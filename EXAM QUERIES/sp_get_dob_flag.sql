-- FUNCTION: public.sp_get_dob_flag(text, integer)

-- DROP FUNCTION IF EXISTS public.sp_get_dob_flag(text, integer);

CREATE OR REPLACE FUNCTION public.sp_get_dob_flag(
	par_exam_name text,
	par_serialid integer)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE

age_rlx record;
candidate_record record;
master_record record;

age_rlx_code character varying(5);
age_rlx_year integer;
esm_length character varying(5);
verification_flag character varying(5);

extract_year int;
extract_month int;
extract_day int;
new_year int;
new_dob date;
dob_to date;
dob_from date;

n int;

BEGIN

select flag_name,flag_query,dob_from_date,dob_to_date,string_to_array(esm_agerelax_codes,',') as esm_agerelax_codes from master_table where exam_name=par_exam_name and serial=par_serialid
 into master_record;

 dob_to=master_record.dob_to_date;
 dob_from=master_record.dob_from_date;

--raise notice 'flag_query--> %',master_record.flag_query;
--for candidate_record in select rollno,agerelax_code,exsm_length,dob1 from candidates where merit is not null order by merit

for candidate_record in execute master_record.flag_query

loop

verification_flag='';
--raise notice '%',candidate_record.rollno;

if(candidate_record.dob1>dob_to or candidate_record.dob1=dob_to) then

verification_flag='U';

elsif(candidate_record.dob1>dob_from and candidate_record.dob1<dob_to) then

verification_flag='9';
 
elsif(candidate_record.dob1<dob_from or candidate_record.dob1=dob_from) then

        
	if(candidate_record.agerelax_code in ('10','11','12','13') and (master_record.flag_name in ('dob_flag_20_30','dob_flag_18_30','dob_flag_18_32') and candidate_record.cat1 in ('9','0'))) then 
	    	verification_flag='99'; 
	else

		if(candidate_record.agerelax_code in ('10','11','12','13') and master_record.flag_name in ('dob_flag_20_30','dob_flag_18_30','dob_flag_18_32')) then
				if (candidate_record.cat1='6') then
					candidate_record.agerelax_code='02';
				elsif(candidate_record.cat1 in ('1','2')) then
					candidate_record.agerelax_code='01';
				end if;
		end if;
		
		if(candidate_record.agerelax_code is null or candidate_record.agerelax_code='') then
		candidate_record.agerelax_code='99';	
		end if;
		--raise info 'candidate_record.agerelax_code 1 ..%',candidate_record.agerelax_code;

		if(length(trim(candidate_record.agerelax_code))=1) then
		candidate_record.agerelax_code='0'||trim(candidate_record.agerelax_code);	
		end if;	
		--raise info 'candidate_record.agerelax_code 2 ..%',candidate_record.agerelax_code;

		if(candidate_record.exsm_length is null or candidate_record.exsm_length='') then
		candidate_record.exsm_length ='0';
		end if;
		--raise info 'candidate_record.agerelax_code 3 ..%',candidate_record.agerelax_code;

		select arc_year into age_rlx_year from arc_table where arc_code=candidate_record.agerelax_code and master_record.flag_name=ANY(string_to_array(age_group,','));
		if(age_rlx_year is null) then 
		age_rlx_year=0;
		end if;
		--raise info 'age_rlx_year 4 ..%',age_rlx_year;
	
		if (candidate_record.agerelax_code=ANY (master_record.esm_agerelax_codes)) then
		age_rlx_year=age_rlx_year+(candidate_record.exsm_length::decimal)::integer;
		end if;
		--raise info 'age_rlx_year after exsm_length %',age_rlx_year;
	
	
		extract_year=date_part('year',candidate_record.dob1)::int;
		--raise info 'upto here 7.2';
		extract_month=date_part('month',candidate_record.dob1)::int;
		--raise info 'upto here 7.3';
		extract_day=date_part('day',candidate_record.dob1)::int;
		--raise info 'upto here 7.4';

		new_year=extract_year+age_rlx_year;
		--raise info 'new_year %',new_year;
		--raise info 'rollno %',candidate_record.rollno;
		-- handling leap year cases ---
		if (extract_day=29 and extract_month=2) then
			extract_day=28;
		end if;
		new_dob=cast(new_year||'-'||extract_month||'-'||extract_day as date);
	
		--raise info 'new_dob %',new_dob;
	

		if(new_dob>dob_from) then
		verification_flag=candidate_record.agerelax_code;
		else
		verification_flag='99';
		end if;
     end if;
	--raise info 'verification_flag %',verification_flag;
else
verification_flag='99';
end if;

--raise info 'verification flag ->%',verification_flag;

execute 'update candidates set '||master_record.flag_name||'='''||verification_flag||''' where rollno='''||candidate_record.rollno||''';';

GET DIAGNOSTICS n=ROW_COUNT;
raise info 'rollno ->%',candidate_record.rollno;

end loop;	

return 'Success';

EXCEPTION WHEN OTHERS THEN
	RETURN SQLSTATE||','||SQLERRM;

END;
$BODY$;

ALTER FUNCTION public.sp_get_dob_flag(text, integer)
    OWNER TO postgres;
