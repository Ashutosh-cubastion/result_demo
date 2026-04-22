create table sten2024tier1qualified
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
 ENG numeric,
 GA	numeric,
 GI	numeric,
 SCORE numeric,
 NORMALIZED numeric,
 CBE_MARKS numeric,
 SKILL_MED character varying,
 POST_APPLY	character varying,
 AGERLXCODE	character varying,
 WITHHELD character varying
 )

psql -U sscpgadmin -h 10.192.97.43 -p 5432 -d ssc_db_candidate_portal
\copy sten2024tier1qualified from 'C:\Users\Public\Steno2024tier1qualified.csv' csv header;
COPY 27245

create table candidates_steno2024 as
(select a.*,b.roll,b.eng,b.ga,b.gi,b.score,b.normalized,b.cbe_marks,b.skill_med,b.post_apply,b.withheld
from "steno2024Applications" a
inner join sten2024tier1qualified b
on a."registrationNo"=b.regid
and a."isActive"=true and
a."statusId"='01');

update candidates_steno2024 a
set a.agerelax_code=b."arcCode"
from "ageRelaxations" b
where a."ageRelaxationId"=b.id
and b."examName"='steno' and b."examYear"='2024';

select distinct "ageRelaxationId",agerelax_code ,count(*) from candidates_steno2024 group by "ageRelaxationId",agerelax_code;

"2gSTENO2024dh01"	"06"	354
"2gSTENO2024dh02"	"10"	252
"2gSTENO2024dh03"	"13"	6
"2gSTENO2024dh04"	"09"	18
"2gSTENO2024dh05"	"02"	1501
"2gSTENO2024dh06"	"05"	41
"2gSTENO2024dh07"	"01"	2438
"2gSTENO2024dh08"	"08"	11
"2gSTENO2024dh09"	"03"	122
"2gSTENO2024dh10"	"04"	133
"2gSTENO2024dh11"	"11"	44
"2gSTENO2024dh12"	"12"	7
							22318
	
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
    "OHCertificate" character varying(255) COLLATE pg_catalog."default",
    "phyLmtCertificate" character varying(255) COLLATE pg_catalog."default",
    "isScribe" boolean,
    "isOwnScribe" boolean,
    "scribeMedium" character varying(20) COLLATE pg_catalog."default",
    "isStenoKnowledge" boolean,
    "skillTestMedium" character varying(20) COLLATE pg_catalog."default",
    post character varying(60) COLLATE pg_catalog."default",
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
    "ownScribeWithdrawal_t1" boolean,
    "scribeRegNo_t1" character varying COLLATE pg_catalog."default",
    "scribeRegNo" character varying COLLATE pg_catalog."default",
    "ownScribeWithdrawal" boolean,
    remarks text COLLATE pg_catalog."default",
    roll character varying COLLATE pg_catalog."default",
    eng numeric,
    ga numeric,
    gi numeric,
    score numeric,
    normalized numeric,
    cbe_marks numeric,
    skill_med character varying COLLATE pg_catalog."default",
    post_apply character varying COLLATE pg_catalog."default",
    withheld character varying COLLATE pg_catalog."default",
	cbeqly_c character varying,
	cbeqly_d character varying,
    agerelax_code character varying COLLATE pg_catalog."default"
)	

psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_steno2024_allocation_final
\copy candidates from 'C:\Users\Public\candidates_steno.csv' csv header;

alter table candidates add column cat1 character varying;
alter table candidates add column cat2 character varying;
alter table candidates add column cat3 character varying;
alter table candidates add column exsm_length character varying;
alter table candidates add column exs_reservation character varying;

update candidates set cat1= 
case when category='SC' then '1'
	 when category='ST' then '2'
	 when category='OBC' then '6'
	 when category='EWS' then '0'
	 when category='UR' then '9'
END;

select distinct category,cat1,count(*) from candidates group by category,cat1;
"EWS"	"0"  4164
"OBC"	"6"  8581
"SC"	"1"  5766
"ST"	"2"  2470
"UR"	"9"  6264

update candidates set cat3= 
case when "typeOfPwbd"='OH' then '4'
	 when "typeOfPwbd"='HH' then '5'
	 when "typeOfPwbd"='VH' then '7'
	 when "typeOfPwbd"='Others' then '8'
END;

select distinct "typeOfPwbd",cat3,count(*) from candidates group by "typeOfPwbd",cat3;

"HH"		"5"		132
"OH"		"4"		423
"Others"	"8"		103
"VH"		"7"		260
					26327
					
update candidates set cat2= '3' where "isEsm"=true;---381
update candidates set exsm_length= substring("lengthOfService",1,2) where cat2= '3';	
update candidates set exs_reservation= 'Yes' where cat2= '3';

select distinct cat2,"isCivilPost",count(*) from candidates group by cat2,"isCivilPost";
"3"	false	279
"3"	true	9
"3"			93
			26864				
update candidates set exs_reservation= 'No' where cat2= '3' and "isCivilPost"=true;----9

CREATE TABLE IF NOT EXISTS public."steno2024educationaldetails"
(
    reno character varying,
	id character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "isDeemed" boolean DEFAULT false,
    "applicationId" character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "highestQualification" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "qualifyingEducation" character varying(255) COLLATE pg_catalog."default",
    status character varying(50) COLLATE pg_catalog."default",
    state character varying(255) COLLATE pg_catalog."default",
    "educationBoard" character varying(255) COLLATE pg_catalog."default",
    "specifiedEduBoard" character varying(255) COLLATE pg_catalog."default",
    "rollNo" character varying(100) COLLATE pg_catalog."default",
    percentage character varying(10) COLLATE pg_catalog."default",
    cgpa character varying(5) COLLATE pg_catalog."default",
    "passingYear" character varying(4) COLLATE pg_catalog."default",
    CONSTRAINT "steno2024educationaldetails_pkey" PRIMARY KEY (id)
)

alter table candidates add column "isDeemed" boolean;
alter table candidates add column "highestQualification" character varying;
alter table candidates add column "qualifyingEducation" character varying;
alter table candidates add column "status" character varying;
alter table candidates add column "passingYear" character varying;


update candidates a
set a."isDeemed"=b."isDeemed",
a."highestQualification"=b."highestQualification",
a."qualifyingEducation"=b."qualifyingEducation",
a."status" =b."status",
a."passingYear"=b."passingYear"
from steno2024educationaldetails b
where a."registrationNo"=b.reno;

select distinct "highestQualification" ,count(*) from candidates group by "highestQualification";
"Diploma"					122
"Graduation"				17760
"Higher Secondary (10+2)"	7110
"Ph.D"						1
"Post Graduation"			2251
							1

select * from candidates where "newName" is not null ;----73

update candidates 
set cand_name="newName"
where "newName" is not null;

select * from candidates where substring("ageAsOnDob",1,2)::int >=27 and agerelax_code is null;---793


select rollno,gender,cat1,cat2,cat3,agerelax_code from candidates where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat3 is not null and cat1 in ('9','0');---7

update candidates set agerelax_code='03',remarks='age relaxation given'  where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat3 is not null and cat1 in ('9','0');---7

select rollno,gender,cat1,cat2,cat3,agerelax_code from candidates where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat3 is not null and cat1 in ('1','2');---6

update candidates set agerelax_code='05',remarks='age relaxation given'  where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat3 is not null and cat1 in ('1','2');---6

select rollno,gender,cat1,cat2,cat3,agerelax_code from candidates where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat3 is not null and cat1 in ('6');---15

update candidates set agerelax_code='04',remarks='age relaxation given'  where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat3 is not null and cat1 in ('6');---15

select rollno,"ageAsOnDob",gender,cat1,cat2,cat3,agerelax_code,"lengthOfService" ,remarks from candidates where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat2 is not null;---2

select rollno,"ageAsOnDob",gender,cat1,cat2,cat3,agerelax_code,"lengthOfService" ,remarks from candidates where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null ;----763

select rollno,"ageAsOnDob",gender,cat1,cat2,cat3,agerelax_code,"lengthOfService" ,remarks from candidates where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat1 in ('1','2');----167

update candidates set agerelax_code='01',remarks='age relaxation given'  where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat1 in ('1','2');---167

select rollno,"ageAsOnDob",gender,cat1,cat2,cat3,agerelax_code,"lengthOfService" ,remarks from candidates where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat1 in ('6');----123

update candidates set agerelax_code='02',remarks='age relaxation given'  where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null and cat1 in ('6');---123

select distinct cat1,cat2,cat3 ,count(*) from candidates where substring("ageAsOnDob",1,2)::int >=27 
and agerelax_code is null group by cat1,cat2,cat3 ;----0,9

"0"			127
"9"			346

alter table candidates add column merit integer;
alter table candidates add column dob_flag_c character varying;
alter table candidates add column dob_flag_d character varying;
alter table candidates add column catsel_dob_c character varying;
alter table candidates add column catsel_dob_d character varying;
alter table candidates add column cut_off_c character varying;
alter table candidates add column cut_off_d character varying;
alter table candidates add column catsel_c character varying;
alter table candidates add column catsel_d character varying;


