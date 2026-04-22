create table tier2_marks
(DriveID character varying,
 ExamID character varying,
 ParticipantID character varying,
 Name character varying,
 ParticipantType character varying,
 TestCenterCode character varying,
 TestCenterName character varying,
 LanName character varying,
 City character varying,
 State character varying,
 Country character varying,
 Subject character varying,
 QuestionPaperName	character varying,
 TotalQuestions character varying,
 QuestionsNotVisited character varying,
 QuestionsNotAttempted character varying,
 QuestionsAttempted character varying,
 QuestionsAttemptedandMarkedForReview character varying,
 QuestionsNotAttemptedandMarkedForReview character varying,
 TotalAttempted character varying,
 TotalCorrect character varying,
 TotalWrong	character varying,
 DelayedDurationsec character varying,
 SubmitTime character varying,
 ComputerKnowledgeModule numeric,
 EnglishLanguageandComprehension numeric,
 MathematicalAbilities numeric,
 GeneralAwareness numeric,
 ReasoningandGeneralIntelligence numeric,
 Score numeric,
 FirstLoginTime character varying,
 ProfileConfirmTime	character varying,
 RingtheBellTime character varying,
 DefaultLanguage character varying,
 MaximumMarks character varying,
 SystemName character varying
)

psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_chsl2024_allocation_final
\copy tier2_marks from 'C:\Users\Public\Final Score Report_CHSLE Exam 18th Nov 2024.csv' csv header;


with cte as
(select a.* from "chsl2024Tier1Marks" a,
rollno b
where a."rollNo"=b.rollno)
select app.* from 
"chsl2024Applications" app,cte
where cte."registrationNo"=app."registrationNo"
and app."statusId"='01' and app."isActive"=true ;

CREATE TABLE IF NOT EXISTS public."chsl2024Applications"
(
    id character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "registrationNo" character varying(11) COLLATE pg_catalog."default" NOT NULL,
    "otrId" character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "myApplicationId" character varying(16) COLLATE pg_catalog."default",
    "emailId" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "phoneNo" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "newName" character varying(50) COLLATE pg_catalog."default",
    "fathersName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "mothersName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    dob date NOT NULL,
    "ageAsOnDob" character varying(30) COLLATE pg_catalog."default" NOT NULL,
    "genderId" character varying(16) COLLATE pg_catalog."default" NOT NULL,
    gender character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "categoryId" character varying(16) COLLATE pg_catalog."default" NOT NULL,
    category character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "isPwbd" boolean,
    "typeOfPwbd" character varying(16) COLLATE pg_catalog."default",
    "nationalityId" character varying(50) COLLATE pg_catalog."default",
    nationality character varying(500) COLLATE pg_catalog."default",
    "markOfIdentification" character varying(50) COLLATE pg_catalog."default",
    "tenthEducationBoardId" character varying(16) COLLATE pg_catalog."default",
    "educationBoardName" character varying(500) COLLATE pg_catalog."default",
    "tenthRollNumber" character varying(16) COLLATE pg_catalog."default",
    "tenthYearOfPassing" character varying(5) COLLATE pg_catalog."default",
    "examCentrePreferenceId1" character varying(16) COLLATE pg_catalog."default",
    "examCentrePreferenceId2" character varying(16) COLLATE pg_catalog."default",
    "examCentrePreferenceId3" character varying(16) COLLATE pg_catalog."default",
    "cbeMedium" character varying(100) COLLATE pg_catalog."default",
    "typingTestMedium" character varying(100) COLLATE pg_catalog."default",
    "isBenchmarkDisabilityVh" boolean,
    "isBenchmarkDisabilityOh" boolean,
    "isPhysicalLimitToWrite" boolean,
    "isScribe" boolean,
    "isOwnScribe" boolean,
    "scribeMedium" character varying(20) COLLATE pg_catalog."default",
    "isScienceStream" boolean,
    "isEsm" boolean,
    "dojOfEsm" date,
    "dodOfEsm" date,
    "lengthOfService" character varying(30) COLLATE pg_catalog."default",
    "isCivilPost" boolean,
    "dojOfCivilPost" date,
    "isAgeRelaxation" boolean,
    "ageRelaxationId" character varying(16) COLLATE pg_catalog."default",
    "isPersonalInfoAccess" boolean,
    "regionCode" character varying(5) COLLATE pg_catalog."default",
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
    "photoId" character varying(16) COLLATE pg_catalog."default",
    "signId" character varying(16) COLLATE pg_catalog."default",
    "isPhotoDeclare" boolean,
    "isDeclaration" boolean,
    "statusId" character varying(16) COLLATE pg_catalog."default",
    "numberOfAttempts" character varying(2) COLLATE pg_catalog."default",
    "photoName" character varying(255) COLLATE pg_catalog."default",
    "photoPath" character varying(255) COLLATE pg_catalog."default",
    "signName" character varying(255) COLLATE pg_catalog."default",
    "signPath" character varying(255) COLLATE pg_catalog."default",
    "ipAddress" character varying(50) COLLATE pg_catalog."default",
    "isActive" boolean,
    "createdByRoleId" character varying(16) COLLATE pg_catalog."default",
    "createdById" character varying(16) COLLATE pg_catalog."default",
    "updatedById" character varying(16) COLLATE pg_catalog."default",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "submitPwbdType" character varying(10) COLLATE pg_catalog."default",
    serial integer NOT NULL DEFAULT 1,
    comments character varying(100) COLLATE pg_catalog."default",
    "ownScribeWithdrawal" boolean DEFAULT false,
    "scribeRegNo" character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT "chsl2024Applications_pkey" PRIMARY KEY (id),
    CONSTRAINT uc_registrationno_numberofattempts UNIQUE ("registrationNo", "numberOfAttempts", serial)
)



