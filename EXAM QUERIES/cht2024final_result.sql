marks data of 1942 candidates shared with us.
1736 candidates filled option form

create table cht2024p1q
(
	REGID character varying,
	ROLL character varying,
	NAME character varying,
	FATHERNAME character varying,
	MOTHERNAME character varying,
	DOB date,
	GENDER character varying,
	CAT1 character varying,
	CAT2 character varying,
	CAT3 character varying,
	AGERELAX character varying,
	AGERLXCODE character varying
)

psql -U sscpgadmin -h 10.192.97.43 -p 5432 -d ssc_db_candidate_portal
PrdSSC202402

\copy cht2024p1q from 'C:\Users\SalauddinKhan\Desktop\CHT2024RESULT\CHT2024P1Q.csv' csv header;
COPY 2146


select a.* from "jht2024Applications" a,
cht2024p1q b
where a."registrationNo"=b.regid
and a."statusId"='01' and a."isActive"=true limit 10;

with cte as
(select a.* from "jht2024Applications" a,
cht2024p1q b
where a."registrationNo"=b.regid
and a."statusId"='01' and a."isActive"=true)

select cte.id,count(*) from cte left join "jht2024WorkExperiences" b
on cte.id=b."applicationId" group by cte.id having count(*)<>1;

'1soonb6kv0n55n9', '39ephmih5xizz9i', '4iywkk13v4n5np9', '6hcy0xt1ox3ah1a', '88l91eutjxnnbec', '94e0hdz6kaegzo3', 'bq4e5pwqkfqdwqv', 'c2innemwldqa8hy', 'dbemm06mjucd02d', 'e59sjyhc7tc61mg', 'ffp91bv53vqg6c1', 'fsixw6nnh64xyjy', 'gxkvoi6ry5i6xce', 'k3upaweufbtcusw', 'mt7hd2ixssnog2i', 'r0eczvc0du9veth', 'sahno94ub4qvcyn', 'vjrf7g11hni1t12'

create table candidates_cht2024 as
(
with cte as
(select a.* from "jht2024Applications" a,
cht2024p1q b
where a."registrationNo"=b.regid
and a.id not in ('1soonb6kv0n55n9', '39ephmih5xizz9i', '4iywkk13v4n5np9', '6hcy0xt1ox3ah1a', '88l91eutjxnnbec', '94e0hdz6kaegzo3', 'bq4e5pwqkfqdwqv', 'c2innemwldqa8hy', 'dbemm06mjucd02d', 'e59sjyhc7tc61mg', 'ffp91bv53vqg6c1', 'fsixw6nnh64xyjy', 'gxkvoi6ry5i6xce', 'k3upaweufbtcusw', 'mt7hd2ixssnog2i', 'r0eczvc0du9veth', 'sahno94ub4qvcyn', 'vjrf7g11hni1t12')
and a."statusId"='01' and a."isActive"=true
)
select cte.*,b."applicationId",b."organisationName",b.department,b."typeOfEmp",b."natureOfWork",b."servicePeriodFrom",b."servicePeriodTo"
 from cte left join "jht2024WorkExperiences" b
on cte.id=b."applicationId"
);

alter table candidates_cht2024 add column "organisationName2" character varying;
alter table candidates_cht2024 add column "department2" character varying;
alter table candidates_cht2024 add column "typeOfEmp2" character varying;
alter table candidates_cht2024 add column "natureOfWork2" character varying;
alter table candidates_cht2024 add column "servicePeriodFrom2" timestamp with time zone;
alter table candidates_cht2024 add column "servicePeriodTo2" timestamp with time zone;

alter table candidates_cht2024 add column "organisationName3" character varying;
alter table candidates_cht2024 add column "department3" character varying;
alter table candidates_cht2024 add column "typeOfEmp3" character varying;
alter table candidates_cht2024 add column "natureOfWork3" character varying;
alter table candidates_cht2024 add column "servicePeriodFrom3" timestamp with time zone;
alter table candidates_cht2024 add column "servicePeriodTo3" timestamp with time zone;

alter table candidates_cht2024 add column "organisationName4" character varying;
alter table candidates_cht2024 add column "department4" character varying;
alter table candidates_cht2024 add column "typeOfEmp4" character varying;
alter table candidates_cht2024 add column "natureOfWork4" character varying;
alter table candidates_cht2024 add column "servicePeriodFrom4" timestamp with time zone;
alter table candidates_cht2024 add column "servicePeriodTo4" timestamp with time zone;