select distinct dob_flag_c,count(*) from candidates group by dob_flag_c;

"01"	622
"02"	114
"03"	51
"04"	54
"05"	19
"06"	351
"09"	4
"9"		25842
"99"	188


select distinct code from vacancy_table where medium='E';----C2,C3,C4,D13,D18,D40
select distinct code from vacancy_table where medium='H';----C4,D18


select a.debarred,a."registrationNo",a.rollno,a.name,b.name as d_name,a."fathersName",b.fatherName as d_father_name,a."mothersName",b.motherName as d_mother_name,a.dob,b.dob as d_dob,a.gender,a.cat1,
b.regionId,b.examId,b.examYear,b.rollNumber,b.debarredFrom,b.debarredUpto,b.reason,b.otherReason
from candidates a,debarreds b where 
b.debarredUpto >'2025-01-01' and

--replace((UPPER(a.name)||UPPER(a."fathersName")||UPPER(a."mothersName")),' ','') = replace((UPPER(b.name)||UPPER(b.fatherName)||UPPER(b.motherName)),' ','')
--and a.dob=b.dob;
 
--replace ((UPPER(b.name)||UPPER(b.motherName)),' ','') = replace ((UPPER(a.name)||UPPER(a."mothersName")),' ','') and a.dob = b.dob;
 
replace ((UPPER(b.name)||UPPER(b.fatherName)),' ','') = replace ((UPPER(a.name)||UPPER(a."fathersName")),' ','') and a.dob = b.dob;


update candidates 
set debarred='Yes' where rollno in ('2201057399',
'2405015253',
'2002002010',
'2201039738',
'2201054886',
'2201016640',
'2406003456',
'2201056246',
'2201056487',
'2201012064',
'2401002243');

alter table candidates add column mistake_d numeric;
alter table candidates add column medium_d character varying;
alter table candidates add column mistake_c numeric;
alter table candidates add column medium_c character varying;

update candidates a
set a.mistake_d=b.asr_per_of_error,
a.medium_d=b.asr_remarks
from skilltest_d b
where a.rollno=b.asr_rollno;---18646 updates

update candidates a
set a.mistake_c=b.asr_per_of_error,
a.medium_c=b.asr_remarks
from skilltest_c b
where a.rollno=b.asr_rollno;---6728 updates

select distinct medium_d,medium_c from candidates;
	
"Hindi"		"Hindi"
			"Hindi"
"English"	"English"
			"English"
"Hindi"	
"English"	

select * from candidates where mistake_d is null ;----8599
select * from candidates where mistake_c is null ;----20517
select * from candidates where (mistake_d is null and mistake_c is null) ;----8005

create table vacancy_table as
(
select
code,
ministry_department,
post,
medium,
pay_grade,
'UR' as category,
'9' as category_code,
ur as vacancies
from vacancy_raw
union all

select
code,
ministry_department,
post,
medium,
pay_grade,
'SC' as category,
'1' as category_code,
sc as vacancies
from vacancy_raw
union all

select
code,
ministry_department,
post,
medium,
pay_grade,
'ST' as category,
'2' as category_code,
st as vacancies
from vacancy_raw
union all

select
code,
ministry_department,
post,
medium,
pay_grade,
'OBC' as category,
'6' as category_code,
obc as vacancies
from vacancy_raw
union all

select
code,
ministry_department,
post,
medium,
pay_grade,
'EWS' as category,
'0' as category_code,
ews as vacancies
from vacancy_raw
union all

select
code,
ministry_department,
post,
medium,
pay_grade,
'ESM' as category,
'3' as category_code,
esm as vacancies
from vacancy_raw
union all

select
code,
ministry_department,
post,
medium,
pay_grade,
'OH' as category,
'4' as category_code,
oh as vacancies
from vacancy_raw
union all

select
code,
ministry_department,
post,
medium,
pay_grade,
'HH' as category,
'5' as category_code,
hh as vacancies
from vacancy_raw
union all

select
code,
ministry_department,
post,
medium,
pay_grade,
'VH' as category,
'7' as category_code,
vh as vacancies
from vacancy_raw
union all

select
code,
ministry_department,
post,
medium,
pay_grade,
'Others' as category,
'8' as category_code,
other_pwd as vacancies
from vacancy_raw

)

alter table vacancy_table add constraint pk_prim primary key (post_code,post_name,category_code,medium);

select category,sum(initial) from vacancy_table group by category;

"OBC"		493
"HH"		26
"ESM"		136
"UR"		1013
"VH"		19
"ST"		147
"SC"		270
"Others"	21
"OH"		23
"EWS"		200

---debarred by region----mail

'3001004879', '3001006329', '3001009121', '3005001019', '3005001022', '3005001275', '3005001532', '3005002100', '3005002257', '3005002595', '3005002622', '3005002629', '3005002640', '3005002705', '3005002779', '3005002856', '3005002880', '3005002942', '3005003206', '3005003410', '3005003479', '3005003558', '3005003562', '3005003615', '3005003764', '3005003847', '3005003860', '3005004093', '3005004298', '3005004322', '3005004769', '3005005195', '3005005213', '3005005295', '3009000610', '3009001042', '3009001144', '3009003561', '3009003640', '3009004697', '3009004890', '3009006618', '3011002398', '3015001916'

update candidates
set debarred='Yes',
remarks_new='Obstruct the conduct of examination/ instigate other candidates not to take the examination'
where rollno in ('3001004879', '3001006329', '3001009121', '3005001019', '3005001022', '3005001275', '3005001532', '3005002100', '3005002257', '3005002595', '3005002622', '3005002629', '3005002640', '3005002705', '3005002779', '3005002856', '3005002880', '3005002942', '3005003206', '3005003410', '3005003479', '3005003558', '3005003562', '3005003615', '3005003764', '3005003847', '3005003860', '3005004093', '3005004298', '3005004322', '3005004769', '3005005195', '3005005213', '3005005295', '3009000610', '3009001042', '3009001144', '3009003561', '3009003640', '3009004697', '3009004890', '3009006618', '3011002398', '3015001916'
);

update candidates set rej_prov='C' where (mistake_d is not null or mistake_c is not null);----19240
update candidates set rej_prov='D' where debarred='Yes';----55

create table "steno2024OptionPreference"
( id character varying,
"registrationNo" character varying,
 preferreddeptcodelist character varying,
 "isActive" character varying,
 "rollNumber" character varying
)

 \copy "steno2024OptionPreference" from 'C:\Users\SalauddinKhan\Desktop\STENO2024FINALRESULT\preference_selected_column.csv' csv header;
COPY 15595

---154 regno have more than 1 entries in post pref
'10011746015','10017803326','10016410948','10001724339','10011736732','10002178776','10001278490','10005944656','10009464445','10005464760','10000983134','10010900097','10000879338','10001035619','10001595221','10006671109','10001789412','10005700812','10000856236','10017805960','10000120676','10000077675','10000076025','10010484357','10005697926','10000911454','10001224728','10000733722','10015517195','10008930085','10009164547','10010685230','10005928578','10010842152','10000016294','10001808064','10016388513','10017816989','10001076393','10001215672','10016728026','10006592649','10017652408','10008505316','10000147216','10005777754','10016956630','10001120034','10000702111','10000816971','10006502725','10000672725','10001170429','10000030043','10017853258','10000165486','10008062384','10017827893','10001060013','10000702115','10009007727','10010845977','10016460009','10017785863','10016444871','10000157477','10006121077','10015263711','10008147103','10000141915','10000958375','10001764311','10009074068','10000059549','10006512679','10005878152','10011064989','10014469911','10015945594','10001264179','10005692012','10006417677','10005836783','10000146546','10008773930','10014217447','10017206295','10000808477','10009572946','10005926319','10016462070','10017444768','10016590810','10000048391','10010124649','10000135570','10017779689','10016816540','10011554560','10011807583','10012143575','10002109845','10001780148','10008040903','10007533898','10009100963','10014447491','10000133448','10013914325','10016548420','10009290257','10008398429','10009202141','10000951078','10000060659','10000850475','10013550454','10001082386','10000034571','10010276373','10017798370','10016403758','10013119532','10008647186','10010923303','10008506212','10008820894','10010834251','10008822773','10008898743','10013445051','10001316134','10014768130','10008994100','10014314776','10005757747','10011142182','10011125061','10001198868','10011216162','10008884551','10016652853','10001664737','10000925359','10017451551','10005863786','10011247374','10010053754','10000099967','10016709868','10001672010','10000990093','10000762924','1000009830'

update candidates a
set a.post_preference=b.preferreddeptcodelist
from "steno2024OptionPreference" b
where a."registrationNo"=b."registrationNo" and
a.rollno=b."rollNumber";----15371