update chsl2024Applications set agerelaxation_code ='10' where agerelaxationid='5587h5a6uh4aedd';---135
update chsl2024Applications set agerelaxation_code ='05' where agerelaxationid='7u3aaw4upi4sfpi';--86
update chsl2024Applications set agerelaxation_code ='02' where agerelaxationid='96a6akkvlf8kr5o';--1827
update chsl2024Applications set agerelaxation_code ='11' where agerelaxationid='er08g357vpc0qk9';--22
update chsl2024Applications set agerelaxation_code ='08' where agerelaxationid='gzv9v8zee55cpgf';--58
update chsl2024Applications set agerelaxation_code ='09' where agerelaxationid='jfnlcsapzasrwhf';--16
update chsl2024Applications set agerelaxation_code ='03' where agerelaxationid='jfuco1ppee6swav';--273
update chsl2024Applications set agerelaxation_code ='01' where agerelaxationid='o0am5hny2hme9yj';--2456
update chsl2024Applications set agerelaxation_code ='04' where agerelaxationid='o1nho6mhh7ekmnh';--265
update chsl2024Applications set agerelaxation_code ='12' where agerelaxationid='pkc42oum7cihyxn';--7
update chsl2024Applications set agerelaxation_code ='06' where agerelaxationid='pkgbrts7t18dau9';--2495


CREATE TABLE IF NOT EXISTS public.chsl2024optionpreference
(
    id character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "notificationId" character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "examId" character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "examYear" character varying(4) COLLATE pg_catalog."default" NOT NULL,
    "registrationNo" character varying(11) COLLATE pg_catalog."default" NOT NULL,
    "applicationReferenceId" character varying(16) COLLATE pg_catalog."default",
    "actionType" character varying(10) COLLATE pg_catalog."default",
    "preferredDeptCodeList" character varying(800)[] COLLATE pg_catalog."default",
    "preferrenceDeclaration" boolean,
    "numberOfAttempts" character varying(2) COLLATE pg_catalog."default",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "isActive" boolean NOT NULL,
    "rollNumber" character varying(12) COLLATE pg_catalog."default",
    "ipAddress" character varying COLLATE pg_catalog."default",
    CONSTRAINT "chsl2024OptionPreference_pkey" PRIMARY KEY (id)
)


create table skilltest_exempted
(slno integer,
region character varying,
rollno character varying,
name character varying)