create table candidates_cht2024_new as 
(select a.*,b."applicationId" as "applicationId_edu",b."isDeemed",b."highestQualification",b."gradState",b."gradUniversity",b."gradSpecifiedUniversity",
b."gradDegree",b."gradRollNo",b."gradSubjects",b."gradfPaasingYear",b."gradExamMedium",b."gradPercentage",b."gardCgpa",b."postGradStatus",
b."postGradState",b."postGradSpecifiedUniversity",b."postGradDegree",b."postGradRollNo",b."postGradSubjects",b."postGradfPaasingYear",b."postGradExamMedium",
b."postGradPercentage",b."postGradCgpa"
from candidates_cht2024 a
left join "jht2024EducationalDetails" b
on a.id=b."applicationId"
 );
 
psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_jht2024allocation_final


CREATE TABLE IF NOT EXISTS public.candidates
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
    "isBenchmarkDisabilityVh" boolean,
    "isBenchmarkDisabilityOh" boolean,
    "isPhysicalLimitToWrite" boolean,
    "isScribe" boolean,
    "isOwnScribe" boolean,
    "scribeMedium" character varying(20) COLLATE pg_catalog."default",
    "transCourseStatus" character varying(50) COLLATE pg_catalog."default",
    "transCourseUniversity" character varying(250) COLLATE pg_catalog."default",
    "transCourseDuration" character varying(20) COLLATE pg_catalog."default",
    "transCourseRoll" character varying(100) COLLATE pg_catalog."default",
    "transCourseYearOfPassing" character varying(4) COLLATE pg_catalog."default",
    "transCoursePercentage" character varying(6) COLLATE pg_catalog."default",
    "transCourseCgpa" character varying(5) COLLATE pg_catalog."default",
    "workExpStatus" boolean,
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
    "OHCertificate" character varying(255) COLLATE pg_catalog."default",
    "phyLmtCertificate" character varying(255) COLLATE pg_catalog."default",
    "ownScribeWithdrawal2" boolean,
    "scribeRegNo2" character varying COLLATE pg_catalog."default",
    "scribeRegNo" character varying COLLATE pg_catalog."default",
    "ownScribeWithdrawal" boolean,
    "applicationId_work" character varying(16) COLLATE pg_catalog."default",
    "organisationName1" character varying(50) COLLATE pg_catalog."default",
    department1 character varying(255) COLLATE pg_catalog."default",
    "typeOfEmp1" character varying(200) COLLATE pg_catalog."default",
    "natureOfWork1" character varying(250) COLLATE pg_catalog."default",
    "servicePeriodFrom1" timestamp with time zone,
    "servicePeriodTo1" timestamp with time zone,
    "organisationName2" character varying COLLATE pg_catalog."default",
    department2 character varying COLLATE pg_catalog."default",
    "typeOfEmp2" character varying COLLATE pg_catalog."default",
    "natureOfWork2" character varying COLLATE pg_catalog."default",
    "servicePeriodFrom2" timestamp with time zone,
    "servicePeriodTo2" timestamp with time zone,
    "organisationName3" character varying COLLATE pg_catalog."default",
    department3 character varying COLLATE pg_catalog."default",
    "typeOfEmp3" character varying COLLATE pg_catalog."default",
    "natureOfWork3" character varying COLLATE pg_catalog."default",
    "servicePeriodFrom3" timestamp with time zone,
    "servicePeriodTo3" timestamp with time zone,
    "organisationName4" character varying COLLATE pg_catalog."default",
    department4 character varying COLLATE pg_catalog."default",
    "typeOfEmp4" character varying COLLATE pg_catalog."default",
    "natureOfWork4" character varying COLLATE pg_catalog."default",
    "servicePeriodFrom4" timestamp with time zone,
    "servicePeriodTo4" timestamp with time zone,
    "applicationId_edu" character varying(16) COLLATE pg_catalog."default",
    "isDeemed" boolean,
    "highestQualification" character varying(255) COLLATE pg_catalog."default",
    "gradState" character varying(255) COLLATE pg_catalog."default",
    "gradUniversity" character varying(255) COLLATE pg_catalog."default",
    "gradSpecifiedUniversity" character varying(255) COLLATE pg_catalog."default",
    "gradDegree" character varying(255) COLLATE pg_catalog."default",
    "gradRollNo" character varying(100) COLLATE pg_catalog."default",
    "gradSubjects" character varying(2000) COLLATE pg_catalog."default",
    "gradfPaasingYear" character varying(4) COLLATE pg_catalog."default",
    "gradExamMedium" character varying(50) COLLATE pg_catalog."default",
    "gradPercentage" character varying(6) COLLATE pg_catalog."default",
    "gardCgpa" character varying(5) COLLATE pg_catalog."default",
    "postGradStatus" character varying(50) COLLATE pg_catalog."default",
    "postGradState" character varying(255) COLLATE pg_catalog."default",
    "postGradSpecifiedUniversity" character varying(255) COLLATE pg_catalog."default",
    "postGradDegree" character varying(255) COLLATE pg_catalog."default",
    "postGradRollNo" character varying(100) COLLATE pg_catalog."default",
    "postGradSubjects" character varying(2000) COLLATE pg_catalog."default",
    "postGradfPaasingYear" character varying(4) COLLATE pg_catalog."default",
    "postGradExamMedium" character varying(50) COLLATE pg_catalog."default",
    "postGradPercentage" character varying(6) COLLATE pg_catalog."default",
    "postGradCgpa" character varying(5) COLLATE pg_catalog."default"
)

