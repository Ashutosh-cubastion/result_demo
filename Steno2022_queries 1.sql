-- Table: public.t_post_pref_steno2022_ssc

-- DROP TABLE IF EXISTS public.t_post_pref_steno2022_ssc;

CREATE TABLE IF NOT EXISTS public.t_post_pref_steno2022_ssc
(
    tp_id integer NOT NULL,
    tp_regno bigint NOT NULL,
    tp_cand_name text COLLATE pg_catalog."default",
    tp_name_in_application text COLLATE pg_catalog."default",
    tp_changedname_in_application text COLLATE pg_catalog."default",
    tp_cand_father_name text COLLATE pg_catalog."default",
    tp_cand_mother_name text COLLATE pg_catalog."default",
    tp_cand_rollno text COLLATE pg_catalog."default" NOT NULL,
    tp_dob date NOT NULL,
    tp_candidate_age real NOT NULL,
    tp_gender integer NOT NULL,
    tp_cat1 integer,
    tp_is_ex_serviceman boolean NOT NULL,
    tp_cat2 integer,
    tp_is_physically_handicaped boolean NOT NULL,
    tp_cat3 integer,
    tp_is_age_relaxation boolean NOT NULL,
    tp_age_relaxation_code integer,
    tp_joining_date_for_armedforces date,
    tp_discharged_date date,
    tp_service_period text COLLATE pg_catalog."default",
    tp_isexs_benefit_availed_for_civilpost boolean,
    tp_joining_date_for_civilpost date,
    tp_post_applied integer NOT NULL,
    tp_stenography_knowledge boolean NOT NULL,
    tp_stenography_medium integer NOT NULL,
    tp_post_pref text COLLATE pg_catalog."default" NOT NULL,
    tp_share_info_accrossportal boolean NOT NULL,
    tp_present_address text COLLATE pg_catalog."default",
    tp_present_districtid integer,
    tp_present_districtname text COLLATE pg_catalog."default",
    tp_present_stateid integer,
    tp_present_statename text COLLATE pg_catalog."default",
    tp_present_pincode integer,
    tp_permanent_address text COLLATE pg_catalog."default",
    tp_permanent_stateid integer,
    tp_permanent_statename text COLLATE pg_catalog."default",
    tp_permanent_districtid integer,
    tp_permanent_districtname text COLLATE pg_catalog."default",
    tp_permanent_pincode integer,
    tp_email_id text COLLATE pg_catalog."default" NOT NULL,
    tp_mobile_number text COLLATE pg_catalog."default" NOT NULL,
    tp_other_national_address text COLLATE pg_catalog."default",
    tp_isactive boolean DEFAULT true,
    tp_ip_address text COLLATE pg_catalog."default",
    tp_createdbyid integer,
    tp_createdbyrid integer,
    tp_updbyid integer,
    tp_upddtm timestamp without time zone,
    tp_createddtm timestamp without time zone DEFAULT now(),
    tp_notificationid integer,
    tp_examid integer,
    tp_exam_year integer,
    tp_qrcode_path text COLLATE pg_catalog."default",
    tp_remarks text COLLATE pg_catalog."default",
    CONSTRAINT t_post_pref_steno2022_ssc_pkey PRIMARY KEY (tp_regno)
	)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.t_post_pref_steno2022_ssc
    OWNER to postgres;

-------------------------------------------------------------------------------------------------------------------


psql -U postgres -h 10.246.126.165 -p 5432 -d ssc2

\copy t_post_pref_steno2022_ssc to 'C:\Users\Public\t_post_pref_steno2022_ssc165.csv' csv header;
\copy t_post_pref_steno2022_ssc to 'C:\Users\Public\t_post_pref_steno2022_ssc166.csv' csv header;
\copy t_post_pref_steno2022_ssc to 'C:\Users\Public\t_post_pref_steno2022_ssc167.csv' csv header;
\copy t_post_pref_steno2022_ssc to 'C:\Users\Public\t_post_pref_steno2022_ssc170.csv' csv header;
\copy t_post_pref_steno2022_ssc to 'C:\Users\Public\t_post_pref_steno2022_ssc171.csv' csv header;
\copy t_post_pref_steno2022_ssc to 'C:\Users\Public\t_post_pref_steno2022_ssc172.csv' csv header;

psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_steno2022_allocation_final

\copy t_post_pref_steno2022_ssc from 'C:\Users\Public\t_post_pref_steno2022_ssc165.csv' csv header;
\copy t_post_pref_steno2022_ssc from 'C:\Users\Public\t_post_pref_steno2022_ssc166.csv' csv header;
\copy t_post_pref_steno2022_ssc from 'C:\Users\Public\t_post_pref_steno2022_ssc167.csv' csv header;
\copy t_post_pref_steno2022_ssc from 'C:\Users\Public\t_post_pref_steno2022_ssc170.csv' csv header;
\copy t_post_pref_steno2022_ssc from 'C:\Users\Public\t_post_pref_steno2022_ssc171.csv' csv header;
\copy t_post_pref_steno2022_ssc from 'C:\Users\Public\t_post_pref_steno2022_ssc172.csv' csv header;

------------------------------------------------------------------------------------------------------------------------

select tp_cand_rollno,tp_regno,tp_cand_name,tp_name_in_application,tp_changedname_in_application,tp_cand_father_name,tp_cand_mother_name,TENTH_ROLLNO,tp_dob,tp_candidate_age,tp_gender,tp_cat1,tp_is_ex_serviceman,tp_cat2,tp_service_period,EXSM_LENGTH,tp_joining_date_for_armedforces,tp_discharged_date,tp_isexs_benefit_availed_for_civilpost,tp_joining_date_for_civilpost,tp_is_physically_handicaped,tp_cat3,SUBCAT_OF_PHTYPE,SUB_PHCODE,MULTIPLEDISABILITY,tp_post_applied,tp_stenography_knowledge,tp_post_pref,tp_share_info_accrossportal,tp_present_address,tp_present_districtid,tp_present_districtname,tp_present_stateid,tp_present_statename,tp_present_pincode,tp_permanent_address,tp_permanent_stateid,tp_permanent_statename,tp_permanent_districtid,tp_permanent_districtname,tp_permanent_pincode,tp_email_id,tp_mobile_number,tp_stenography_medium,tp_is_age_relaxation from t_post_pref_steno2022_ssc;


-------------------------------------------------------------------------------------------------------------------------------

pg_dump -U postgres -h 10.246.126.173 -p 5432 -t temp_steno -F c -f C:\Users\Public\tempsteno.dump alloc_steno2022_allocation_final
pg_restore -U postgres -h 10.246.126.165 -p 5432 -d ssc2 C:\Users\Public\tempsteno.dump
pg_restore -U postgres -h 10.246.126.166 -p 5432 -d ssc2 C:\Users\Public\tempsteno.dump
pg_restore -U postgres -h 10.246.126.167 -p 5432 -d ssc2 C:\Users\Public\tempsteno.dump
pg_restore -U postgres -h 10.246.126.170 -p 5432 -d ssc2 C:\Users\Public\tempsteno.dump
pg_restore -U postgres -h 10.246.126.171 -p 5432 -d ssc2 C:\Users\Public\tempsteno.dump
pg_restore -U postgres -h 10.246.126.172 -p 5432 -d ssc2 C:\Users\Public\tempsteno.dump

----------------------------------------------------------------------------------------------------------------------------

insert into candidates (select tp_cand_rollno,tp_regno,tp_cand_name,tp_name_in_application,tp_changedname_in_application,tp_cand_father_name,tp_cand_mother_name,tp_dob,tp_candidate_age,tp_gender,tp_cat1,tp_is_ex_serviceman,tp_cat2,tp_joining_date_for_armedforces,tp_discharged_date,tp_service_period,NULL,tp_isexs_benefit_availed_for_civilpost,tp_joining_date_for_civilpost,tp_is_physically_handicaped,tp_cat3,NULL,NULL,NULL,tp_post_applied,tp_stenography_knowledge,tp_post_pref,tp_share_info_accrossportal,tp_permanent_address,tp_permanent_stateid,tp_permanent_statename,tp_permanent_districtid,tp_permanent_districtname,tp_permanent_pincode,tp_present_address,tp_present_districtid,tp_present_districtname,tp_present_stateid,tp_present_statename,tp_present_pincode,tp_email_id,tp_mobile_number,tp_stenography_medium,tp_is_age_relaxation,tp_age_relaxation_code from t_post_pref_steno2022_ssc);