create table vacancy_table as
(
SELECT 
    MinistryName,
	DepartmentName,
	Postname,
	post_code,
	'UR' as category,
	'9' as category_code,
	 UR AS "initial"
	 from vacancy

UNION ALL
SELECT 
    MinistryName,
	DepartmentName,
	Postname,
	post_code,
	'SC' as category,
	'1' as category_code,
	 SC AS "initial"
	 from vacancy
UNION ALL
SELECT 
    MinistryName,
	DepartmentName,
	Postname,
	post_code,
	'ST' as category,
	'2' as category_code,
	 ST AS "initial"
	 from vacancy 
UNION ALL
SELECT 
    MinistryName,
	DepartmentName,
	Postname,
	post_code,
	'EWS' as category,
	'0' as category_code,
	 EWS AS "initial"
	 from vacancy	 
UNION ALL
SELECT 
    MinistryName,
	DepartmentName,
	Postname,
	post_code,
	'OBC' as category,
	'6' as category_code,
	 OBC AS "initial"
	 from vacancy
UNION ALL
SELECT 
    MinistryName,
	DepartmentName,
	Postname,
	post_code,
	'ESM' as category,
	'3' as category_code,
	 ESM AS "initial"
	 from vacancy 
UNION ALL
SELECT 
    MinistryName,
	DepartmentName,
	Postname,
	post_code,
	'OH' as category,
	'4' as category_code,
	 OH AS "initial"
	 from vacancy

UNION ALL
SELECT 
    MinistryName,
	DepartmentName,
	Postname,
	post_code,
	'HH' as category,
	'5' as category_code,
	 HH AS "initial"
	 from vacancy
	 
UNION ALL
SELECT 
    MinistryName,
	DepartmentName,
	Postname,
	post_code,
	'VH' as category,
	'7' as category_code,
	 VH AS "initial"
	 from vacancy	 
UNION ALL
SELECT 
    MinistryName,
	DepartmentName,
	Postname,
	post_code,
	'OTHERS' as category,
	'8' as category_code,
	 Otherpwd AS "initial"
	 from vacancy	 
);

select sum(initial) from vacancy_table;---3894
select sum(initial) from vacancy_table where category_code in ('1','2','0','6','9');---3437
select sum(initial) from vacancy_table where category_code not in ('1','2','0','6','9');---457

alter table vacancy_table add constraint pk_post primary key (department_code,category_code);

update vacancy_table set gender='2' where department_code='L41';;

CREATE TABLE SKILLTEST
(asr_rollno CHARACTER VARYING,
 asr_region_code CHARACTER VARYING,
 asr_date_appeared CHARACTER VARYING,
 asr_batch_no CHARACTER VARYING,
 asr_spelling_mistakes CHARACTER VARYING,
 asr_half_error CHARACTER VARYING,
 asr_misc_error CHARACTER VARYING,
 asr_punctuation_error CHARACTER VARYING,
 asr_paragraphic_error CHARACTER VARYING,
 asr_total_mistakes	NUMERIC,
 asr_no_of_word_original CHARACTER VARYING,
 asr_per_of_error NUMERIC,
 asr_stenograde CHARACTER VARYING,
 asr_remarks CHARACTER VARYING,
 SUBJECT CHARACTER VARYING
)

alter table SKILLTEST add constraint pk_asr primary key(asr_rollno);

CREATE TABLE TYPINGTEST
(asr_rollno CHARACTER VARYING,
 asr_region_code CHARACTER VARYING,
 asr_date_appeared CHARACTER VARYING,
 asr_batch_no CHARACTER VARYING,
 asr_spelling_mistakes CHARACTER VARYING,
 asr_half_error CHARACTER VARYING,
 asr_misc_error CHARACTER VARYING,
 asr_punctuation_error CHARACTER VARYING,
 asr_paragraphic_error CHARACTER VARYING,
 asr_total_mistakes	NUMERIC,
 asr_no_of_word_original CHARACTER VARYING,
 asr_per_of_error NUMERIC,
 asr_stenograde CHARACTER VARYING,
 asr_remarks CHARACTER VARYING,
 SUBJECT CHARACTER VARYING
)


