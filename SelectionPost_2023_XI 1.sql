create table unvrified_data
(
regid character varying,
roll character varying,
name character varying,
exam_level character varying,
post_code character varying,
exam_date date,
exam_shift character varying,
tcs_v_code character varying
)


psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_selectionpost2023_xi_allocation




create table marks

(
ParticipantID character varying,	
Name character varying,
General_Intelligence double precision,
General_Awareness double precision,	
Quantitative_Aptitude double precision,
English_Language double precision,
Score double precision,
Normalized_Score double precision,
Date_Shift character varying,
System_Name character varying,
EQ CHARACTER VARYING
)

update unverified_data
set exam_level ='Matriculation' where exam_level ='M';
update unverified_data
set exam_level ='Higher Secondary (10+2)' where exam_level ='H';
update unverified_data
set exam_level ='Graduation & Above' where exam_level ='G';


alter table unverified_data add column key character varying;

update unverified_data
set key = roll||exam_level;

alter table marks add column key character varying;

update marks
set key = participantid||eq;

select b.roll,b.name,b.regid,a.participantid,a.name from
marks a,
unverified_data b
where a.key not in (b.key);


alter table marks
add constraint marks_pk primary key(participantid,eq);


select * from  unverified_data order by roll,exam_level limit 10;
select * from marks where participantid ='1311000004';


alter table marks add column regno character varying;

update marks
set regno =b.regid
from unverified_data b where marks.key=b.key;----335446

select * from marks where regno is null;---5557

psql -U postgres -h 10.246.126.165 -p 5432 -d ssc2

\copy (select * from t_examrhq2023_applicant_reg_pu where ear_isactive ='true' and ear_application_status ='1') to 'C:\Users\Public\rhq2023_165.csv' csv header;




CREATE TABLE IF NOT EXISTS public.t_examrhq2023_applicant_reg_pu
(
    ear_appl_regid bigint NOT NULL,
    ear_person_regno bigint NOT NULL,
    ear_personid integer NOT NULL,
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
    ear_centerid3 integer,
    ear_regionid integer NOT NULL,
    ear_region_of_post integer NOT NULL,
    ear_postid integer NOT NULL,
    ear_postcode text COLLATE pg_catalog."default" NOT NULL,
    ear_postname text COLLATE pg_catalog."default" NOT NULL,
    ear_levelofpost text COLLATE pg_catalog."default" NOT NULL,
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
    ear_own_scribe boolean,
    ear_scribe_medium integer,
    ear_whether_skilltest_required boolean,
    ear_skilltest_medium integer,
    ear_is_age_relaxation boolean NOT NULL,
    ear_age_relaxation_code integer,
    ear_edqualification integer NOT NULL,
    ear_edqual_name text COLLATE pg_catalog."default" NOT NULL,
    ear_edsubject integer NOT NULL,
    ear_edsub_name text COLLATE pg_catalog."default" NOT NULL,
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
    ear_share_persinfo_accrossportal boolean,
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
    ear_photo_date date,
    ear_isdate_clear_on_photo boolean NOT NULL,
    challan_generation_date date,
    challan_downloaded_date date,
    challan_refno text COLLATE pg_catalog."default",
    applicationfee character varying(30) COLLATE pg_catalog."default",
    ear_rollno text COLLATE pg_catalog."default",
    ear_qrcode_path text COLLATE pg_catalog."default",
    ear_add_source character(1) COLLATE pg_catalog."default",
    ear_upd_source character(1) COLLATE pg_catalog."default",
    ear_language_option text COLLATE pg_catalog."default",
    ear_highest_edu_qual text COLLATE pg_catalog."default",
    ear_is_obc_by_delhi_govt boolean,
    ear_reg_categoryid integer,
    ear_is_delhi_police boolean,
    ear_is_modified boolean,
    ear_declaration_for_post boolean,
    ear_noofattempt integer,
    ear_flag integer,
    ear_piflag integer,
    ear_siflag integer,
    ear_piflag_lastupdtm timestamp without time zone,
    ear_siflag_lastupdtm timestamp without time zone,
    ear_isdraftprint_util_flag boolean,
    ear_isextended boolean
	)
	
	
psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_selectionpost2023_xi_allocation
	
\copy t_examrhq2023_applicant_reg_pu from 'C:\Users\Public\rhq2023_165.csv' csv header;


create table cut_off_table
(
	serial_id integer,
	category character varying,
	total double precision,
	constraint cut_off_pk primary key (serial_id)
);

\copy cut_off_table from 'C:\Users\Public\cut_off_table_rhq2023.csv' csv header;

