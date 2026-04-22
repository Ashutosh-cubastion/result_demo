-- FUNCTION: public.sp_adjust_vacancy(text, integer)

-- DROP FUNCTION IF EXISTS public.sp_adjust_vacancy(text, integer);

CREATE OR REPLACE FUNCTION public.sp_adjust_vacancy(
	par_exam_name text,
	par_serialid integer)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE

master_record record;
adjust_vacancy record;
counter int:=0;
vacancy_record_updated int;

BEGIN

select flag_name,flag_query from master_table where exam_name=par_exam_name and serial=par_serialid into master_record;

update vacancy_table set current=null,allocated=0,left_vacancy=initial_vacancy,allocated_oh=0,allocated_hh=0,allocated_vh=0,allocated_ph_others=0,allocated_esm=0;

for adjust_vacancy in  execute master_record.flag_query
loop
--raise info '1';
vacancy_record_updated=0;
update vacancy_table set left_vacancy=(left_vacancy - adjust_vacancy.vacancy) where category_code=case when adjust_vacancy.allocated_against_ur='1' then '9' else adjust_vacancy.cat1 end and post_code=adjust_vacancy.allocated_post;

GET DIAGNOSTICS vacancy_record_updated=row_count;
raise info '%',vacancy_record_updated;
if(vacancy_record_updated=1) then
   	counter=counter+1;
	--raise info '%',counter;
end if;

end loop;

update vacancy_table set current=left_vacancy;

return 'Total '||counter||' vacancies updated';

exception when others then
	return SQLSTATE||','||SQLERRM;
end;
$BODY$;

ALTER FUNCTION public.sp_adjust_vacancy(text, integer)
    OWNER TO postgres;