select * from skilltest_exempted ;--194

select distinct asr_rollno from typingtest;---34530


select a.* from typingtest a,
skilltest_exempted b where
a.asr_rollno=b.rollno;---4


create table candidates as select * from chsl2024applications;

do
$$
begin

alter table candidates add column cat1 character varying;
alter table candidates add column cat2 character varying;
alter table candidates add column cat3 character varying;
alter table candidates add column exs_reservation character varying;
alter table candidates add column gi numeric;
alter table candidates add column ga numeric;
alter table candidates add column qa numeric;
alter table candidates add column eng numeric;
alter table candidates add column raw_score numeric;
alter table candidates add column final_score_normalized numeric;
alter table candidates add column tier1 numeric;

end
$$

------tier1 marks update-----

update candidates a
set a.gi =b.p1_general_intelligence::numeric,
a.ga =b.p1_general_awareness::numeric,
a.qa = b.p1_quantitative_aptitude::numeric,
a.eng =b.p1_english_language::numeric,
a.raw_score=b.p1_raw_score::numeric,
a.final_score_normalized=b."p1_final_score_(normalized)"::numeric,
a.tier1=b.tier1::numeric
from chsl2024tier1marks b
where a."registrationNo"=b.regno;----34920 updates


update candidates a
set a.rollno=b.rollno
from chsl2024tier1marks b
where a."registrationNo"=b.regno;


do
$$
begin

alter table candidates add column computer_knowledge_module numeric;
alter table candidates add column mathematical_abilities numeric;
alter table candidates add column reasoning_and_general_intelligence numeric;
alter table candidates add column english_language_and_comprehension numeric;
alter table candidates add column general_awareness numeric;
alter table candidates add column score numeric;

end
$$

----tier2 marks update------


update candidates a
set
a.computer_knowledge_module =b.ComputerKnowledgeModule,
a.mathematical_abilities =b.MathematicalAbilities,
a.reasoning_and_general_intelligence =b.ReasoningandGeneralIntelligence,
a.english_language_and_comprehension=b.EnglishLanguageandComprehension,
a.general_awareness =b.GeneralAwareness,
a.score =b.score
from tier2_marks b
where
a.rollno=b.participantid;----34920 updates

alter table candidates add column section1 numeric;
alter table candidates add column section2 numeric;
alter table candidates add column total numeric;

update candidates set section1=mathematical_abilities+reasoning_and_general_intelligence;
update candidates set section2=english_language_and_comprehension+general_awareness;
update candidates set total=section1+section2;

update candidates set cat1='0' where category='EWS';---6152
update candidates set cat1='6' where category='OBC';---11656
update candidates set cat1='1' where category='SC';---6501
update candidates set cat1='2' where category='ST';---2679
update candidates set cat1='9' where category='UR';---7932


update candidates set cat2='3' where "isEsm"=true;---2754

update candidates set cat3='5' where "typeOfPwbd"='HH';---426
update candidates set cat3='4' where "typeOfPwbd"='OH';---568
update candidates set cat3='8' where "typeOfPwbd"='Others';---283
update candidates set cat3='7' where "typeOfPwbd"='VH';---361

------select distinct "typeOfPwbd","isBenchmarkDisabilityVh" ,count(*)from candidates group by "typeOfPwbd","isBenchmarkDisabilityVh";

update candidates set exs_reservation='Yes'where cat2='3';
update candidates set exs_reservation='No'where cat2='3' and "isCivilPost"=true;---14 updates


alter table candidates add column mistakes_ldc numeric;
alter table candidates add column ldc_medium character varying;
alter table candidates add column mistakes_deo numeric;
alter table candidates add column deo_medium character varying;


--------typing test marks update-------


update candidates a
set a.mistakes_ldc=b.asr_per_of_error,
a.ldc_medium=asr_remarks
from typingtest b
where a.rollno=b.asr_rollno;----34530 updates


2201014547
2201205791
6001010958
6014003401


select distinct b.asr_rollno from candidates a,
typingtest b where a.rollno<>b.asr_rollno;


select * from typingtest where asr_rollno in ('2201014547','2201205791','6001010958','6014003401');