update candidates set post_preference='{C9,C1,C3,C4,C5,C2,C6,C7,C8,D52,D20,D16,D10,D26,D56,D57,D42,D24,D17,D13,D14,D11,D19,D22,D27,D35,D37,D12,D15,D18,D21,D23,D28,D29,D30,D31,D32,D33,D34,D36,D38,D39,D40,D41,D43,D44,D45,D46,D47,D48,D49,D50,D51,D53,D54,D55,D25}' where "registrationNo"='10000016294';
update candidates set post_preference='{D52,D16,D10,D27,D20,D42,D19,D56,D43,D13,D26,D11,D17,D24,D34,D35,D36,D38,D40,D41,D46,D50,D53,D55,D14,D15,D18,D21,D22,D23,D25,D28,D29,D30,D31,D32,D33,D37,D39,D44,D45,D47,D48,D49,D51,D54,D57,D12,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000030043';
update candidates set post_preference='{C9,C8,C5,C2,D43,C1,C6,C7,C3,D52,D57,D18,D23,C4,D31,D46,D55,D17,D11,D16,D10,D44,D37,D42,D45,D26,D15,D12,D13,D21,D22,D29,D28,D30,D32,D33,D34,D35,D36,D39,D40,D47,D48,D49,D51,D53,D54,D56,D38,D24,D41,D20,D19,D50,D27,D14,D25}' where "registrationNo"='10000034571';
update candidates set post_preference='{C1,C9,C8,D52,D16,D10,D27,D56,D24,D26,D37,D38,D42,D43,D44,D48,D35,D36,D50,D49,D47,D55,D57,D51,D53,D54,D46,D28,D30,D11,D12,D13,D14,D15,D19,D17,D18,C4,C6,D23,D25,D45,D31,D32,D33,D34,D39,D40,C5,C7,X,X,X,X,X,X,X}' where "registrationNo"='10000048391';
update candidates set post_preference='{D10,D16,D52,D42,D27,D20,D26,D56,D19,D24,D43,D38,D35,D13,D11,D48,D55,D50,D44,C1,C4,C9,C3,C5,C7,D14,D15,D12,D21,D22,D30,D32,D36,D40,D46,D47,D49,D53,D54,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000059549';
update candidates set post_preference='{D52,D42,D27,D16,D10,D13,D20,D38,D49,D56,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000060659';
update candidates set post_preference='{D12,D43,D52,D30,D31,D56,D53,D51,D45,D44,D41,D26,D54,D48,D36,D35,D22,D10,D13,D15,D16,D17,D55,D28,D29,D50,D49,D32,D34,D47,D46,D42,D19,D20,D33,D37,D39,D18,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000076025';
update candidates set post_preference='{D52,D16,D10,D42,D56,D55,D43,D27,D49,D48,D50,D51,D44,D46,D53,D54,D57,D11,D13,D22,D21,D28,D30,D36,D37,D35,D12,D24,D26,D38,D47,D19,D15,D17,D18,D20,D23,D29,D31,D32,D33,D34,D39,D40,D45,D25,D41,D14,C1,C5,C6,C7,C8,C9,C4,C2,C3}' where "registrationNo"='10000077675';
update candidates set post_preference='{D46,D56,D57,D23,D15,D55,D18,D31,D43,D52,D10,D21,D33,D42,D16,D38,D29,D11,D12,D20,D13,D17,D22,D24,D26,D27,D28,D30,D32,D34,D35,D36,D37,D39,D40,D44,D45,D47,D48,D49,D50,D51,D53,D14,D19,D25,D41,D54,C1,C2,C3,C4,C5,C6,C7,C8,C9}' where "registrationNo"='10000099967';
update candidates set post_preference='{C4,C5,C2,D38,D22,D17,D14,D24,D11,D10,D19,D20,D57,D44,D36,D27,D23,D21,D16,D15,D12,D18,D56,D55,D53,D52,D51,D49,D48,D47,D45,D43,D41,D42,D40,D37,D34,D33,D32,D31,D29,D28,D30,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000120676';
update candidates set post_preference='{C1,C4,C9,D52,D16,D10,D42,D27,D19,D56,D43,D48,D26,D13,C8,D14,D38,D35,D11,C2,C3,C5,C6,C7,D12,D15,D17,D18,D20,D21,D22,D23,D24,D28,D29,D30,D31,D32,D33,D34,D36,D37,D39,D40,D41,D44,D45,D46,D47,D49,D50,D51,D53,D54,D55,D57,X}' where "registrationNo"='10000133448';
update candidates set post_preference='{D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,D57,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000135570';
update candidates set post_preference='{D43,D46,D52,D31,D44,D55,D16,D54,D56,D15,D29,D28,D21,D13,D32,D22,D11,D17,D23,D45,D53,D49,D48,D27,D51,D42,D40,D37,D39,D36,D35,D33,D30,D24,D20,D50,D19,D10,D12,D38,D34,D47,D18,D26,D57,C8,C9,C7,C6,C5,C4,C1,X,X,X,X,X}' where "registrationNo"='10000141915';
update candidates set post_preference='{D44,D52,D16,D57,D24,D26,D28,D31,D10,D30,D12,D38,D42,D45,D17,D48,D49,D53,D55,D56,D35,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000146546';
update candidates set post_preference='{D52,D16,D10,D20,D27,D19,D42,D56,D26,D50,D43,D25,D24,D11,D13,D28,D48,D45,D46,D37,D38,D35,D33,D22,D57,D55,D54,D53,D51,D49,D47,D41,D44,D36,D34,D32,D31,D30,D29,D23,D21,D18,D15,D12,D40,D39,D17,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000147216';
update candidates set post_preference='{D52,D57,D42,D17,D23,D55,D18,D12,D49,D40,D43,D36,D14,D16,D20,D56,D26,D37,D21,D13,D22,D51,D30,D10,D32,D54,D33,D53,D19,D45,D35,D24,D11,D46,D27,D28,D38,D44,D41,D25,D29,D34,D39,D47,D50,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000157477';
update candidates set post_preference='{C9,C8,C5,C6,C7,C1,C4,C3,C2,D57,D43,D46,D52,D23,D18,D31,D40,D11,D13,D53,D30,D55,D48,D49,D42,D56,D35,D41,D15,D26,D38,D32,D10,D16,D50,D14,D12,D17,D51,D44,D20,D19,D24,D29,D21,D22,D28,D33,D34,D37,D39,D45,D47,D27,D36,D54,D25}' where "registrationNo"='10000165486';
update candidates set post_preference='{D57,D56,D55,C1,D54,D53,D52,D51,D50,C3,C2,D49,D48,D47,D46,D45,D44,D43,D42,D41,D40,D39,D38,D37,D36,D35,D34,D33,D32,D31,D30,D29,D28,D27,D26,D25,D24,D23,D22,D21,D20,D19,D18,D17,D16,D15,D14,D13,D12,D11,D10,C9,C8,C7,C6,C5,C4}' where "registrationNo"='10000672725';
update candidates set post_preference='{D52,D42,D10,D16,D27,D43,D24,D48,D53,D54,D50,D19,D25,D11,D14,D46,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000702111';
update candidates set post_preference='{C9,C4,C5,C6,C1,C7,C8,D52,D10,D16,D20,D42,D27,D26,D24,D19,D43,D50,D11,D12,D13,D14,D15,D17,D18,D21,D22,D23,D28,D29,D30,D31,D32,D33,D35,D36,D37,D40,D34,D41,D44,D45,D46,D47,D48,D51,D53,D54,D55,D56,D57,C2,C3,D25,D39,D38,D49}' where "registrationNo"='10000702115';
update candidates set post_preference='{D52,D16,D10,D19,D27,D42,D56,D24,D26,D48,D54,D13,D14,D11,D38,D35,D12,D21,D22,D28,D37,D46,D47,D50,D51,D57,D53,D44,D41,D36,D30,D25,D55,D43,D23,D15,D17,D18,D20,D29,D31,D32,D39,D40,D33,D34,D45,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000733722';
update candidates set post_preference='{D16,D10,D43,D19,D20,D11,D12,D13,D14,D15,D17,D18,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D41,D42,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,D57,C1,C2,C3,C4,C5,C6,C7,C8,C9,D40}' where "registrationNo"='10000762924';
update candidates set post_preference='{D52,D42,D27,D10,D16,D13,D20,D38,D43,D56,D49,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000808477';
update candidates set post_preference='{D52,D16,D10,D42,D56,D27,D43,D13,D48,D37,D55,D28,D35,D49,D54,D30,D19,D51,D47,D36,D22,D26,D53,D12,D21,D44,D57,D50,D38,D24,D11,D46,D20,D33,D45,D23,D17,D29,D39,D32,D34,D15,D31,D18,D40,D25,C1,C4,C9,C8,C6,C5,C7,X,X,X,X}' where "registrationNo"='10000816971';
update candidates set post_preference='{C9,C8,C5,C4,C2,C6,C3,C7,C1,D57,D43,D52,D44,D46,D23,D18,D16,D10,D20,D27,D26,D24,D25,D42,D56,D19,D13,D50,D55,D54,D53,D48,D47,D38,D35,D30,D40,D36,D32,D21,D22,D11,D31,D15,D51,D34,D41,D28,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000850475';
update candidates set post_preference='{C1,D41,D44,C2,C3,C4,C5,C6,C7,C8,C9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D34,D35,D36,D37,D38,D39,D40,D42,D43,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,X,X,X}' where "registrationNo"='10000856236';
update candidates set post_preference='{D16,D10,C1,C9,D17,C8,C4,C2,C3,C5,C6,C7,D25,D43,D46,D44,D52,D11,D12,D13,D14,D15,D18,D19,D20,D21,D22,D23,D24,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D37,D36,D39,D38,D40,D41,D42,D45,D47,D49,D48,D50,D56,D53,D55,D57,D51,D54}' where "registrationNo"='10000879338';
update candidates set post_preference='{C4,C1,C9,D52,D19,D11,D16,D17,D10,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000911454';
update candidates set post_preference='{D16,D10,D44,D27,D42,D20,D19,D56,D40,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000925359';
update candidates set post_preference='{C1,C4,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000951078';
update candidates set post_preference='{C9,C5,C8,C2,C1,C7,C6,C3,C4,D57,D18,D17,D52,D16,D10,D23,D21,D32,D35,D45,D43,D56,D55,D28,D14,D13,D12,D11,D22,D27,D29,D30,D33,D34,D36,D39,D40,D41,D44,D49,D51,D53,D54,D46,D26,D20,D24,D19,D15,D31,D37,D38,D42,D47,D48,D50,D25}' where "registrationNo"='10000958375';
update candidates set post_preference='{D50,D51,D52,D53,D54,D55,D56,D57,C1,C2,C3,C4,C5,C6,C7,C8,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10000983134';
update candidates set post_preference='{D44,D17,D16,C9,C5,C4,D10,D43,D15,D18,D19,D23,D24,D28,D29,D26,D30,D31,D36,D38,D40,D13,D45,D47,D46,D57,D55,D53,D52,D51,D50,D54,D49,D42,D41,D32,D33,D34,D37,D22,D20,D11,D12,D14,D39,D27,D35,D48,D56,C1,C2,C3,C6,C7,C8,D25,X}' where "registrationNo"='10000990093';
update candidates set post_preference='{D20,D19,D26,D16,D10,D57,D17,D13,D38,D56,D36,D52,D27,D28,D29,D44,D43,D41,D40,D42,D11,D12,D50,D53,D54,D31,D24,D23,D18,D15,D14,D45,D46,D47,D49,D55,D48,D51,D39,D37,D35,D30,D32,D33,D34,C5,C3,C2,C1,C4,C6,C7,C8,C9,X,X,X}' where "registrationNo"='10001035619';
update candidates set post_preference='{D27,D10,D16,D56,D49,D52,D43,D40,D46,D13,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001060013';
update candidates set post_preference='{C9,C8,C7,C5,C4,C2,C1,C3,C6,D26,D57,D23,D18,D52,D43,D10,D14,D24,D55,D44,D16,D13,D20,D56,D54,D47,D36,D31,D19,D17,D38,D50,D53,D40,D41,D29,D28,D27,D33,D37,D11,D12,D15,D21,D22,D30,D32,D34,D35,D39,D42,D45,D46,D48,D49,D51,D25}' where "registrationNo"='10001076393';
update candidates set post_preference='{D16,C1,D32,D20,D48,D27,D30,D31,D51,D21,D12,D13,D52,D22,D28,D35,D40,D43,D47,D54,C2,C3,C4,C5,C6,C7,C8,C9,D11,D18,D19,D23,D24,D33,D34,D36,D37,D38,D39,D41,D42,D44,D45,D46,D49,D50,D53,D55,D56,D57,D10,D14,D15,D17,X,X,X}' where "registrationNo"='10001082386';
update candidates set post_preference='{C9,C5,C8,D57,D23,D52,D43,D18,C6,D46,D31,D15,D16,C4,C2,C3,C1,C7,D36,D44,D17,D28,D29,D56,D55,D54,D53,D49,D45,D35,D26,D22,D21,D11,D19,D24,D38,D27,D30,D33,D39,D41,D40,D48,D47,D14,D13,D12,D51,D10,D42,X,X,X,X,X,X}' where "registrationNo"='10001120034';
update candidates set post_preference='{D57,D18,D43,D52,D23,D46,D13,D55,D22,D16,D10,D20,D19,D42,D26,D24,D17,D50,D53,D54,D30,D32,D40,D11,D28,D21,D51,D56,D27,D49,D38,D36,D33,D31,D34,D35,D39,D41,D47,D48,D44,D45,D29,D12,D15,D14,D25,D37,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001170429';
update candidates set post_preference='{D21,D51,D40,D32,D28,D25,D27,D56,D55,D54,D53,D52,D50,D49,D46,D43,D42,D30,D26,D24,D20,D19,D17,D16,D13,D11,D10,D12,D14,D15,D18,D22,D23,D29,D31,D33,D34,D35,D36,D37,D38,D39,D41,D44,D45,D47,D48,D57,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001198868';
update candidates set post_preference='{C5,C9,C1,D13,D10,D16,D20,D38,D52,D56,D27,D42,D43,D49,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001215672';
update candidates set post_preference='{D55,D13,D43,D46,D56,D52,D10,D16,D27,D42,D28,D11,D17,D19,D20,D21,D24,D26,D30,D32,D40,D49,D50,D51,D53,D54,D12,D14,D15,D18,D22,D23,D29,D31,D33,D34,D35,D36,D37,D38,D39,D41,D44,D45,D47,D48,D57,D25,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001224728';
update candidates set post_preference='{D52,D43,D55,D46,D21,D49,D51,D53,D32,D40,D28,D30,D17,D18,C8,C9,D15,C5,D12,D20,D22,D23,D25,D27,D29,D31,D33,D34,D35,D36,D37,D38,D39,D41,D44,D47,D48,D56,D57,D11,D13,D16,D19,D24,D26,D42,D50,D54,C3,C2,C1,C7,C4,C6,D10,D14,D45}' where "registrationNo"='10001264179';
update candidates set post_preference='{C9,C5,C6,C8,D57,D43,D52,D23,D56,D11,D15,D13,D46,D44,D29,D31,D12,D22,D30,D32,D49,D45,D26,D38,D24,D20,D10,D42,D40,D51,D54,D16,D47,D48,D50,D53,D55,D17,D21,D27,D35,D33,D34,D28,D19,D36,D39,D18,D37,X,X,X,X,X,X,X,X}' where "registrationNo"='10001278490';
update candidates set post_preference='{D16,D52,D10,D27,D42,D20,D26,D56,D19,D43,D13,D24,D50,D11,D35,D38,D48,D55,D12,D14,D15,D21,D22,D30,D32,D36,D40,D44,D46,D47,D49,D53,D54,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001316134';
update candidates set post_preference='{D52,D16,D10,D27,D42,D56,D24,D43,D26,D48,D37,D38,D50,D13,D55,D11,D22,D30,D35,D36,D46,D47,D54,D57,D49,D19,D28,D51,D53,D21,D12,D15,D17,D18,D20,D23,D25,D29,D31,D32,D33,D34,D39,D40,D44,D45,D14,D41,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001595221';
update candidates set post_preference='{D43,D52,D46,D56,D55,D53,D50,D42,D10,D11,D13,D16,D17,D20,D24,D26,D34,D35,D38,D40,D41,D19,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001664737';
update candidates set post_preference='{D52,D56,D16,D10,D43,D42,D27,D19,D24,D14,D28,D55,D35,D48,D13,D49,D44,D51,D53,D31,D39,D40,D45,D22,D36,D57,D29,D50,D38,D46,D47,D20,D25,D11,D12,D15,D17,D18,D21,D23,D26,D30,D32,D33,D34,D37,D41,D54,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001672010';
update candidates set post_preference='{D57,C1,D48,D36,D31,D56,D55,D54,D53,D52,D51,D50,D49,C2,C3,C4,C5,C6,C7,C8,C9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D23,D24,D25,D26,D27,D28,D29,D30,D32,D33,D35,D37,D38,D40,D41,D42,D43,D44,X,X,X,X,X,X}' where "registrationNo"='10001724339';
update candidates set post_preference='{D43,D52,D18,D57,D23,D31,D46,D55,D17,D11,D16,D10,D44,D37,D42,D45,D26,D15,D12,D13,D21,D22,D29,D28,D30,D32,D33,D34,D35,D36,D39,D40,D47,D48,D49,D51,D53,D54,D56,D38,D24,D20,D19,D50,D27,D14,D41,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001764311';
update candidates set post_preference='{D57,D23,D46,D17,D20,D18,D26,D16,D13,D10,D11,D12,D14,D15,D19,D21,D22,D24,D25,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10001780148';
update candidates set post_preference='{D52,D16,D10,D20,D56,D43,D42,D26,D27,D19,D28,D38,D46,D48,D55,D57,D50,D45,D37,D35,D33,D24,D22,D11,D13,D17,D23,D53,D21,D47,D51,D54,D41,D15,D29,D32,D34,D49,D40,D39,D12,D18,D30,D31,D36,D44,C1,C4,C9,C8,C5,C2,C3,C6,C7,X,X}' where "registrationNo"='10001789412';
update candidates set post_preference='{C9,C5,C4,C6,C1,C7,C8,D57,D26,D23,D18,D31,D43,D52,D10,D16,D21,D27,D12,D42,D15,D32,D37,D38,D54,D56,D13,D24,D19,D20,D35,D39,D40,D45,D47,D48,D36,D49,D50,D44,D34,D33,D30,D29,D28,D22,D51,D53,D55,D17,D11,D25,D46,X,X,X,X}' where "registrationNo"='10001808064';
update candidates set post_preference='{C9,C8,C5,C7,C1,C6,C4,C3,C2}' where "registrationNo"='10002109845';
update candidates set post_preference='{D52,D16,D10,D27,D42,D20,D26,D56,D43,D24,D11,D13,D50,D40,D55,D28,D46,D53,D54,D17,D21,D49,D51,D30,D32,D25,D19,D48,D35,D38,D22,D37,D47,D57,D45,D33,D14,D23,D36,D41,D12,D15,D34,D44,D39,D29,D18,D31,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10002178776';
update candidates set post_preference='{D16,D10,D26,D13,D56,D22,D17,D21,D52,D12,D18,D30,D43,D57,D51,D11,D33,D46,D47,D31,D23,D20,D45,D44,D50,D19,D53,D49,D42,D38,D15,D24,D27,D28,D29,D32,D34,D35,D36,D37,D39,D40,D48,D54,D55,D25,D14,D41,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10005464760';
update candidates set post_preference='{C9,C8,C7,C5,D56,D57,D52,D46,D44,D35,D38,D24,D48,D26,D42,D43,D45,D41,D47,D49,D55,D54,D53,D40,D51,D50,D25,D39,C1,C2,C3,C4,C6,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D28,D27,D29,D31,D30,D33,D32,D34,D36,X}' where "registrationNo"='10005692012';
update candidates set post_preference='{D56,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D57,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10005697926';
update candidates set post_preference='{D23,D22,D17,D36,D43,D31,D18,D13,D57,D56,D55,D50,D10,D11,D12,D14,D16,D15,D45,D47,D46,D54,D51,D52,D53,D48,D49,D21,D40,D39,D26,D28,D29,D30,D33,D34,D35,D37,D32,D41,D42,D44,D24,D25,D27,D38,D19,D20,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10005700812';
update candidates set post_preference='{C9,C8,C5,C4,C2,C6,C3,C7,C1,D57,D52,D44,D43,D23,D18,D46,D31,D36,D54,D12,D22,D16,D49,D45,D53,D55,D28,D29,D10,D39,D30,D26,D13,D17,D19,D24,D38,D11,D56,D15,D14,D33,D20,D47,D21,D32,D41,D34,D48,D35,D37,D40,D42,D50,D51,D27,D25}' where "registrationNo"='10005777754';
update candidates set post_preference='{D16,C1,C9,D10,D43,D45,D39,D57,D36,D38,D48,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10005836783';
update candidates set post_preference='{D43,D57,D46,D52,D23,D17,D31,D18,D55,D56,D15,D44,D20,D35,D42,D11,D16,D10,D12,D19,D21,D45,D24,D26,D28,D30,D32,D33,D37,D38,D40,D49,D50,D51,D53,D54,D39,D25,D13,D22,D27,D34,D36,D47,D48,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10005863786';
update candidates set post_preference='{D50,D36,D37,D34,D39,D45,D47,D51,D35,D28,D32,D48,D14,D44,D54,D41,D30,D22,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10005878152';
update candidates set post_preference='{D52,D16,D10,D27,D42,D20,D56,D43,D26,D24,D13,D12,D11,X,D15,D17,D18,D19,D21,D22,D23,D25,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,X,D44,D45,D46,D47,D48,D49,D50,D51,D53,D54,D55,D57,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10005926319';
update candidates set post_preference='{D52,D16,D10,D42,D27,D19,D56,D24,D43,D26,D48,D13,D14,D50,D37,D38,D35,D28,D11,D46,D49,D55,D54,D51,D47,D30,D22,D36,D12,D21,D41,D44,D53,D57,D40,D39,D34,D33,D32,D31,D29,D25,D23,D20,D18,D17,D15,D45,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10005928578';
update candidates set post_preference='{C1,C4,C9,C5,C8,C3,C2,C6,C7,D52,D16,D10,D20,D27,D42,D19,D26,D56,D43,D24,D50,D55,D48,D28,D13,D11,D22,D35,D33,D37,D38,D45,D46,D17,D23,D53,D57,D21,D47,D51,D54,D41,D15,D29,D32,D39,D34,D40,D49,D12,D18,D30,D31,D36,D44,X,X}' where "registrationNo"='10005944656';
update candidates set post_preference='{D52,D16,D10,D42,D27,D19,D56,D24,D43,D26,D48,D13,D14,D50,D37,D38,D49,D46,D11,D28,D35,D55,D22,D30,D36,D47,D51,D54,D12,D21,D41,D44,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10006121077';
update candidates set post_preference='{D10,D11,D12,D13,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D26,D27,D28,D29,D30,D31,D32,D34,D35,D36,D37,D38,D39,D40,D42,D44,D45,D46,D47,D48,D49,D51,D52,D53,D54,D55,D56,D57,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10006417677';
update candidates set post_preference='{C9,C1,C4,C6,D43,D57,D52,D16,D10,D28,D44,D55,D42,D13,D36,D48,D56,D51,D49,D54,D37,D35,D30,D27,D21,D22,D19,D12,D53,D47,D38,D26,D24,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10006502725';
update candidates set post_preference='{D45,D38,D22,D43,D26,D53,D32,D39,C1,C8,C3,C4,C5,C6,C7,D10,C9,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D23,D24,D44,D27,D28,D29,D30,D31,D33,D34,D35,D36,D37,D40,D41,D42,D46,D47,D48,D49,D50,D51,D52,D54,D55,D56,D57,X,X}' where "registrationNo"='10006512679';
update candidates set post_preference='{D57,D52,D23,D31,D43,D18,D46,D17,D44,D15,D55,D36,D10,D16,D35,D14,D13,D12,D39,D40,D41,D45,D48,D49,D51,D53,D34,D32,D30,D29,D28,D22,D21,D54,D56,D27,D33,D37,D42,D11,D26,D24,D20,D19,D38,D50,D47,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10006592649';
update candidates set post_preference='{D55,D41,D18,D23,D28,D29,D15,D10,D21,D26,D17,D37,D36,D33,D31,D43,D49,D48,D47,D34,D32,D22,D27,D53,D51,D57,D54,D52,D50,D30,D35,D39,D40,D45,D42,D16,D19,D20,D14,D13,D12,D11,D38,D24,X,X,X,X}' where "registrationNo"='10006671109';
update candidates set post_preference='{D53,D50,D43,D38,C4,D18,D57,D56,D51,C1,D35,D42,D39,D26,D40,D37,C9,D31,D12,D13,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10007533898';
update candidates set post_preference='{D43,D46,D56,D57,D55,D54,D53,D52,D51,D50,D49,D48,D47,D45,D44,D41,D39,D38,D37,D36,D35,D34,D33,D32,D31,D30,D29,D28,D27,D24,D23,D22,D21,D20,D19,D18,D17,D16,D15,D14,D13,D12,D11,D10,D25,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008040903';
update candidates set post_preference='{D43,D52,D55,D42,D20,D19,D10,D16,D13,D14,D26,D27,D56,D35,D38,D48,D50,D54,D53,D49,D47,D46,D44,D40,D36,D32,D30,D21,D15,D12,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008062384';
update candidates set post_preference='{D52,D10,D16,D27,D42,D20,D26,D56,D19,D24,D11,D13,D17,D21,D25,D28,D30,D32,D40,D46,D49,D50,D51,D54,D55,D43,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008147103';
update candidates set post_preference='{D12,D10,D21,D13,D25,D16,D26,D32,D28,D42,D45,D48,D19,D20,D41,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008398429';
update candidates set post_preference='{D23,D54,D45,D31,D14,D27,D33,D36,D10,D12,D16,D18,D20,D22,D24,D26,D28,D30,D32,D34,D38,D40,D42,D44,D46,D48,D50,D51,D56,D11,D13,D15,D19,D21,D25,D29,D35,D37,D39,D41,D43,D47,D49,D53,D52,D55,D17,D57,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008505316';
update candidates set post_preference='{C1,D16,D10,D27,D42,D43,D56,D55,D28,D48,D13,D22,D35,D37,D45,D33,C6,C2,D21,D41,D49,D39,D40,D32,D29,D15,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008506212';
update candidates set post_preference='{D52,D20,D43,D13,D50,D11,D46,D21,D27,D26,D42,D56,D48,D10,D16,D24,D35,D38,D36,D44,D55,D47,D49,D53,D54,D12,D19,D32,D30,D40,D15,D22,D25,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008647186';
update candidates set post_preference='{D10,D11,D16,D17,D18,D19,D20,D57,D12,D13,D14,D15,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008773930';
update candidates set post_preference='{C1,C2,C3,C4,C5,C6,C7,C8,C9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,D57}' where "registrationNo"='10008820894';
update candidates set post_preference='{D24,D57,D12,D47,D19,D46,D26,D13,D16,D10,D56,D23,D11,D18,D14,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D39,D40,D41,D42,D43,D45,D48,D49,D50,D51,D52,D53,D55,D44,D21,D22,D27,D38,D20,D54,D17,D25,D15,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008822773';
update candidates set post_preference='{D52,D10,D16,D11,D14,D19,D42,D43,D44,D56,D12,D13,D21,D22,D24,D26,D27,D28,D30,D35,D36,D37,D38,D41,D46,D47,D48,D49,D50,D51,D53,D54,D55,D57,D15,D17,D18,D23,D31,D32,D33,D34,D40,D39,D45,D25,D29,D20,C1,C2,C3,C4,C5,C6,C7,C8,C9}' where "registrationNo"='10008884551';
update candidates set post_preference='{D52,D16,D10,D43,D56,D22,D55,D21,D24,D12,D13,D42,D33,D40,D46,D27,D49,D48,D14,D17,D18,D28,D29,D30,D32,D34,D23,D36,D31,D44,D53,D41,D35,D54,D57,D20,D19,D26,D45,D47,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008898743';
update candidates set post_preference='{D20,D24,D19,D16,D10,D43,D38,D35,D42,D27,D46,D45,D11,D26,D28,D48,D50,D13,D33,D53,D22,D21,D23,D54,D51,D39,D49,D44,D40,D36,D34,D32,D29,D30,D31,D17,D52,D15,D12,D18,D56,D55,D57,D37,D25,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008930085';
update candidates set post_preference='{D16,D10,D52,D13,D27,D42,D20,D19,D26,D43,D56,D11,D12,D14,D15,D21,D22,D24,D25,D30,D32,D35,D36,D38,D40,D44,D46,D47,D48,D49,D50,D53,D54,D55,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10008994100';
update candidates set post_preference='{C9,D43,C4,D13,D52,D45,D53,D20,D24,D26,C1,C5,C6,C7,C8,D19,D23,D28,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10009007727';
update candidates set post_preference='{D10,D11,D12,D13,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D27,D29,D28,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,D57,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10009074068';
update candidates set post_preference='{D52,D16,D10,D42,D19,D56,D24,D43,D26,D20,D55,D28,D11,D35,D38,D37,D33,D45,D53,D57,D17,D23,D54,D51,D21,D41,D49,D15,D32,D39,D40,D30,D18,D31,D44,D12,D14,D50,D25,D46,D27,D48,D22,D13,D29,D34,D36,D47,C1,C4,C9,C5,C3,C6,C2,C7,C8}' where "registrationNo"='10009100963';
update candidates set post_preference='{D57,D56,D54,D55,D51,D52,D47,D44,D36,D35,D33,D31,D29,D20,D19,D13,C9,D32,D34,D53,D50,D49,D48,D46,D45,D43,D42,D41,D40,D39,D38,D37,D30,D28,D27,D26,D25,D24,D23,D22,D21,D18,D17,D16,D15,D14,D12,D11,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10009164547';
update candidates set post_preference='{D57,D16,D17,D18,D19,D20,D23,D24,D26,D46,D44,D45,D54,D52,D51,D47,D31,D28,D29,D41,D53,D10,D11,D12,D13,D14,D15,D21,D22,D27,D30,D32,D33,D34,D35,D36,D37,D38,D39,D40,D42,D43,D48,D49,D55,D56,D50,D25,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10009202141';
update candidates set post_preference='{D57,D52,D49,D48,D46,D45,D51,D10,D11,D12,D13,D14,D15,D16,D34,D23,D22,D21,D30,D24,D25,D27,D28,D31,D55,D50,D41,D26,D56,D36,D20,D19,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10009290257';
update candidates set post_preference='{D10,D16,D27,D52,D56,D20,D26,D42,D11,D19,D13,D28,D43,D46,D49,D50,D54,D51,D55,D53,D40,D32,D30,D24,D21,D14,D57,D48,D36,D47,D45,D44,D39,D38,D37,D34,D33,D29,D15,D18,D23,D22,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10009464445';
update candidates set post_preference='{D52,D42,D16,D10,D19,D24,D27,D43,D48,D56,D57,D55,D54,D53,D51,D50,D49,D47,D46,D44,D41,D38,D37,D36,D35,D30,D28,D26,D22,D21,D14,D13,D12,D11,D15,D17,D18,D20,D23,D29,D31,D32,D33,D39,D40,D45,D25,D34,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10009572946';
update candidates set post_preference='{D57,D56,D55,D54,D53,D52,D51,D50,D49,D48,D47,D46,D45,D44,D43,D32,D42,D41,D40,D39,D38,D37,D36,D35,D34,D33,D31,D30,D29,D28,D27,D26,D25,D24,D23,D22,D21,D20,D19,D18,D17,D16,D15,D14,D13,D12,D11,D10,C9,C8,C7,C6,C5,C4,C3,C2,C1}' where "registrationNo"='10010053754';
update candidates set post_preference='{D52,D16,D10,D19,D43,D24,D44,D56,D42,D27,D26,D13,D46,D55,D48,D51,D57,D54,D53,D50,D49,D47,D41,D38,D37,D36,D35,D30,D28,D22,D21,D14,D12,D11,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10010124649';
update candidates set post_preference='{C9,C4,C1,C5,C6,C8,D10,D16,D52,D20,D19,D43,D55,D13,D56,D26,D24,D46,D36,D35,D38,D53,D34,D42,D27,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10010276373';
update candidates set post_preference='{D16,D10,D11,D12,D13,D14,D15,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D46,C1,C2,C3,C4,C5,C6,C7,C8,C9,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10010484357';
update candidates set post_preference='{D52,D10,D16,D27,D20,D42,D56,D26,D19,D24,D43,D11,D13,D17,D21,D25,D28,D30,D32,D40,D46,D49,D50,D51,D53,D54,D55,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10010685230';
update candidates set post_preference='{D16,D43,D52,D10,D42,D50,D23,D11,D27,D20,D24,D19,D38,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10010834251';
update candidates set post_preference='{C1,C4,C9,C5,C8,C6,C7,D52,D16,D10,D20,D27,D26,D56,D42,D43,D50,D11,D22,D35,D33,D21,D38,D37,D45,D46,D51,D13,D17,D47,D57,D15,D29,D32,D40,D39,D49,D54,D55,D53,X,X,X,D18,D30,D31,D36,D44,D12,D34,X,X,X,X,X,X,X}' where "registrationNo"='10010842152';
update candidates set post_preference='{D52,D10,D16,D27,D42,D20,D19,D26,D43,D24,D11,D25,D56,D40,D28,D30,D32,D48,D50,D55,D53,D51,D46,D13,D17,D33,D35,D57,D38,D45,D47,D41,D22,D36,D37,D29,D44,D21,D31,D39,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10010845977';
update candidates set post_preference='{D52,D10,D16,D27,D20,D19,D26,D56,D43,D24,D11,D28,D33,D35,D45,D46,D48,D50,D51,D53,D55,D54,D57,D12,D13,D14,D15,D17,D18,D21,D22,D23,D25,D29,D30,D31,D32,D34,D36,D37,D38,D39,D40,D41,D44,D47,D49,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10010900097';
update candidates set post_preference='{D25,D57,D55,D52,D45,D43,D41,D39,D42,D36,D34,D31,D29,D15,D28,D23,D24,D18,D19,D21,D10,D11,D56,D14,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10010923303';
update candidates set post_preference='{C1,C9,C3,C4,C5,C7,C2,C6,C8,D16,D52,D10,D42,D27,D20,D26,D43,D11,D13,D12,D14,D15,D19,D21,D22,D30,D32,D35,D36,D40,D44,D46,D48,D49,D53,D54,D55,D17,D18,D23,D28,D29,D31,D33,D34,D37,D39,D41,D45,D51,D57,D56,D24,X,X,X,X}' where "registrationNo"='10011064989';
update candidates set post_preference='{D52,D27,D16,D10,D42,D26,D20,D56,D43,D24,D19,D13,D25,D50,D48,D55,D35,D30,D11,D12,D14,D15,D21,D22,D32,D36,D38,D40,D44,D46,D47,D49,D53,D54,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10011125061';
update candidates set post_preference='{D16,D52,D10,D27,D42,D20,D26,D56,D19,D24,D43,D13,D50,D11,D35,D38,D48,D55,D12,D14,D15,D21,D22,D30,D32,D36,D40,D44,D46,D47,D49,D53,D54,D17,D18,D23,D29,D31,D33,D34,D37,D39,D41,D45,D51,D57,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10011142182';
update candidates set post_preference='{C1,D17,D10,D13,D16,D21,D26,D39,D42,D43,D45,D54,D55,D57,D40,D29,D23,D11,D12,D14,D15,D18,D19,D20,D22,D24,D25,D27,D28,D30,D31,D32,D34,D35,D36,D37,D38,D46,D47,D48,D49,D50,D51,D52,D53,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10011216162';
update candidates set post_preference='{D17,D18,D19,D20,D21,D22,D23,D24,D56,D57,D55,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10011247374';
update candidates set post_preference='{C9,C5,C8,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10011554560';
update candidates set post_preference='{C1,C2,C3,C4,C5,C6,C7,C8,C9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,D57}' where "registrationNo"='10011736732';
update candidates set post_preference='{D10,D12,D17,D23,D18,D21,D24,D25,D26,D27,D28,D30,D31,D32,D33,D34,D35,D36,D37,D39,D40,D41,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,D57,D13,D14,D15,D16,D19,D20,D22,D11,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10011746015';
update candidates set post_preference='{C5,C2,D52,D46,D23,D12,D18,D55,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10011807583';
update candidates set post_preference='{D52,D57,D10,D16,D19,D24,D27,D42,D43,D56,D13,D14,D11,D12,D21,D22,D26,D28,D30,D35,D36,D37,D38,D41,D44,D46,D47,D48,D49,D50,D51,D53,D54,D55,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10012143575';
update candidates set post_preference='{C9,D57,C5,C8,C4,C6,C1,C7,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10013119532';
update candidates set post_preference='{C9,C8,C5,C1,C4,C7,C6,D18,D23,D36,D43,D46,D55,D57,D16,D10,D19,D24,D27,D42,D48,D52,D56,D54,D53,D51,D50,D49,D47,D45,D44,D40,D39,D38,D37,D35,D34,D33,D32,D31,D30,D29,D28,D26,D22,D21,D20,D17,D15,D12,D11,D25,X,X,X,X,X}' where "registrationNo"='10013445051';
update candidates set post_preference='{D16,D44,D10,D45,D18,C9,D21,C1,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10013550454';
update candidates set post_preference='{C9,C5,C4,C8,C2,C6,C7,C1,C3,D52,D19,D20,D24,D26,D12,D17,D18,D47,D56,D49,D44,D43,D38,D57,D21,D23,D31,D41,D45,D16,D10,D11,D13,D14,D15,D22,D25,D27,D28,D29,D30,D32,D33,D34,D35,D36,D37,D39,D40,D42,D46,D48,D50,D51,D53,D54,D55}' where "registrationNo"='10013914325';
update candidates set post_preference='{D42,D37,D38,D28,D30,D35,D43,D24,D55,D52,D16,D10,D11,D12,D21,D26,D44,D46,D49,D50,D51,D53,D54,D56,D57,D13,D22,D27,D36,D47,D48,D19,D45,D39,D40,D34,D33,D32,D15,D17,D18,D20,D23,D29,D31,D25,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10014217447';
update candidates set post_preference='{C1,C4,C9,D16,D17,D18,D19,D24,D31,D57,C5,C7,C6,D10,D11,D12,D13,D15,D20,D21,D22,D23,D25,D26,D27,D28,D29,D30,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D55,D56,X,X,X,X,X}' where "registrationNo"='10014314776';
update candidates set post_preference='{C9,C6,C1,D16,D42,D45,D44,D43,D52,D51,D17,D10,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10014447491';
update candidates set post_preference='{D57,D44,D52,D20,D16,D10,D11,D18,D17,D21,D24,D26,D27,D33,D40,D43,D45,D56,D55,D12,D13,D15,D22,D23,D28,D29,D30,D31,D32,D34,D35,D36,D37,D39,D42,D51,D53,D54,D14,D38,D50,D46,D48,D47,D19,D41,D49,C1,C2,C3,C4,C5,C6,C7,C8,D25,C9}' where "registrationNo"='10014469911';
update candidates set post_preference='{C1,C2,C3,C4,C5,C6,C7,C8,C9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,D57}' where "registrationNo"='10014768130';
update candidates set post_preference='{C9,C8,C4,C5,C1,C6,C3,C7,C2,D57,D43,D46,D23,D52,D18,D15,D22,D55,D19,D51,D21,D29,D27,D26,D28,D35,D36,D38,D40,D49,D48,D41,D11,D32,D31,D12,D13,D39,D34,D54,D56,D45,D20,D53,D37,D10,D33,D14,D24,D42,D17,D44,D50,D30,D47,D16,X}' where "registrationNo"='10015263711';
update candidates set post_preference='{C9,C5,C8,D57,D23,D43,D18,D31,D52,D55,D44,D46,D15,C1,C7,C4,D16,D10,D56,D21,D35,D42,D45,D28,D54,D40,D33,D32,D39,D30,D53,D49,D17,D37,D51,D12,D11,D50,D26,D20,D19,D24,D38,D25,D36,D13,D22,D48,D27,D34,D47,X,X,X,X,X,X}' where "registrationNo"='10015517195';
update candidates set post_preference='{C9,C5,D43,D52,C1,D20,D42,D16,D49,D27,D10,D13,D56,D38,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10015945594';
update candidates set post_preference='{D10,D11,D16,D21,D38,D39,D51,D56,D57,D54,D55,D48,D45,D53,D47,D37,D43,D49,D50,D44,D36,D35,D33,D34,D32,D22,D26,D27,D28,D29,C1,C2,C3,C4,C5,C6,C7,C8,C9,D12,D42,D31,D25,D30,D40,D41,D46,D13,D14,D15,D17,D18,D19,D20,D24,X,X}' where "registrationNo"='10016388513';
update candidates set post_preference='{D16,D10,D27,D42,D26,D48,D28,D22,D30,D19,D56,D24,D14,D37,D11,D52,D43,D13,D50,D35,D38,D49,D47,D51,D54,D55,D46,D36,D53,D21,D41,D12,D44,D57,D31,D23,D18,D17,D15,D45,D39,D34,D33,D32,D29,D20,D25,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10016403758';
update candidates set post_preference='{D16,D52,D10,D20,D27,D42,D26,D13,D19,D24,D43,D56,D55,D54,D53,D50,D49,D48,D47,D46,D44,D40,D38,D36,D35,D32,D30,D22,D21,D15,D14,D12,D11,D28,D33,D37,D41,D57,D51,D34,D17,D18,D29,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10016410948';
update candidates set post_preference='{C1,C9,C4,C5,D10,D16,D52,C7,C6,D20,D43,C8,D42,D24,D56,D26,D38,D19,D50,D55,D27,D11,D48,D12,D13,D15,D17,D18,D21,D22,D23,D28,D29,D30,D31,D32,D33,D35,D36,D37,D39,D40,D44,D45,D46,D47,D49,D53,D54,D25,X,X,X,X,X,X,X}' where "registrationNo"='10016444871';
update candidates set post_preference='{D43,D52,D55,D42,D13,D16,D17,D24,D27,D34,D35,D36,D40,D41,D46,D53,D56,D11,D19,D20,D38,D10,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10016460009';
update candidates set post_preference='{D10,D11,D13,D15,D16,D17,D19,D20,D21,D22,D23,D24,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,D57,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10016462070';
update candidates set post_preference='{C9,C5,C8,D57,C6,C4,D43,C1,C2,C3,C7,D23,D31,D52,D18,D19,D10,D16,D26,D54,D24,D44,D49,D11,D12,D13,D14,D15,D46,D17,D20,D21,D22,D27,D28,D29,D30,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D45,D47,D48,D50,D51,D53,D55,D56,D25}' where "registrationNo"='10016548420';
update candidates set post_preference='{C9,C8,C5,C4,C1,C6,D43,D52,D18,D23,D55,D31,D46,C2,C3,C7,D16,D10,D57,D36,D15,D19,D42,D20,D56,D44,D28,D29,D33,D13,D26,D24,D12,D22,D11,D14,D47,D17,D21,D27,D30,D32,D34,D35,D37,D41,D39,D40,D38,D45,D48,D49,D50,D51,D53,D54,D25}' where "registrationNo"='10016590810';
update candidates set post_preference='{D52,D19,D10,D16,D43,D27,D20,D56,D26,D24,D38,D13,D42,D34,D35,D36,D40,D41,D46,D50,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10016652853';
update candidates set post_preference='{D52,D16,D10,D42,D27,D19,D56,D43,D24,D26,D48,D13,D50,D14,D38,D37,D55,D35,D11,D46,D49,D36,D22,D47,D51,D54,D53,D57,D44,D41,D21,D12,D28,D30,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10016709868';
update candidates set post_preference='{C5,C6,C1,C2,C9,C7,C8,C4,C3,D52,D44,D43,D19,D18,D38,D26,D20,D17,D16,D31,D10,D12,D15,D13,D14,D23,D22,D21,D24,D30,D27,D28,D29,D57,D56,D54,D51,D55,D32,D33,D34,D35,D36,D37,D42,D41,D39,D40,D45,D47,D49,D48,D53,D50,D46,D11,D25}' where "registrationNo"='10016728026';
update candidates set post_preference='{D12,D11,D31,D54,D52,D43,D45,D48,D36,D35,D34,D33,D29,D28,D27,D26,D25,D24,D23,D22,D21,D18,D17,D15,D37,D38,D39,D40,D41,D42,D46,D47,D49,D50,D51,D55,D56,D57,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10016816540';
update candidates set post_preference='{C9,C5,D18,D57,D23,D43,D52,D55,D31,D15,C6,C4,C2,C3,C7,C1,D26,D29,D56,D12,D16,D10,D24,D38,D21,D36,D42,D33,X,D49,D20,X,D44,D48,D22,D54,D37,D19,D46,D17,D28,D39,D45,D51,D30,D11,D13,D40,D14,D41,D35,D32,D53,X,D47,D27,D50}' where "registrationNo"='10016956630';
update candidates set post_preference='{C9,C8,C5,D57,D52,D43,D23,D16,D55,D46,D18,D15,C1,C6,C4,D17,D42,D54,D44,C2,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10017206295';
update candidates set post_preference='{D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,D57,C1,C2,C3,C4,C5,C6,C7,C8,C9}' where "registrationNo"='10017444768';
update candidates set post_preference='{D57,D52,D46,D23,D43,D55,D31,D18,D44,D13,D12,D21,D17,D32,D29,D56,D10,D16,D36,D54,D15,D22,D45,D51,D53,D49,D39,D37,D42,D33,D30,D34,D35,D40,D48,D50,D28,D11,D19,D27,D20,D24,D26,D38,D47,C9,C5,C8,C6,C4,C1,C7,C2,C3,X,X,X}' where "registrationNo"='10017451551';
update candidates set post_preference='{D27,D16,D52,D10,D17,D26,D20,D24,D43,D44,D42,D11,D13,D19,D35,D38,D48,D50,D55,D56,D54,D53,D49,D40,D12,D14,D15,D21,D22,D30,D32,D36,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10017652408';
update candidates set post_preference='{D52,D16,D10,D27,D42,D20,D56,D26,D43,D24,D23,D50,D13,D25,D48,D17,D18,D11,D55,C1,C2,C3,C4,C5,C6,C7,C8,C9,D28,D35,D38,D46,D22,D37,D53,D12,D14,D19,D15,D21,D54,D47,D29,D30,D31,D32,D33,D34,D49,D36,D39,D57,D40,X,X,X,X}' where "registrationNo"='10017779689';
update candidates set post_preference='{D10,D12,D16,D17,D20,D21,D26,D27,D28,D37,D46,D47,D55,D56,D57,D11,D13,D14,D15,D18,D19,D22,D23,D24,D30,D29,D31,D32,D33,D34,D35,D36,D38,D40,D41,D42,D43,D44,D45,D48,D49,D50,D51,D52,D53,D54,D25,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10017785863';
update candidates set post_preference='{C9,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10017798370';
update candidates set post_preference='{D52,D43,D44,D46,D57,D23,D55,D31,D36,D15,D56,D29,D16,D10,D48,D54,D49,D51,D11,D19,D42,D38,D24,D53,D27,D47,D41,D30,D21,D20,D37,D26,D22,D13,D14,D50,D18,D17,D35,D32,D34,D39,D40,D45,D33,D12,D28,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10017803326';
update candidates set post_preference='{C1,C2,C3,C4,C5,C6,C7,C8,C9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31,D32,D33,D34,D35,D36,D37,D38,D40,D41,D42,D43,D44,D45,D46,D47,D48,D49,D50,D51,D52,D53,D54,D55,D56,D57,X}' where "registrationNo"='10017805960';
update candidates set post_preference='{C9,C5,C8,C7,D52,D57,D23,D31,D46,D43,D16,D49,D55,D22,D18,D10,D48,D41,D34,D29,D28,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10017816989';
update candidates set post_preference='{C9,C1,C4,C6,C3,D57,D13,D36,D43,D55,D26,D12,D14,D56,D42,D21,D48,D49,D53,D54,D51,D10,D27,D52,D16,D19,D41,D22,D28,D30,D35,D37,D38,D44,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10017827893';
update candidates set post_preference='{D26,D38,D37,D36,D35,D34,D33,D57,D56,D55,D53,D52,D51,D50,D49,D48,D47,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10017853258';
update candidates set post_preference='{C9,C8,C5,C6,C1,C7,C4,C3,C2,D57,D43,D52,D46,D18,D23,D16,D55,D31,D10,D22,D44,D26,D20,D19,D56,D54,D24,D33,D42,D15,D11,D35,D17,D29,D49,D28,D13,D45,D47,D21,D41,D12,D27,D53,D51,D32,D36,D37,D39,D40,D48,D30,D34,D38,D50,X,X}' where "registrationNo"='10000098307';
update candidates set post_preference='{D57,D13,D18,D22,D23,D31,D36,D33,D44,D55,D10,D16,D52,D26,D56,D19,D49,D35,D21,D30,D48,D51,D54,D12,D53,D43,D24,D28,D27,D37,D11,D50,D47,D38,D42,D20,D29,D39,D34,D40,D45,D46,D25,X,X,X,X,X,X,X,X,X,X,X,X,X,X}' where "registrationNo"='10005757747';


