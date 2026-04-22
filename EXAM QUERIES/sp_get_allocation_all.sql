-- FUNCTION: public.sp_get_allocation_all(text, integer)

-- DROP FUNCTION IF EXISTS public.sp_get_allocation_all(text, integer);

CREATE OR REPLACE FUNCTION public.sp_get_allocation_all(
	par_exam_name text,
	par_serialid integer)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
master_record record;
candidate_record record;
vacancy_record record;
vacancy_record_horizontal record;
catsel_dob text;
catsel_dob_name text;
catsel text;
catsel_name text;
dv_preference_post text[];
length_of_preference int;
catsel_category text;
candidates_record_updated int;
vacancy_record_updated int;
length_of_catsel int;
allocatedAgainstUR text;
count_all int;

BEGIN

select flag_name,flag_query from master_table where exam_name=par_exam_name and serial=par_serialid into master_record;

<<candidate_loop>>
for candidate_record in execute master_record.flag_query
loop

--raise info 'rollno-->%',candidate_record.rollno;	

candidates_record_updated=0;
vacancy_record_updated=0;

if(candidate_record.preference_post is null or candidate_record.preference_post='') then
	continue;
else
	dv_preference_post=string_to_array(candidate_record.preference_post,',');
	length_of_preference=array_length(dv_preference_post,1);
end if;

--raise info 'length_of_preference %', length_of_preference;

<<preference_loop>>
for i in 1..length_of_preference
loop

--raise info '%',dv_preference_post[i];
catsel_dob_name='';
catsel_name='';
catsel_dob='';
catsel='';

if(dv_preference_post[i] is null or dv_preference_post[i]='') then
	continue;
end if;

--if(dv_preference_post[i]='D65' and candidate_record.gender='1') then
	--continue;
--end if;

if(dv_preference_post[i] in ('B19','B22','B31') and candidate_record.cat3 in ('4','5','7','8')) then
	continue;
end if;

--if(dv_preference_post[i] in ('D38','D39') and candidate_record.cat3 in ('7')) then
--	continue;
--end if;

if ((dv_preference_post[i] in ('C01','C02')) or (dv_preference_post[i] in ('D08','D16','B03','B06','B07','B14','B16','B17','B18','B24','B25','B30','B32','B37','B38','B40','B43','D05') and candidate_record.dest_exempted='Y')) then
	continue;
else
	execute  'select catsel_dob,catsel from m_post_list where '''||dv_preference_post[i]||'''=ANY(posts)' into catsel_dob_name,catsel_name;
	execute  'select '||catsel_dob_name||','||catsel_name||' from candidates where rollno='''||candidate_record.rollno||'''' into catsel_dob,catsel;
    
	if(catsel is null or catsel='') then
		continue;
	end if;
end if;

--raise info 'catsel_dob %', catsel_dob;
--raise info 'catsel%', catsel;

length_of_catsel= length(catsel);

   <<catsel_loop>>
	for j in 1..length_of_catsel
		loop
		catsel_category='';
		
		catsel_category= substring(catsel,j,1);
			
		select left_vacancy as current,allocated from vacancy_table where vacancy_table.category_code||post_code=(catsel_category||dv_preference_post[i]) into vacancy_record;
	   -- raise info 'current vacancy %',vacancy_record.current;
	   -- raise info 'allocated %',vacancy_record.allocated;
		if(vacancy_record) is null then 
			continue;
		end if;
		
		if(vacancy_record.current>0) then
			allocatedAgainstUR='';
						
			if(catsel_category in ('3','4','5','7','8')) then
			  			   
			   if exists(select 1 from vacancy_table where vacancy_table.category_code||post_code=(candidate_record.cat1||dv_preference_post[i]) and (initial_vacancy=0 or initial_vacancy=(allocated_oh+allocated_hh+allocated_vh+allocated_ph_others+allocated_esm))) then
		       		if exists(select 1 from vacancy_table where vacancy_table.category_code||post_code='9'||dv_preference_post[i] and (initial_vacancy=0 or initial_vacancy=(allocated_oh+allocated_hh+allocated_vh+allocated_ph_others+allocated_esm))) then
						 	continue catsel_loop;
			   		else
						if(catsel_category='3') then
							allocatedAgainstUR='1';
						elsif(catsel_category in ('4','5','7','8') and catsel_dob='9') then
			   					allocatedAgainstUR='1';
								
						else
			   				continue;
			   			end if;	  		
			   		end if;
				end if;
	  		  end if;
			   
		  UPDATE candidates SET allocated_category_all=catsel_category , allocated_post_all=dv_preference_post[i],allocated_against_ur_all=allocatedAgainstUR,allocated_preference_position_all=i WHERE rollno=candidate_record.rollno;
	      GET DIAGNOSTICS candidates_record_updated=row_count;
		  if(candidates_record_updated=1) then
			  -- raise info ' candiate table updated for rollno % ', candidate_record.rollno;
			   update vacancy_table set left_vacancy=(vacancy_record.current-1),allocated=(vacancy_record.allocated+1)	where  category_code||post_code=(catsel_category||dv_preference_post[i]);
			   GET DIAGNOSTICS vacancy_record_updated=row_count;
			   if(vacancy_record_updated=1) then
			   --		raise info 'vacancy table updated for %',(catsel_category||dv_preference_post[i]);
					if (catsel_category in ('3','4','5','7','8')) then
						 update vacancy_table set 
						 allocated_esm= case when catsel_category='3' then allocated_esm+1 else allocated_esm end,
						 allocated_oh= case  when catsel_category='4' then allocated_oh+1 else allocated_oh end,
						 allocated_hh= case  when catsel_category='5' then allocated_hh+1 else allocated_hh end,
						 allocated_vh= case  when catsel_category='7' then allocated_vh+1 else allocated_vh end,
						 allocated_ph_others= case when catsel_category='8' then allocated_ph_others+1 else allocated_ph_others end
						 where  category_code||post_code=
						case when allocatedAgainstUR='1' then ('9'||dv_preference_post[i])
						else (candidate_record.cat1||dv_preference_post[i]) end;
					end if;
			   end if;
		   else
			   raise info 'candidate table not updated for rollno %', candidate_record.rollno;
		   end if;
	 end if;
	
			   
	exit catsel_loop when candidates_record_updated=1;
	end loop catsel_loop;
	exit preference_loop when candidates_record_updated=1;
	end loop preference_loop;
end loop candidate_loop;

select count(rollno) from candidates where allocated_category_all is not null into count_all;
return master_record.flag_name||' updated successfully for '||count_all||' candidates';						
	exception when others then
		return SQLSTATE||','||SQLERRM;						

end;
$BODY$;

ALTER FUNCTION public.sp_get_allocation_all(text, integer)
    OWNER TO postgres;
