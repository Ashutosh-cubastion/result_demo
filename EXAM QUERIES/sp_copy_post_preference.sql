-- FUNCTION: public.sp_copy_post_preference()

-- DROP FUNCTION IF EXISTS public.sp_copy_post_preference();

CREATE OR REPLACE FUNCTION public.sp_copy_post_preference(
	)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE

candidate_record record;
least_position integer;
category_code character varying(10);
post_code character varying(10);
pref_position integer;
alloc_against_ur character varying(10);

BEGIN

for candidate_record in select rollno,allocated_preference_position_all,allocated_category_all,allocated_post_all,allocated_against_ur_all,
				allocated_preference_position_r,allocated_category_r,allocated_post_r,allocated_against_ur_r from candidates where 
				(merit_all is not null or merit_r is not null)
loop

if( candidate_record.allocated_preference_position_all is not null or candidate_record.allocated_preference_position_r is not null) then
select least(allocated_preference_position_all,allocated_preference_position_r) from candidates where rollno=candidate_record.rollno into least_position;

	if(least_position=candidate_record.allocated_preference_position_all) then 
		category_code=candidate_record.allocated_category_all;
		post_code=candidate_record.allocated_post_all;
		pref_position=candidate_record.allocated_preference_position_all;
		alloc_against_ur=candidate_record.allocated_against_ur_all;
		
	elsif (least_position=candidate_record.allocated_preference_position_r) then
		category_code=candidate_record.allocated_category_r;
		post_code=candidate_record.allocated_post_r;
		pref_position=candidate_record.allocated_preference_position_r;
		alloc_against_ur=candidate_record.allocated_against_ur_r;
	else
		category_code=null;
		post_code=null;
		pref_position=null;
		alloc_against_ur=null;
	
	end if;

update candidates set allocated_post=post_code,allocated_category=category_code,allocated_position=pref_position,allocated_against_ur=alloc_against_ur where rollno=candidate_record.rollno;
end if;

end loop;

END;
$BODY$;

ALTER FUNCTION public.sp_copy_post_preference()
    OWNER TO postgres;