select count(distinct "registrationNo") from candidates where post_preference is not null;---15371


update candidates 
set rej_prov='C' where post_preference is not null;---15372

update candidates 
set rej_prov='D' where debarred='Yes';---55

select rollno,cat1,cat2,cat3,total, mistake_c from candidates 
where merit is not null and mistake_c is not null and mistake_c<='7' and cut_off_c='' order by merit ;---245

select rollno,cat1,cat2,cat3,total, mistake_d from candidates 
where merit is not null and mistake_d is not null and mistake_d<='10' and cut_off_d='' order by merit ;---441

alter table vacancy_table add column current integer;
alter table vacancy_table add column allocated integer;
alter table vacancy_table add column left_vacancy integer;

update vacancy_table set current=initial;

select distinct post from candidates where merit is not null AND post_preference like '%D%' ;
"Stenographer Grade 'D'"
"Stenographer Grade 'C' & Stenographer Grade 'D'"

select distinct post from candidates where merit is not null AND post_preference like '%C%' ;
"Stenographer Grade 'C'"
"Stenographer Grade 'C' & Stenographer Grade 'D'"

select rollno,cat1,cat2,cat3,catsel_dob_c,cut_off_c,catsel_c,total,mistake_c from candidates where merit is not null and mistake_c is not null 
and cut_off_c='' and cat1='1' and mistake_c<='7'; -----0