select * from tier2_marks where participantid in ('2201014547','2201205791','6001010958','6014003401');----no records found


-------skilltest marks update-----------

update candidates a
set a.mistakes_deo=b.asr_per_of_error,
a.deo_medium=asr_remarks
from skilltest b
where a.rollno=b.asr_rollno;----1433 updates

CREATE TABLE IF NOT EXISTS public.debarred
(
   
    regionid character varying COLLATE pg_catalog."default",
    registrationnumber character varying COLLATE pg_catalog."default",
    name character varying COLLATE pg_catalog."default",
    fathername character varying COLLATE pg_catalog."default",
    mothername character varying COLLATE pg_catalog."default",
    dob2 date,
    genderid character varying COLLATE pg_catalog."default",
    categoryid character varying COLLATE pg_catalog."default",
    educationboardid character varying COLLATE pg_catalog."default",
    matriculationrollnumber character varying COLLATE pg_catalog."default",
    matriculationpassyear character varying COLLATE pg_catalog."default",
    examid character varying COLLATE pg_catalog."default",
    examyear character varying COLLATE pg_catalog."default",
    rollnumber character varying COLLATE pg_catalog."default",
    debarredfrom1 date,
    debarredupto1 date,
    reason character varying COLLATE pg_catalog."default",
    otherreason character varying COLLATE pg_catalog."default"
)

alter table candidates add column debarred character varying;
alter table candidates add column rejection_provision character varying;
alter table candidates add column remarks character varying;


--------debarred by regions
select * from candidates where rollno in ('3003014877','3209001641','9001002974','1801011791','1408014711','1403001460','1010002964','8601039669')limit 10;

-------rejected/cancelled by regions
select * from candidates where rollno in ('9001007527','9001000071','6006008329','6006008410','8012003352','8601028507','8009006384','8011003167','8004002988','8003004297');


select a.debarred,a."registrationNo",a.rollno,a.name,b.name as d_name,a.father_name,b.fathername as d_father_name,a.mother_name,b.mothername as d_mother_name,a.dob,b.dob2 as d_dob,a.gender,a.cat1,
b.debarredFrom1,b.debarredUpto1,b.reason,b.otherReason
from candidates a,debarred b where 
b.debarredUpto1 >'2025-01-01' and

--replace((UPPER(a.name)||UPPER(a.father_name)||UPPER(a.mother_name)),' ','') = replace((UPPER(b.name)||UPPER(b.fathername)||UPPER(b.mothername)),' ','')
--and a.dob=b.dob2;
 
--replace ((UPPER(b.name)||UPPER(b.mothername)),' ','') = replace ((UPPER(a.name)||UPPER(a.mother_name)),' ','') and a.dob = b.dob2;
 
replace ((UPPER(b.name)||UPPER(b.fathername)),' ','') = replace ((UPPER(a.name)||UPPER(a.father_name)),' ','') and a.dob = b.dob2;


update candidates set deabrred='Yes', rejection_provision='D' where rollno in (
'2201279303','2201308600','2201193694','2201083866','2201003337','4605003400','2201202725','2201202725','2405027097','2405087722','2201242397','2201136081','2201046657','2201228820','2201128214','2201025777','8601004885','2201165022','2201058682','2201136154','2201160376','2201311017','2405072841','3201018202','3206150340','2002010723','2405045824','2201311564','2201090641','2201012263','2201106560','2405008005','2201269437','2405064197','2405064197','2201228665','2201054207','2201311149','2201201196','4410071985','2201048825','2405101019','2405101019','2201090255','2405011325','2405052016','2201230616','3206047561','2201202688','2405075815','2201157815','2201307032','2201025819','2404004938','2201053894','2201058557'
);


10006688914 suspected debarred

------candidates exempted but appeared in typing test---------
select a.* from typingtest a,
skilltest_exempted b where
a.asr_rollno=b.rollno;---4  "3003031280","3009057507","3201013460","3206047602"


----present in exempted but not in candidates------