CREATE TABLE IF NOT EXISTS public.master_table
(
    serial integer NOT NULL,
    exam_name character varying(15) COLLATE pg_catalog."default",
    exam_year character varying(4) COLLATE pg_catalog."default",
    flag_name character varying(30) COLLATE pg_catalog."default",
    flag_query text COLLATE pg_catalog."default",
    updatecolumn1 character varying COLLATE pg_catalog."default",
    level_of_post character varying COLLATE pg_catalog."default",
    dob_from_date date,
    dob_to_date date,
    esm_agerelax_codes text COLLATE pg_catalog."default",
    CONSTRAINT master_table_pk PRIMARY KEY (serial)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.master_table
    OWNER to postgres;
	
	
alter table marks add column key2 character varying;
alter table unverified_data add column key2 character varying;

update unverified_data 
set key2 = regid||exam_level;

update marks 
set key2 = regno||eq;	


do
$$
BEGIN
Alter table unverified_data add column General_Intelligence double precision;
Alter table unverified_data add column General_Awareness double precision;
Alter table unverified_data add column Quantitative_Aptitude double precision;
Alter table unverified_data add column English_Language double precision;
Alter table unverified_data add column Score double precision;
Alter table unverified_data add column Normalized_Score double precision;

end
$$

UPDATE unverified_data
 set General_Intelligence = B.General_Intelligence,
 General_Awareness = B.General_Awareness,
 Quantitative_Aptitude = B.Quantitative_Aptitude,
 English_Language = B.English_Language,
 Score = B.Score,
 Normalized_Score = B.Normalized_Score
 
 from marks b where b.key2 = unverified_data.key2;
 
 
copy (select ear_person_regno as "Registration ID",ear_name as Name, ear_changedname as "New Name",
ear_father_name as "father_name",ear_mother_name as mother_name,ear_dob as DOB,ear_candiateage_ason_date as Age,
ear_gender as Gender,ear_categoryid as "Category",ear_tenth_education_board as "Matriculation Board",ear_tenth_roll_no as "Matriculation Roll",
ear_tenth_yearofpassing as "Matriculation Year",ear_regionid as "Region",ear_region_of_post as "Region of Post",
ear_postcode as "Post Code",ear_postname as "Post Name",ear_levelofpost as "Level of Post", ear_is_ex_serviceman as "Whether ESM",
ear_joining_date_for_armedforces as "ESM Date of Joining",ear_discharged_date as " ESM Date of Discharge",ear_joining_date_for_civilpost as "Date of joining the Civil Post",
ear_isexs_benefit_availed_for_civilpost as " ESM benefit availed for Civil Post",ear_ph_code as "PH_CODE",
ear_is_cerebral_palsy as " Is CP",ear_is_physical_limitation as "Is Physical Limitation",ear_is_scribe_required as "Scribe required",
ear_own_scribe as "Own Scribe",ear_whether_skilltest_required as "Skill Test required",ear_skilltest_medium as "Skill Test Medium",
ear_is_age_relaxation as "Age relaxation required",ear_age_relaxation_code as "Age-relaxation Code",
ear_share_persinfo_accrossportal as "Share Personal Information",ear_permanent_stateid as "Permanent State ID",ear_permanent_districtid as "Permanent District ID",
ear_permanent_pincode as "Permanent PIN",ear_email_id as "Email ID",ear_mobile_number as "Mobile Number",
applicationfee as "Application Fee"
from t_examrhq2023_applicant_reg_pu) to 'C:\Users\Public\rhq2023_reqData.csv' csv header;---1407701


update candidates
set filed159 ='Yes'
where candidate_name is null;---159 records


update candidates set 
candidate_name = b.ear_name,
changed_name=b.ear_changedname,
father_name=b.ear_father_name,
mother_name=b.ear_mother_name,
dob=b.ear_dob,
gender=b.ear_gender,
region_id=b.ear_regionid,
region_of_post=b.ear_region_of_post,
post_code_app=b.ear_postcode,
post_name=b.ear_postname,
level_of_post=b.ear_levelofpost,
cat1=b.ear_categoryid,
is_ex_serviceman=b.ear_is_ex_serviceman,
joining_date =b.ear_joining_date_for_armedforces,
discharged_date =b.ear_discharged_date,
service_period =b.ear_service_period,
joining_date_for_civil_post =b.ear_joining_date_for_civilpost,
isexs_benefit_availed_for_civilpost=b.ear_isexs_benefit_availed_for_civilpost,
is_ph=b.ear_is_physically_handicaped,
cat3 =b.ear_ph_code,
skilltest=b.ear_whether_skilltest_required,
skilltest_medium=b.ear_skilltest_medium,
agerelax =b.ear_is_age_relaxation,
agerelax_code_app =b.ear_age_relaxation_code,
permanent_address=b.ear_permanent_address,
permanent_district=b.ear_permanent_districtid,
permanent_state=b.ear_permanent_stateid,
permanent_pincode=b.ear_permanent_pincode,
present_address=b.ear_present_address,
present_district=b.ear_present_districtid,
present_state=b.ear_present_stateid,
present_pincode=b.ear_present_pincode,
email_id =b.ear_email_id,
mobile_number =b.ear_mobile_number

from t_examrhq2023_applicant_reg_pu b
where candidates.regid||candidates.post_code = b.ear_person_regno||b.ear_postcode;--------757687 updates

update candidates set 
candidate_name = b.ear_name,
changed_name=b.ear_changedname,
father_name=b.ear_father_name,
mother_name=b.ear_mother_name,
dob=b.ear_dob,
gender=b.ear_gender,
region_id=b.ear_regionid,
region_of_post=b.ear_region_of_post,
post_code_app=b.ear_postcode,
post_name=b.ear_postname,
level_of_post=b.ear_levelofpost,
cat1=b.ear_categoryid,
is_ex_serviceman=b.ear_is_ex_serviceman,
joining_date =b.ear_joining_date_for_armedforces,
discharged_date =b.ear_discharged_date,
service_period =b.ear_service_period,
joining_date_for_civil_post =b.ear_joining_date_for_civilpost,
isexs_benefit_availed_for_civilpost=b.ear_isexs_benefit_availed_for_civilpost,
is_ph=b.ear_is_physically_handicaped,
cat3 =b.ear_ph_code,
skilltest=b.ear_whether_skilltest_required,
skilltest_medium=b.ear_skilltest_medium,
agerelax =b.ear_is_age_relaxation,
agerelax_code_app =b.ear_age_relaxation_code,
permanent_address=b.ear_permanent_address,
permanent_district=b.ear_permanent_districtid,
permanent_state=b.ear_permanent_stateid,
permanent_pincode=b.ear_permanent_pincode,
present_address=b.ear_present_address,
present_district=b.ear_present_districtid,
present_state=b.ear_present_stateid,
present_pincode=b.ear_present_pincode,
email_id =b.ear_email_id,
mobile_number =b.ear_mobile_number
from t_examrhq2023_applicant_reg_pu b
where candidates.regid ::bigint= b.ear_person_regno
and candidates.filed159='Yes'; ----159 updates

select * from candidates where is_ex_serviceman ='Yes';----6475

update candidates
set cat2 ='3' where is_ex_serviceman ='Yes';---6475 updates

update candidates 
set exsm_length = substring(service_period,1,3);---757846 updates

update candidates 
set exs_reservation ='Yes' where cat2='3';---6475 updates

update candidates 
set exs_reservation ='No' where cat2='3' and isexs_benefit_availed_for_civilpost ='true';---70 updates


update candidates
set agerelax_code = agerelax_code_app;----757846 updates

Age-relaxation updates:------------------------------------------------------------------------------------


update candidates
set agerelax_code ='06'
where cat2='3'  and agerelax ='false';---48 updates

select count(*) 
from candidates where cat2 is null  and cat3 is not null and agerelax ='false';----6312


update candidates
set agerelax_code ='03'
where cat2 is null  and cat3 is not null and agerelax ='false' and cat1 in ('9','0') ;---2431 updates

update candidates
set agerelax_code ='04'
where cat2 is null  and cat3 is not null and agerelax ='false' and cat1 in ('6') ;---3087 updates

update candidates
set agerelax_code ='05'
where cat2 is null  and cat3 is not null and agerelax ='false' and cat1 in ('1','2') ;---794 updates


update candidates
set agerelax_code ='01'
where cat2 is null  and cat3 is null and agerelax ='false' and cat1 in ('1','2') ;---180035 updates

update candidates
set agerelax_code ='02'
where cat2 is null  and cat3 is null and agerelax ='false' and cat1 in ('6') ;----216626 updates

insert into candidates_distinct (regid,roll,name,exam_level,post_code,exam_date,exam_shift,tcs_v_code,key1,key2,general_intelligence,general_awareness,quantitative_aptitude,english_language,score,normalized_score,candidate_name,changed_name,father_name,mother_name,dob,gender,region_id,region_name,region_of_post,post_code_app,post_name,level_of_post,cat1,is_ex_serviceman,cat2,joining_date,discharged_date,service_period,exsm_length,joining_date_for_civil_post,isexs_benefit_availed_for_civilpost,exs_reservation,is_ph,cat3,skilltest,skilltest_medium,agerelax,agerelax_code_app,agerelax_code,permanent_address,permanent_district,permanent_state,permanent_pincode,present_address,present_district,present_state,present_pincode,email_id,mobile_number,filed159,prkey)
select distinct on (prkey) regid,roll,name,exam_level,post_code,exam_date,exam_shift,tcs_v_code,key1,key2,general_intelligence,general_awareness,quantitative_aptitude,english_language,score,normalized_score,candidate_name,changed_name,father_name,mother_name,dob,gender,region_id,region_name,region_of_post,post_code_app,post_name,level_of_post,cat1,is_ex_serviceman,cat2,joining_date,discharged_date,service_period,exsm_length,joining_date_for_civil_post,isexs_benefit_availed_for_civilpost,exs_reservation,is_ph,cat3,skilltest,skilltest_medium,agerelax,agerelax_code_app,agerelax_code,permanent_address,permanent_district,permanent_state,permanent_pincode,present_address,present_district,present_state,present_pincode,email_id,mobile_number,filed159,prkey
from candidates; -----757829


alter table candidates add constraint pk primary key (regid,post_code);

CREATE TABLE IF NOT EXISTS public.m_debbaredcandidates_ssc
(
    dc_id integer NOT NULL ,
    dc_createdbyid integer,
    dc_createdbyrid integer,
    dc_updbyid integer,
    dc_upddtm timestamp without time zone,
    dc_createddtm timestamp without time zone ,
    dc_isactive boolean ,
    dc_orderby integer,
    dc_ipaddress text COLLATE pg_catalog."default",
    dc_rollno text COLLATE pg_catalog."default",
    dc_name text COLLATE pg_catalog."default" NOT NULL,
    dc_father_name text COLLATE pg_catalog."default" NOT NULL,
    dc_mother_name text COLLATE pg_catalog."default",
    dc_dob_name date NOT NULL,
    dc_gender integer NOT NULL,
    dc_category text COLLATE pg_catalog."default",
    dc_name_year_exam text COLLATE pg_catalog."default" NOT NULL,
    dc_debarreddate date NOT NULL,
    dc_debarred_upto date NOT NULL,
    dc_dc_debbared_reason text COLLATE pg_catalog."default" NOT NULL,
    debarredyear integer NOT NULL,
    region_code integer NOT NULL,
    dc_regno bigint,
    dc_isews text COLLATE pg_catalog."default",
    dc_tenthboard integer,
    dc_tenthyear text COLLATE pg_catalog."default",
    dc_tenthroll text COLLATE pg_catalog."default",
    dc_photo text COLLATE pg_catalog."default"
	);

psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_selectionpost2023_xi_allocation	
\copy m_debbaredcandidates_ssc from 'C:\Users\Public\debbared_ssc.csv' csv header;	


update candidates
set post_name = null where filed159 ='Yes';---159 updates


alter table arc_table
add constraint pk primary key (arc_code,age_group);

do
$$
begin

Alter table candidates add column dob_flag_18_25 character varying;
Alter table candidates add column dob_flag_18_27 character varying;
Alter table candidates add column dob_flag_18_28 character varying;
Alter table candidates add column dob_flag_18_30 character varying;
Alter table candidates add column dob_flag_18_32 character varying;
Alter table candidates add column dob_flag_19_25 character varying;
Alter table candidates add column dob_flag_20_25 character varying;
Alter table candidates add column dob_flag_21_26 character varying;
Alter table candidates add column dob_flag_21_27 character varying;
Alter table candidates add column dob_flag_22_28 character varying;
Alter table candidates add column catsel_dob_18_25 character varying;
Alter table candidates add column catsel_dob_18_27 character varying;
Alter table candidates add column catsel_dob_18_28 character varying;
Alter table candidates add column catsel_dob_18_30 character varying;
Alter table candidates add column catsel_dob_18_32 character varying;
Alter table candidates add column catsel_dob_19_25 character varying;
Alter table candidates add column catsel_dob_20_25 character varying;
Alter table candidates add column catsel_dob_21_26 character varying;
Alter table candidates add column catsel_dob_21_27 character varying;
Alter table candidates add column catsel_dob_22_28 character varying;
Alter table candidates add column catsel_18_25 character varying;
Alter table candidates add column catsel_18_27 character varying;
Alter table candidates add column catsel_18_28 character varying;
Alter table candidates add column catsel_18_30 character varying;
Alter table candidates add column catsel_18_32 character varying;
Alter table candidates add column catsel_19_25 character varying;
Alter table candidates add column catsel_20_25 character varying;
Alter table candidates add column catsel_21_26 character varying;
Alter table candidates add column catsel_21_27 character varying;
Alter table candidates add column catsel_22_28 character varying;

end
$$


CREATE TABLE IF NOT EXISTS public.marks
(
    rollno character varying COLLATE pg_catalog."default" NOT NULL,
    name character varying COLLATE pg_catalog."default",
    center_code character varying COLLATE pg_catalog."default",
    gi double precision,
    ga double precision,
    qa double precision,
    eng double precision,
    score double precision,
    normalized double precision,
    date_shift character varying COLLATE pg_catalog."default",
    system_name character varying COLLATE pg_catalog."default",
    exam_level character varying COLLATE pg_catalog."default" NOT NULL,
    reg_no character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pkey_marks PRIMARY KEY (reg_no, exam_level)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.marks
    OWNER to postgres;
	
Debarred Checking:---------------------------------------------------------------------
	
select a.regid,a.roll,a.candidate_name,b.dc_name,a.father_name,b.dc_father_name,a.mother_name,b.dc_mother_name,
a.dob,b.dc_dob_name,a.gender,b.dc_gender,a.cat1,b.dc_category,b.dc_debarreddate,b.dc_debarred_upto

from candidates a,m_debbaredcandidates_ssc b where 
replace (substring(UPPER(a.candidate_name),1,4)||substring(UPPER(a.father_name),1,4)||substring(UPPER(a.mother_name),1,4),' ','') = replace (substring(UPPER(b.dc_name),1,4)||substring(UPPER(b.dc_father_name),1,4)||substring(UPPER(b.dc_mother_name),1,4),' ','');

--replace ((UPPER(b.dc_name)||UPPER(b.dc_mother_name)),' ','') = replace ((UPPER(a.candidate_name)||UPPER(a.mother_name)),' ','') and a.dob = b.dc_dob_name;

replace ((UPPER(b.dc_name)||UPPER(b.dc_father_name)),' ','') = replace ((UPPER(a.candidate_name)||UPPER(a.father_name)),' ','') and a.dob = b.dc_dob_name;



do
$$
begin
alter table candidates add column exam_name character varying;
alter table candidates add column cutoffcatsel character varying;
alter table candidates add column cutoffcatsel_eq_level character varying;
alter table candidates add column merit integer;
alter table candidates add column post_rank character varying;
end
$$

update candidates
set level_of_post = exam_level where filed159 ='Yes';---159 updates


CREATE INDEX IF NOT EXISTS cand_reg_post_xi
    ON public.candidates USING btree
    (reg_no ASC NULLS LAST, post_code COLLATE pg_catalog."default" ASC NULLS LAST, level_of_post COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

Dob_flag_18_25:

"01"	74194
"02"	65702
"03"	2376
"04"	457
"05"	516
"06"	5503
"10"	7878
"11"	181
"12"	650
"13"	26
"9"		394516
"99"	87208
"U"		1
null	118621


Select reg_no,name,gender,cat1,dob,agerelax_code_app,agerelax_code,dob_flag_18_25 from candidates
where dob_flag_18_25='99' and agerelax_code is not null ;

Select reg_no,name,gender,cat1,dob,agerelax_code_app,agerelax_code,dob_flag_18_25 from candidates
where dob_flag_18_25='99' and dob ::character varying like '1997%' and agerelax_code is not null;

Dob_flag_18_27:

"01"	40723
"02"	34557
"03"	1765
"04"	160
"05"	369
"06"	5508
"10"	4802
"11"	170
"12"	424
"13"	26
"9"		519607
"99"	31096
"U"		1
null	118621


update candidates 
set dob_flag_18_25 =null,
dob_flag_18_27 =null; ------to take in to account dob_from_dt

"01"	74008
"02"	65479
"03"	2373
"04"	457
"05"	516
"06"	5503
"10"	7872
"11"	181
"12"	650
"13"	26
"9"		395100
"99"	87042
"U"		1
		118621

Select reg_no,name,gender,cat1,dob,agerelax_code_app,agerelax_code,cutoffcatsel,cutoffcatsel_eq_level,merit,dob_flag_18_25 from candidates
where dob_flag_18_25 is null;

Dob_flag_18_27:

"01"	40723
"02"	34557
"03"	1765
"04"	160
"05"	369
"06"	5508
"10"	4802
"11"	170
"12"	424
"13"	26
"9"		519607
"99"	31096
"U"		1
null	118621

"01"	40621
"02"	34386
"03"	1765
"04"	160
"05"	369
"06"	5508
"10"	4798
"11"	170
"12"	422
"13"	26
"9"	    519965
"99"	31017
"U"		1
null	118621

select distinct dob_flag_21_26,count(*) from candidates group by dob_flag_21_26;
select distinct dob_flag_21_27,count(*) from candidates group by dob_flag_21_27;
select distinct dob_flag_22_28,count(*) from candidates group by dob_flag_22_28;
select distinct catsel_dob_18_25,count(*) from candidates group by catsel_dob_18_25;
select distinct catsel_dob_18_27,count(*) from candidates group by catsel_dob_18_27;
select distinct catsel_dob_18_28,count(*) from candidates group by catsel_dob_18_28;
select distinct catsel_dob_18_30,count(*) from candidates group by catsel_dob_18_30;
select distinct catsel_dob_18_32,count(*) from candidates group by catsel_dob_18_32;
select distinct catsel_dob_19_25,count(*) from candidates group by catsel_dob_19_25;
select distinct catsel_dob_20_25,count(*) from candidates group by catsel_dob_20_25;
select distinct catsel_dob_21_26,count(*) from candidates group by catsel_dob_21_26;
select distinct catsel_dob_21_27,count(*) from candidates group by catsel_dob_21_27;
select distinct catsel_dob_22_28,count(*) from candidates group by catsel_dob_22_28;

select distinct catsel_18_25,count(*) from candidates group by catsel_18_25;
select distinct catsel_18_27,count(*) from candidates group by catsel_18_27;
select distinct catsel_18_28,count(*) from candidates group by catsel_18_28;
select distinct catsel_18_30,count(*) from candidates group by catsel_18_30;
select distinct catsel_18_32,count(*) from candidates group by catsel_18_32;
select distinct catsel_19_25,count(*) from candidates group by catsel_19_25;
select distinct catsel_20_25,count(*) from candidates group by catsel_20_25;
select distinct catsel_21_26,count(*) from candidates group by catsel_21_26;
select distinct catsel_21_27,count(*) from candidates group by catsel_21_27;
select distinct catsel_22_28,count(*) from candidates group by catsel_22_28;

update vacancy_table
set initial =orignal_vacancy * 30
where orignal_vacancy <=4;---5227 updates

update vacancy_table
set initial = 150
where orignal_vacancy >=5;--213 updates

update vacancy_table
set initial = orignal_vacancy * 15
where orignal_vacancy >10;----82 updates

update vacancy_table
set initial =orignal_vacancy * 40
where post_code in ('NR33123','NR33223','NR33323'); ----30 updates


update candidates
set post_age_limit  = b.age_limit
from vacancy_table b where candidates.post_code =b.post_code;---755247 updates

'KK10923','WR13423','WR14723','KK12223','NR27523','CR15423','ER12323','WR12923','NW10223','NR25223','WR15623','SR13123','CR12923' ----posts only for females


alter table candidates add column remarks text;

update candidates set merit =merit_original; ----757829


update candidates
set merit = null,
remarks = 'Post Only for female'
where post_code in ('KK10923','WR13423','WR14723','KK12223','NR27523','CR15423','ER12323','WR12923','NW10223','NR25223','WR15623','SR13123','CR12923')
and gender ='2' and merit_original is not null ; ---2006 updates

NR25623 ----only for male

update candidates
set merit = null,
remarks = 'Post Only for Male'
where post_code in ('NR25623')
and gender ='1' and merit_original is not null ; -----1999 updates

update vacancy_table set current = initial where orignal_vacancy <>'0';

create table vacancy_table as (select * from vacancy_table_10092023 where orignal_vacancy<>'0');

alter table vacancy_table
add constraint pk2 primary key (post_code,category_code);

update vacancy_table
set initial= '999',
current ='999'
where category_code in ('3','4','5','7','8');---157 updates

do
$$
begin

Alter table candidates add column allocated_category character varying COLLATE pg_catalog."default";
Alter table candidates add column  allocated_post character varying COLLATE pg_catalog."default";
Alter table candidates add column  allocated_eq character varying COLLATE pg_catalog."default";
Alter table candidates add column  age_limit character varying COLLATE pg_catalog."default";

end
$$

do
$$
begin

Alter table vacancy_table add column allocated integer;
Alter table vacancy_table add column left_vacancy integer;
Alter table vacancy_table add column min_marks double precision;
Alter table vacancy_table add column min_marks_parta double precision;
Alter table vacancy_table add column min_marks_partb double precision;
Alter table vacancy_table add column min_marks_cand_dob date;

end
$$

update vacancy_table
set initial ='0',
current ='0'
where post_code in ('NW10423','NR10323','NR14423','NR15423','NR15523','NR16723','NR17623','NR31123','CR10323','MP10323','WR11423','SR12723','KK10723'
) and category_code ='9';---13 updates


update vacancy_table
set initial ='0',
current ='0'
where post_code in ('SR12823','SR12523') and category_code ='6'; -----2 updates


Wrong ARC_CODE handling:-----------------------------------------------

update candidates
set agerelax_code ='05' ,
remarks ='Wrong arc choosen earlier'
 where agerelax ='true' and agerelax_code_app ='3' and cat1 in ('1','2'); ---346 updates
 
update candidates
set agerelax_code ='04' ,
remarks ='Wrong arc choosen earlier'
 where agerelax ='true' and agerelax_code_app ='3' and cat1 in ('6');---530 updates

update candidates
set agerelax_code ='11' ,
remarks ='Wrong arc choosen earlier'
 where agerelax ='true' and agerelax_code_app ='10' and cat1 in ('1','2'); ---5359 updates

update candidates
set agerelax_code ='13' ,
remarks ='Wrong arc choosen earlier'
 where agerelax ='true' and agerelax_code_app ='12' and cat1 in ('1','2');---191 updates 
 
select reg_no,name,dob,gender,cutoffcatsel,cutoffcatsel_eq_level,dob_flag_18_27,catsel_dob_18_27,catsel_18_27 from candidates where post_code in ('NR33123','NR33223','NR33323')
and dob_flag_18_27 ='99';

select reg_no,post_code,name,dob,gender,cat1,cat2,exsm_length,cat3,agerelax_code,cutoffcatsel,cutoffcatsel_eq_level,dob_flag_18_27,catsel_dob_18_27,catsel_18_27,remarks from candidates where
post_code in ('NR33123','NR33223','NR33323') and
reg_no in ('75001548526','83000094268','83000118405','85000030117','20005577521','50006880215','85000022132','20000762509','83000096266','85000062541','20005582142','50000906791','50000996151'
);

update candidates
set allocated_category = null,
allocated_post = null,
allocated_eq =null,
age_limit =null; ----757829

update vacancy_table
set allocated =null,
left_vacancy =null; 

update candidates
set 
dob_flag_18_25= null ,
dob_flag_18_27= null ,
dob_flag_18_28= null ,
dob_flag_18_30= null ,
dob_flag_18_32= null ,
dob_flag_19_25= null ,
dob_flag_20_25= null ,
dob_flag_21_26= null ,
dob_flag_22_28= null ,
dob_flag_21_27= null ,
catsel_dob_18_25= null ,
catsel_dob_18_27= null ,
catsel_dob_18_28= null ,
catsel_dob_18_30= null ,
catsel_dob_18_32= null ,
catsel_dob_19_25= null ,
catsel_dob_20_25= null ,
catsel_dob_21_26= null ,
catsel_dob_21_27= null ,
catsel_dob_22_28 =null,
catsel_18_25= null ,
catsel_18_27= null ,
catsel_18_28= null ,
catsel_18_30= null ,
catsel_18_32= null ,
catsel_19_25= null ,
catsel_20_25= null ,
catsel_21_26= null ,
catsel_21_27= null ,
catsel_22_28=null 
where remarks ='Wrong arc choosen earlier';


select reg_no||post_code as pkey,rollno,Allocated_Category||Allocated_Post as key from candidates where allocated_post is not null;


do
$$
begin
Update candidates set allocated_post = 'ER10323', allocated_category = '9' where prkey = '94000564761ER10323';
Update candidates set allocated_post = 'WR11623', allocated_category = '1' where prkey = '20001771664WR11623';
Update candidates set allocated_post = 'NR14723', allocated_category = '9' where prkey = '84000069882NR14723';
Update candidates set allocated_post = 'NR28423', allocated_category = '6' where prkey = '83000055436NR28423';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '40002668928NR28023';
Update candidates set allocated_post = 'NR28423', allocated_category = '9' where prkey = '20000022595NR28423';
Update candidates set allocated_post = 'ER14423', allocated_category = '9' where prkey = '94000325149ER14423';
Update candidates set allocated_post = 'ER13523', allocated_category = '9' where prkey = '94000325149ER13523';
Update candidates set allocated_post = 'ER14523', allocated_category = '9' where prkey = '94000325149ER14523';
Update candidates set allocated_post = 'NR28023', allocated_category = '9' where prkey = '30001632915NR28023';
Update candidates set allocated_post = 'NR14723', allocated_category = '6' where prkey = '81000086496NR14723';
Update candidates set allocated_post = 'NW11623', allocated_category = '9' where prkey = '30001394406NW11623';
Update candidates set allocated_post = 'ER11923', allocated_category = '9' where prkey = '30001394406ER11923';
Update candidates set allocated_post = 'NR25723', allocated_category = '9' where prkey = '30001394406NR25723';
Update candidates set allocated_post = 'NR12523', allocated_category = '9' where prkey = '30001394406NR12523';
Update candidates set allocated_post = 'NR27923', allocated_category = '9' where prkey = '50000953726NR27923';
Update candidates set allocated_post = 'CR10923', allocated_category = '9' where prkey = '50000953726CR10923';
Update candidates set allocated_post = 'CR11023', allocated_category = '9' where prkey = '50000953726CR11023';
Update candidates set allocated_post = 'NR27523', allocated_category = '9' where prkey = '50000953726NR27523';
Update candidates set allocated_post = 'ER14523', allocated_category = '9' where prkey = '92000016355ER14523';
Update candidates set allocated_post = 'ER13523', allocated_category = '9' where prkey = '92000016355ER13523';
Update candidates set allocated_post = 'NR28023', allocated_category = '0' where prkey = '30005519104NR28023';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '40003732914ER14523';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '40002779799ER14523';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '94000074623NR12523';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '50005764082NW11623';
Update candidates set allocated_post = 'NR25723', allocated_category = '1' where prkey = '91000330940NR25723';
Update candidates set allocated_post = 'NR27923', allocated_category = '6' where prkey = '92000192006NR27923';
Update candidates set allocated_post = 'NR12523', allocated_category = '6' where prkey = '94000504642NR12523';
Update candidates set allocated_post = 'CR10223', allocated_category = '9' where prkey = '50000593328CR10223';
Update candidates set allocated_post = 'NR14823', allocated_category = '1' where prkey = '20000144877NR14823';
Update candidates set allocated_post = 'NR14723', allocated_category = '1' where prkey = '20000144877NR14723';
Update candidates set allocated_post = 'NR14723', allocated_category = '9' where prkey = '50000974412NR14723';
Update candidates set allocated_post = 'NR14823', allocated_category = '9' where prkey = '50000974412NR14823';
Update candidates set allocated_post = 'NR25723', allocated_category = '6' where prkey = '40001309425NR25723';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '20000081445NR25723';
Update candidates set allocated_post = 'SR11623', allocated_category = '1' where prkey = '30000434316SR11623';
Update candidates set allocated_post = 'KK12423', allocated_category = '9' where prkey = '91000076117KK12423';
Update candidates set allocated_post = 'NW10223', allocated_category = '9' where prkey = '40004244337NW10223';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '85000206624WR11623';
Update candidates set allocated_post = 'ER14423', allocated_category = '6' where prkey = '94000645734ER14423';
Update candidates set allocated_post = 'CR10923', allocated_category = '6' where prkey = '20004822859CR10923';
Update candidates set allocated_post = 'NE12423', allocated_category = '9' where prkey = '30000884614NE12423';
Update candidates set allocated_post = 'CR15123', allocated_category = '9' where prkey = '30000884614CR15123';
Update candidates set allocated_post = 'SR11723', allocated_category = '9' where prkey = '30000884614SR11723';
Update candidates set allocated_post = 'WR15523', allocated_category = '9' where prkey = '30000884614WR15523';
Update candidates set allocated_post = 'CR10423', allocated_category = '9' where prkey = '30000884614CR10423';
Update candidates set allocated_post = 'KK11423', allocated_category = '9' where prkey = '30000884614KK11423';
Update candidates set allocated_post = 'WR14623', allocated_category = '9' where prkey = '30000884614WR14623';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '20003655689ER14423';
Update candidates set allocated_post = 'NR27523', allocated_category = '2' where prkey = '30002227185NR27523';
Update candidates set allocated_post = 'NR30123', allocated_category = '9' where prkey = '30000576524NR30123';
Update candidates set allocated_post = 'NR22323', allocated_category = '9' where prkey = '30000576524NR22323';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '40002143555ER13523';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '30002060515ER13523';
Update candidates set allocated_post = 'WR11623', allocated_category = '9' where prkey = '92000161659WR11623';
Update candidates set allocated_post = 'WR11623', allocated_category = '6' where prkey = '50005000852WR11623';
Update candidates set allocated_post = 'NW10223', allocated_category = '6' where prkey = '50005317332NW10223';
Update candidates set allocated_post = 'NR14823', allocated_category = '6' where prkey = '94000363500NR14823';
Update candidates set allocated_post = 'KK10523', allocated_category = '9' where prkey = '91000155678KK10523';
Update candidates set allocated_post = 'SR11623', allocated_category = '9' where prkey = '50000325470SR11623';
Update candidates set allocated_post = 'SR11723', allocated_category = '1' where prkey = '50002405162SR11723';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '50000454860WR15523';
Update candidates set allocated_post = 'KK12623', allocated_category = '9' where prkey = '91000076117KK12623';
Update candidates set allocated_post = 'CR15123', allocated_category = '0' where prkey = '40005044906CR15123';
Update candidates set allocated_post = 'NR14723', allocated_category = '6' where prkey = '94000089273NR14723';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '40004171170NR14723';
Update candidates set allocated_post = 'SR13423', allocated_category = '9' where prkey = '10007437920SR13423';
Update candidates set allocated_post = 'NR32623', allocated_category = '6' where prkey = '73001492931NR32623';
Update candidates set allocated_post = 'NR26423', allocated_category = '2' where prkey = '20004543069NR26423';
Update candidates set allocated_post = 'NR32623', allocated_category = '1' where prkey = '92000038727NR32623';
Update candidates set allocated_post = 'NR27523', allocated_category = '6' where prkey = '93000046951NR27523';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '50000023679NR14823';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '72001416136NR30123';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '10005858936NR22323';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '30001238878SR11623';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '95000462404CR10423';
Update candidates set allocated_post = 'NR32623', allocated_category = '6' where prkey = '72000597393NR32623';
Update candidates set allocated_post = 'NR31323', allocated_category = '6' where prkey = '30000639777NR31323';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '84000050896ER10323';
Update candidates set allocated_post = 'NR32623', allocated_category = '6' where prkey = '75000925486NR32623';
Update candidates set allocated_post = 'NR27223', allocated_category = '1' where prkey = '95000597537NR27223';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '95000597537NR32023';
Update candidates set allocated_post = 'NR31323', allocated_category = '1' where prkey = '83000282777NR31323';
Update candidates set allocated_post = 'NR14723', allocated_category = '3' where prkey = '30000576524NR14723';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '30005340233CR11023';
Update candidates set allocated_post = 'SR11723', allocated_category = '9' where prkey = '91000147615SR11723';
Update candidates set allocated_post = 'NR32023', allocated_category = '9' where prkey = '72000430587NR32023';
Update candidates set allocated_post = 'NR31323', allocated_category = '9' where prkey = '84000269814NR31323';
Update candidates set allocated_post = 'NR31323', allocated_category = '9' where prkey = '50002295699NR31323';
Update candidates set allocated_post = 'SR11723', allocated_category = '0' where prkey = '50002965203SR11723';
Update candidates set allocated_post = 'NR32623', allocated_category = '1' where prkey = '50004505670NR32623';
Update candidates set allocated_post = 'NR32623', allocated_category = '1' where prkey = '73000507795NR32623';
Update candidates set allocated_post = 'CR15123', allocated_category = '6' where prkey = '95000171936CR15123';
Update candidates set allocated_post = 'NE12423', allocated_category = '9' where prkey = '91000155678NE12423';
Update candidates set allocated_post = 'KK11423', allocated_category = '9' where prkey = '91000155678KK11423';
Update candidates set allocated_post = 'WR14623', allocated_category = '9' where prkey = '91000155678WR14623';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '50002503266WR14623';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '50002968662WR14623';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '10001379011KK10523';
Update candidates set allocated_post = 'NR21023', allocated_category = '9' where prkey = '20000734440NR21023';
Update candidates set allocated_post = 'NE10223', allocated_category = '9' where prkey = '10000556726NE10223';
Update candidates set allocated_post = 'CR11023', allocated_category = '6' where prkey = '40001833993CR11023';
Update candidates set allocated_post = 'NE12423', allocated_category = '0' where prkey = '95000618900NE12423';
Update candidates set allocated_post = 'SR13423', allocated_category = '1' where prkey = '10002954216SR13423';
Update candidates set allocated_post = 'CR10223', allocated_category = '9' where prkey = '50000536751CR10223';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '50002626871NE12423';
Update candidates set allocated_post = 'KK11423', allocated_category = '9' where prkey = '10005077136KK11423';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '83000344958NR31323';
Update candidates set allocated_post = 'NR20723', allocated_category = '9' where prkey = '50000797004NR20723';
Update candidates set allocated_post = 'KK12623', allocated_category = '6' where prkey = '82000198640KK12623';
Update candidates set allocated_post = 'CR10223', allocated_category = '9' where prkey = '20004324582CR10223';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '10007471133KK11423';
Update candidates set allocated_post = 'NE12423', allocated_category = '6' where prkey = '50002522158NE12423';
Update candidates set allocated_post = 'KK11423', allocated_category = '0' where prkey = '30004326362KK11423';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '10006833628NE10223';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '10005310333KK11423';
Update candidates set allocated_post = 'NE12423', allocated_category = '6' where prkey = '10000035038NE12423';
Update candidates set allocated_post = 'SR13323', allocated_category = '9' where prkey = '10007467960SR13323';
Update candidates set allocated_post = 'NR32623', allocated_category = '6' where prkey = '72001300995NR32623';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '40000262219NR31323';
Update candidates set allocated_post = 'KK12423', allocated_category = '1' where prkey = '10007015433KK12423';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '20004346246KK12423';
Update candidates set allocated_post = 'WR10523', allocated_category = '9' where prkey = '10007452552WR10523';
Update candidates set allocated_post = 'NR32623', allocated_category = '1' where prkey = '72000965468NR32623';
Update candidates set allocated_post = 'NR27223', allocated_category = '9' where prkey = '72000658164NR27223';
Update candidates set allocated_post = 'NR32623', allocated_category = '6' where prkey = '75000737047NR32623';
Update candidates set allocated_post = 'NE12523', allocated_category = '9' where prkey = '50004767998NE12523';
Update candidates set allocated_post = 'SR15523', allocated_category = '9' where prkey = '50004767998SR15523';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '30002270212SR13423';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '20001761401NR27523';
Update candidates set allocated_post = '', allocated_category = '' where prkey = '92000326491ER16023';

end
$$



do
$$
begin

update vacancy_table set allocated = '143' where finalkey = '1NR27223';
update vacancy_table set allocated = '9' where finalkey = '0NE12423';
update vacancy_table set allocated = '378' where finalkey = '3NR14723';
update vacancy_table set allocated = '29' where finalkey = '9NR20723';
update vacancy_table set allocated = '21' where finalkey = '9SR13323';
update vacancy_table set allocated = '78' where finalkey = '6KK12423';
update vacancy_table set allocated = '108' where finalkey = '9NR21023';
update vacancy_table set allocated = '27' where finalkey = '9ER11923';
update vacancy_table set allocated = '22' where finalkey = '9WR10523';
update vacancy_table set allocated = '41' where finalkey = '9NE12523';
update vacancy_table set allocated = '10' where finalkey = '2NE10223';
update vacancy_table set allocated = '10' where finalkey = '6SR13323';
update vacancy_table set allocated = '9' where finalkey = '0KK11423';
update vacancy_table set allocated = '76' where finalkey = '9SR15523';
update vacancy_table set allocated = '1051' where finalkey = '1NR32623';
update vacancy_table set allocated = '42' where finalkey = '0CR15123';
update vacancy_table set allocated = '4308' where finalkey = '9NR32623';
update vacancy_table set allocated = '24' where finalkey = '0SR11723';
update vacancy_table set allocated = '117' where finalkey = '6NR27223';
update vacancy_table set allocated = '1628' where finalkey = '6NR32623';
update vacancy_table set allocated = '403' where finalkey = '0NR31323';
update vacancy_table set allocated = '4' where finalkey = '6NR21023';
update vacancy_table set allocated = '157' where finalkey = '4ER16023';
update vacancy_table set allocated = '22' where finalkey = '6SR13423';

end
$$

update candidates
set allocated_category = null,
allocated_post = null,
allocated_eq =null,
age_limit =null where allocated_post='';---33

update vacancy_table
set min_marks =null,
min_marks_parta =null,
min_marks_partb =null,
min_marks_cand_dob =null;

update vacancy_table
set left_vacancy = current-allocated;


alter table t_examrhq2023_applicant_reg_pu add column ear_tenth_education_board_name text;
alter table t_examrhq2023_applicant_reg_pu add column center1 text;
alter table t_examrhq2023_applicant_reg_pu add column center2 text;
alter table t_examrhq2023_applicant_reg_pu add column center3 text;
alter table t_examrhq2023_applicant_reg_pu add column region text;
alter table t_examrhq2023_applicant_reg_pu add column region_name_of_post text;
alter table t_examrhq2023_applicant_reg_pu add column present_district text;
alter table t_examrhq2023_applicant_reg_pu add column present_state text;
alter table t_examrhq2023_applicant_reg_pu add column permanent_state text;
alter table t_examrhq2023_applicant_reg_pu add column permanent_state text;

update t_examrhq2023_applicant_reg_pu a
set a.ear_tenth_education_board_name = b.eb_educationboard
from m_educationboard_ssc b where a.ear_tenth_education_board =b.eb_id;

update t_examrhq2023_applicant_reg_pu a
set a.center1 = b.ec_center_name
from m_exam_centers_ssc b where a.ear_centerid1=b.ec_id;

update t_examrhq2023_applicant_reg_pu a
set a.center2 = b.ec_center_name
from m_exam_centers_ssc b where a.ear_centerid2=b.ec_id;

update t_examrhq2023_applicant_reg_pu a
set a.center3 = b.ec_center_name
from m_exam_centers_ssc b where a.ear_centerid3=b.ec_id;

update t_examrhq2023_applicant_reg_pu a
set a.region = b.rg_region_name
from m_regions_gis b where a.ear_regionid=b.rg_regionid;

update t_examrhq2023_applicant_reg_pu a
set a.region_name_of_post = b.rg_region_name
from m_regions_gis b where a.ear_region_of_post=b.rg_regionid;

update t_examrhq2023_applicant_reg_pu a
set a.present_state = b.st_state_name
from m_states_gis b where a.ear_present_stateid=b.st_stateid;

update t_examrhq2023_applicant_reg_pu a
set a.permanent_state = b.st_state_name
from m_states_gis b where a.ear_permanent_stateid=b.st_stateid;

update t_examrhq2023_applicant_reg_pu a
set a.permanent_district = b.ds_dist_name
from m_districts_gis b where a.ear_permanent_districtid=b.ds_distid;

update t_examrhq2023_applicant_reg_pu a
set a.present_district = b.ds_dist_name
from m_districts_gis b where a.ear_present_districtid=b.ds_distid;


CREATE TABLE rhqcomplete2023 as 
(select
 ear_person_regno as regno,  
    ear_name as name,
    ear_changedname as new_name,
    ear_father_name as father_name,
    ear_mother_name as mother_name,
    ear_dob as dob,
    ear_candiateage_ason_date  as age,
    ear_gender  as gender,
    ear_categoryid as catgeory,
    ear_nationality as nationality,
    ear_identification_mark as identification_mark,
    ear_tenth_education_board  as ear_tenth_education_boardid,
	ear_tenth_education_board_name as tenth_education_board,
    ear_tenth_roll_no as tenth_roll_no ,
    ear_tenth_yearofpassing  as tenth_yearofpassing,
    ear_photo_img_url as photo_img_url ,
    ear_sign_img_url as sign_img_url ,
    ear_centerid1  as ear_centerid1,
	center1,
    ear_centerid2  as centerid2,
	center2,
    ear_centerid3 as centerid3,
	center3,
    ear_regionid as regionid,
	region,
    ear_region_of_post  as regionid_of_post,
	region_name_of_post as region_of_post,
    ear_postid as postid ,
    ear_postcode as postcode,
    ear_postname as postname ,
    ear_levelofpost as levelofpost,
    ear_is_ex_serviceman  as is_ex_serviceman,
	cat2,
    ear_service_period as service_period, 
    ear_joining_date_for_armedforces as joining_date_for_armedforces,
    ear_joining_date_for_civilpost as joining_date_for_civilpost,
    ear_discharged_date as discharged_date,
    ear_isexs_benefit_availed_for_civilpost as isexs_benefit_availed_for_civilpost,
	exs_reservation,
    ear_is_physically_handicaped as is_physically_handicaped ,
    ear_ph_code,
	cat3,
    ear_is_cerebral_palsy as is_cerebral_palsy ,
    ear_is_physical_limitation  as is_physical_limitation,
    ear_is_scribe_required as is_scribe_required ,
    ear_own_scribe as own_scribe ,
    ear_scribe_medium as scribe_medium,
    ear_whether_skilltest_required as whether_skilltest_required,
    ear_skilltest_medium  as skilltest_medium,
    ear_is_age_relaxation   as is_age_relaxation,
    ear_age_relaxation_code as age_relaxation_code,
    ear_edqualification  as edqualificationid,
    ear_edqual_name as edqualification_name,
    ear_edsubject  as edsubject,
    ear_edsub_name as edsub_name,
    ear_isactive as isactive,
    ear_ip_address, 
    ear_createdbyid ,
    ear_createdbyrid ,
    ear_updbyid ,
    ear_upddtm ,
    ear_createddtm ,
    ear_notificationid,  
    ear_application_status as application_status,
    ear_is_ews_candidate ,
    ear_share_persinfo_accrossportal ,
    ear_present_address as present_address ,
    ear_present_districtid ,
	present_district,
    ear_present_stateid ,
	present_state,
    ear_present_pincode as present_pincode,
    ear_permanent_address 
    ear_permanent_stateid ,
	permanent_state,
    ear_permanent_districtid ,
	permanent_district
    ear_permanent_pincode ,
    ear_email_id as email_id ,
    ear_mobile_number as mobile_number,
    ear_other_national_address ,
    ear_photo_date ,
    ear_isdate_clear_on_photo , 
    challan_generation_date ,
    challan_downloaded_date ,
    challan_refno, 
    applicationfee ,
    ear_qrcode_path ,
    ear_add_source ,
    ear_upd_source ,
    ear_language_option ,
    ear_highest_edu_qual ,
    ear_is_obc_by_delhi_govt ,
    ear_reg_categoryid ,
    ear_is_delhi_police ,
    ear_is_modified ,
    ear_declaration_for_post ,
    ear_noofattempt ,
    ear_flag ,
    ear_piflag ,
    ear_siflag ,
    ear_piflag_lastupdtm ,
    ear_siflag_lastupdtm ,
    ear_isdraftprint_util_flag ,
    ear_isextended	
	
	from t_examrhq2023_applicant_reg_pu
)


do
$$
begin
alter table rhqcomplete2023 add column allocated_category character varying;
alter table rhqcomplete2023 add column allocated_post character varying;
alter table rhqcomplete2023 add column allocated_eq character varying;
alter table rhqcomplete2023 add column age_limit character varying;
alter table rhqcomplete2023 add column rollno character varying;

end
$$


update rhqcomplete2023
set
allocated_category=CTE.allocated_category,
allocated_post=CTE.allocated_post,
allocated_eq=CTE.allocated_eq,
age_limit=CTE.age_limit,
rollno =CTE.rollno

from candidates CTE where 
rhqcomplete2023.regno||rhqcomplete2023.postcode = CTE.reg_no||CTE.post_code and CTE.allocated_post is not null;


copy (select * from rhqcomplete2023 where allocated_category is not null) to 'C:\Users\Public\candidates_details.csv' csv header;


select reg_no,rollno,name,gender,dob,cat1,cat2,cat3,agerelax_code_app,agerelax_code,dob_flag_18_25,catsel_dob_18_25,dob_flag_18_27,catsel_dob_18_27,dob_flag_18_28,dob_flag_18_30,merit_original ,merit 
from candidates where agerelax_code ='10' and dob_flag_18_25 = '10' and merit is not null 
and dob >'1983-01-01' and catsel_dob_18_25 <>'9' ;-----297 records

update candidates
set catsel_dob_18_25 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='10' and dob_flag_18_25 = '10' and merit is not null 
and dob >'1983-01-01' and catsel_dob_18_25 <>'9' ;----297 updates

select remarks,reg_no,rollno,name,gender,dob,cat1,cat2,cat3,agerelax_code_app,agerelax_code,dob_flag_18_25,catsel_dob_18_25,dob_flag_18_27,catsel_dob_18_27,dob_flag_18_28,dob_flag_18_30,merit_original ,merit 
from candidates where agerelax_code ='10' and dob_flag_18_27 = '10' and merit is not null 
and dob >'1983-01-01' and catsel_dob_18_27 <>'9' ;---94

update candidates
set catsel_dob_18_27 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='10' and dob_flag_18_27 = '10' and merit is not null 
and dob >'1983-01-01' and catsel_dob_18_27 <>'9' ; ---94 updates

update candidates
set catsel_dob_18_28 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='10' and dob_flag_18_28 = '10' and merit is not null 
and dob >'1983-01-01' ;---2345 updates

update candidates
set catsel_dob_18_30 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='10' and dob_flag_18_30 = '10' and merit is not null 
and dob >'1983-01-01' ;---1238 updates

update candidates
set catsel_dob_18_32 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='10' and dob_flag_18_32 = '10' and merit is not null 
and dob >'1983-01-01' ;---567 updates

update candidates
set catsel_dob_19_25 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='10' and dob_flag_19_25 = '10' and merit is not null 
and dob >'1983-01-01' ;---4008 updates


update candidates
set catsel_dob_20_25 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='10' and dob_flag_20_25 = '10' and merit is not null 
and dob >'1983-01-01' ;---4008 updates

update candidates
set catsel_dob_21_26 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='10' and dob_flag_21_26 = '10' and merit is not null 
and dob >'1983-01-01' ;---3476 updates

update candidates
set catsel_dob_21_27 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='10' and dob_flag_21_27 = '10' and merit is not null 
and dob >'1983-01-01' ;---2894 updates

update candidates
set catsel_dob_22_28 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='10' and dob_flag_22_28 = '10' and merit is not null 
and dob >'1983-01-01' ;---2345 updates


------------------------------------------------------------------------------------------------------------------


update candidates
set catsel_dob_18_25 ='9',
remarks ='upto 45 years allowed'
where agerelax_code ='11' and dob_flag_18_25 = '11' and merit is not null 
and dob >'1978-01-01' ;----4015 updates

update candidates
set catsel_dob_18_27 ='9',
remarks ='upto 45 years allowed'
where agerelax_code ='11' and dob_flag_18_27 = '11' and merit is not null 
and dob >'1978-01-01' and catsel_dob_18_25 <>'9' ;---2601 updates

update candidates
set catsel_dob_18_28 ='9',
remarks ='upto 45 years allowed'
where agerelax_code ='11' and dob_flag_18_28 = '11' and merit is not null 
and dob >'1978-01-01' ;---1334 updates

update candidates
set catsel_dob_18_30 ='9',
remarks ='upto 45 years allowed'
where agerelax_code ='11' and dob_flag_18_30 = '11' and merit is not null 
and dob >'1978-01-01' ;---476 updates

update candidates
set catsel_dob_18_32 ='9',
remarks ='upto 45 years allowed'
where agerelax_code ='11' and dob_flag_18_32 = '11' and merit is not null 
and dob >'1978-01-01' ;---224 updates

update candidates
set catsel_dob_19_25 ='9',
remarks ='upto 45 years allowed'
where agerelax_code ='11' and dob_flag_19_25 = '11' and merit is not null 
and dob >'1978-01-01' ;---4015 updates


update candidates
set catsel_dob_20_25 ='9',
remarks ='upto 45 years allowed'
where agerelax_code ='11' and dob_flag_20_25 = '11' and merit is not null 
and dob >'1978-01-01' ;---4015 updates

update candidates
set catsel_dob_21_26 ='9',
remarks ='upto 45 years allowed'
where agerelax_code ='11' and dob_flag_21_26 = '11' and merit is not null 
and dob >'1978-01-01' ;---2933 updates

update candidates
set catsel_dob_21_27 ='9',
remarks ='upto 45 years allowed'
where agerelax_code ='11' and dob_flag_21_27 = '11' and merit is not null 
and dob >'1978-01-01' ;---2601 updates

update candidates
set catsel_dob_22_28 ='9',
remarks ='upto 45 years allowed'
where agerelax_code ='11' and dob_flag_22_28 = '11' and merit is not null 
and dob >'1978-01-01' ;---1334 updates


-----------------------------------------------------------------------------------------------------------------------------------

update candidates
set catsel_dob_18_25 ='9',
remarks ='upto 35 years allowed'
where agerelax_code ='12' and dob_flag_18_25 = '12' and merit is not null 
and dob >'1988-01-01' ;----540 updates

update candidates
set catsel_dob_18_27 ='9',
remarks ='upto 35 years allowed'
where agerelax_code ='12' and dob_flag_18_27 = '12' and merit is not null 
and dob >'1988-01-01' ;-----346 updates

update candidates
set catsel_dob_18_28 ='9',
remarks ='upto 35 years allowed'
where agerelax_code ='12' and dob_flag_18_28 = '12' and merit is not null 
and dob >'1988-01-01' ;---302 updates

update candidates
set catsel_dob_18_30 ='9',
remarks ='upto 35 years allowed'
where agerelax_code ='12' and dob_flag_18_30 = '12' and merit is not null 
and dob >'1988-01-01' ;---193 updates

update candidates
set catsel_dob_18_32 ='9',
remarks ='upto 35 years allowed'
where agerelax_code ='12' and dob_flag_18_32 = '12' and merit is not null 
and dob >'1988-01-01' ;---100 updates

update candidates
set catsel_dob_19_25 ='9',
remarks ='upto 35 years allowed'
where agerelax_code ='12' and dob_flag_19_25 = '12' and merit is not null 
and dob >'1988-01-01' ;---540 updates


update candidates
set catsel_dob_20_25 ='9',
remarks ='upto 35 years allowed'
where agerelax_code ='12' and dob_flag_20_25 = '12' and merit is not null 
and dob >'1988-01-01' ;---540 updates

update candidates
set catsel_dob_21_26 ='9',
remarks ='upto 35 years allowed'
where agerelax_code ='12' and dob_flag_21_26 = '12' and merit is not null 
and dob >'1988-01-01' ;---466 updates

update candidates
set catsel_dob_21_27 ='9',
remarks ='upto 35 years allowed'
where agerelax_code ='12' and dob_flag_21_27 = '12' and merit is not null 
and dob >'1988-01-01' ;---346 updates

update candidates
set catsel_dob_22_28 ='9',
remarks ='upto 35 years allowed'
where agerelax_code ='12' and dob_flag_22_28 = '12' and merit is not null 
and dob >'1988-01-01' ;---302 updates


--------------------------------------------------------------------------------------------------------------------------

update candidates
set catsel_dob_18_25 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='13' and dob_flag_18_25 = '13' and merit is not null 
and dob >'1983-01-01' ;----136 updates

update candidates
set catsel_dob_18_27 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='13' and dob_flag_18_27 = '13' and merit is not null 
and dob >'1983-01-01' ;---- 104 updates

update candidates
set catsel_dob_18_28 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='13' and dob_flag_18_28 = '13' and merit is not null 
and dob >'1983-01-01' ;---76 updates

update candidates
set catsel_dob_18_30 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='13' and dob_flag_18_30 = '13' and merit is not null 
and dob >'1983-01-01' ;---56 updates

update candidates
set catsel_dob_18_32 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='13' and dob_flag_18_32 = '13' and merit is not null 
and dob >'1983-01-01' ;---13 updates

update candidates
set catsel_dob_19_25 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='13' and dob_flag_19_25 = '13' and merit is not null 
and dob >'1983-01-01' ;---136 updates


update candidates
set catsel_dob_20_25 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='13' and dob_flag_20_25 = '13' and merit is not null 
and dob >'1983-01-01' ;---136 updates

update candidates
set catsel_dob_21_26 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='13' and dob_flag_21_26 = '13' and merit is not null 
and dob >'1983-01-01' ;---124 updates

update candidates
set catsel_dob_21_27 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='13' and dob_flag_21_27 = '13' and merit is not null 
and dob >'1983-01-01' ;---104 updates

update candidates
set catsel_dob_22_28 ='9',
remarks ='upto 40 years allowed'
where agerelax_code ='13' and dob_flag_22_28 = '13' and merit is not null 
and dob >'1983-01-01' ;---76 updates


---------------------------------------------------------------------------------------------------------------------------------------------

update vacancy_table
set allocated =null,
left_vacancy =null,
min_marks =null,
min_marks_parta =null,
min_marks_partb =null,
min_marks_cand_dob =null;


select * from candidates where remarks ='Delhi High Court Candidates' order by rollno;
select rollno,name,cutoffcatsel,dob_flag_18_25,dob_flag_18_27,catsel_dob_18_25,catsel_dob_18_27,catsel_18_27,allocated_post,allocated_category,allocated_eq from candidates where remarks ='Delhi High Court Candidates' order by rollno;

update candidates
set dob_flag_18_27 ='9',
catsel_dob_18_27 ='9',

where remarks ='Delhi High Court Candidates';


update candidates
set 
dob_flag_18_25= '06' ,
dob_flag_18_27= '06' ,
dob_flag_18_28= '06' ,
dob_flag_18_30= '06' ,
dob_flag_18_32= '06' ,
dob_flag_19_25= '06' ,
dob_flag_20_25= '06' ,
dob_flag_21_26= '06' ,
dob_flag_22_28= '06' ,
dob_flag_21_27= '06' 
where cat2='3' and merit is not null and dob_flag_18_25 ='99' and agerelax_code in ('6','06'); ----esm candidates where dob_flag_18_25 ='99'