select rollno,cat1,cat2,cat3,catsel_dob_c,cut_off_c,catsel_c,total,mistake_c from candidates where merit is not null and mistake_c is not null 
and cut_off_c='' and cat1 in ('1','2','6','0') and mistake_c>'7'; -----3373

select rollno,cat1,cat2,cat3,catsel_dob_c,cut_off_c,catsel_c,total,mistake_c from candidates where merit is not null and mistake_c is not null 
and cut_off_c='' and cat1 in ('1','2','6','0') and mistake_c>'7'; -----3373

select rollno,cat1,cat2,cat3,catsel_dob_c,cut_off_c,catsel_c,total,mistake_c from candidates where merit is not null and mistake_c is not null 
and cut_off_c='' and cat1 in ('9') and mistake_c<='5'; -----0

select rollno,cat1,cat2,cat3,catsel_dob_c,cut_off_c,catsel_c,total,mistake_c from candidates where merit is not null and mistake_c is not null 
and cut_off_c='' and cat1 in ('9') and mistake_c>'5'; -----1210

select rollno,cat1,cat2,cat3,catsel_dob_d,cut_off_d,catsel_d,total,mistake_d from candidates where merit is not null and mistake_d is not null 
and cut_off_d='' and cat1 in ('1','2','6','0') and mistake_d<='10'; -----0