select * from candidates where rollno in ('1408006862','3003021712','3008016553','3203005613','3205035021','3206155957');-----no records found
select * from tier2_marks where participantid in ('1408006862','3003021712','3008016553','3203005613','3205035021','3206155957');----no records found


-----typing test exempted candidates------

update candidates set mistakes_ldc='0.0',remarks='typing test exempted' where rollno in ('2201025745','3009039068','2201157582','2201262759','3009057507','3009027862','2201237763','2201123632','2201279231','2201326965','2201127466','3206067019','2405085664','2201265181','2201299722','2201136974','2201326973','2201311384','2201157815','2201173997','6005013737','2201007495','4205010275','2201009572','2201097177','3005018641','2201136936','8601010394','3205016589','2406016014','3011028492','2405023850','2201202688','2201193750','2201046848','4205012477','2201307032','4417015349','5501005018','2201193815','2201046701','2405048881','8201003405','8601020458','2201200620','2201237620','2201136081','3001002703','3010071952','3009070855','2201164164','2201308646','2201025777','3011015514','3005001163','3206148073','2201228820','2405112487','2201100137','4206012993','3206105660','2405112472','4206015022','4410076721','5701000795','2405072841','2201197947','2201306535','2401003901','7201006348','8012009197','3001018798','2201271662','5501000101','2201237413','3011023833','2201189293','2201090612','2401002105','3013031377','3005027722','2201326971','2201237068','3010040160','2201188940','4410037683','3001018880','2201104299','2201023416','6204014573','6005000799','2404002241','8201003561','2201123527','2404004341','2201021588','2201134225','5105018078','2201191945','2405111996','2201058682','2201082126','2404005920','4205026073','8601003596','4205014342','9205004061','2201088199','2201123200','3013031360','2201018583','2201164555','2201148557','4609007238','3003034955','2201306327','2201230833','4205002512','3010012574','3013040610','2201009823','2201014517','2405049121','2201174049','3206012199','2201088194','2201200855','2201122864','3010035435','2405045824','2201092599','3001043806','2201058398','2201134420','2201086347','2201316308','1401013499','4417013172','2201237284','2406008694','3010030320','2201010151','2201136065','2201272019','2201125115','3205039397','2405040348','2201279303','2201046780','2201036955','2201055473','3003012757','2201316499','3010098235','2201265083','4410042859','4602002405','2003005270','2201058561','3206025694','2405112567','2201202868','3206047602','4207011293','3003003885','4410100924','2405072781','2201307109','2201058077','9001009622','2201237995','2201122917','3001006702','1004001262','2201263106','2405006374','2201092664','3011023958','4410004204','2201193791','2201307106','3007019409','3009059632','4410023202','6001004368','3003031280','3201013460','2201058557');


update candidates set gender='2' where gender='Male';---29284
update candidates set gender='1' where gender='Female';---5636


alter table candidates add column cand_name character varying;
alter table candidates add column agerelax_code character varying;
alter table candidates add column service_period character varying;

update candidates set cand_name=name;
update candidates set cand_name=new_name where new_name is not null;

update candidates set service_period=lengthofservice;

update candidates set agerelax_code=agerelaxation_code;

select distinct substring("ageAsOnDob",1,3) from candidates where agerelax_code is null;
select * from candidates where agerelax_code is null and substring("ageAsOnDob",1,3)='27' ;
select * from candidates where agerelax_code is null and "ageAsOnDob" like '27%' ;


select distinct rejection_provision,count(*) from candidates group by rejection_provision;
update candidates set rejection_provision='C' where rejection_provision is null;---34865

update candidates set rejection_provision='W',
remarks='With held by regions' where  rollno in ('2405019647','2201245687','2201314952','2002018073','2405087722','2201003337','2201053894','2201242496','2201134420','2201237068','2201125165','2201271662','2201204905','2201237995','2201301934','2201053562','2201274588','1401044473','1401046127','1004027153','1403017318','1203003049','8601020226','7204005737'
) ;

update candidates a
set a.post_pref=b."preferredDeptCodeList"
from chsl2024optionpreference b
where a."registrationNo"=b."registrationNo" and
a.rollno=b."rollNumber";---27092

