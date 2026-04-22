-- FUNCTION: public.sp_get_catsel(text, integer)

-- DROP FUNCTION IF EXISTS public.sp_get_catsel(text, integer);

CREATE OR REPLACE FUNCTION public.sp_get_catsel(
	par_exam_name text,
	par_serialid integer)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE

candidate_record record;
loc_query text;
update_cutoff_flag character varying(5);
n integer;

master_record record;

BEGIN

select flag_name,flag_query from master_table where exam_name=par_exam_name and serial=par_serialid into master_record;

for candidate_record in execute master_record.flag_query
loop

update_cutoff_flag=candidate_record.cut_off_flag;

raise info 'rollno -> %',candidate_record.rollno;
--raise info 'catsel_dob -> %',candidate_record.catsel_dob;
--raise info 'cut_off -> %',candidate_record.cut_off_flag;
--raise info 'exs_reservation -->%',candidate_record.exs_reservation;

if(candidate_record.cat2='3' and candidate_record.exs_reservation='No') then
	update_cutoff_flag=trim(replace(update_cutoff_flag,'3',''));
	--raise info ' 3 removed';
end if;				 

if(candidate_record.catsel_dob in ('1','2','6','4','5','7','8')) then

update_cutoff_flag=trim(replace(update_cutoff_flag,'9',''));

elsif (candidate_record.catsel_dob='' or candidate_record.catsel_dob is null) then
update_cutoff_flag='';

end if;

--raise info 'update_cutoff_flag %',update_cutoff_flag;

execute 'update candidates set '||master_record.flag_name||'='''||coalesce(update_cutoff_flag,'')||''' where rollno='''||candidate_record.rollno||''';';

GET DIAGNOSTICS n=ROW_COUNT;
raise info 'row updated ->%',n;

end loop;

return 'Successfully updated'||master_record.flag_name;

EXCEPTION WHEN OTHERS THEN

   RETURN SQLSTATE||','||SQLERRM;

END;
$BODY$;

ALTER FUNCTION public.sp_get_catsel(text, integer)
    OWNER TO postgres;