select rollno,cat1,cat2,cat3,catsel_dob_d,cut_off_d,catsel_d,total,mistake_d from candidates where merit is not null and mistake_d is not null 
and cut_off_d='' and cat1 in ('1','2','6','0') and mistake_d>'10'; -----7854

select rollno,cat1,cat2,cat3,catsel_dob_d,cut_off_d,catsel_d,total,mistake_d from candidates where merit is not null and mistake_d is not null 
and cut_off_d='' and cat1 in ('9') and mistake_d<='7'; -----0

select rollno,cat1,cat2,cat3,catsel_dob_d,cut_off_d,catsel_d,total,mistake_d from candidates where merit is not null and mistake_d is not null 
and cut_off_d='' and cat1 in ('9') and mistake_d>'7'; -----2230

select distinct cbeqly_c from candidates where allocated_post like '%C%';----Y

select distinct cbeqly_d from candidates where allocated_post like '%D%';---Y

select distinct allocated_category,catsel_d from candidates where allocated_category is not null and allocated_post like '%D%' group by allocated_category,catsel_d;

select distinct allocated_category,catsel_c from candidates where allocated_category is not null and allocated_post like '%C%' group by allocated_category,catsel_c;

select * from candidates where allocated_category='3';----LENGTH OF SERVICE OK

select distinct gender from candidates where allocated_post='D25';---ONLY MALE

select distinct merit,allocated_category from candidates where debarred='Yes';---null


'3005001022', '3005003410', '3009003561', '3005002942', '3005002622', '3005004298', '3009004697', '3005002629', '3005002705', '3009001042', '3005003558', '3005004093', '3005001532', '3005001019', '3001004879', '3005002640', '3009004890', '3009000610', '3005002779', '3005002257', '3005002856', '3005002880', '3005002100', '3011002398', '3005003847', '3005005195', '3005005295', '3005003479', '3005003562', '3009001144', '3005004322', '3005005213', '3001009121', '3015001916', '3005002595', '3005004769', '3009003640', '3005003206', '3005001275', '3005003764', '3005003615', '3005003860', '3009006618', '3001006329'