'8202000491','2404000445','8601020529','2201053600','7207006902','8601047448','2201166414','8601041933','2201162375','2201123579','2201244878','3013032183','2405109361','2201128103','7202000537','2201087378','1403003367','6007005684','8201017537','2201134226','8006007236','8601012650','2201160372','3009029336'

alter table candidates add column post_pref_original character varying;

update candidates set post_pref_original=post_pref;

-------BRO POST only for Male----------

select DISTINCT GENDER,COUNT(*)from candidates where post_pref_ORIGINAL like '%L41%' GROUP BY GENDER;


update candidates set post_pref=replace(post_pref,'L41,','') WHERE post_pref like '%L41%' and GENDER='1';---1563
update candidates set post_pref=replace(post_pref,',L41','') WHERE post_pref like '%L41%' and GENDER='1';

alter table vacancy_table add column current integer;
update vacancy_table set current=initial;

----MEA 16 vacancy cancelled-----

update vacancy_table set current='0',initial='0' where department_code='L19';

select sum(initial) from vacancy_table where category_code in ('1','2','0','6','9');---3421
select sum(initial) from vacancy_table where category_code not in ('1','2','0','6','9');---456


dob_flag 

Row Labels	Count of registrationNo
9	28120
10	132
11	19
12	7
99	197
01	2001
02	1408
03	243
04	212
05	73
06	2493
08	4
09	11
Grand Total	34920

catsel_dob

Row Labels	Count of registrationNo
1	1525
2	474
3	2493
4	3
5	3
6	1407
7	3
8	2
9	28761
(blank)	249
Grand Total	34920



cutoff_ldc

Row Labels	Count of registrationNo
0	1818
1	3274
2	1512
3	868
4	278
5	178
6	1316
7	148
8	101
9	3738
14	8
17	5
24	7
27	4
35	1
38	2
64	4
90	2207
91	776
92	122
93	4
94	16
96	5691
97	6
98	2
904	2
907	2
913	1
914	2
917	1
918	1
924	6
927	2
964	14
965	2
967	12
968	2
04	1
05	2
07	1
(blank)	12783
Grand Total	34920


cutoff_deo
Row Labels	Count of registrationNo
0	15
1	195
2	39
3	76
4	9
6	28
9	330
14	2
90	147
91	27
92	8
93	1
96	377
964	1
(blank)	33665
Grand Total	34920

catsel_ldc

Row Labels	Count of registrationNo
0	1818
1	3433
2	1522
3	814
4	278
5	178
6	2126
7	148
8	101
9	3738
14	8
17	5
24	8
27	4
35	1
38	2
64	4
65	1
90	2207
91	617
92	112
93	4
94	16
96	4881
97	6
98	2
904	2
907	2
913	1
914	2
917	1
918	1
924	5
927	2
964	14
965	1
967	12
968	2
04	1
05	2
07	1
(blank)	12837
Grand Total	34920


catsel_deo
Row Labels	Count of registrationNo
0	15
1	199
2	39
3	75
4	9
6	74
9	330
14	2
90	147
91	23
92	8
93	1
96	331
964	1
(blank)	33666
Grand Total	34920
	
update candidates a
set
a.merit =b.merit,
a.cutoff_flag_ldc =b.cutoff_flag_ldc,
a.cutoff_flag_deo =b.cutoff_flag_deo,
a.exsm_yrs =b.exsm_yrs,
a.exsm_months =b.exsm_months,
a.exsm_days =b.exsm_days,
a.dob_flag =b.dob_flag,
a.catsel_dob_flag =b.catsel_dob_flag,
a.catsel_ldc =b.catsel_ldc,
a.catsel_deo =b.catsel_deo,
a.allocated_category=b.allocated_category,
a.allocated_dept=b.allocated_dept,
a.allocated_against_ur=b.allocated_against_ur
from allocated_python_new b
where a."registrationNo"=b.registrationno;	
	
	
	

'9001007527','9001000071','6006008329','6006008410','8012003352','8601028507','8009006384','8011003167','8004002988','8003004297'


'3003014877','3209001641','9001002974','1801011791','1408014711','1403001460','1010002964','8601039669'


Points to note:

