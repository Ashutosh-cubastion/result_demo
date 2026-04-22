CREATE TABLE candidates
(
    ear_person_regno bigint NOT NULL,
    ear_name text COLLATE pg_catalog."default" NOT NULL,
    ear_changedname text COLLATE pg_catalog."default",
    ear_father_name text COLLATE pg_catalog."default" NOT NULL,
    ear_mother_name text COLLATE pg_catalog."default" NOT NULL,
    ear_dob date NOT NULL,
    ear_candiateage_ason_date real NOT NULL,
    ear_gender integer NOT NULL,
    ear_categoryid integer,
    ear_nationality integer NOT NULL,
    ear_identification_mark text COLLATE pg_catalog."default" NOT NULL,
    ear_tenth_education_board integer NOT NULL,
    ear_tenth_roll_no text COLLATE pg_catalog."default" NOT NULL,
    ear_tenth_yearofpassing integer NOT NULL,
    ear_photo_img_url text COLLATE pg_catalog."default" NOT NULL,
    ear_sign_img_url text COLLATE pg_catalog."default" NOT NULL,
    ear_centerid1 integer NOT NULL,
    ear_centerid2 integer NOT NULL,
    ear_centerid3 integer NOT NULL,
    ear_regionid integer NOT NULL,
    ear_is_ex_serviceman boolean NOT NULL,
    ear_service_period text COLLATE pg_catalog."default",
    ear_joining_date_for_armedforces date,
    ear_joining_date_for_civilpost date,
    ear_discharged_date date,
    ear_isexs_benefit_availed_for_civilpost boolean,
    ear_is_physically_handicaped boolean,
    ear_ph_code integer,
    ear_is_cerebral_palsy boolean,
    ear_is_physical_limitation boolean,
    ear_is_scribe_required boolean,
    ear_scribe_medium integer,
    ear_own_scribe boolean,
    ear_state_ut_pref text COLLATE pg_catalog."default" NOT NULL,
    ear_is_age_relaxation boolean NOT NULL,
    ear_age_relaxation_code integer,
    ear_isactive boolean DEFAULT true,
    ear_ip_address text COLLATE pg_catalog."default",
    ear_createdbyid integer,
    ear_createdbyrid integer,
    ear_updbyid integer,
    ear_upddtm timestamp without time zone,
    ear_createddtm timestamp without time zone DEFAULT now(),
    ear_notificationid integer NOT NULL,
    ear_application_status integer,
    ear_is_ews_candidate boolean,
    ear_share_persinfo_accrossportal boolean NOT NULL,
    ear_languagepreference integer,
    ear_edqualification integer NOT NULL,
    ear_education_details text COLLATE pg_catalog."default" NOT NULL,
    ear_passed_qual_exam text COLLATE pg_catalog."default",
    ear_state_for_university integer,
    ear_eduqual_university_board integer,
    ear_eduqual_rollno text COLLATE pg_catalog."default",
    ear_eduqual_passingyear integer,
    ear_eduqual_percentage text COLLATE pg_catalog."default",
    ear_eduqual_cgpa text COLLATE pg_catalog."default",
    ear_present_address text COLLATE pg_catalog."default",
    ear_present_districtid integer,
    ear_present_stateid integer,
    ear_present_pincode integer,
    ear_permanent_address text COLLATE pg_catalog."default",
    ear_permanent_stateid integer,
    ear_permanent_districtid integer,
    ear_permanent_pincode integer,
    ear_email_id text COLLATE pg_catalog."default" NOT NULL,
    ear_mobile_number text COLLATE pg_catalog."default" NOT NULL,
    ear_other_national_address text COLLATE pg_catalog."default",
    ear_photo_date text COLLATE pg_catalog."default",
    ear_isdate_clear_on_photo boolean NOT NULL,
    challan_generation_date date,
    challan_downloaded_date date,
    challan_refno text COLLATE pg_catalog."default",
    applicationfee character varying(30) COLLATE pg_catalog."default" NOT NULL,
    ear_rollno text COLLATE pg_catalog."default",
    ear_qrcode_path text COLLATE pg_catalog."default",
    ear_add_source character(1) COLLATE pg_catalog."default",
    ear_upd_source character(1) COLLATE pg_catalog."default",
    ear_noofattempt integer,
    ear_flag integer,
    ear_piflag integer,
    ear_siflag integer,
    ear_piflag_lastupdtm timestamp without time zone,
    ear_siflag_lastupdtm timestamp without time zone,
    ear_isdraftprint_util_flag boolean,
    CONSTRAINT t_mtsexam2022_applicant_reg_pu_pk PRIMARY KEY (ear_person_regno)
)

	
	
	
alter table marks add column regno character varying;

	
update marks 
set regno = b.reg_no
from reg_roll_map b where marks.rollno = b.rollno;	---2277913