alter table candidates add column post_pref character varying;

update candidates a
set a.post_pref=b."preferredDeptCodeList"
from "jht2024OptionPreference" b
where a."registrationNo"=b."registrationNo";

---education/exp verification --------

select distinct "highestQualification" from candidates where post_pref is not null;----Ph.D ,Post Graduation

select distinct "postGradStatus" ,count(*) from candidates where post_pref is not null group by "postGradStatus";
"Appearing"	48
"Passed"	1688

select distinct "postGradfPaasingYear" ,count(*) from candidates where post_pref is not null 
and "postGradStatus"='Passed' group by "postGradfPaasingYear";

"2000"	1
"2004"	2
"2006"	1
"2008"	3
"2009"	1
"2010"	1
"2011"	9
"2012"	11
"2013"	8
"2014"	9
"2015"	33
"2016"	56
"2017"	91
"2018"	145
"2019"	157
"2020"	192
"2021"	260
"2022"	296
"2023"	279
"2024"	130
		3--------need to CHECK ----passing year not mentioned but marks/cgpa is mentioned
		
select * from candidates where post_pref is not null and "postGradStatus"='Passed' and "postGradfPaasingYear" is null ;---passing year not mentioned but marks/cgpa is mentioned

create table vacancy_table as
(
select 
post_code,
dept_name,
post_name,
pay_level,
color_blind,
'UR' as category,
'9' as category_code,
ur as initial_vacancy
from vacancy_raw
union all
select 
post_code,
dept_name,
post_name,
pay_level,
color_blind,
'SC' as category,
'1' as category_code,
sc as initial_vacancy
from vacancy_raw
union all
select 
post_code,
dept_name,
post_name,
pay_level,
color_blind,
'ST' as category,
'2' as category_code,
st as initial_vacancy
from vacancy_raw
union all
select 
post_code,
dept_name,
post_name,
pay_level,
color_blind,
'OBC' as category,
'6' as category_code,
obc as initial_vacancy
from vacancy_raw
union all
select 
post_code,
dept_name,
post_name,
pay_level,
color_blind,
'EWS' as category,
'0' as category_code,
ews as initial_vacancy
from vacancy_raw
union all
select 
post_code,
dept_name,
post_name,
pay_level,
color_blind,
'OH' as category,
'4' as category_code,
oh as initial_vacancy
from vacancy_raw
union all
select 
post_code,
dept_name,
post_name,
pay_level,
color_blind,
'HH' as category,
'5' as category_code,
hh as initial_vacancy
from vacancy_raw
union all
select 
post_code,
dept_name,
post_name,
pay_level,
color_blind,
'VH' as category,
'7' as category_code,
vh as initial_vacancy
from vacancy_raw
union all
select 
post_code,
dept_name,
post_name,
pay_level,
color_blind,
'Pwd-Others' as category,
'8' as category_code,
other as initial_vacancy
from vacancy_raw
);


alter table candidates add column rollno character varying;
alter table candidates add column gen_hindi numeric;
alter table candidates add column gen_english numeric;
alter table candidates add column paper1 numeric;
alter table candidates add column dummy_no character varying;
alter table candidates add column paper2 numeric;
alter table candidates add column language character varying;
alter table candidates add column total numeric;	
		
update candidates a
set a.rollno =b.roll,
a.gen_hindi=b.gen_hin,
a.gen_english=b.gen_eng,
a.paper1 =b.paper1,
a.dummy_no =b.dummyno,
a.paper2 =b.paper2,
a.language =b.language
from marks_edp b
where a."registrationNo"=b.regid;---1941 updates

