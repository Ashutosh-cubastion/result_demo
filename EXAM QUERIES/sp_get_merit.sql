-- FUNCTION: public.sp_get_merit(text, integer)

-- DROP FUNCTION IF EXISTS public.sp_get_merit(text, integer);

CREATE OR REPLACE FUNCTION public.sp_get_merit(
	par_exam_name text,
	par_serialid integer)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
declare
	
	master_record record;
	candidate_rollno record;
	merit integer;
	
	
	begin
	merit=0;

	select flag_name,flag_query from master_table where serial=par_serialid and exam_name=par_exam_name into master_record;

        raise info 'flag_query--> %',master_record.flag_query;	

	FOR candidate_rollno in execute master_record.flag_query

	
	LOOP
	
	merit=merit+1;
	execute 'update candidates set '||master_record.flag_name||'='||merit||' where rollno='''||candidate_rollno.rollno||''';';

	raise notice 'rollno -> %',candidate_rollno.rollno;
	raise notice 'merit -> %',merit;
	
	END LOOP;
	
	
	return master_record.flag_name||' updated successfully for '||merit||' candidates';
	
	
	exception when others then
		return SQLSTATE||','||SQLERRM;
	END;
$BODY$;

ALTER FUNCTION public.sp_get_merit(text, integer)
    OWNER TO postgres;