do
$$
begin

 

Alter table candidates_bkp_25082023 add column  name character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column father_name character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column mother_name character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column dob date;
Alter table candidates_bkp_25082023 add column gender character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column cat1 character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column  is_ex_serviceman boolean;
Alter table candidates_bkp_25082023 add column cat2 character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column joining_date_for_armedforces date;
Alter table candidates_bkp_25082023 add column discharged_date date;
Alter table candidates_bkp_25082023 add column service_period character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column is_exs_benefit_availed_for_civilpost character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column joining_date_for_civilpost date;
Alter table candidates_bkp_25082023 add column exsm_length character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column exs_reservation character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column phy_handicapped character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column cat3 character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column agerelax character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column agerelax_code_app character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column agerelax_code character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column state_preference character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column permanent_district character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column permanent_state character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column permanent_pincode character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column mobile character varying COLLATE pg_catalog."default";
Alter table candidates_bkp_25082023 add column email character varying COLLATE pg_catalog."default";

 

end
$$


update candidates_bkp_25082023

set name =b.ear_name,
    father_name =b.ear_father_name,
    mother_name =b.ear_mother_name,
    dob =b.ear_dob,
    gender =b.ear_gender,
    cat1 =b.ear_categoryid,
    is_ex_serviceman = b.ear_is_ex_serviceman,
    joining_date_for_armedforces =b.ear_joining_date_for_armedforces,
    discharged_date =b.ear_discharged_date,
    service_period =b.ear_service_period,
    is_exs_benefit_availed_for_civilpost =b.ear_isexs_benefit_availed_for_civilpost,
    joining_date_for_civilpost =b.ear_joining_date_for_civilpost,
    phy_handicapped =b.ear_is_physically_handicaped,
    cat3 =b.ear_ph_code,
    agerelax =b.ear_is_age_relaxation,
    agerelax_code_app =b.ear_age_relaxation_code,
    state_preference =b.ear_state_ut_pref,
    permanent_district =b.ear_permanent_districtid,
    permanent_state =b.ear_permanent_stateid,
    permanent_pincode =b.ear_permanent_pincode,
    mobile =b.ear_mobile_number,
    email =b.ear_email_id
    from t_mtsexam2022_applicant_reg_pu b
    where b.ear_person_regno ::character varying = candidates_bkp_25082023.regno;
	
update candidates_bkp_25082023
set cat2= '3' where is_ex_serviceman='true';---9116


update candidates_bkp_25082023
set exsm_length= substring(service_period,1,3);


update candidates_bkp_25082023
set exs_reservation = 'Yes'
where is_exs_benefit_availed_for_civilpost<>'true' and cat2='3' ----8594


update candidates_bkp_25082023
set agerelax_code =agerelax_code_app;


update candidates_bkp_25082023
set agerelax_code='06' where cat2='3' and (agerelax_code_app is null or agerelax_code_app ='');----93 esm relaxation given

select rollno,regno,gender,cat1,cat2,exsm_length,cat3,agerelax,agerelax_code_app,agerelax_code 
from candidates_bkp_25082023 where cat2 is null and cat3 in ('4','5','7','8')and cat1 in ('9','0') and (agerelax_code_app is null or agerelax_code_app ='');

update candidates_bkp_25082023 
set agerelax_code ='03'  where cat2 is null and cat3 in ('4','5','7','8')and cat1 in ('9','0') and (agerelax_code_app is null or agerelax_code_app ='');---3767+905

select rollno,regno,gender,cat1,cat2,exsm_length,cat3,agerelax,agerelax_code_app,agerelax_code 
from candidates_bkp_25082023 where cat2 is null and cat3 in ('4','5','7','8')and cat1 in ('6') and (agerelax_code_app is null or agerelax_code_app ='');

update candidates_bkp_25082023 
set agerelax_code ='04'  where cat2 is null and cat3 in ('4','5','7','8')and cat1 in ('6') and (agerelax_code_app is null or agerelax_code_app ='');---8089

select rollno,regno,gender,cat1,cat2,exsm_length,cat3,agerelax,agerelax_code_app,agerelax_code 
from candidates_bkp_25082023 where cat2 is null and cat3 in ('4','5','7','8')and cat1 in ('1','2') and (agerelax_code_app is null or agerelax_code_app ='');

update candidates_bkp_25082023 
set agerelax_code ='05'  where cat2 is null and cat3 in ('4','5','7','8')and cat1 in ('1','2') and (agerelax_code_app is null or agerelax_code_app ='');--3393