select distinct regid from marks_edp where regid not in (select distinct "registrationNo" from candidates);---no such

select * from candidates where rollno is not null;---1941

select * from candidates where post_pref is not null and rollno is null;---28 candidates
"10017635787"
"10017787779"
"10017852792"
"10014132900"
"10000713767"
"10017859178"
"10008998431"
"10017725507"
"10017852602"
"10013656758"
"10017892026"
"10008806295"
"10008827895"
"10014927235"
"10017902943"
"10000725406"
"10017857835"
"10017849695"
"10005746965"
"10001198963"
"10001288623"
"10001675014"
"10000003551"
"10005465502"
"10014906347"
"10015654536"
"10017899454"
"10014612599"

alter table candidates add column agerelax_code character varying;

update candidates set agerelax_code=
case
when "ageRelaxationId"='7jophluaqvneaax' then '03'
when "ageRelaxationId"='9t4aoztk2eseynm' then '02'
when "ageRelaxationId"='bvcv2dlbgbpgdmk' then '06'
when "ageRelaxationId"='fw3o7xeulvkoq1r' then '05'
when "ageRelaxationId"='gyga0bu8pg6hsqm' then '01'
when "ageRelaxationId"='jyaiky96iocvwek' then '08'
when "ageRelaxationId"='mp48tvbymh35qlh' then '09'
when "ageRelaxationId"='z0ys6a4d7yvcq61' then '04'
else null
end;

select "ageRelaxationId",agerelax_code,count(*) from candidates group by "ageRelaxationId",agerelax_code;
"gyga0bu8pg6hsqm"	"01"	299
"z0ys6a4d7yvcq61"	"04"	18
"mp48tvbymh35qlh"	"09"	1
"9t4aoztk2eseynm"	"02"	162
"bvcv2dlbgbpgdmk"	"06"	73
"7jophluaqvneaax"	"03"	23
"fw3o7xeulvkoq1r"	"05"	12
							1558
							
update candidates set cat2='3' where "isEsm"=true;--77

select distinct cat1,cat2,cat3 from candidates where agerelax_code='01' group by cat1,cat2,cat3;
select distinct cat1,cat2,cat3 from candidates where agerelax_code='02' group by cat1,cat2,cat3;
select distinct cat1,cat2,cat3 from candidates where agerelax_code='03' group by cat1,cat2,cat3;
select distinct cat1,cat2,cat3 from candidates where agerelax_code='04' group by cat1,cat2,cat3;
select distinct cat1,cat2,cat3 from candidates where agerelax_code='05' group by cat1,cat2,cat3;
select distinct cat1,cat2,cat3 from candidates where agerelax_code='06' group by cat1,cat2,cat3;
select distinct cat1,cat2,cat3 from candidates where agerelax_code='08' group by cat1,cat2,cat3;
select distinct cat1,cat2,cat3 from candidates where agerelax_code='09' group by cat1,cat2,cat3;

select distinct cat1,cat2,cat3,count(*) from candidates where agerelax_code is null group by cat1,cat2,cat3;

update candidates
set agerelax_code='05' where agerelax_code is null and cat3 in ('4','5','7','8') and cat1 in ('1','2');--2

update candidates
set agerelax_code='04' where agerelax_code is null and cat3 in ('4','5','7','8') and cat1 in ('6');--2

update candidates
set agerelax_code='03' where agerelax_code is null and cat3 in ('4','5','7','8') and cat1 in ('9','0');--13

update candidates
set agerelax_code='06' where agerelax_code is null and cat2='3' ;

update candidates
set agerelax_code='01' where agerelax_code is null and cat1 in ('1','2');

update candidates
set agerelax_code='02' where agerelax_code is null and cat1 in ('6');	

update candidates
set exs_reservation='No' where cat2='3' and "isCivilPost" =true;

update candidates set total=paper1+paper2 where rollno is not null;--1941

create table debarreds
(id	character varying,
 regionId	character varying,
 registrationNumber character varying,
 name character varying,
 fatherName character varying,
 motherName character varying,
 dob date,
 genderId character varying,
 categoryId character varying,
 educationBoardId character varying,
 matriculationRollNumber character varying,
 matriculationPassYear character varying,
 examId character varying,
 examYear character varying,
 rollNumber character varying,
 debarredFrom date,
 debarredUpto date,
 reason character varying,
 otherReason character varying					
)

