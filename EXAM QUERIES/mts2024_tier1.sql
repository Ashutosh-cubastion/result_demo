CREATE TABLE IF NOT EXISTS public.mts2024applications
(
    id character varying(16) COLLATE pg_catalog."default",
    "registrationNo" character varying(11) COLLATE pg_catalog."default",
    "otrId" character varying(16) COLLATE pg_catalog."default",
    "myApplicationId" character varying(16) COLLATE pg_catalog."default",
    "emailId" character varying(50) COLLATE pg_catalog."default",
    "phoneNo" character varying(10) COLLATE pg_catalog."default",
    name character varying(50) COLLATE pg_catalog."default",
    "newName" character varying(50) COLLATE pg_catalog."default",
    "fathersName" character varying(50) COLLATE pg_catalog."default",
    "mothersName" character varying(50) COLLATE pg_catalog."default",
    dob date,
    "ageAsOnDob" character varying(30) COLLATE pg_catalog."default",
    "genderId" character varying(16) COLLATE pg_catalog."default",
    gender character varying(16) COLLATE pg_catalog."default",
    "categoryId" character varying(16) COLLATE pg_catalog."default",
    category character varying(16) COLLATE pg_catalog."default",
    "isPwbd" boolean,
    "typeOfPwbd" character varying(16) COLLATE pg_catalog."default",
    "submitPwbdType" character varying(10) COLLATE pg_catalog."default",
    "nationalityId" character varying(16) COLLATE pg_catalog."default",
    nationality character varying(500) COLLATE pg_catalog."default",
    "markOfIdentification" character varying(50) COLLATE pg_catalog."default",
    "tenthEducationBoardId" character varying(16) COLLATE pg_catalog."default",
    "educationBoardName" character varying(500) COLLATE pg_catalog."default",
    "tenthRollNumber" character varying(16) COLLATE pg_catalog."default",
    "tenthYearOfPassing" character varying(5) COLLATE pg_catalog."default",
    "examCentrePreferenceId1" character varying(16) COLLATE pg_catalog."default",
    "examCentrePreferenceId2" character varying(16) COLLATE pg_catalog."default",
    "examCentrePreferenceId3" character varying(16) COLLATE pg_catalog."default",
    "cbeMedium" character varying COLLATE pg_catalog."default",
    "isBenchmarkDisabilityVh" boolean,
    "isBenchmarkDisabilityOh" boolean,
    "isPhysicalLimitToWrite" boolean,
    "isScribe" boolean,
    "isOwnScribe" boolean,
    "scribeMedium" character varying(20) COLLATE pg_catalog."default",
    "isScienceStream" character varying(5) COLLATE pg_catalog."default",
    "preferenceCode" character varying COLLATE pg_catalog."default",
    "isEsm" boolean,
    "dojOfEsm" date,
    "dodOfEsm" date,
    "lengthOfService" character varying(30) COLLATE pg_catalog."default",
    "isCivilPost" boolean,
    "dojOfCivilPost" date,
    "regionCode" character varying(5) COLLATE pg_catalog."default",
    "isAgeRelaxation" boolean,
    "ageRelaxationId" character varying(16) COLLATE pg_catalog."default",
    "isPersonalInfoAccess" boolean,
    "permanentAddress" character varying(500) COLLATE pg_catalog."default",
    "permanentStateId" character varying(16) COLLATE pg_catalog."default",
    "permanentStateName" character varying(100) COLLATE pg_catalog."default",
    "permanentDistrictId" character varying(16) COLLATE pg_catalog."default",
    "permanentDistrictName" character varying(100) COLLATE pg_catalog."default",
    "permanentPincode" character varying(6) COLLATE pg_catalog."default",
    "presentAddress" character varying(500) COLLATE pg_catalog."default",
    "presentStateId" character varying(16) COLLATE pg_catalog."default",
    "presentStateName" character varying(100) COLLATE pg_catalog."default",
    "presentDistrictId" character varying(16) COLLATE pg_catalog."default",
    "presentDistrictName" character varying(100) COLLATE pg_catalog."default",
    "presentPincode" character varying(6) COLLATE pg_catalog."default",
    "isPhotoDeclare" boolean,
    "isDeclaration" boolean,
    "statusId" character varying(16) COLLATE pg_catalog."default",
    "numberOfAttempts" character varying(2) COLLATE pg_catalog."default",
    "photoName" character varying(255) COLLATE pg_catalog."default",
    "photoPath" character varying(255) COLLATE pg_catalog."default",
    "signName" character varying(255) COLLATE pg_catalog."default",
    "signPath" character varying(255) COLLATE pg_catalog."default",
    "photoSource" character varying(30) COLLATE pg_catalog."default",
    "isActive" boolean,
    "createdById" character varying(16) COLLATE pg_catalog."default",
    "createdByRoleId" character varying(16) COLLATE pg_catalog."default",
    "updatedById" character varying(16) COLLATE pg_catalog."default",
    "ipAddress" character varying(50) COLLATE pg_catalog."default",
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "isRejected" boolean,
    description character varying(500) COLLATE pg_catalog."default",
    row_number integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.mts2024applications
    OWNER to postgres;
	
select count(*) from mts2024applications ;----5744713	

alter table candidates rename column "registrationNo"  to regno;

select * from candidates limit 10;

alter table candidates add constraint pk_regno_mts primary key (regno);

alter table candidates rename column "fathersName"  to father_name;
alter table candidates rename column "mothersName"  to mother_name;
alter table candidates rename column "gender"  to gender_name;

pg_dump -U postgres -h 10.246.126.173 -p 5432 -t cut_off_table -F c -f C:\Users\Public\cut_off_table.dump alloc_mts2023_t1_allocation
pg_dump -U postgres -h 10.246.126.173 -p 5432 -t master_table -F c -f C:\Users\Public\master_table.dump alloc_mts2023_t1_allocation
pg_dump -U postgres -h 10.246.126.173 -p 5432 -t arc_table -F c -f C:\Users\Public\arc_table.dump alloc_mts2023_t1_allocation	

pg_restore -U postgres -h 10.246.126.173 -p 5432 -d alloc_mts2024_tier1_allocation -t arc_table C:\Users\Public\arc_table.dump
pg_restore -U postgres -h 10.246.126.173 -p 5432 -d alloc_mts2024_tier1_allocation -t master_table C:\Users\Public\master_table.dump
pg_restore -U postgres -h 10.246.126.173 -p 5432 -d alloc_mts2024_tier1_allocation -t cut_off_table C:\Users\Public\cut_off_table.dump

alter table candidates add column cat1 character varying;
alter table candidates add column cat2 character varying;
alter table candidates add column cat3 character varying;
alter table candidates add column gender integer;


select distinct cat1,count(*) from candidates group by cat1;
"EWS"	335201
"OBC"	2480718
"SC"	1468139
"ST"	539156
"UR"	921499

update candidates set cat2='3' where "isEsm"=true;---22800

update candidates set cat3='4' where "typeOfPwbd"='OH';-----37842
update candidates set cat3='5' where "typeOfPwbd"='HH';-----7957
update candidates set cat3='7' where "typeOfPwbd"='VH';-----19317
update candidates set cat3='8' where "typeOfPwbd"='Others';-----8230

update candidates set gender='1' where gender_name='Female';----1786783
update candidates set gender='2' where gender_name='Male';----3957872
update candidates set gender='3' where gender_name='Transgender';----58


alter table candidates add column arc_code character varying;

update candidates a
set a.arc_code=b."arcCode"
from "ageRelaxations" b
where a."ageRelaxationId"=b.id;

select distinct cat1,arc_code,count(*) from candidates where arc_code is not null group by cat1,arc_code;---all ok

alter table candidates add column exs_reservation character varying;

select distinct "isCivilPost",count(*) from candidates where cat2='3' group by "isCivilPost";

update candidates
set exs_reservation='Yes' where cat2='3';---22800

update candidates
set exs_reservation='No' where cat2='3' and "isCivilPost"=true;---346



create table marks_edp
(
	ParticipantID character varying,
	Name character varying,
	ParticipantType character varying,
	TestCenterCode character varying,
	TestCenterName character varying,
	Numerical_and_Mathematical_Ability numeric,
	Reasoning_Ability_and_Problem_Solving numeric,
	Session1_score numeric,
	Session1_Normalized_Score numeric,
	General_Awareness numeric,
	English_Language_and_Comprehension numeric,
	Session2_score numeric,
	Session2_Normalized_Score numeric,
	Score numeric,
	Normalized_Score numeric,
	Date_Shift character varying,
	SystemName character varying
)

alter table marks_edp add constraint pk_participant primary key(participantid);


create table unvd_data
(REGID character varying,
 ROLL character varying,
 NAME character varying,
 REMARKS character varying,
 TCS_V_CODE character varying,
 EXAM_DATE character varying,
 EXAM_SHIFT character varying,
 PWD_STATUS	character varying,
 PWD_TYPE character varying,
 SCRIBE character varying,
 OWN_SCRIBE character varying
)

alter table marks_edp add column regid character varying;

alter table unvd_data add constraint pk_r primary key(regid);

select count(*) from marks_edp ;---2250788


update marks_edp a
set a.regid=b.regid
from unvd_data b
where a.participantid=b.roll;---2250749

----39 missing regno in marks data ------

'8204003226','7205003276','8604005107','7013001706','8601023682','8603009085','8601027291','8601027500','8204000044','8201001221','8004012349','8601048232','8007051268','8003011036','8201029901','8008023223','8004027729','8601008969','8008003991','8601022982','8007020813','8008000156','8603012165','8601045291','8601064398','8004019603','8004023036','8003008333','8208013173','8201006072','8601017645','8206005257','7201007637','7204016446','8004016869','8601062084','7205009380','8603010315','8601060588'


alter table candidates add column marks_available character varying;


alter table candidates add column part1_nm numeric;
alter table candidates add column part2_reasoning numeric;
alter table candidates add column session1_score numeric;
alter table candidates add column session1_normalized_score numeric;

alter table candidates add column part3_ga numeric;
alter table candidates add column part4_eng numeric;
alter table candidates add column session2_score numeric;
alter table candidates add column session2_normalized_score numeric;

alter table candidates add column score numeric;
alter table candidates add column normalized_score numeric;

select count(distinct roll) from unvd_data ;---5599236

update candidates a
set a.rollno=b.roll
from unvd_data b where a.regno=b.regid;---5599236


update candidates a
set a.marks_available='Yes',
a.part1_nm=b.numerical_and_mathematical_ability,
a.part2_reasoning=b.reasoning_ability_and_problem_solving,
a.session1_score=b.session1_score,
a.session1_normalized_score=b.session1_normalized_score,
a.part3_ga=b.general_awareness,
a.part4_eng=b.english_language_and_comprehension,
a.session2_score=b.session2_score,
a.session2_normalized_score=b.session2_normalized_score,
a.score=b.score,
a.normalized_score=b.normalized_score
from marks_edp b
where a.regno=b.regid
and a.rollno=b.participantid;-----2250749


---------debarred checking----------------------


select a.debarred,a.regno,a.rollno,a.name,b.name as d_name,a.father_name,b.fathername as d_father_name,a.mother_name,b.mothername as d_mother_name,a.dob,b.dob as dob1_deb,b.dob2 as d_dob,a.gender,a.cat1,
b.debarredfrom1,b.debarredupto1,b.reason,b.otherreason
from candidates a,debarred b where 
a.marks_available='Yes' and
b.debarredupto1 >'2024-01-01' and
replace((UPPER(a.name)||UPPER(a.father_name)||UPPER(a.mother_name)),' ','') = replace((UPPER(b.name)||UPPER(b.fathername)||UPPER(b.mothername)),' ','')
and a.dob=b.dob2;
 
--replace ((UPPER(b.name)||UPPER(b.mothername)),' ','') = replace ((UPPER(a.name)||UPPER(a.mother_name)),' ','') and a.dob = b.dob2;
 
replace ((UPPER(b.name)||UPPER(b.fathername)),' ','') = replace ((UPPER(a.name)||UPPER(a.father_name)),' ','') and a.dob = b.dob2
and replace(upper(a.mother_name),' ','')<>replace(upper(b.mothername),' ','');



update candidates
set debarred='Yes' where regno in (
select a.regno
from candidates a,debarred b where 
a.marks_available='Yes' and
b.debarredupto1 >'2024-01-01' and
replace((UPPER(a.name)||UPPER(a.father_name)||UPPER(a.mother_name)),' ','') = replace((UPPER(b.name)||UPPER(b.fathername)||UPPER(b.mothername)),' ','')
and a.dob=b.dob2
	)

update candidates
set debarred='Yes' where regno in ('10012225937','10016422416','10016068175','10006731106','10014091878','10016850731','10000775441','10015836085','10016186770');


update candidates
set debarred='Yes' where regno in 
('10013550136','10012962339','10015994992','10008662147','10001470873','10014071442','10012477323','10012723739','10013034399');

alter table candidates add column rej_prov character varying;

update candidates
set rej_prov='C' where marks_available='Yes';---2250749

update candidates
set rej_prov='D' where debarred='Yes';---1127


update candidates set arc_code='06',remarks='relaxation given' where regno in ('10017138467','10017204939','10017409195','10017240739','10014580804');

update candidates set arc_code='05',remarks='relaxation given' where regno in ('10017511048','10012003737','10017323171','10017125609','10017430954','10017735321','10017240393','10017560534');

update candidates set arc_code='03',remarks='relaxation given' where regno in ('10014543228','10017617552','10015692240','10017607070','10017227889','10015359946','10017335322','10017199719','10017713671','10001702179','10017476091','10009545297','10013633992','10008009453')

update candidates set arc_code='04',remarks='relaxation given' where regno in ('10017370317','10005832355','10013717953','10017642006','10008293329','10015441103','10015808714','10001186372','10014369184','10017468916','10006472587','10002124396','10001684018','10017337857','10017260108','10017428583','10017652613','10017483316','10017626089','10017565887','10017219368','10017393179','10006127261','10017491811','10017540827','10017483497','10016791647','10005740154','10017501662','10006519905','10017651857','10015817121','10002152505','10008239065','10015697555','10011221766','10016526014','10017351236');

update candidates set arc_code='01',remarks='relaxation given' where regno in
(select regno from candidates where rej_prov='C' and substring("ageAsOnDob",1,3)::int >=27
and arc_code is null and cat2='0' and cat3 is null and cat1 in ('1','2'));

update candidates set arc_code='02',remarks='relaxation given' where regno in
(select regno from candidates where rej_prov='C' and substring("ageAsOnDob",1,3)::int >=27
and arc_code is null and cat2='0' and cat3 is null and cat1 in ('6'));

alter table candidates  add column cand_name character varying;

update candidates
 set cand_name=name where marks_available='Yes';
 
alter table candidates rename column "newName"  to changed_name;

update candidates
set cand_name=changed_name where marks_available='Yes' and rej_prov='C' and changed_name is not null;

alter table candidates add column dob_flag_18_27 character varying;
alter table candidates add column catsel_dob_18_27 character varying;
alter table candidates add column merit integer;
alter table candidates add column cutoff_flag character varying;
alter table candidates add column catsel_18_27 character varying;
alter table candidates add column allocated_category character varying;
alter table candidates add column allocated_state character varying;
alter table candidates add column age_limit character varying;
alter table candidates add column allocated_against_ur character varying;
alter table candidates add column post_name character varying;
alter table candidates add column post_code character varying;
alter table candidates add column state_name character varying;


create table candidates_for_ashu as (
select row_number,regno,rollno,name,changed_name,cand_name,father_name,mother_name,dob,"ageAsOnDob" as candidateage_ason_date,
gender,cat1,"tenthRollNumber" as tenth_roll_no,"regionCode" as regionid,"isEsm" as is_ex_serviceman,cat2,
"lengthOfService" as service_period,"dojOfEsm" as joining_date_for_armedforces,"dojOfCivilPost" as joining_date_for_civilpost,
"dodOfEsm" as discharged_date,"isCivilPost" as isexs_benefit_availed_for_civilpost,"isPwbd" as is_physically_handicaped,
cat3,post_pref as state_ut_pref,"isAgeRelaxation" as is_age_relaxation,arc_code as agerelax_code,exs_reservation,
dob_flag_18_27,catsel_dob_18_27,debarred as debarred_flag,part1_nm,part2_reasoning,part3_ga,part4_eng, score as score_raw,
total, session1_raw_score as session1_raw,session2_raw_score as session2_raw, session1, session2, 
merit, cutoff_flag,catsel_18_27, rej_prov as rejprov, allocated_category,allocated_state,age_limit,allocated_against_ur, 
post_name,post_code,state_name from candidates where rej_prov='C');----2249622

update candidates a
set a.dob_flag_18_27=b.dob_flag_18_27,
a.catsel_dob_18_27=b.catsel_dob_18_27,
a.merit=b.merit::int,
a.cutoff_flag=b.cutoff_flag,
a.catsel_18_27=b.catsel_18_27,
a.allocated_category=b.allocated_category_havaldar,
a.allocated_state=b.allocated_state_havaldar,
a.age_limit=b.age_limit_havaldar,
a.allocated_against_ur=b.allocated_agaist_ur_havaldar
from mts_result b
where a.regno=b.regno
and a.rollno=b.rollno;


10001748209
do
$$
begin

update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10001027990';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10005603586';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10000050193';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10000981870';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10013966137';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10011688884';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10008587885';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10011099327';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10013795805';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10017229349';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10017188337';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10016882585';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10013640910';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10016625475';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10005828093';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10014113482';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10006107430';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10017270445';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10013683338';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10015682240';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10006140303';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10009699426';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014761049';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10005785184';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10001809638';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10002044209';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10008210742';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10008633451';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10008165197';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10009015034';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10011598292';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10008672696';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10010723097';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10017511841';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10000752645';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10000899004';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10000918388';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10008136817';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10010163946';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10011261390';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011384227';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10011411107';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014086867';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011749282';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011865434';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10012278526';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10012769499';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10014201776';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014772378';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014879605';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10015164742';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10015191431';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10010744016';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10013886067';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10013026784';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10017211518';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10015709395';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10017389092';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10013913718';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10015754596';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10016476296';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10016048310';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10000771344';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10012235706';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10008955219';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10001598250';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10013558827';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10009042550';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011117331';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10013075412';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10016145891';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10016326767';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10016797698';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10016400611';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10015867865';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10016571517';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10015901417';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10016489383';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014306347';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10016649646';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10016665950';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10016678414';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10016751342';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10016770563';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10001297619';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10009488941';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10000706880';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10001605652';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10008230382';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10009367678';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014059094';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014077515';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10016663705';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10010149705';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10017313032';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10000069793';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10010921606';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10000866276';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10011701075';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10016148548';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10008003318';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10001309880';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10001688714';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10005759598';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10005788295';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10010580536';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011312000';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011757223';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10013916565';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10016307447';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10016336854';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10017382233';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10000114286';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10009301671';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10000813244';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10000958235';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10001059630';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10001078016';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10001148966';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10001205010';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10001241215';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10001725792';
update candidates set cutoff_flag='03',catsel_18_27=' ' where  regno='10001748209';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10001765087';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10001787186';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10005686893';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10005774062';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10005797638';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10005818621';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10005824835';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10000131732';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10006347722';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10006541752';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011418431';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10006694295';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10010707685';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10008037968';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10008038181';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10000787148';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10008064603';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10002060340';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10008932919';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10012396583';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10009167183';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10009186360';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10009387941';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10009787749';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10012762948';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10009934644';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10009990845';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10010205256';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10010797087';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011017058';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10011170533';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10011236645';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011292583';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10011342694';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011722019';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10011783316';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10011794272';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10011942987';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10012028810';
update candidates set cutoff_flag='08',catsel_18_27='08' where regno='10012175789';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10012251598';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10015357268';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10000843873';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10012518086';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10012689077';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10012720851';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10012805289';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10012952859';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10012965319';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10013141860';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10013306424';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10013357280';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10013399457';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10013509134';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10001105402';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10013600191';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10010843862';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10013614406';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10013993119';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10001048223';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10014060845';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10001773840';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10006480706';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10006508488';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10013912474';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10013913405';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10009090095';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10014080298';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10014186913';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10014194427';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10014267426';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014313718';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014322093';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10012056841';
update candidates set cutoff_flag='05',catsel_18_27='05' where regno='10014415730';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10014434856';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10014500308';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014739004';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014536681';
update candidates set cutoff_flag='03',catsel_18_27='03' where regno='10013448127';
update candidates set cutoff_flag='07',catsel_18_27='07' where regno='10013519249';
update candidates set cutoff_flag='04',catsel_18_27='04' where regno='10014617495';
update candidates set cutoff_flag='035',catsel_18_27='035'where regno='10001049360';

end
$$

---suspected debarred----
'10008152077','10015543452','10016129954','10013946162','10005638695','10001835955','10001198635','10011889268','10005742022','10013311727'


create table vacancy_table_mts
(
post_name character varying,
post_code character varying,
state_code character varying,
state_name character varying,
region_code character varying,
age_limit character varying,
category character varying,
category_code character varying,
orignal_vacancy	integer,
initial_vacancy integer,
current integer,
allocated integer,
left_vacancy integer,
key	character varying,
lowestmarks_session2 numeric,
minmarks_ga numeric,
lowestmarks_session1 numeric,
min_marks_cand_dob date
)

update candidates a
set a.post_name=b.post_name,
a.post_code=b.post_code,
a.state_name=b.state_name
from vacancy_table_mts b
where a.allocated_state=b.state_code
and a.allocated_state is not null;


-----candidature cancelled candidates------
'8204000044','8008000156','8201000129','8201001221','8601005695','8201002351','8601008969','8601010054','8601011105','8207002852','8010004408','8201006072','8007014454','8603004604','8603004678','8604004368','8601038838','8004012349','8603008536','8601044633','8603012165','8603012005','8604010999','8604016415','8604018256'


'8008003991','8204003226','8604005107','8601017645','8206005257','8601022982','8601023682','8007020813','8601027291','8601027500','8603009085','8603010315','8601045291','8601048232','8004016869','8601060588','8601062084','8601064398','8004019603','8007051268','8003008333','8003011036','8004023036','8201029901','8004027729','8008023223','8208013173'


select * from candidates where rollno in ('8204000044','8008000156','8201000129','8201001221','8601005695','8201002351','8601008969','8601010054','8601011105','8207002852','8010004408','8201006072','8007014454','8603004604','8603004678','8604004368','8601038838','8004012349','8603008536','8601044633','8603012165','8603012005','8604010999','8604016415','8604018256'
);---no record found

select * from candidates where rollno in ('8008003991','8204003226','8604005107','8601017645','8206005257','8601022982','8601023682','8007020813','8601027291','8601027500','8603009085','8603010315','8601045291','8601048232','8004016869','8601060588','8601062084','8601064398','8004019603','8007051268','8003008333','8003011036','8004023036','8201029901','8004027729','8008023223','8208013173'
);-----no record found


-----with held cases------95+50

'8601024126','8601023060','8201005424','8201008203','8601006490','8003024152','8601008658','8601062551','8601066269','8003021042','8601087412','8001008225','8001009185','8001011883','8003000046','8003000659','8003001562','8003007693','8007022754','8007024371','8007028203','8007032284','8007037057','8007038880','8007038981','8007044378','8007071487','8008000245','8010013245','8010015872','8010018386','8010018832','8011007421','8201009340','8201018172','8201040402','8206004619','8601006860','8601011274','8601033195','8601054709','8601062035','8601066105','8601067855','8601071913','8601081386','8601082236','8601087791','8601100741','8601101986','8601102298','8604003108','8604010497','8601060433','8007049272','8202011799','8604005107','8601017645','8202001146','8003025179','8007052046','8204031588','8208005031','8201024478','8601099819','8601029238','8007070173','8601066363','8007071601','8007009012','8007050027','8001008610','8007036134','8007039965','8007037928','8007042604','8007050055','8010006162','8007041127','8007067534','8003005483','8003004498','8601106248','8601008930','8007028062','8007078930','8007043853','8001011580','8007023850','8007083766','8007082837','8007014885','8007023084','8010010572','8007001920','8007064736','8003003295'

not found

8604005107
8601017645

update candidates
set rej_prov='W',
remarks='With held' where rollno in ('8601024126','8601023060','8201005424','8201008203','8601006490','8003024152','8601008658','8601062551','8601066269','8003021042','8601087412','8001008225','8001009185','8001011883','8003000046','8003000659','8003001562','8003007693','8007022754','8007024371','8007028203','8007032284','8007037057','8007038880','8007038981','8007044378','8007071487','8008000245','8010013245','8010015872','8010018386','8010018832','8011007421','8201009340','8201018172','8201040402','8206004619','8601006860','8601011274','8601033195','8601054709','8601062035','8601066105','8601067855','8601071913','8601081386','8601082236','8601087791','8601100741','8601101986','8601102298','8604003108','8604010497','8601060433','8007049272','8202011799','8604005107','8601017645','8202001146','8003025179','8007052046','8204031588','8208005031','8201024478','8601099819','8601029238','8007070173','8601066363','8007071601','8007009012','8007050027','8001008610','8007036134','8007039965','8007037928','8007042604','8007050055','8010006162','8007041127','8007067534','8003005483','8003004498','8601106248','8601008930','8007028062','8007078930','8007043853','8001011580','8007023850','8007083766','8007082837','8007014885','8007023084','8010010572','8007001920','8007064736','8003003295'
);


'3209015413','3209015361','3209015386','3209015407','3209015391','3209015290','3209016043','3209016069','3209015881','3209015960','3209015978','3209015896','3209016044','3209015923','3209015921','3209015985','3209015924','3209015959','3209017178','3209017292','3209017303','3209017318','3209017319','3209017269','3209017856','3209018562','3209018571','3209018614','3209018620','3209018585','3209018574','3209018517','3209018595','3209018564','3209007642','3209007727','3209007687','3209008316','3209008253','3209008212','3209008322','3209008216','3209008887','3209009020','3209008932','3209008884','3209008844','3209008902','3209009010','3209009025'

update candidates
set rej_prov='W',
remarks='With held' where rollno in ('3209015413','3209015361','3209015386','3209015407','3209015391','3209015290','3209016043','3209016069','3209015881','3209015960','3209015978','3209015896','3209016044','3209015923','3209015921','3209015985','3209015924','3209015959','3209017178','3209017292','3209017303','3209017318','3209017319','3209017269','3209017856','3209018562','3209018571','3209018614','3209018620','3209018585','3209018574','3209018517','3209018595','3209018564','3209007642','3209007727','3209007687','3209008316','3209008253','3209008212','3209008322','3209008216','3209008887','3209009020','3209008932','3209008884','3209008844','3209008902','3209009010','3209009025'
);


---------disqulaified candidates------------------------
select * from candidates where rollno in ('3206033131','3009160911');


update candidates a
set a.testcentercode=b.testcentercode,
a.testcentername=b.testcentername
from edp_marks b
where a.rollno=b.participantid;

