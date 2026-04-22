select distinct level,count(distinct roll_number),count(distinct reg_number) from rhq_2025_tier1_admit_card_bfr_rescheduling
Where is_active=true
group by level;



select distinct level,reg_number,count(*) from rhq_2025_tier1_admit_card_bfr_rescheduling
group by level,reg_number having count(distinct roll_number)>1 order by level;

select distinct level,roll_number,count(*) from rhq_2025_tier1_admit_card_bfr_rescheduling
group by level,roll_number having count(distinct reg_number)>1 order by level;

select distinct level,reg_number,count(*) from rhq_2025_tier1_admit_card
group by level,reg_number having count(distinct roll_number)>1 order by level;

select distinct level,roll_number,count(*) from rhq_2025_tier1_admit_card
group by level,roll_number having count(distinct reg_number)>1 order by level;

select distinct a.reg_number,a.level,a.roll_number,b.roll_number
from rhq_2025_tier1_admit_card_bfr_rescheduling a,
rhq_2025_tier1_admit_card b where
a.reg_number=b.reg_number and a.level=b.level
and a.roll_number<>b.roll_number;

psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_selectionpost2025_xiii_t1_allocation

select distinct is_active,count(*) from admit_card_data group by is_active;

"f"	19
"t"	1166552

create table admit_card_data
(
	reg_number character varying,
	roll_number character varying,
	name character varying,
	level character varying,
	region character varying,
	is_active character varying,
	remarks character varying
);