---------------------------------------------------------------------------------------------------------------

copy (select a.* from t_steno2022exam_applicant_reg_pu a,temp_steno b where a.ear_person_regno =b.tp_regno) to 'C:\Users\Public\165.csv' csv header;

------------------------------------------------------------------------------------------------------
create table data_dump as (select b.* from 
t_steno2022exam_applicant_reg_pu b inner join candidates
on b.ear_person_regno = candidates.regno::bigint
and b.ear_isactive = 'true' and b.ear_application_status = '1');


update candidates
set  highqual = b.ear_edqualification,
 eduqual =b.ear_education_details,
 eqstate =b.ear_state_for_university,
 equni =b.ear_eduqual_university_board,
 eqrollno =b.ear_eduqual_rollno,
 eqyear =b.ear_eduqual_passingyear,
 eqpercentage =b.ear_eduqual_percentage,
 eqcgpa =b.ear_eduqual_cgpa
 from data_dump b
 where b.ear_person_regno =candidates.regno::bigint;
 
 ----------------------------------------------------------------------------------------------------------
 CREATE TABLE IF NOT EXISTS public.marks
(
    regid character varying COLLATE pg_catalog."default",
    rollno character varying COLLATE pg_catalog."default" NOT NULL,
    name character varying COLLATE pg_catalog."default",
    fname character varying COLLATE pg_catalog."default",
    mname character varying COLLATE pg_catalog."default",
    cat1 character varying COLLATE pg_catalog."default",
    cat2 character varying COLLATE pg_catalog."default",
    cat3 character varying COLLATE pg_catalog."default",
    dob character varying COLLATE pg_catalog."default",
    gender character varying COLLATE pg_catalog."default",
	post_apply character varying COLLATE pg_catalog."default",
    part3_eng double precision,
    part2_ga double precision,
    part1_gi double precision,
    score double precision,
    normalise double precision,
	mistake_c double precision,
    mistake_d double precision,
    medium_skil character varying COLLATE pg_catalog."default",
	cbeqly_c character varying COLLATE pg_catalog."default",
	cbeqly_d character varying COLLATE pg_catalog."default", 
    CONSTRAINT edp_marks_pk PRIMARY KEY (rollno)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.marks
    OWNER to postgres;
 
 \copy marks from 'C:\Users\Public\Steno2022result\Steno2022result\Steno2022Marks.csv' csv header;
 
------------------------------------------------------------------------------------------------------------------------

alter table candidates add column part1_gi double precision;
alter table candidates add column part2_ga double precision;
alter table candidates add column part3_eng double precision;
alter table candidates add column score double precision;
alter table candidates add column total double precision;
alter table candidates add column mistake_d double precision;
alter table candidates add column medium_d character varying COLLATE pg_catalog."default";
alter table candidates add column mistake_c double precision;
alter table candidates add column medium character varying COLLATE pg_catalog."default";

----------------------------------------------------------------------------------------------------------

update candidates
set part1_gi =b.part1_gi ,
part2_ga=b.part2_ga,
part3_eng=b.part3_eng,
score =b.score,
total =b.normalise,
mistake_d=b.mistake_d,
mistake_c=b.mistake_c,
medium = b.medium_skil

from marks b where candidates.regno = b.regid;

---------------------------------------------------------------------------------------------------------
update candidates
set rejection_provision ='R',
remarks ='Marks not available' where regno in ('30004791704',
'30004545511',
'10005998470',
'93000622516',
'94000742618');

------------------------------------------------------------------------------------------------------------------

select * from t_post_pref_steno2022_ssc  where tp_regno in ('10005172557','10000736768');
alter table candidates add column exs_reservation character varying COLLATE pg_catalog."default";

-----------------------------------------------------------------------------------------------------------


select * from candidates where cat2 ='3' ---68;
select * from candidates where cat2 ='3' and isexs_benefit_availed_for_civilpost ='true' ---2
select * from candidates where cat2 ='3' and isexs_benefit_availed_for_civilpost is null ---11
select * from candidates where cat2 ='3' and isexs_benefit_availed_for_civilpost ='false' ---55

update candidates
set exs_reservation ='No',
remarks = 'esm reservation already availed'
where cat2 ='3' and isexs_benefit_availed_for_civilpost ='true';

update candidates
set exs_reservation ='Yes',
remarks = 'esm reservation given'
where cat2 ='3' and isexs_benefit_availed_for_civilpost ='false';

update candidates
set exs_reservation ='Yes',
remarks = 'esm reservation given'
where cat2 ='3' and isexs_benefit_availed_for_civilpost is null;

---------------------------------------------------------------------------------------------------------------

UPDATE candidates
SET exsm_length = LEFT(serviceperiod, 2);

---------------------------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.master_table
(
    serial integer NOT NULL,
    exam_name character varying(15) COLLATE pg_catalog."default",
    flag_name character varying(15) COLLATE pg_catalog."default",
    flag_query text COLLATE pg_catalog."default",
    dob_from_date date,
    dob_to_date date,
    esm_agerelax_codes text COLLATE pg_catalog."default",
    CONSTRAINT master_table_pk PRIMARY KEY (serial)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.master_table
    OWNER to postgres;
	
----------------------------------------------------------------------------------------------

\copy m_debbaredcandidates_ssc to 'C:\Users\Public\debbared165.csv' csv header;

pg_dump -U postgres -h 10.246.126.165 -p 5432 -t m_debbaredcandidates_ssc -F c -f C:\Users\Public\debbared.dump ssc2
pg_restore -U postgres -h 10.246.126.173 -p 5432 -d alloc_steno2022_allocation_final -t m_debbaredcandidates_ssc C:\Users\Public\debbared.dump

------------------------------------------------------------------------------------------------------------------------

Select regno,name,dc_name,father_name,dc_father_name,mother_name,dc_mother_name,dob,dc_dob_name,gender,dc_gender,cat1,dc_category
from candidates,m_debbaredcandidates_ssc where 
--replace ((UPPER(dc_name)||UPPER(dc_father_name)||UPPER(dc_mother_name)),' ','') = replace ((UPPER(name)||UPPER(father_name)||UPPER(mother_name)),' ','');

--replace ((UPPER(dc_name)||UPPER(dc_mother_name)),' ','') = replace ((UPPER(name)||UPPER(mother_name)),' ','') and dob = dc_dob_name;

replace ((UPPER(dc_name)||UPPER(dc_father_name)),' ','') = replace ((UPPER(name)||UPPER(father_name)),' ','') and dob = dc_dob_name;	
--------------------------------------------------------------------------------------------------------------------------

update candidates set rejection_provision ='C' where regno not in ('30004791704',
'30004545511',
'10005998470',
'93000622516',
'94000742618');	
---------------------------------------------------------------------------------------------------------------------------

	do
	$$
	begin
	
	Alter table candidates add column merit integer;
    Alter table candidates add column dob_flag_c character varying COLLATE pg_catalog."default";
    Alter table candidates add column dob_flag_d character varying COLLATE pg_catalog."default";
    Alter table candidates add column catsel_dob_c character varying COLLATE pg_catalog."default";
    Alter table candidates add column catsel_dob_d character varying COLLATE pg_catalog."default";
    Alter table candidates add column cut_off_c character varying COLLATE pg_catalog."default";
    Alter table candidates add column cut_off_d character varying COLLATE pg_catalog."default";
    Alter table candidates add column catsel_c character varying COLLATE pg_catalog."default";
    Alter table candidates add column catsel_d character varying COLLATE pg_catalog."default";
	
	end
	$$
	
----------------------------------------------------------------------------------------------------------------

select * from sp_get_merit('STENO2022',1);

-----------------------------------------------------------------------------------------------------------------

select * from sp_get_dob_flag('STENO2022',2);

-----------------------------------------------------------------------------------------------------------------

select rollno,regno,name,dob,gender,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code,merit,dob_flag_c,dob_flag_d from candidates where dob_flag_c='99';
select dob_flag_c,count(*) from candidates where merit is not null group by dob_flag_c;
select dob_flag_d,count(*) from candidates where merit is not null group by dob_flag_d;

------------------------------------------------------------------------------------------------------------------
dob_flag_c :

"06"	66
"03"	26
"01"	344
"05"	15
"04"	32
"99"	81 ---applied agerelax_code applicable for D post
"02"	62
"9"		18130
--------------------------------------------------------------------------------------------------------------------
dob_flag_d :
"12"	9
"06"	66
"10"	127
"11"	24
"13"	5
"03"	55
"01"	978
"05"	25
"04"	61
"99"	630
"02"	558
"9"		16218
----------------------------------------------------------------------------------------------------
Verification queries for dob_flagS:


1. dob_flag_d =99
select rollno,regno,name,dob,gender,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code,merit,dob_flag_c,dob_flag_d
from candidates where dob_flag_d='99' and is_age_relaxation ='true' and agerelax_code ='1';

2.select rollno,regno,name,dob,gender,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code,merit,dob_flag_c,dob_flag_d
from candidates where dob_flag_d='99' and is_age_relaxation ='true' and agerelax_code ='2';

3. select rollno,regno,name,dob,gender,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code,merit,dob_flag_c,dob_flag_d
from candidates where dob_flag_d='99' and is_age_relaxation ='true' and agerelax_code ='3';

4.select rollno,regno,name,dob,gender,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code,merit,dob_flag_c,dob_flag_d
from candidates where dob_flag_d='99' and is_age_relaxation ='true' and agerelax_code ='4';


1. dob_flag_c =99
select rollno,regno,name,dob,gender,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code,merit,dob_flag_c,dob_flag_c
from candidates where dob_flag_c='99' and is_age_relaxation ='true' and agerelax_code ='10';

2.select rollno,regno,name,dob,gender,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code,merit,dob_flag_c,dob_flag_c
from candidates where dob_flag_c='99' and is_age_relaxation ='true' and agerelax_code ='11';

3. select rollno,regno,name,dob,gender,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code,merit,dob_flag_c,dob_flag_c
from candidates where dob_flag_c='99' and is_age_relaxation ='true' and agerelax_code ='12';


4.select rollno,regno,name,dob,gender,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code,merit,dob_flag_c,dob_flag_c
from candidates where dob_flag_c='99' and is_age_relaxation ='true' and agerelax_code ='13';


------------------------------------------------------------------------------------------------------------

give age relaxation to those candidates whose age >27

Total ESM candidate =68 out of which 67 has opted for ESM age relaxation (06).
1 ESM candidate bearing rollno "1202000487" was not given agerelax_code as age<27.

select rollno,regno,name,dob,gender,age,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code,merit,dob_flag_c,dob_flag_d
from candidates where 
--dob_flag_d='99' and 
is_age_relaxation <>'true' and cat3 is not null
and age>'27';

5 SC/ST pwbd candidates (age>=27) "7204001411","3011007204","7202001353","2006001145","3005003431" has not taken age relaxation has been given SC/ST pwbd age relaxation (05);

update candidates set agerelax_code = '05' where rollno in 
(select rollno
from candidates where 
is_age_relaxation <>'true' and cat3 is not null
and age>='27' and cat1 in('1','2'));

20 OBC pwbd candidates (age>=27) "4410016040" "3010007768" "2201016412" "2006000365" "3003002063" "3005005742" "3013002201" "3013002043" "3206025789" "3206021231" "2201007000" "3010020946" "2405008047" "2006004082" "3005004036" "6005002499" "3005005451" "8001000027" "2201040973" "3206020792" has not taken age relaxation, has been given OBC pwbd age relaxation (05);

update candidates set agerelax_code = '04' where rollno in 
(select rollno
from candidates where 
is_age_relaxation <>'true' and cat3 is not null
and age>='27' and cat1 in('6'));

3 UR pwbd candidates (age>=27) "2003002392","3009001441","2405005756" has not taken age relaxation,has been given UR pwbd age relaxation (03);

update candidates set agerelax_code ='03' where rollno in 
(select rollno
from candidates where 
is_age_relaxation <>'true' and cat3 is not null
and age>='27' and cat1 in('9','0')); 

482 (non esm,non pwbd )candidates (age>=27) has not opted any age relaxation. Hence they were given age relaxations as follows:(only applicable for SC/ST/OBC)

select rollno,regno,name,dob,gender,age,cat1,cat2,cat3,serviceperiod,exsm_length,is_age_relaxation,agerelax_code_raw,agerelax_code,merit,dob_flag_c,dob_flag_d
from candidates where 
is_age_relaxation <>'true' and cat3 is null and cat2 is null
and age>='27'

164 SC/ST candidates (age>=27) has not taken age relaxation,has been given SC/ST age relaxation (01);

update candidates set agerelax_code = '01' where rollno in 
(select rollno
from candidates where 
is_age_relaxation <>'true' and cat3 is null and cat2 is null
and age>='27' and cat1 in('1','2'));


88 OBC candidates (age>=27) has not taken age relaxation,has been given OBC age relaxation (02);

update candidates set agerelax_code = '02' where rollno in 
(select rollno
from candidates where 
is_age_relaxation <>'true' and cat3 is null and cat2 is null
and age>='27' and cat1 in('6'));

---------------------------------------------------------------------------------------------------------------------------------------
catsel verification:

select rollno,name,dob,gender,catsel_dob_c,cut_off_c,catsel_c from candidates where (catsel_c is null or catsel_c='') and (cut_off_c is not null and cut_off_c<>'');
select rollno,name,dob,gender,catsel_dob_c,cut_off_c,catsel_c from candidates where (catsel_c is not null and catsel_c<>'') and cut_off_c=catsel_c;

-----------------------------------------------------------------------------------------------------------------------------------------

update candidates
set medium_c =substring(medium,4,1)
where mistake_c is not null;

update candidates
set medium_d =substring(medium,4,1)
where mistake_d is not null;

-----------------------------------------------------------------------------------------------------------------------------------------------

update candidates
set allocated_post =null,
allocated_medium =null,
allocated_category =null,
allocated_against_ur =null;


------------------------------------------------------------------------------------------------------------------------------------------------


update candidates
set 
cut_off_c =null,
cut_off_d =null,
catsel_c=null,
catsel_d=null,
allocated_post =null,
allocated_medium =null,
allocated_category =null,
allocated_against_ur =null;

-----------------------------------------------------------------------------------------------------------------------------------------------

update vacancy_table set
current =initial;
-------------------------------------------------------------------------------------------------------------------------------------

update vacancy_table
set allocated=null,
left_vacancy=null,
min_marks=null,
min_marks_part1_gi =null,
min_marks_part2_ga=null,
min_marks_cand_dob=null,
min_marks_merit =null;


----------------------------------------------------------------------------------------------------------------------------------

select ear_person_regno,ear_noofattempt,ear_isactive from t_steno2022exam_applicant_reg_pu inner join temp_steno
on t_steno2022exam_applicant_reg_pu.ear_person_regno = temp_steno.tp_regno
and ear_isactive = 'true' and ear_application_status = '1'

update exam_wise_candidateresultdata_steno2022
set region_id =b.ear_region_id,

from t_steno2022exam_applicant_reg_pu b where exam_wise_candidateresultdata_steno2022.regno = b.ear_person_regno
and b.ear_isactive = 'true' and b.ear_application_status = '1';

