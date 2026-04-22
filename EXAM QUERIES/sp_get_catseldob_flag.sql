-- FUNCTION: public.sp_get_catseldob_flag(text, integer)

-- DROP FUNCTION IF EXISTS public.sp_get_catseldob_flag(text, integer);

CREATE OR REPLACE FUNCTION public.sp_get_catseldob_flag(
	par_exam_name text,
	par_serialid integer)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE

candidate_record record;
master_record record;
catsel record;

cand_gender character varying(5);
cand_cat1 character varying(5);
cand_cat2 character varying(5);
cand_cat3 character varying(5);
cand_dob_flag character varying(5);
catsel_dob character varying(5);
catsel_dob_decision boolean;

extract_year int;
extract_month int;
extract_day int;
new_year int;
new_dob date;

n int;

BEGIN

select flag_name,flag_query,dob_from_date from master_table where exam_name=par_exam_name and serial=par_serialid into master_record;

raise info 'flag_query--> %',master_record.flag_query;

for candidate_record in execute master_record.flag_query

loop

catsel_dob='';
cand_gender=candidate_record.gender;
cand_cat1=candidate_record.cat1;
cand_cat2=candidate_record.cat2;
cand_cat3=candidate_record.cat3;
cand_dob_flag=candidate_record.dob_flag;

--raise info 'upto here 1.1';
if ((cand_dob_flag is not null and cand_dob_flag<>'') and cand_dob_flag<>'9') then 

	select string_to_array(arc_cat1,',') as arc_cat1,string_to_array(arc_cat2,',') as arc_cat2,string_to_array(arc_cat3,',') as arc_cat3,string_to_array(arc_gender,',') as arc_gender,arc_year_against_ur from arc_table where arc_code=cand_dob_flag into  catsel;

	--raise info 'cand_dob_flag %',cand_dob_flag;
	--raise info 'arc values %,%,%',catsel.arc_cat1,catsel.arc_cat2,catsel.arc_cat3;

	if(cand_cat1=ANY(catsel.arc_cat1) and cand_gender=ANY(catsel.arc_gender)) then
		if(cand_cat2=ANY(catsel.arc_cat2)) then
			catsel_dob=cand_cat2;
			--raise info 'catsel_dob here 1.1.1 - %',catsel_dob;
		else
		  	if(catsel.arc_year_against_ur is null) then 
				catsel.arc_year_against_ur=0;
			end if;
			--raise notice 'age_rlx_year 1.1.2..%',catsel.arc_year_against_ur;
			extract_year=date_part('year',candidate_record.dob1)::int;
			--raise notice 'upto here 1.1.3';
			extract_month=date_part('month',candidate_record.dob1)::int;
			--raise notice 'upto here 1.1.4';
			extract_day=date_part('day',candidate_record.dob1)::int;
			--raise notice 'upto here 1.1.5';
			new_year=extract_year+catsel.arc_year_against_ur;
			--raise notice 'new_year %',new_year;
			if(extract_month=2 and extract_day=29) then
				extract_day=28;
			end if;

			new_dob=cast(new_year||'-'||extract_month||'-'||extract_day as date);
	
			--raise notice 'new_dob %',new_dob;
			
	
			if(new_dob>master_record.dob_from_date) then
				catsel_dob_decision=true;
			else
				catsel_dob_decision=false;	
			end if;
			
		
			if(cand_cat3=ANY(catsel.arc_cat3)) then
				if(catsel_dob_decision=true) then catsel_dob='9';	
				else catsel_dob=cand_cat3;
				end if;
			else
				if(catsel_dob_decision=true) then catsel_dob='9';	
				else catsel_dob=cand_cat1;
				end if;
				--raise info 'catsel_dob here 1.1.6 - %',catsel_dob;
			end if;	
		end if;		
	else
		catsel_dob='';
		--raise info 'catsel_dob here 1.1.7 - %',catsel_dob;
	end if;

	--raise info 'upto here 1.1.8';
	
else

catsel_dob=cand_dob_flag;

end if;

--raise info 'upto here 1.3 %',catsel_dob;

execute 'update candidates set '||master_record.flag_name||'='''||catsel_dob||''' where rollno='''||candidate_record.rollno||''';';
GET DIAGNOSTICS n=ROW_COUNT;

raise info 'row updated %',n;

end loop;

return 'Successfully updated catsel_dob';

EXCEPTION WHEN OTHERS THEN

	return SQLSTATE||','||SQLERRM;
END;
$BODY$;

ALTER FUNCTION public.sp_get_catseldob_flag(text, integer)
    OWNER TO postgres;
