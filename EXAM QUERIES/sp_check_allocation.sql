-- FUNCTION: public.sp_check_allocation(text, integer)

-- DROP FUNCTION IF EXISTS public.sp_check_allocation(text, integer);

CREATE OR REPLACE FUNCTION public.sp_check_allocation(
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
dv_preference_post text[];
merit_name text;
merit int;
length_of_preference int;
length_of_catsel int;
catsel_name text;
catsel_category text;
catsel text;
last_merit int;

BEGIN

create temp table post_merit_mapping
(
keyvalue text,
merit_value int,
constraint post_merit_mapping_pk primary key (keyvalue)
);

create temp table checkalloc
(
rollno text,
description text
);

insert into post_merit_mapping 
(select allocated_category_all||allocated_post_all as keyvalue,max(merit_all) as mapvalue from candidates where allocated_post_all is not null and allocated_post_all not in ('C01','C02') group by allocated_post_all,allocated_category_all
union all
select allocated_category_r||allocated_post_r as keyvalue,max(merit_r) as mapvalue from candidates where allocated_post_r in ('C01','C02') group by allocated_post_r,allocated_category_r);

select flag_name,flag_query from master_table where exam_name=par_exam_name and serial=par_serialid into master_record;

<<candidate_loop>>
for candidate_record in  execute master_record.flag_query
loop

if(candidate_record.preference_post is null or candidate_record.preference_post='') then
	continue;
else
	dv_preference_post=string_to_array(candidate_record.preference_post,',');
	length_of_preference=array_position(dv_preference_post,candidate_record.allocated_post::text) ;
end if;

if(length_of_preference=1) then
	continue;
end if;

<<preference_loop>>
for i in 1..(length_of_preference-1)
loop
merit=0;
merit_name='';
catsel_name='';
catsel='';
execute  'select merit,catsel from m_post_list where '''||dv_preference_post[i]||'''=ANY(posts)' into merit_name,catsel_name;
execute  'select '||merit_name||','||catsel_name||' from candidates where rollno='''||candidate_record.rollno||'''' into merit,catsel;

if(catsel is null or catsel='') then
	continue;
end if;

if (merit is null) then
	merit=0;
end if;	

length_of_catsel= length(catsel);
	   <<catsel_loop>>
	   	for j in 1..length_of_catsel
		loop
		catsel_category='';
		
		catsel_category= substring(catsel,j,1);
		
		select merit_value from post_merit_mapping where keyvalue=catsel_category||dv_preference_post[i] into last_merit;
		if (last_merit>merit) then
		    --if(dv_preference_post[i]='D66' and candidate_record.gender='1') then
				--insert into checkalloc(rollno,description) values (candidate_record.rollno,'Female not allowed in D65 - keyvalue - '||catsel_category||dv_preference_post[i]||' Last Merit- '||last_merit||' candidate merit name - '||merit_name||' candidate merit- '||merit);
			--elsif	
			 if(dv_preference_post[i] in ('B19','B22','B31') and candidate_record.cat3 in ('4','5','7','8')) then
				insert into checkalloc(rollno,description) values (candidate_record.rollno,'Pwbd not allowed in B19,B22,B31 - keyvalue - '||catsel_category||dv_preference_post[i]||' Last Merit- '||last_merit||' candidate merit name - '||merit_name||' candidate merit- '||merit);		
			elsif (dv_preference_post[i] in ('D08','D16','B03','B06','B07','B14','B16','B17','B18','B24','B25','B30','B32','B37','B38','B40','B43','D05') and candidate_record.dest_exempted='Y') then
				insert into checkalloc(rollno,description) values (candidate_record.rollno,'DEST Exempted not allowed. post code- '||dv_preference_post[i]||' catsel- '||catsel_category);
			else
				insert into checkalloc(rollno,description) values (candidate_record.rollno,'Wrong Allocation- keyvalue - '||catsel_category||dv_preference_post[i]||' Last Merit- '||last_merit||' candidate merit name - '||merit_name||' candidate merit- '||merit);
			end if;
		end if;
		end loop catsel_loop;
	end loop preference_loop;
end loop candidate_loop;

drop table post_merit_mapping;
copy checkalloc to 'C:\Users\Public\CGLE2024_Allocation_Final\CheckAllocation\checkalloc.csv' with csv header;
drop table checkalloc;

return 'check allocation file generated';
exception when others then
	return SQLSTATE||','||SQLERRM;
end;
$BODY$;

ALTER FUNCTION public.sp_check_allocation(text, integer)
    OWNER TO postgres;
