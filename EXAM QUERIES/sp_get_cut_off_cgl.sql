-- FUNCTION: public.sp_get_cut_off(text, integer)

-- DROP FUNCTION IF EXISTS public.sp_get_cut_off(text, integer);

CREATE OR REPLACE FUNCTION public.sp_get_cut_off(
	par_exam_name text,
	par_serialid integer)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE

master_record record;

sccutoff record;
stcutoff record;
obccutoff record;
urcutoff record;
ewscutoff record;
esmcutoff record;
ohcutoff record;
hhcutoff record;
vhcutoff record;
othercutoff record;

loc_query text;
cut_off_flag text;
n integer;

par_gender character varying(1);

candidate_record record;

BEGIN

	select flag_name,flag_query,cut_off_clause from master_table where exam_name=par_exam_name and serial=par_serialid into master_record;

		

	select tier1 as paper1,tier2 as paper2,session1,session2,additional_paper,dest_mistakes,ckt_marks from cut_off_table where  category='1' and cut_off_name =master_record.cut_off_clause into sccutoff;
	select tier1 as paper1,tier2 as paper2,session1,session2,additional_paper,dest_mistakes,ckt_marks from cut_off_table where  category='2' and cut_off_name =master_record.cut_off_clause into stcutoff;
	select tier1 as paper1,tier2 as paper2,session1,session2,additional_paper,dest_mistakes,ckt_marks from cut_off_table where  category='6' and cut_off_name =master_record.cut_off_clause into obccutoff;
	select tier1 as paper1,tier2 as paper2,session1,session2,additional_paper,dest_mistakes,ckt_marks from cut_off_table where  category='9' and cut_off_name =master_record.cut_off_clause into urcutoff;
	select tier1 as paper1,tier2 as paper2,session1,session2,additional_paper,dest_mistakes,ckt_marks from cut_off_table where  category='0' and cut_off_name =master_record.cut_off_clause into ewscutoff;
	select tier1 as paper1,tier2 as paper2,session1,session2,additional_paper,dest_mistakes,ckt_marks from cut_off_table where  category='3' and cut_off_name =master_record.cut_off_clause into esmcutoff;
	select tier1 as paper1,tier2 as paper2,session1,session2,additional_paper,dest_mistakes,ckt_marks from cut_off_table where  category='4' and cut_off_name =master_record.cut_off_clause into ohcutoff;
	select tier1 as paper1,tier2 as paper2,session1,session2,additional_paper,dest_mistakes,ckt_marks from cut_off_table where  category='5' and cut_off_name =master_record.cut_off_clause into hhcutoff;
	select tier1 as paper1,tier2 as paper2,session1,session2,additional_paper,dest_mistakes,ckt_marks from cut_off_table where  category='7' and cut_off_name =master_record.cut_off_clause into vhcutoff;
	select tier1 as paper1,tier2 as paper2,session1,session2,additional_paper,dest_mistakes,ckt_marks from cut_off_table where  category='8' and cut_off_name =master_record.cut_off_clause into othercutoff;
	
		

	for candidate_record in execute master_record.flag_query 
	loop

		raise info 'rollno-->%',candidate_record.rollno;
	
		cut_off_flag='';
		

		if(candidate_record.paper1>=urcutoff.paper1 and candidate_record.session1>=urcutoff.session1 and candidate_record.session2>=urcutoff.session2 and candidate_record.additional_paper>=urcutoff.additional_paper and candidate_record.ckt_marks>=urcutoff.ckt_marks and candidate_record.dest_mistakes<=urcutoff.dest_mistakes) then
			
				cut_off_flag='9';
			
		end if;
		
		if(candidate_record.cat1='0' and candidate_record.paper1>=ewscutoff.paper1 and candidate_record.session1>=ewscutoff.session1 and candidate_record.session2>=ewscutoff.session2  and candidate_record.additional_paper>=ewscutoff.additional_paper and candidate_record.ckt_marks>=ewscutoff.ckt_marks and candidate_record.dest_mistakes<=ewscutoff.dest_mistakes) then
				cut_off_flag=cut_off_flag||'0';
		end if;
		
		if(candidate_record.cat1='1' and candidate_record.paper1>=sccutoff.paper1 and candidate_record.session1>=sccutoff.session1 and candidate_record.session2>=sccutoff.session2 and candidate_record.additional_paper>=sccutoff.additional_paper and candidate_record.ckt_marks>=sccutoff.ckt_marks and candidate_record.dest_mistakes<=sccutoff.dest_mistakes) then
				cut_off_flag=cut_off_flag||'1';
		end if;

	
		if(candidate_record.cat1='2' and candidate_record.paper1>=stcutoff.paper1 and candidate_record.session1>=stcutoff.session1 and candidate_record.session2>=stcutoff.session2 and candidate_record.additional_paper>=stcutoff.additional_paper and candidate_record.ckt_marks>=stcutoff.ckt_marks and candidate_record.dest_mistakes<=stcutoff.dest_mistakes) then
				cut_off_flag=cut_off_flag||'2';
		end if;
	
		
		if(candidate_record.cat1='6' and candidate_record.paper1>=obccutoff.paper1 and candidate_record.session1>=obccutoff.session1 and candidate_record.session2>=obccutoff.session2 and candidate_record.additional_paper>=obccutoff.additional_paper and candidate_record.ckt_marks>=obccutoff.ckt_marks and candidate_record.dest_mistakes<=obccutoff.dest_mistakes) then
				cut_off_flag=cut_off_flag||'6';
	
		end if;
		
		if(candidate_record.cat2='3' and candidate_record.paper1>=esmcutoff.paper1 and candidate_record.session1>=esmcutoff.session1 and candidate_record.session2>=esmcutoff.session2 and candidate_record.additional_paper>=esmcutoff.additional_paper and candidate_record.ckt_marks>=esmcutoff.ckt_marks and candidate_record.dest_mistakes<=esmcutoff.dest_mistakes) then
				cut_off_flag=cut_off_flag||'3';
	
		end if;
		
		if(candidate_record.cat3='4' and candidate_record.paper1>=ohcutoff.paper1 and candidate_record.session1>=ohcutoff.session1 and candidate_record.session2>=ohcutoff.session2 and candidate_record.additional_paper>=ohcutoff.additional_paper and candidate_record.ckt_marks>=ohcutoff.ckt_marks and candidate_record.dest_mistakes<=ohcutoff.dest_mistakes) then

				cut_off_flag=cut_off_flag||'4';
		end if;
		
		if(candidate_record.cat3='5' and candidate_record.paper1>=hhcutoff.paper1 and candidate_record.session1>=hhcutoff.session1 and candidate_record.session2>=hhcutoff.session2 and candidate_record.additional_paper>=hhcutoff.additional_paper and candidate_record.ckt_marks>=hhcutoff.ckt_marks and candidate_record.dest_mistakes<=hhcutoff.dest_mistakes) then
				cut_off_flag=cut_off_flag||'5';
	
		end if;
		
		if(candidate_record.cat3='7' and candidate_record.paper1>=vhcutoff.paper1 and candidate_record.session1>=vhcutoff.session1 and candidate_record.session2>=vhcutoff.session2  and candidate_record.additional_paper>=vhcutoff.additional_paper and candidate_record.ckt_marks>=vhcutoff.ckt_marks and candidate_record.dest_mistakes<=vhcutoff.dest_mistakes) then
				cut_off_flag=cut_off_flag||'7';
	
		end if;
		
		if(candidate_record.cat3='8' and candidate_record.paper1>=othercutoff.paper1 and candidate_record.session1>=othercutoff.session1 and candidate_record.session2>=othercutoff.session2 and candidate_record.additional_paper>=othercutoff.additional_paper and candidate_record.ckt_marks>=othercutoff.ckt_marks and candidate_record.dest_mistakes<=othercutoff.dest_mistakes) then
				cut_off_flag=cut_off_flag||'8';
		end if;
		
		execute 'update candidates set '||master_record.flag_name||'='''||cut_off_flag||''' where rollno='''||candidate_record.rollno||''';';
		GET DIAGNOSTICS n=ROW_COUNT;
		raise info 'row updated %',n;

	end loop;
	return 'Success';

EXCEPTION WHEN OTHERS THEN
	RETURN SQLSTATE||','||SQLERRM;

END;
$BODY$;

ALTER FUNCTION public.sp_get_cut_off(text, integer)
    OWNER TO postgres;