CREATE TABLE IF NOT EXISTS public."rhq2025Applications_bkp07072025"
(
    id character varying(16) COLLATE pg_catalog."default",
    "registrationNo" character varying(11) COLLATE pg_catalog."default",
    "statusId" character varying(16) COLLATE pg_catalog."default",
    "numberOfAttempts" character varying(2) COLLATE pg_catalog."default",
    "otrId" character varying(16) COLLATE pg_catalog."default",
    "advtId" character varying(100) COLLATE pg_catalog."default",
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
    nationality character varying(255) COLLATE pg_catalog."default",
    "markOfIdentification" character varying(50) COLLATE pg_catalog."default",
    "educationBoardName" character varying(500) COLLATE pg_catalog."default",
    "tenthRollNumber" character varying(16) COLLATE pg_catalog."default",
    "tenthYearOfPassing" character varying(5) COLLATE pg_catalog."default",
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
    "isEsm" boolean,
    "dojOfEsm" date,
    "dodOfEsm" date,
    "lengthOfService" character varying(30) COLLATE pg_catalog."default",
    "isCivilPost" boolean,
    "dojOfCivilPost" date,
    "isPersonalInfoAccess" boolean,
    "isCentralGovtEmp" boolean,
    "jobDetails" character varying(255) COLLATE pg_catalog."default",
    "examCentrePreferenceId1" character varying(16) COLLATE pg_catalog."default",
    "examCentrePreferenceId2" character varying(16) COLLATE pg_catalog."default",
    "examCentrePreferenceId3" character varying(16) COLLATE pg_catalog."default",
    "isBenchmarkDisabilityVh" boolean,
    "isBenchmarkDisabilityCPBA" boolean,
    "isPhysicalLimitToWrite" boolean,
    "VHCertificate" character varying(500) COLLATE pg_catalog."default",
    "OHCertificate" character varying(500) COLLATE pg_catalog."default",
    "phyLmtCertificate" character varying(500) COLLATE pg_catalog."default",
    "isScribe" boolean,
    "isOwnScribe" boolean,
    "scribeMedium" character varying(20) COLLATE pg_catalog."default",
    "postRegion" character varying(16) COLLATE pg_catalog."default",
    "postCode" character varying(16) COLLATE pg_catalog."default",
    "postName" character varying(300) COLLATE pg_catalog."default",
    "postId" character varying(300) COLLATE pg_catalog."default",
    "postLevel" character varying(300) COLLATE pg_catalog."default",
    "highestEducationalQualificationId" character varying(16) COLLATE pg_catalog."default",
    "otherQualification" character varying(500) COLLATE pg_catalog."default",
    "postRelatedToUserConfirmation" boolean,
    "isEqForPost" boolean,
    "isWorkExpRequired" character varying(16) COLLATE pg_catalog."default",
    "isAgeRelaxation" boolean,
    "ageRelaxationId" character varying(16) COLLATE pg_catalog."default",
    "isSkillTestRequired" boolean,
    "skillTestMedium" character varying(16) COLLATE pg_catalog."default",
    "regionCode" character varying(5) COLLATE pg_catalog."default",
    "isFaceRDAuthenticated" boolean,
    "candidateConsent" boolean,
    "isAdditionalKycDone" boolean,
    "photoName" character varying(255) COLLATE pg_catalog."default",
    "photoPath" character varying(255) COLLATE pg_catalog."default",
    "signName" character varying(255) COLLATE pg_catalog."default",
    "signPath" character varying(255) COLLATE pg_catalog."default",
    "isPhotoDeclare" boolean,
    "isDeclaration" boolean,
    "photoSource" character varying(30) COLLATE pg_catalog."default",
    "applicationSource" character varying(30) COLLATE pg_catalog."default",
    "preferredDeptCodeList" character varying(800)[] COLLATE pg_catalog."default",
    "applicationRollNum" character varying(16) COLLATE pg_catalog."default",
    "preferrenceDeclaration" boolean,
    "isActive" boolean,
    "createdById" character varying(16) COLLATE pg_catalog."default",
    "createdByRoleId" character varying(16) COLLATE pg_catalog."default",
    "updatedById" character varying(16) COLLATE pg_catalog."default",
    "ipAddress" character varying(50) COLLATE pg_catalog."default",
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "isAadharVerified" boolean,
    "applicationInitiationSource" character varying(30) COLLATE pg_catalog."default",
    "isRejected" boolean,
    description character varying(500) COLLATE pg_catalog."default",
    row_number integer,
    "centreName1" character varying COLLATE pg_catalog."default",
    "centreName2" character varying COLLATE pg_catalog."default",
    "centreName3" character varying COLLATE pg_catalog."default",
    regionid1 character varying COLLATE pg_catalog."default",
    regionid2 character varying COLLATE pg_catalog."default",
    regionid3 character varying COLLATE pg_catalog."default",
    region1 character varying COLLATE pg_catalog."default",
    region2 character varying COLLATE pg_catalog."default",
    region3 character varying COLLATE pg_catalog."default",
    key character varying COLLATE pg_catalog."default",
    flag_d character varying COLLATE pg_catalog."default",
    arc_code character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

CREATE TABLE EDP_MARKS
(ExamID character varying,
 RollNO	character varying,
 Name character varying,
 ExamName character varying,
 TestDate character varying,
 Shift character varying,
 DATE_SHIFT character varying,
 centreName	character varying,
 TotalCorrect numeric,
 TotalWrong numeric,
 Total_Bonus numeric,
 TotalQuestions	numeric,
 MaximunMarks numeric,
 TotalAttempted	numeric,
 Reasoning_Bonus numeric,
 Reasoning_Score numeric,
 GA_Bonus numeric,
 GA_Score numeric,
 Quantitative_Bonus numeric,
 Quantitative_Score numeric,
 English_Bonus numeric,
 English_Score numeric,
 unique_rawscore_generation_id character varying,
 Score	numeric,
 Percentile numeric,
 Score_S1	numeric,
 Score_S2 numeric,
 Score_S3 numeric,
 Score_S4 numeric,
 Score_S5 numeric,
 Score_S6 numeric,
 Score_S7 numeric,
 Score_S8	numeric,
  Score_S9	numeric,
  Score_S10	numeric,
  Score_S11	numeric,
 Normalised_Score numeric,
 level_of_exam character varying
);



Alter table EDP_MARKS add constraint pk_roll primary key (rollno,level_of_exam);

alter table EDP_MARKS add column key1 character varying;

update EDP_MARKS 
set key1=rollno||level_of_exam;

SELECT count(*) from "rhq2025Applications_bkp07072025" limit 10;---2940177
select count(*) from  "rhq2025WorkExperiences" limit 10;--111932


select distinct level,roll_number,count(*) from admit_card_data
group by level,roll_number having count(distinct reg_number)>1 order by level;--no

alter table admit_card_data add column key1 character varying;

update admit_card_data 
set key1=roll_number||level;

---copy regno from admit card table to marks table on the basis of key1 (rollno||level)

alter table edp_marks add column reg_number character varying;

update edp_marks a
set a. reg_number=b.reg_number
from admit_card_data b
where a.key1=b.key1;---524454 updates

select count(*) from edp_marks where reg_number is null;----0

select distinct a.is_active,count(*) from
admit_card_data a,
edp_marks b where  a.key1=b.key1
group by a.is_active;---4 false candidates

select distinct level_of_exam,rollno,count(*) from edp_marks
group by level_of_exam,rollno having count(distinct reg_number)>1 order by level_of_exam;--no candidate found

select distinct reg_number,level_of_exam,count(*) from edp_marks
group by reg_number,level_of_exam having count(distinct rollno)>1 order by level_of_exam;--no candidate found

----conclusion ---no candidate has appear twice on same level of exam 


alter table edp_marks add column key2 character varying;

update edp_marks 
set key2=reg_number||level_of_exam;----524454

select count(*) from edp_marks where key2 is null;---0


-----------candidate table preparation-------------------

alter table rhq2025Applications add constraint pk_rp primary key (key);

create index idx_1 on rhq2025Applications ("registrationNo","postCode");


select distinct "statusId",count(*) from "rhq2025Applications_bkp07072025" group by "statusId";
"01"	2939401
"04"	776

create table rhq2025Applications as (select * from "rhq2025Applications_bkp07072025" where "statusId"='01');

select distinct "statusId","isActive",count(*) from rhq2025Applications  group by "statusId","isActive" limit 10;
"01"	true	2939401

select distinct "postLevel",count(*) from rhq2025Applications group by "postLevel";
"Graduation & Above"		1021850
"Higher Secondary (10+2)"	708219
"Matriculation (10th)"		1209332

alter table rhq2025Applications add column level_of_exam character varying;

update rhq2025Applications
set level_of_exam= case
when "postLevel"='Graduation & Above' then 'GRADUATE'
when "postLevel"='Higher Secondary (10+2)' then 'HS'
when "postLevel"='Matriculation (10th)' then 'MATRIC'
END;----2939401 updates

select distinct "postLevel",level_of_exam,count(*) from rhq2025Applications group by "postLevel",level_of_exam;
"Graduation & Above"	"GRADUATE"	1021850
"Higher Secondary (10+2)"	"HS"	708219
"Matriculation (10th)"	"MATRIC"	1209332

create index idx_2 on rhq2025Applications ("registrationNo",level_of_exam);

alter table rhq2025Applications add column key2 character varying;

update rhq2025Applications 
set 
key2="registrationNo"||level_of_exam;----- 2939401 updates

alter table rhq2025Applications add column roll_number character varying;
alter table rhq2025Applications add column General_Intelligence numeric;
alter table rhq2025Applications add column General_Awareness numeric;
alter table rhq2025Applications add column Quantitative_Aptitude numeric;
alter table rhq2025Applications add column English_Language numeric;
alter table rhq2025Applications add column score numeric;
alter table rhq2025Applications add column normalized_score numeric;

---------check if any key2 present in marks but not in application data ------

select distinct key2 from edp_marks
where key2 not in (select distinct key2 from rhq2025Applications);----85

"10000714096HS"
"10000757682HS"
"10000796620HS"
"10000804691MATRIC"
"10000860621HS"
"10000893501HS"
"10000977009HS"
"10001026847MATRIC"
"10001070159HS"
"10001168550HS"
"10001180450HS"
"10001243351GRADUATE"
"10001280733HS"
"10001284485HS"
"10001590623HS"
"10001637907HS"
"10002051797GRADUATE"
"10005809945HS"
"10005904444GRADUATE"
"10006582320HS"
"10006828379HS"
"10007525439GRADUATE"
"10008099997HS"
"10008308535HS"
"10008715889MATRIC"
"10008897808MATRIC"
"10008924554HS"
"10009444733HS"
"10009721134HS"
"10010062994HS"
"10010231969HS"
"10010236170MATRIC"
"10010261751HS"
"10010476750GRADUATE"
"10010581594GRADUATE"
"10010693062MATRIC"
"10010794757HS"
"10010823503MATRIC"
"10010870314GRADUATE"
"10011165155HS"
"10011409139GRADUATE"
"10011749895HS"
"10012364108MATRIC"
"10013885598HS"
"10014013697GRADUATE"
"10014527901HS"
"10014667686HS"
"10015432097MATRIC"
"10015502788HS"
"10015565851HS"
"10015877764GRADUATE"
"10015935165GRADUATE"
"10016061423MATRIC"
"10016281681MATRIC"
"10016411826GRADUATE"
"10017250565HS"
"10017559883HS"
"10017934243HS"
"10018111198HS"
"10018450709MATRIC"
"10021580296HS"
"10021626250HS"
"10021902929HS"
"10021913277HS"
"10021929196HS"
"10021937516GRADUATE"
"10021964172HS"
"10022065414HS"
"10022071853HS"
"10022119163HS"
"10022148762HS"
"10022149037MATRIC"
"10022204070MATRIC"
"10022233153HS"
"10022254465MATRIC"
"10022304593MATRIC"
"10022327996MATRIC"
"10022467472HS"
"10022554000HS"
"10023244166GRADUATE"
"10023245908MATRIC"
"10023379604MATRIC"
"10023404548HS"
"10023415513MATRIC"
"10023507670HS"

update rhq2025Applications
set 
level_of_exam='HS',
key2=replace(key2,'GRADUATE','HS')
where "postCode" in ('NW11425');---2826

update rhq2025Applications
set 
level_of_exam='HS',
key2=replace(key2,'GRADUATE','HS')
where "postCode" in ('NW10225');---31716

select distinct(substring(key2,12)) from rhq2025Applications where "postCode" in ('NW10225','NW11425') ;


SELECT DISTINCT e.key2
FROM edp_marks e
WHERE NOT EXISTS (
    SELECT 1
    FROM rhq2025Applications r
    WHERE r.key2 = e.key2
);

select distinct key2 from edp_marks
where key2 not in (select distinct key2 from rhq2025Applications) ;---85

update edp_marks a
set key2_in_app='Yes' 
from rhq2025Applications b
where a.key2=b.key2;


select * from edp_marks where key2 in ('10000019865GRADUATE','10000048098GRADUATE','10000068266GRADUATE','10000155151GRADUATE','10000786101GRADUATE','10000796620HS','10000804691MATRIC','10000832627GRADUATE','10000836686GRADUATE','10000847269GRADUATE','10000931410GRADUATE','10000953141GRADUATE','10000997596GRADUATE','10000998127GRADUATE','10001020091GRADUATE','10001026847MATRIC','10001157986GRADUATE','10001229840GRADUATE','10001243351GRADUATE','10001602133GRADUATE','10001606543GRADUATE','10001637907HS','10001683989GRADUATE','10001696959GRADUATE','10001744318GRADUATE','10001799473GRADUATE','10002051797GRADUATE','10002101832GRADUATE','10005461470GRADUATE','10005475388GRADUATE','10005632826GRADUATE','10005667221GRADUATE','10005809945HS','10005904444GRADUATE','10006116831GRADUATE','10006137658GRADUATE','10006496229GRADUATE','10006600025GRADUATE','10006786194GRADUATE','10007525439GRADUATE','10007661541GRADUATE','10008030522GRADUATE','10008046148GRADUATE','10008161466GRADUATE','10008197397GRADUATE','10008221757GRADUATE','10008295964GRADUATE','10008308535HS','10008321071GRADUATE','10008506843GRADUATE','10008673545GRADUATE','10008715889MATRIC','10008887892GRADUATE','10008897808MATRIC','10009300368GRADUATE','10009447729GRADUATE','10009483541GRADUATE','10009837861GRADUATE','10009932071GRADUATE','10010010626GRADUATE','10010012614GRADUATE','10010046979GRADUATE','10010159976GRADUATE','10010236170MATRIC','10010261751HS','10010276852GRADUATE','10010280770GRADUATE','10010411879GRADUATE','10010464960GRADUATE','10010476750GRADUATE','10010581594GRADUATE','10010693062MATRIC','10010775513GRADUATE','10010823503MATRIC','10010870314GRADUATE','10010873275GRADUATE','10010889583GRADUATE','10010896126GRADUATE','10010936743GRADUATE','10011028770GRADUATE','10011072068GRADUATE','10011076293GRADUATE','10011079696GRADUATE','10011111665GRADUATE','10011252858GRADUATE','10011257170GRADUATE','10011409139GRADUATE','10011510268GRADUATE','10011531687GRADUATE','10011749895HS','10011855964GRADUATE','10012062403GRADUATE','10012242775GRADUATE','10012354667GRADUATE','10012361650GRADUATE','10012364108MATRIC','10012411514GRADUATE','10012625455GRADUATE','10012633754GRADUATE','10012790513GRADUATE','10013690349GRADUATE','10013759546GRADUATE','10013885598HS','10014013697GRADUATE','10014185678GRADUATE','10014569479GRADUATE','10014632043GRADUATE','10014850454GRADUATE','10015199427GRADUATE','10015390733GRADUATE','10015414081GRADUATE','10015432097MATRIC','10015877764GRADUATE','10015935165GRADUATE','10015987266GRADUATE','10016038881GRADUATE','10016061423MATRIC','10016229857GRADUATE','10016281681MATRIC','10016411826GRADUATE','10016484568GRADUATE','10016848131GRADUATE','10017826809GRADUATE','10017843512GRADUATE','10018247539GRADUATE','10018450709MATRIC','10018655363GRADUATE','10018997103GRADUATE','10019002357GRADUATE','10020537644GRADUATE','10020695275GRADUATE','10021397822GRADUATE','10021468239GRADUATE','10021626250HS','10021761399GRADUATE','10021770491GRADUATE','10021937516GRADUATE','10022028445GRADUATE','10022028844GRADUATE','10022044537GRADUATE','10022065594GRADUATE','10022071853HS','10022080385GRADUATE','10022082099GRADUATE','10022094149GRADUATE','10022099025GRADUATE','10022113317GRADUATE','10022119163HS','10022126272GRADUATE','10022149037MATRIC','10022165051GRADUATE','10022184958GRADUATE','10022204070MATRIC','10022233153HS','10022254465MATRIC','10022269757GRADUATE','10022288393GRADUATE','10022303771GRADUATE','10022304593MATRIC','10022327996MATRIC','10022412047GRADUATE','10022455467GRADUATE','10022483183GRADUATE','10022494051GRADUATE','10022571157GRADUATE','10023224979GRADUATE','10023225301GRADUATE','10023244166GRADUATE','10023245908MATRIC','10023273661GRADUATE','10023286745GRADUATE','10023317399GRADUATE','10023335967GRADUATE','10023338108GRADUATE','10023368116GRADUATE','10023379604MATRIC','10023415513MATRIC','10023456790GRADUATE','10023479958GRADUATE','10023487877GRADUATE');

select * from edp_marks_new where rollno in (select roll_number from admit_card_data where level is null);


update rhq2025applications a
set
a.roll_number=b.rollno,
a.General_Intelligence=b.reasoning_score,
a.General_Awareness=b.ga_score,
a.Quantitative_Aptitude=b.quantitative_score,
a.English_Language=b.english_score,
a.score=b.score,
a.normalized_score=b.normalised_score
from edp_marks_new b where
a.key2=b.key2;---1645330 updates in 32 min

select distinct reg_number,level_of_exam,count(*) from 
edp_marks_new group by reg_number,level_of_exam having count(distinct rollno)>1;---no records


select  reg_number,level_of_exam,count(*) from 
edp_marks_new group by reg_number,level_of_exam having count(*)>1;---no records


---------------------vacancy table preparation --------------------------

create table vacancy_table as 
select region,
post_code,
post_name,
department,
age,
pay_scale,
eq_level,
gender,
'SC' as category,
'1' as category_code,
sc as original_vacancy
from vacancy_raw
union all
select region,
post_code,
post_name,
department,
age,
pay_scale,
eq_level,
gender,
'ST' as category,
'2' as category_code,
st as original_vacancy
from vacancy_raw
union all
select region,
post_code,
post_name,
department,
age,
pay_scale,
eq_level,
gender,
'OBC' as category,
'6' as category_code,
obc as original_vacancy
from vacancy_raw
union all
select region,
post_code,
post_name,
department,
age,
pay_scale,
eq_level,
gender,
'EWS' as category,
'0' as category_code,
ews as original_vacancy
from vacancy_raw
union all
select region,
post_code,
post_name,
department,
age,
pay_scale,
eq_level,
gender,
'UR' as category,
'9' as category_code,
ur as original_vacancy
from vacancy_raw
union all
select region,
post_code,
post_name,
department,
age,
pay_scale,
eq_level,
gender,
'ESM' as category,
'3' as category_code,
esm as original_vacancy
from vacancy_raw
union all
select region,
post_code,
post_name,
department,
age,
pay_scale,
eq_level,
gender,
'OH' as category,
'4' as category_code,
oh as original_vacancy
from vacancy_raw
union all
select region,
post_code,
post_name,
department,
age,
pay_scale,
eq_level,
gender,
'HH' as category,
'5' as category_code,
hh as original_vacancy
from vacancy_raw
union all
select region,
post_code,
post_name,
department,
age,
pay_scale,
eq_level,
gender,
'VH' as category,
'7' as category_code,
vh as original_vacancy
from vacancy_raw
union all
select region,
post_code,
post_name,
department,
age,
pay_scale,
eq_level,
gender,
'Others' as category,
'8' as category_code,
others as original_vacancy
from vacancy_raw;

select distinct category,category_code,sum(original_vacancy) from vacancy_table group by category,category_code;

alter table vacancy_table add constraint pk_vac primary key (post_code,category_code,eq_level);

alter table vacancy_table add column initial integer;
alter table vacancy_table add column current integer;

update vacancy_table set initial=original_vacancy;

select * from vacancy_table where original_vacancy=0 and category_code in ('3','4','5','7','8');---1668
select * from vacancy_table where original_vacancy<>0 and category_code in ('3','4','5','7','8');---117

update vacancy_table set initial=999 where original_vacancy<>0 and category_code in ('3','4','5','7','8');---117

select * from vacancy_table where original_vacancy=0 and category_code in ('1','2','6','9','0');---1025
select * from vacancy_table where original_vacancy<>0 and category_code in ('1','2','6','9','0');---760

select * from vacancy_table where original_vacancy<=5 and category_code in ('1','2','6','9','0');---1668

update vacancy_table set initial=original_vacancy*30 where original_vacancy<=5 and category_code in ('1','2','6','9','0');---1668

select * from vacancy_table where original_vacancy>5 and category_code in ('1','2','6','9','0');---97

update vacancy_table set initial=original_vacancy*15 where original_vacancy>5 and category_code in ('1','2','6','9','0');---97


select sum(original_vacancy),sum(initial) from vacancy_table where original_vacancy=0;---0,0

update vacancy_table set current=initial;

select sum(original_vacancy),sum(initial),sum(current) from vacancy_table;----2604,170103,170103

-----Group B (Non Gazetted)--------------------1550 updates

update vacancy_table set
post_group='Group B (Non Gazetted)'
where post_code in ('ER12525','NR19925','WR13225','WR13425','NR10125','SR10325','NR18925','ER11025','NR15825','NR14225','ER10925','ER17025','WR10425','NR14325','ER16325','ER11625','NR12225','NR20125','NR15725','NR15625','WR13325','ER13325','NR16425','ER15425','SR10925','SR13925','CR10625','ER13425','ER14625','SR12225','NR15025','NR14825','MP11625','KK11225','NE11325','KK11725','NR21025','NR21225','CR10325','MP13025','CR13325','MP12525','NW12325','NW12525','SR12525','CR10825','SR13525','NR16325','WR10325','ER10425','SR12625','CR10425','WR11325','ER17125','WR10625','NR17025','NR19825','NR16725','ER14525','WR13025','NR18825','NR12025','ER16925','SR10425','WR12425','ER11725','SR10525','CR11125','NR11525','ER10525','SR11025','ER17325','ER13825','NR11825','ER11325','SR10225','WR10525','NR16525','WR10125','NR14425','SR12425','SR12725','SR13625','ER13925','WR12825','WR14325','WR12925','NR20425','ER11425','NR17125','NR17925','NR11925','WR13125','NR12125','NR14525','NR15925','CR11525','ER13225','WR14025','KK11025','KK10725','NW10625','KK11825','NE11225','NW11925','NE11625','MP13225','KK10425','KK12525','KK10125','MP10225','NW10125','KK11625','MP10825','MP10725','NW11525','MP11025','NE11825','NE11525','MP11225','KK10325','NR20725','NR21325','NW12125','MP12025','KK12825','KK12925','KK12625','KK13125','KK12725','MP11825','CR12125','MP13125','CR12225','CR12325','CR12425','CR12525','CR12625','CR12725','CR12925','CR13025','CR13425','MP12725','MP12825','MP12925','KK11425','MP12125','CR12825','MP12625','NW12725','NW12925','CR11925','NW12825','SR12025','WR13825');


----------Group C (Non Technical)------------------1860

update vacancy_table set
post_group='Group C (Non Technical)'
where post_code in ('ER14425','WR15025','WR15125','ER14025','NR16825','ER12925','NR17425','ER11125','NR16625','CR10525','SR11325','NR17725','SR11125','SR11425','NR20225','NR14625','SR13425','SR11625','NR11325','ER16025','SR10825','WR11925','CR10925','ER11225','WR13625','SR12825','WR12325','WR11825','NR20325','NR14925','ER13025','SR14025','ER15525','ER12625','NR17625','SR10625','WR12025','CR11625','CR10225','WR11025','SR12125','NR17825','ER13625','NR11225','WR11125','SR13125','ER15025','SR11525','ER10225','ER14225','ER14725','SR12925','SR10725','ER10625','ER12325','SR13025','ER12725','NR16925','ER16225','ER15725','CR10125','MP10525','NW11425','KK10525','NW10225','NW10725','NE11125','NE10625','KK12225','NE11925','NW11725','MP11425','CR11725','NE12125','NR20825','NE11425','WR11525','WR12125','CR11025','CR11325','ER15125','MP11125','NW12225','SR13325','WR13925','WR11625','SR13225','ER11925','NR20025','ER13525','ER15225','ER11525','NR15225','ER14825','NR11425','ER17225','WR13525','WR14125','ER10325','NR19725','SR13825','NR17525','ER14925','SR12325','ER11825','ER12425','ER12225','NR18025','WR12625','WR13725','ER10825','WR12525','ER13725','WR10925','WR12225','WR11225','ER15325','SR11225','ER12025','WR10225','SR11725','ER16125','ER14325','NR15125','ER15925','NW10425','SR13725','ER13125','NR11725','NR11625','ER15825','NR11125','NW10925','NR17225','ER15625','ER12125','NR18625','WR12725','WR10825','WR11425','SR11925','ER10125','ER12825','CR10725','ER14125','KK11325','KK11925','NE12025','NW11625','NE10125','MP10125','NE10325','NW10325','NW10525','NW11325','KK11125','NE10925','MP11725','NW11025','NW11225','KK11525','NW12625','MP10625','KK12125','NE10225','NE11725','NE10825','MP10425','KK12425','KK10925','MP11525','KK12025','NE11025','NE10425','KK10625','NW12025','CR11825','CR12025','MP11925','KK12325','NR14725','NW11125','CR11425','CR11225','KK13025','KK13225','KK10825','CR13125','CR13225','MP12425','NW12425');

-----------Group C (Technical) -------------------160

update vacancy_table set
post_group='Group C (Technical)'
where post_code in ('NR16025','WR14425','NR16125','WR14925','KK10225','WR11725','WR14225','WR14525','WR14725','NR18725','WR14625','WR14825','WR10725','MP12225','MP12325','CR13525');

---------------------work experience ---------------------------

alter table rhq2025applications add column "organisationName" character varying;
alter table rhq2025applications add column "designation" character varying;
alter table rhq2025applications add column "natureOfDuty" character varying;
alter table rhq2025applications add column "servicePeriodFrom" date;
alter table rhq2025applications add column "servicePeriodUpto" date;

update rhq2025applications a
set a."organisationName"=b."organisationName",
a.designation=b.designation,
a."natureOfDuty"=b."natureOfDuty",
a."servicePeriodFrom"=b."servicePeriodFrom",
a."servicePeriodUpto"=b."servicePeriodTo"
from "rhq2025WorkExperiences" b
where 
a.id=b."applicationId" and
a."postId"=b."postId";----78563 updates in 14 min


------------------------------------------------------------------------------------------

Details of Post Categories which have been cancelled.----->WR12025,NR17525,NR17625,NR17725,NR17825,

NE10525*(merged with NW11125),

NE10725*(merged with NR14725),

MP11325*(merged with NR14725),

Alter table rhq2025applications add column post_code character varying;

update rhq2025applications
set post_code="postCode";

update rhq2025applications
set post_code='NW11125'
where "postCode"='NE10525';---560

update rhq2025applications
set post_code='NR14725'
where "postCode"='NE10725';---417

update rhq2025applications
set post_code='NR14725'
where "postCode"='MP11325';---334


create table candidates as (select * from rhq2025applications where roll_number is not null);----1645330

alter table candidates add column cat1 character varying;
alter table candidates add column cat2 character varying;
alter table candidates add column cat3 character varying;
alter table candidates add column exs_reservation character varying;
alter table candidates add column debarred character varying;

select distinct category,count(*) from candidates group by category;

update candidates
set cat1= case
when category='SC' then '1'
when category='ST' then '2'
when category='OBC' then '6'
when category='EWS' then '0'
when category='UR' then '9'
END;

select distinct category,cat1,count(*) from candidates group by category,cat1;

select distinct "isPwbd","typeOfPwbd",count(*) from candidates group by "isPwbd", "typeOfPwbd";

update candidates
set cat3= case
when "typeOfPwbd"='OH' then '4'
when "typeOfPwbd"='HH' then '5'
when "typeOfPwbd"='VH' then '7'
when "typeOfPwbd"='Others' then '8'
END;

select distinct  "isPwbd","typeOfPwbd",cat3,count(*) from candidates group by  "isPwbd","typeOfPwbd",cat3;

update candidates set cat2='3' where "isEsm"=true;----9005

update candidates set gender='1' where gender='Female';---679033
update candidates set gender='2' where gender='Male';---966294
update candidates set gender='3' where gender='Transgender';---3

alter table candidates add column cand_name character varying;

update candidates set cand_name=name;
update candidates set cand_name="newName" where "newName" is not null;---4377


select "registrationNo","postCode",name,"newName",cand_name from candidates where "registrationNo" in ('10023413821','10022308711','10018189704','10020153044','10001310289');

update candidates set cand_name=name where "registrationNo" in ('10023413821','10022308711','10018189704','10020153044','10001310289');

-------------------------DEBARRED CHECKING -------------------------------------

Create table debarreds
(
	id character varying,
	regionId character varying,
	registrationNumber character varying,
	name character varying,
	fatherName character varying,
	motherName	character varying,
	dob	date,
	genderId character varying,
	categoryId	character varying,
	educationBoardId character varying,
	matriculationRollNumber character varying,
	matriculationPassYear character varying,
	examId character varying,
	examYear character varying,
	rollNumber character varying,
	debarredFrom date,
	debarredUpto date,
	reason	character varying,
	otherReason character varying,
	externalCandidate character varying,
	remarksForExternal character varying,
	externalInstitutionId character varying,
	letterNumber character varying,
	letterDate character varying,
	ipAddress	character varying,
	createdById character varying,
	updatedById character varying,
	isActive	boolean,
	createdAt character varying,
	updatedAt character varying,
	remarks_final character varying
);


------cand+mother+father+dob----------

update candidates
set debarred='Yes' where 
"registrationNo" in ('10010440946','10005691263','10015567024','10000779598','10005683109','10013636339','10011037160','10001835101','10005853594','10001025159','10017153646','10000039775');


select a.debarred,a."registrationNo",a.roll_number,a.name,b.name as d_name,a."fathersName",b.fatherName as d_father_name,a."mothersName",b.motherName as d_mother_name,a.dob,b.dob as d_dob,a.gender,a.cat1,
b.regionId,b.examId,b.examYear,b.rollNumber,b.debarredFrom,b.debarredUpto,b.reason,b.otherReason,b.createdAt,b.updatedAt
from candidates a,debarreds b where 
b.debarredUpto >'2025-01-01' and
b.isActive=true and

--replace((UPPER(a.name)||UPPER(a."fathersName")||UPPER(a."mothersName")),' ','') = replace((UPPER(b.name)||UPPER(b.fatherName)||UPPER(b.motherName)),' ','')
--and a.dob=b.dob;
 
--replace ((UPPER(b.name)||UPPER(b.motherName)),' ','') = replace ((UPPER(a.name)||UPPER(a."mothersName")),' ','') and a.dob = b.dob;
 
replace ((UPPER(b.name)||UPPER(b.fatherName)),' ','') = replace ((UPPER(a.name)||UPPER(a."fathersName")),' ','') and a.dob = b.dob;

--------------------------------------------------------------------------------------------------------------------

alter table candidates add column agerelax_code character varying;

update candidates set agerelax_code=arc_code;

select distinct "isCentralGovtEmp",count(*) from candidates where arc_code in ('10','11','12','13') group by "isCentralGovtEmp";---
false	1710
true	3835


select "registrationNo" from candidates group by "registrationNo" having count(distinct cat1)>1;


--------pwbd true but code missing-----------

select * from rhq2025applications where "registrationNo"='10010475829';
select * from rhq2025applications where "registrationNo"='10001012128';
select * from rhq2025applications where "registrationNo"='10012869725';


-------ARC CORRECTION------------

select * from candidates where arc_code='01' and cat1='9';
select "registrationNo",gender,cat1,"postCode","isCentralGovtEmp",arc_code,agerelax_code from candidates where "registrationNo" in ('10014369458','10013826133');

select * from candidates where agerelax_code in ('10','11') and "isCentralGovtEmp"=false;---10000675203


select distinct post_group,age from vacancy_table order by post_group,age;

group B---"18-25","18-27","18-28","18-30","23-28"
group C---"18-25","18-27","18-30","20-25","21-25","21-28"

select sum(initial) from vacancy_table where post_group ='Group B (Non Gazetted)' and category_code='3';---0

select distinct "isCivilPost",count(*) from candidates where cat2='3' group by "isCivilPost";

update candidates set exs_reservation='Yes' where cat2='3';---9005

update candidates set exs_reservation='No' where cat2='3' and "isCivilPost"=true ;---155

select distinct post_code from vacancy_table where post_code in ('CR10125','CR10225','CR10525','CR10725','CR10925','CR11025','CR11225','CR11325','CR11425','CR11625','CR11725','CR11825','CR12025','CR13125','CR13225','CR13525','ER10125','ER10225','ER10325','ER10625','ER10825','ER11125','ER11225','ER11525','ER11825','ER12025','ER12125','ER12225','ER12325','ER12625','ER12725','ER12825','ER12925','ER13025','ER13125','ER13525','ER13625','ER13725','ER14025','ER14125','ER14225','ER14325','ER14425','ER14725','ER14825','ER14925','ER15025','ER15125','ER15225','ER15525','ER15625','ER15725','ER15825','ER15925','ER16025','ER16125','ER16225','ER17225','KK10225','KK10525','KK10625','KK10825','KK10925','KK11125','KK11325','KK11525','KK11925','KK12025','KK12125','KK12225','KK12325','KK12425','KK13025','KK13225','MP10125','MP10425','MP10525','MP10625','MP11125','MP11425','MP11525','MP11725','MP12225','MP12325','MP12425','NE10125','NE10225','NE10325','NE10425','NE10625','NE10825','NE10925','NE11025','NE11125','NE11425','NE11725','NE11925','NE12025','NE12125','NR11125','NR11225','NR11325','NR11425','NR11625','NR11725','NR14625','NR14725','NR14925','NR15125','NR15225','NR16025','NR16125','NR16625','NR16825','NR16925','NR17225','NR17425','NR17525','NR17625','NR17825','NR18025','NR18625','NR18725','NR19725','NR20025','NR20225','NR20325','NR20825','NW10225','NW10325','NW10425','NW10525','NW10725','NW10925','NW11025','NW11125','NW11225','NW11325','NW11425','NW11625','NW11725','NW12025','NW12225','NW12425','NW12625','SR10625','SR10725','SR10825','SR11125','SR11225','SR11325','SR11425','SR11525','SR11625','SR11725','SR11925','SR12125','SR12625','SR12825','SR12925','SR13025','SR13125','SR13225','SR13325','SR13425','SR13725','SR13825','SR14025','WR10225','WR10725','WR10825','WR10925','WR11025','WR11125','WR11225','WR11425','WR11525','WR11625','WR11725','WR11825','WR11925','WR12025','WR12125','WR12225','WR12325','WR12525','WR12625','WR12725','WR13525','WR13625','WR13725','WR13925','WR14125','WR14225','WR14425','WR14525','WR14625','WR14725','WR14825','WR14925','WR15025','WR15125')
and post_group='Group B (Non Gazetted)';---SR12625

Select * from candidates where "postCode"='SR12625' and arc_code='11';--10006122556

select distinct cat3 from candidates;---4,5,7,8,NULL
select distinct cat2 from candidates;---3,NULL
select distinct cat1 from candidates;----1,2,6,9,0

select * from candidates where cat2='3' and agerelax_code is null;----118

update candidates set agerelax_code='06' where cat2='3' and agerelax_code is null;--118 updates

select count(*) from candidates where cat3 is not null and cat2 is null and cat1 in ('1','2') and agerelax_code is null;-----1579

update candidates set agerelax_code='05' where cat3 is not null and cat2 is null and cat1 in ('1','2') and agerelax_code is null;---1579 updates

select count(*) from candidates where cat3 is not null and cat2 is null and cat1 in ('6') and agerelax_code is null;---6617

update candidates set agerelax_code='04' where cat3 is not null and cat2 is null and cat1 in ('6') and agerelax_code is null;---6617 updates

select count(*) from candidates where cat3 is not null and cat2 is null and cat1 in ('9','0') and agerelax_code is null;---5784

update candidates set agerelax_code='03' where cat3 is not null and cat2 is null and cat1 in ('9','0') and agerelax_code is null;---5784 updates

select count(*) from candidates where cat3 is null and cat2 is null and cat1 in ('1','2') and agerelax_code is null;---327638

update candidates set agerelax_code='01' where cat3 is null and cat2 is null and cat1 in ('1','2') and agerelax_code is null;----327638 updates

select count(*) from candidates where cat3 is null and cat2 is null and cat1 in ('6') and agerelax_code is null;----422752

update candidates set agerelax_code='02' where cat3 is null and cat2 is null and cat1 in ('6') and agerelax_code is null;---422752 updates

alter table candidates add column age_limit character varying;

with cte as
(select distinct post_code,age from vacancy_table)
update candidates a
set a.age_limit= cte.age
from cte
where a.post_code=cte.post_code;----1564039

alter table candidates add column rej_prov character varying;
update candidates set rej_prov='C';


select distinct rej_prov,count(*) from candidates group by rej_prov ;


"C"	1645226
"D"	104

-------------Posts where veritical vacancy equal to horizontal vacancy----------------

select * from vacancy_table where post_code='CR11125' and category_code='9';
select * from vacancy_table where post_code='CR11925' and category_code='0';
select * from vacancy_table where post_code='KK12525' and category_code='9';
select * from vacancy_table where post_code='MP13025' and category_code='0';
select * from vacancy_table where post_code='MP13225' and category_code='6';
select * from vacancy_table where post_code='NR16125' and category_code='6';
select * from vacancy_table where post_code='NR18625' and category_code='9';
select * from vacancy_table where post_code='NR18825' and category_code='9';
select * from vacancy_table where post_code='NR19725' and category_code='9';
select * from vacancy_table where post_code='SR10925' and category_code='9';
select * from vacancy_table where post_code='WR11325' and category_code='9';
select * from vacancy_table where post_code='WR15125' and category_code='9';



---------------------candidates for result processing ------------

select "registrationNo" as regno,roll_number as rollno,cand_name as name, gender as genderid,dob,cat1,cat2,cat3,"lengthOfService" as lengthofservice, exs_reservation,agerelax_code,post_code,level_of_exam as level_of_post,age_limit,general_intelligence as parta_gi,general_awareness as partb_ga, quantitative_aptitude as partc_qa, score,normalized_score as total,key_new from candidates where rej_prov='C'

-------------POSTS MEGRED---------------------

select * from candidates t
where t.post_code in ('NE10725')
and not exists (
    select 1
    from candidates x
    where x."registrationNo" = t."registrationNo"
      and x.post_code   = 'NR14725'
); ---71
 
update candidates t
set
    post_code  = 'NR14725'
where t.post_code in ('NE10725')
and not exists (
    select 1
    from candidates x
    where x."registrationNo" = t."registrationNo"
      and x.post_code   = 'NR14725'
); ---71

select * from candidates t
where t.post_code in ('MP11325')
and not exists (
    select 1
    from candidates x
    where x."registrationNo" = t."registrationNo"
      and x.post_code   = 'NR14725'
); ---57
 
update candidates t
set
    post_code  = 'NR14725'
where t.post_code in ('MP11325')
and not exists (
    select 1
    from candidates x
    where x."registrationNo" = t."registrationNo"
      and x.post_code   = 'NR14725'
); ---57

select * from candidates t
where t.post_code in ('NE10525')
and not exists (
    select 1
    from candidates x
    where x."registrationNo" = t."registrationNo"
      and x.post_code   = 'NW11125'
); ---131
 
update candidates t
set
    post_code  = 'NW11125'
where t.post_code in ('NE10525')
and not exists (
    select 1
    from candidates x
    where x."registrationNo" = t."registrationNo"
      and x.post_code   = 'NW11125'
); ---131


update candidates
set rej_prov='R' where roll_number in ('4206303354','4410302645');

select * from candidates where cat2='3' and level_of_exam='GRADUATE' limit 10;


v2x3y4z5a6b7c8d

------------ESM for GRADUATION---------------------------------------

select distinct "isEqForPost" from candidates where cat2='3' and level_of_exam='GRADUATE' limit 10;---true

select distinct "highestEducationalQualificationId" from candidates where cat2='3' and level_of_exam='GRADUATE' limit 10;
"u4w5x6y7z8a9b0c"
"v2x3y4z5a6b7c8d"
"y6a7b8c9d0e1f2g"

alter table candidates add column key_new character varying;

select distinct post_code,count(*) from candidates where age_limit is null group by post_code;

"NR17525"	266
"NR17625"	23213
"NR17725"	306
"NR17825"	670
"WR12025"	56836

update candidates
set
key_new="registrationNo"||post_code;----1645330 updates in 9 min

select distinct key_new,count(*) from candidates group by key_new having count(*)>1;----no records found


select count(*) from candidates where normalized_score is not null and age_limit is not null and rej_prov in ('C') ;-----1563558


do
$$
begin

alter table python_result add column cutoff_flag character varying;
alter table python_result add column exsm_yrs character varying;
alter table python_result add column exsm_months character varying;
alter table python_result add column exsm_days character varying;
alter table python_result add column dob_flag character varying;
alter table python_result add column catsel_dob_flag character varying;
alter table python_result add column catsel character varying;
alter table python_result add column allocated_category character varying;
alter table python_result add column allocated_post character varying;
alter table python_result add column allocated_eq character varying;
alter table python_result add column dob_flag_18_25 character varying;
alter table python_result add column dob_flag_18_30 character varying;
alter table python_result add column dob_flag_18_27 character varying;
alter table python_result add column dob_flag_18_28 character varying;
alter table python_result add column dob_flag_23_28 character varying;
alter table python_result add column dob_flag_21_25 character varying;
alter table python_result add column dob_flag_21_28 character varying;
alter table python_result add column dob_flag_20_25 character varying;
alter table python_result add column catsel_dob_flag_18_25 character varying;
alter table python_result add column catsel_dob_flag_18_30 character varying;
alter table python_result add column catsel_dob_flag_18_27 character varying;
alter table python_result add column catsel_dob_flag_18_28 character varying;
alter table python_result add column catsel_dob_flag_23_28 character varying;
alter table python_result add column catsel_dob_flag_21_25 character varying;
alter table python_result add column catsel_dob_flag_21_28 character varying;
alter table python_result add column catsel_dob_flag_20_25 character varying;
alter table python_result add column catsel_18_25 character varying;
alter table python_result add column catsel_18_30 character varying;
alter table python_result add column catsel_18_27 character varying;
alter table python_result add column catsel_18_28 character varying;
alter table python_result add column catsel_23_28 character varying;
alter table python_result add column catsel_21_25 character varying;
alter table python_result add column catsel_21_28 character varying;
alter table python_result add column catsel_20_25 character varying;

end
$$

--------------------verifications----------------------------------------

select distinct genderid from python_result where allocated_post in ('CR11225');---2 only male allocated

select distinct genderid from python_result where allocated_post in ('CR11025','ER15825','KK10925','NE11925','NW11725','SR13825','WR13525');---1 only female allocated



update candidates a
set
a.merit=b.merit,
a.cutoff_flag =b.cutoff_flag,
a.exsm_yrs =b.exsm_yrs,
a.exsm_months =b.exsm_months,
a.exsm_days =b.exsm_days,
a.dob_flag_18_25 =b.dob_flag_18_25,
a.dob_flag_18_30 =b.dob_flag_18_30,
a.dob_flag_18_27 =b.dob_flag_18_27,
a.dob_flag_18_28 =b.dob_flag_18_28,
a.dob_flag_23_28 =b.dob_flag_23_28,
a.dob_flag_21_25 =b.dob_flag_21_25,
a.dob_flag_21_28 =b.dob_flag_21_28,
a.dob_flag_20_25 =b.dob_flag_20_25,
a.catsel_dob_flag_18_25 =b.catsel_dob_flag_18_25,
a.catsel_dob_flag_18_30 =b.catsel_dob_flag_18_30,
a.catsel_dob_flag_18_27 =b.catsel_dob_flag_18_27,
a.catsel_dob_flag_18_28 =b.catsel_dob_flag_18_28,
a.catsel_dob_flag_23_28 =b.catsel_dob_flag_23_28,
a.catsel_dob_flag_21_25 =b.catsel_dob_flag_21_25,
a.catsel_dob_flag_21_28 =b.catsel_dob_flag_21_28,
a.catsel_dob_flag_20_25 =b.catsel_dob_flag_20_25,
a.catsel_18_25 =b.catsel_18_25,
a.catsel_18_30 =b.catsel_18_30,
a.catsel_18_27 =b.catsel_18_27,
a.catsel_18_28 =b.catsel_18_28,
a.catsel_23_28 =b.catsel_23_28,
a.catsel_21_25 =b.catsel_21_25,
a.catsel_21_28 =b.catsel_21_28,
a.catsel_20_25 =b.catsel_20_25,
a.allocated_category =b.allocated_category,
a.allocated_post =b.allocated_post,
a.allocated_eq =b.allocated_eq

from python_result b
where a.key_new=b.key_new;----1563558 updates in 5 min


select "registrationNo","postCode",merit,allocated_post,allocated_category,allocated_eq 
from candidates where allocated_post='WR10925'
and allocated_category in ('6','9') 
ORDER BY MERIT;

update candidates
set allocated_post=null,
allocated_category=null,
allocated_eq=null 
where allocated_post='WR10925'
and allocated_category in ('6','9') ;----90

update candidates
set 
allocated_category=null,
allocated_post=null,
allocated_eq=null
where allocated_post='MP10425';---30 updates

'CR11125','CR11925','KK12525','MP13025','MP13225','NR16125','NR18625','NR18825','NR19725','SR10925','WR11325','WR15125','WR10925'

update candidates a
set
a.merit=b.merit,
a.cutoff_flag =b.cutoff_flag,
a.exsm_yrs =b.exsm_yrs,
a.exsm_months =b.exsm_months,
a.exsm_days =b.exsm_days,
a.dob_flag_18_25 =b.dob_flag_18_25,
a.dob_flag_18_30 =b.dob_flag_18_30,
a.dob_flag_18_27 =b.dob_flag_18_27,
a.catsel_dob_flag_18_25 =b.catsel_dob_flag_18_25,
a.catsel_dob_flag_18_30 =b.catsel_dob_flag_18_30,
a.catsel_dob_flag_18_27 =b.catsel_dob_flag_18_27,
a.catsel_18_25 =b.catsel_18_25,
a.catsel_18_30 =b.catsel_18_30,
a.catsel_18_27 =b.catsel_18_27,
a.allocated_category =b.allocated_category,
a.allocated_post =b.allocated_post,
a.allocated_eq =b.allocated_eq

from python_result_27935 b
where a.key_new=b.key_new;----27395 updates in 2 mins


create table work_experience as 
(
WITH numbered AS (
    SELECT 
        "applicationId",
        "postId",
        "organisationName",
        designation,
        "natureOfDuty",
		"servicePeriodFrom",
		"servicePeriodTo",
        ROW_NUMBER() OVER (
            PARTITION BY "applicationId", "postId" 
            ORDER BY "servicePeriodFrom"  
        ) AS rn
    FROM "rhq2025WorkExperiences"
)

SELECT
    "applicationId",
    "postId",

    MAX(CASE WHEN rn = 1 THEN "organisationName" END) AS "organisationName1",
    MAX(CASE WHEN rn = 1 THEN designation END) AS designation1,
    MAX(CASE WHEN rn = 1 THEN "natureOfDuty" END) AS "natureOfDuty1",
	MAX(CASE WHEN rn = 1 THEN "servicePeriodFrom" END) AS "servicePeriodFrom1",
	MAX(CASE WHEN rn = 1 THEN "servicePeriodTo" END) AS "servicePeriodTo1",

    MAX(CASE WHEN rn = 2 THEN "organisationName" END) AS "organisationName2",
    MAX(CASE WHEN rn = 2 THEN designation END) AS designation2,
    MAX(CASE WHEN rn = 2 THEN "natureOfDuty" END) AS "natureOfDuty2",
	MAX(CASE WHEN rn = 2 THEN "servicePeriodFrom" END) AS "servicePeriodFrom2",
	MAX(CASE WHEN rn = 2 THEN "servicePeriodTo" END) AS "servicePeriodTo2",
	
	MAX(CASE WHEN rn = 3 THEN "organisationName" END) AS "organisationName3",
    MAX(CASE WHEN rn = 3 THEN designation END) AS designation3,
    MAX(CASE WHEN rn = 3 THEN "natureOfDuty" END) AS "natureOfDuty3",
	MAX(CASE WHEN rn = 3 THEN "servicePeriodFrom" END) AS "servicePeriodFrom3",
	MAX(CASE WHEN rn = 3 THEN "servicePeriodTo" END) AS "servicePeriodTo3",
	
	MAX(CASE WHEN rn = 4 THEN "organisationName" END) AS "organisationName4",
    MAX(CASE WHEN rn = 4 THEN designation END) AS designation4,
    MAX(CASE WHEN rn = 4 THEN "natureOfDuty" END) AS "natureOfDuty4",
	MAX(CASE WHEN rn = 4 THEN "servicePeriodFrom" END) AS "servicePeriodFrom4",
	MAX(CASE WHEN rn = 4 THEN "servicePeriodTo" END) AS "servicePeriodTo4",
	
	MAX(CASE WHEN rn = 5 THEN "organisationName" END) AS "organisationName5",
    MAX(CASE WHEN rn = 5 THEN designation END) AS designation5,
    MAX(CASE WHEN rn = 5 THEN "natureOfDuty" END) AS "natureOfDuty5",
	MAX(CASE WHEN rn = 5 THEN "servicePeriodFrom" END) AS "servicePeriodFrom5",
	MAX(CASE WHEN rn = 5 THEN "servicePeriodTo" END) AS "servicePeriodTo5",
	
	MAX(CASE WHEN rn = 6 THEN "organisationName" END) AS "organisationName6",
    MAX(CASE WHEN rn = 6 THEN designation END) AS designation6,
    MAX(CASE WHEN rn = 6 THEN "natureOfDuty" END) AS "natureOfDuty6",
	MAX(CASE WHEN rn = 6 THEN "servicePeriodFrom" END) AS "servicePeriodFrom6",
	MAX(CASE WHEN rn = 6 THEN "servicePeriodTo" END) AS "servicePeriodTo6",
	
	MAX(CASE WHEN rn = 7 THEN "organisationName" END) AS "organisationName7",
    MAX(CASE WHEN rn = 7 THEN designation END) AS designation7,
    MAX(CASE WHEN rn = 7 THEN "natureOfDuty" END) AS "natureOfDuty7",
	MAX(CASE WHEN rn = 7 THEN "servicePeriodFrom" END) AS "servicePeriodFrom7",
	MAX(CASE WHEN rn = 7 THEN "servicePeriodTo" END) AS "servicePeriodTo7",
	
	MAX(CASE WHEN rn = 8 THEN "organisationName" END) AS "organisationName8",
    MAX(CASE WHEN rn = 8 THEN designation END) AS designation8,
    MAX(CASE WHEN rn = 8 THEN "natureOfDuty" END) AS "natureOfDuty8",
	MAX(CASE WHEN rn = 8 THEN "servicePeriodFrom" END) AS "servicePeriodFrom8",
	MAX(CASE WHEN rn = 8 THEN "servicePeriodTo" END) AS "servicePeriodTo8",
	
	MAX(CASE WHEN rn = 9 THEN "organisationName" END) AS "organisationName9",
    MAX(CASE WHEN rn = 9 THEN designation END) AS designation9,
    MAX(CASE WHEN rn = 9 THEN "natureOfDuty" END) AS "natureOfDuty9",
	MAX(CASE WHEN rn = 9 THEN "servicePeriodFrom" END) AS "servicePeriodFrom9",
	MAX(CASE WHEN rn = 9 THEN "servicePeriodTo" END) AS "servicePeriodTo9",
	
	MAX(CASE WHEN rn = 10 THEN "organisationName" END) AS "organisationName10",
    MAX(CASE WHEN rn = 10 THEN designation END) AS designation10,
    MAX(CASE WHEN rn = 10 THEN "natureOfDuty" END) AS "natureOfDuty10",
	MAX(CASE WHEN rn = 10 THEN "servicePeriodFrom" END) AS "servicePeriodFrom10",
	MAX(CASE WHEN rn = 10 THEN "servicePeriodTo" END) AS "servicePeriodTo10"

FROM numbered
GROUP BY "applicationId", "postId"
);

do
$$
begin

alter table candidates add column "organisationName1" character varying;
alter table candidates add column designation1 character varying;
alter table candidates add column "natureOfDuty1" character varying;
alter table candidates add column "servicePeriodFrom1" date;
alter table candidates add column "servicePeriodTo1" date;

alter table candidates add column "organisationName2" character varying;
alter table candidates add column designation2 character varying;
alter table candidates add column "natureOfDuty2" character varying;
alter table candidates add column "servicePeriodFrom2" date;
alter table candidates add column "servicePeriodTo2" date;

alter table candidates add column "organisationName3" character varying;
alter table candidates add column designation3 character varying;
alter table candidates add column "natureOfDuty3" character varying;
alter table candidates add column "servicePeriodFrom3" date;
alter table candidates add column "servicePeriodTo3" date;

alter table candidates add column "organisationName4" character varying;
alter table candidates add column designation4 character varying;
alter table candidates add column "natureOfDuty4" character varying;
alter table candidates add column "servicePeriodFrom4" date;
alter table candidates add column "servicePeriodTo4" date;

alter table candidates add column "organisationName5" character varying;
alter table candidates add column designation5 character varying;
alter table candidates add column "natureOfDuty5" character varying;
alter table candidates add column "servicePeriodFrom5" date;
alter table candidates add column "servicePeriodTo5" date;

alter table candidates add column "organisationName6" character varying;
alter table candidates add column designation6 character varying;
alter table candidates add column "natureOfDuty6" character varying;
alter table candidates add column "servicePeriodFrom6" date;
alter table candidates add column "servicePeriodTo6" date;

alter table candidates add column "organisationName7" character varying;
alter table candidates add column designation7 character varying;
alter table candidates add column "natureOfDuty7" character varying;
alter table candidates add column "servicePeriodFrom7" date;
alter table candidates add column "servicePeriodTo7" date;

alter table candidates add column "organisationName8" character varying;
alter table candidates add column designation8 character varying;
alter table candidates add column "natureOfDuty8" character varying;
alter table candidates add column "servicePeriodFrom8" date;
alter table candidates add column "servicePeriodTo8" date;

alter table candidates add column "organisationName9" character varying;
alter table candidates add column designation9 character varying;
alter table candidates add column "natureOfDuty9" character varying;
alter table candidates add column "servicePeriodFrom9" date;
alter table candidates add column "servicePeriodTo9" date;

alter table candidates add column "organisationName10" character varying;
alter table candidates add column designation10 character varying;
alter table candidates add column "natureOfDuty10" character varying;
alter table candidates add column "servicePeriodFrom10" date;
alter table candidates add column "servicePeriodTo10" date;

end
$$



update candidates a
set a."organisationName1"=b."organisationName1",
a.designation1=b.designation1,
a."natureOfDuty1"=b."natureOfDuty1",
a."servicePeriodFrom1"=b."servicePeriodFrom1",
a."servicePeriodTo1"=b."servicePeriodTo1",

a."organisationName2"=b."organisationName2",
a.designation2=b.designation2,
a."natureOfDuty2"=b."natureOfDuty2",
a."servicePeriodFrom2"=b."servicePeriodFrom2",
a."servicePeriodTo2"=b."servicePeriodTo2",

a."organisationName3"=b."organisationName3",
a.designation3=b.designation3,
a."natureOfDuty3"=b."natureOfDuty3",
a."servicePeriodFrom3"=b."servicePeriodFrom3",
a."servicePeriodTo3"=b."servicePeriodTo3",

a."organisationName4"=b."organisationName4",
a.designation4=b.designation4,
a."natureOfDuty4"=b."natureOfDuty4",
a."servicePeriodFrom4"=b."servicePeriodFrom4",
a."servicePeriodTo4"=b."servicePeriodTo4",

a."organisationName5"=b."organisationName5",
a.designation5=b.designation5,
a."natureOfDuty5"=b."natureOfDuty5",
a."servicePeriodFrom5"=b."servicePeriodFrom5",
a."servicePeriodTo5"=b."servicePeriodTo5",

a."organisationName6"=b."organisationName6",
a.designation6=b.designation6,
a."natureOfDuty6"=b."natureOfDuty6",
a."servicePeriodFrom6"=b."servicePeriodFrom6",
a."servicePeriodTo6"=b."servicePeriodTo6",

a."organisationName7"=b."organisationName7",
a.designation7=b.designation7,
a."natureOfDuty7"=b."natureOfDuty7",
a."servicePeriodFrom7"=b."servicePeriodFrom7",
a."servicePeriodTo7"=b."servicePeriodTo7",

a."organisationName8"=b."organisationName8",
a.designation8=b.designation8,
a."natureOfDuty8"=b."natureOfDuty8",
a."servicePeriodFrom8"=b."servicePeriodFrom8",
a."servicePeriodTo8"=b."servicePeriodTo8",

a."organisationName9"=b."organisationName9",
a.designation9=b.designation9,
a."natureOfDuty9"=b."natureOfDuty9",
a."servicePeriodFrom9"=b."servicePeriodFrom9",
a."servicePeriodTo9"=b."servicePeriodTo9",

a."organisationName10"=b."organisationName10",
a.designation10=b.designation10,
a."natureOfDuty10"=b."natureOfDuty10",
a."servicePeriodFrom10"=b."servicePeriodFrom10",
a."servicePeriodTo10"=b."servicePeriodTo10"

from work_experience b
where 
a.id=b."applicationId" and
a."postId"=b."postId";----78563 updates in 14 min