select rollno,regno,gender,cat1,cat2,exsm_length,cat3,agerelax,agerelax_code_app,agerelax_code 
from candidates_bkp_25082023 where cat2 is null and cat3 is null and cat1 in ('1','2') and (agerelax_code_app is null or agerelax_code_app ='');

update candidates_bkp_25082023 
set agerelax_code ='01'  where cat2 is null and cat3 is null and cat1 in ('1','2') and (agerelax_code_app is null or agerelax_code_app ='');---483881

select rollno,regno,gender,cat1,cat2,exsm_length,cat3,agerelax,agerelax_code_app,agerelax_code 
from candidates_bkp_25082023 where cat2 is null and cat3 is null and cat1 in ('6') and (agerelax_code_app is null or agerelax_code_app ='');

update candidates_bkp_25082023 
set agerelax_code ='02'  where cat2 is null and cat3 is null and cat1 in ('6') and (agerelax_code_app is null or agerelax_code_app ='');---835539


do
$$
begin

alter table candidates_bkp_25082023 add column session1 double precision;
alter table candidates_bkp_25082023 add column session2 double precision;
alter table candidates_bkp_25082023 add column dob_flag_18_25 character varying;
alter table candidates_bkp_25082023 add column dob_flag_18_27 character varying;
alter table candidates_bkp_25082023 add column catsel_dob_18_25 character varying;
alter table candidates_bkp_25082023 add column catsel_dob_18_27 character varying;

end
$$

update candidates
set session1= part1_nm + part2_reasoning,
session2= part3_ga + part4_eng;


Debbared checking:---------------------------------------------------------------

select a.regno,a.rollno,a.name,a.dob,a.father_name,a.mother_name,a.dob,a.gender,a.cat1,
b.regno,b.rollno,b.name,b.dob,b.father_name,b.mother_name,b.dob,b.gender,b.cat1

from candidates a,candidates b where 
replace (substring(UPPER(a.name),1,4)||substring(UPPER(a.father_name),1,4)||substring(UPPER(a.mother_name),1,4),' ','') = replace (substring(UPPER(b.name),1,4)||substring(UPPER(b.father_name),1,4)||substring(UPPER(b.mother_name),1,4),' ','');

--replace ((UPPER(dc_name)||UPPER(dc_mother_name)),' ','') = replace ((UPPER(cand_name)||UPPER(cand_mname)),' ','') and dob = dc_dob_name;

--replace ((UPPER(dc_name)||UPPER(dc_father_name)),' ','') = replace ((UPPER(cand_name)||UPPER(cand_fname)),' ','') and dob = dc_dob_name;


update candidates
set tenth_education_board =b.ear_tenth_education_board,
tenth_rollno= b.ear_tenth_roll_no,
tenth_yearofpassing= b.ear_tenth_yearofpassing
from t_mtsexam2022_applicant_reg_pu b
where b.ear_person_regno ::character varying = candidates.regno;


create table multi_flag as 
(
with cte1 as 
(
select regno,rollno,name,dob,father_name,mother_name,gender,cat1,tenth_education_board,tenth_rollno,tenth_yearofpassing,
	replace (substring(UPPER(name),1,4)||substring(UPPER(father_name),1,4)||substring(UPPER(mother_name),1,4),' ','') as key1 from candidates
),
cte2 as 
(
	select key1 as key2,count(regno)as total_count from cte1 group by key1
)
select cte1.regno,cte1.rollno,cte1.name,cte1.dob,cte1.father_name,cte1.mother_name,cte1.gender,cte1.cat1,cte1.tenth_education_board,cte1.tenth_rollno,cte1.tenth_yearofpassing,cte1.key1,cte2.total_count
from cte1,cte2 where cte1.key1=cte2.key2 and cte2.total_count>'2'
	);
	
	
create table cut_off_table_new 
(
	category character varying not null,
	session1 double precision,
	session2 double precision,
	constraint cut_off primary key (category)
)


create table data1 as (select ear_person_regno,ear_regionid,ear_name,ear_gender,ear_dob,ear_categoryid,ear_is_ex_serviceman,
ear_joining_date_for_armedforces,ear_discharged_date,ear_isexs_benefit_availed_for_civilpost,ear_ph_code as cat3,
ear_age_relaxation_code,ear_state_ut_pref,ear_permanent_stateid,permanent_districtid,ear_permanent_pincode
from t_mtsexam2022_applicant_reg_pu);


create table data2 as (select ear_person_regno,ear_name,ear_changedname,ear_father_name,ear_mother_name,
ear_edqualification,ear_education_details,ear_state_for_university,ear_edqual_university_board,ear_edqual_rollno,
ear_edqual_passingyear,ear_edqual_percentage,ear_edqual_cgpa from t_mtsexam2022_applicant_reg_pu);


copy
(select a.ear_person_regno as regno,a.ear_regionid as region,a.ear_name as name,a.ear_gender as gender,
a.ear_dob as dob,a.ear_categoryid as cat1, case when a.ear_is_ex_serviceman ='true' then 3 else 0 end as cat2,
a.ear_joining_date_for_armedforces as ESM_DOJ,a.ear_discharged_date as ESM_DOD,a.ear_isexs_benefit_availed_for_civilpost as
exs_reservation,a.cat3,a.ear_age_relaxation_code as ar_code, a.ear_state_ut_pref as post_preference,a.ear_permanent_stateid as stateid,
b.st_state_name as permanent_state,a.ear_permanent_districtid as permanent_districtid,c.ds_dist_name as permanent_district, a.ear_permanent_pincode as permannet_pincode 
from
data1 a,
m_states_gis b,
m_districts_gis c where
a.ear_permanent_stateid  =b.st_stateid and
a.ear_permanent_districtid=c.ds_distid) to 'C:\Users\Public\reqData1.csv' csv header;


MTS2022_T1_reprocessed


copy
(select a.ear_person_regno as regno,
a.ear_name as name,
a.ear_changedname as new_name,
a.ear_father_name as father_name,
a.ear_mother_name as mother_name,
a.ear_edqualification as highestqualificationid,
b.eq_ed_qualification as highest_qualification,
a.ear_education_details as educationl_qualification,
a.ear_state_for_university as state_for_university_id,
d.st_state_name as EQ_State,
a.ear_eduqual_university_board as eduqual_university_board_id,
c.uni_name as EQ_University_Board,
a.ear_eduqual_rollno as  EQ_Roll_Number,
a.ear_eduqual_passingyear as  EQ_Year_of_passing, 
a.ear_eduqual_percentage as EQ_Percentage, 
a.ear_eduqual_cgpa as EQ_CGPA from 
data2 a,
 m_universities_ssc c,
 m_educational_qual_pu b,
 m_states_gis d
 where 
 a.ear_edqualification= b.eq_id and
 a.ear_eduqual_university_board =c.uni_id and
 a.ear_state_for_university =d.st_stateid)
 to 'C:\Users\Public\reqdata2.csv' csv header;



update marks_edp 
set regno = b.reg_no from reg_roll_map b where
marks_edp.participantid=b.rollno;----2277913

update candidates set
part1_nm = b.NumericalandMathematicalAbility,
part2_reasoning =b.ReasoningAbilityandProblemSolving,
part3_ga =b.GeneralAwareness,
part4_eng=b.EnglishLanguageandComprehension,
score=b.Score,
total_normalized =b.Normalized_Score,
session1_raw=b.Group1_score,
session2_raw=b.Group2_score,
session1= b.Group1_Normalized_Score,
session2= b.Group2_Normalized_Score
from marks_edp b where candidates.rollno = b.participantid;


alter table candidates add column total double precision;

update candidates
set total = session1+session2;


update candidates
set exs_reservation ='Yes' where cat2='3';---9116

update candidates
set exs_reservation ='No' where cat2='3' and is_exs_benefit_availed_for_civilpost='true';----15


update vacancy_table set current= initial_vacancy;


select count(*) from candidates where allocated_state is not null limit 10;

select * from vacancy_table where age_limit='18-27' and post_code<>'MTS';


alter table vacancy_table add column lowestMarkssession1 double precision;

update vacancy_table set allocated =current,
left_vacancy ='0' where initial_vacancy<>'0';


alter table candidates add column post_name_havaldar character varying;
alter table candidates add column post_code_havaldar character varying;
alter table candidates add column state_name_havaldar character varying;


update candidates set post_name_havaldar=vacancy_table.post_name,
post_code_havaldar=vacancy_table.post_code,
state_name_havaldar=vacancy_table.state_name
from vacancy_table where candidates.allocated_state_havaldar=vacancy_table.state_code and vacancy_table.post_code<>'MTS' and 
candidates.allocated_state_havaldar is not null;------3015


update vacancy_table
set allocated=null,
left_vacancy=null,
min_marks=null,
minpart4marks=null,
min_marks_cand_dob=null,
lowestmarkssession1 =null;


update candidates
set allocated_category=null,
allocated_state=null,
age_limit=null,
allocated_against_ur =null,
post_name_havaldar=null,
post_code_havaldar=null,
state_name_havaldar=null;



sirs allocated

4404010849
4417022760
4404001914
4410116304
4426000525
3206063964
4205062133
2002005195
