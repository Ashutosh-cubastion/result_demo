create table je2024applicationdata
(
	registrationNo character varying,
	name character varying,
	newName	character varying,
	fathersName character varying,
	mothersName character varying,
	dob character varying, 
	dob1 date,
	ageAsOnDob character varying,
	genderId character varying,
	gender character varying,
	categoryId character varying,
	category character varying,
	nationality character varying,
	markOfIdentification character varying,
	isEsm character varying,
	lengthOfService character varying,
	dojOfEsm character varying,
	dodOfEsm character varying,
	isCivilPost character varying,
	dojOfCivilPost character varying,
	is_physically_handicapped character varying,
	typeOfPwbd character varying,
	Pwbd_Code character varying,
	isAgeRelaxation	 character varying,
	ageRelaxationCode character varying,
	post_appliedFor character varying,
	highestQualification character varying,
	qualifyingEducation character varying,
	subjectCode character varying,
	subject character varying,
	passingStatus character varying,
	passingYear character varying,
	boardStateId character varying,
	educationBoardId character varying,
	presentAddress character varying,
	presentDistrict character varying,
	presentState character varying,
	presentPincode character varying,
	permanentAddress character varying,
	permanentDistrict character varying,
	permanentState character varying,
	permanentPincode character varying,
	contactDetailForOtherNationals character varying,
	phoneNo character varying,
	emailId	character varying,
	status character varying,
	isPersonalInfoAccess character varying,
	applicationFee character varying,
	regionCode	character varying
)

create table tier1_marks
(
REGID character varying,
ROLL character varying,
NAME character varying,
FNAME character varying,
MNAME character varying,
DOB	 date,
GENDER	character varying,
CAT1 character varying,
CAT2 character varying,
CAT3 character varying,
AGERLXCODE character varying,
EQ	character varying,
SUBJECT character varying,
MEDIUM character varying,
GEN_ENGG numeric,
GA	numeric,
GI numeric,
SCORE numeric,
NORMALIZED numeric,
PAPER1 numeric,
P1Q_C character varying,
P1Q_EM character varying,
WITHHELD character varying
)


psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_je2024_allocation_final

\copy tier1_marks from 'C:\Users\SalauddinKhan\Desktop\je2024_tier1_marks.csv' csv header;
---COPY 16223

select * from tier1_marks where withheld is not null;---4


CREATE TABLE IF NOT EXISTS public.vacancy_table
(
    department_name character varying COLLATE pg_catalog."default",
    post_name character varying COLLATE pg_catalog."default",
    post_code character varying COLLATE pg_catalog."default" NOT NULL,
    subject_option character varying COLLATE pg_catalog."default",
	sage_limit character varying COLLATE pg_catalog."default",
    gender character varying COLLATE pg_catalog."default",
    category character varying COLLATE pg_catalog."default",
    category_code character varying COLLATE pg_catalog."default" NOT NULL,
    initial_vacancy integer,
    current integer,
    allocated integer,
    left_vacancy integer,
    CONSTRAINT vacancy_pkey PRIMARY KEY (post_code, category_code)
)


create table candidates as Select * from je2024applicationdata ;


Create table tier2_marks
(DriveID character varying,
 ExamID character varying,
 ParticipantID character varying,
 Name character varying,
 ParticipantType character varying,
 TestCenterCode character varying,
 TestCenterName	character varying,
 LanName character varying,
 City character varying,
 State character varying,
 Country character varying,
 Subject character varying,
 QuestionPaperName character varying,
 TotalQuestions character varying,
 QuestionsNotVisited character varying,
 QuestionsNotAttempted character varying,
 QuestionsAttempted character varying,
 QuestionsAttemptedandMarkedForReview character varying,
 QuestionsNotAttemptedandMarkedForReview character varying,
 TotalAttempted	character varying,
 TotalCorrect character varying,
 TotalWrong	character varying,
 "DelayedDuration(sec)" character varying,
 SubmitTime character varying,
 GeneralEngineeringCivilAndStructural numeric,
 Score numeric,
 normalized numeric,
 FirstLoginTime character varying,
 ProfileConfirmTime character varying,
 RingtheBellTime character varying,
 DefaultLanguage character varying,
 MaximumMarks character varying,
 SystemName character varying
 );
 
 do
$$
begin

alter table candidates add column rollno character varying;
alter table candidates add column cand_name character varying;
alter table candidates add column cat1 character varying;
alter table candidates add column cat2 character varying;
alter table candidates add column cat3 character varying;
alter table candidates add column exsm_length character varying;
alter table candidates add column exs_reservation character varying;
alter table candidates add column arc_code character varying;
alter table candidates add column p1_gi numeric;
alter table candidates add column p1_ga numeric;
alter table candidates add column p1_gen_engg numeric;
alter table candidates add column p1_score numeric;
alter table candidates add column p1_normalized numeric;
alter table candidates add column paper1 numeric;
alter table candidates add column p1_subject character varying;

end
$$


update candidates a
set a.rollno=b.roll
from tier1_marks b
where a."registrationNo"=b.regid;----16223 updates 

-------paper1 marks update---------------

update candidates a
set a.p1_gi=b.gi,
a.p1_ga=b.ga,
a.p1_gen_engg =b.gen_engg,
a.p1_score =b.score,
a.p1_normalized=b.normalized,
a.paper1 =b.paper1,
a.p1_subject =b.subject
from tier1_marks b
where a."registrationNo"=b.regid
and a.rollno=b.roll;---16223 updates

do
$$
begin

alter table candidates add column p2_score numeric;
alter table candidates add column p2_normalized numeric;
alter table candidates add column paper2 numeric;
alter table candidates add column p2_subject character varying;

end
$$

update candidates a
set a.p2_score=b.score,
a.p2_normalized=b.normalized,
a.p2_subject=b.subject
from tier2_marks b
where a.rollno=b.participantid;---14255 updates


update candidates
set paper2=p2_normalized where p1_score is not null;

update candidates
set paper2=p2_score  where p2_subject='Junior Engineer 2024 Paper II Civil';---10435 updates


select * into candidates_all from candidates;


alter table candidates add column total numeric;
update candidates set total=paper1+paper2 where p2_subject is not null;-----total marks update 14225


alter table candidates add column debarred character varying;
alter table candidates add column rejection_provision character varying;
alter table candidates add column remarks character varying;


update candidates
set gender='1' where "Gender"='Female';---1267

update candidates
set gender='2' where "Gender"='Male';---14956


update candidates
set cat3=code;


update candidates  set cand_name=name;---16223

select * from candidates where name<>cand_name;

update candidates  set cand_name=newname where newname is not null;---30


select distinct p1_subject,p2_subject,count(*) from candidates where rejection_provision='C' group by p1_subject,p2_subject;
"CIVIL"	"Junior Engineer 2024 Paper II Civil"		10435
"ELECT"	"Junior Engineer 2024 Paper II Electrical"	2403
"MECH"	"Junior Engineer 2024 Paper II Mechanical"	1417

select distinct subject,p1_subject,p2_subject,count(*) from candidates where rejection_provision='C' group by subject, p1_subject,p2_subject;
"Automobile Engineering"	"MECH"	"Junior Engineer 2024 Paper II Mechanical"			6
"Civil Engineering"			"CIVIL"	"Junior Engineer 2024 Paper II Civil"				10435
"Electrical Engineering"	"ELECT"	"Junior Engineer 2024 Paper II Electrical"			2403
"Mechanical Engineering"	"MECH"	"Junior Engineer 2024 Paper II Mechanical"			1411

----handling age relaxation code-------

select distinct cat1 ,count(*) from candidates where arc_code is null and substring("ageAsOnDob",1,3)::int >='30' group by cat1;
"0"	201
"1"	87
"2"	45
"6"	81
"9"	152

select max(substring("ageAsOnDob",1,3)::int) from candidates where arc_code is null and substring("ageAsOnDob",1,3)::int >='30' ;---32 

select * from candidates where arc_code is null and substring("ageAsOnDob",1,3)::int >='30' 
and cat1 in ('1','2');---132

update candidates set arc_code='01' where arc_code is null and substring("ageAsOnDob",1,3)::int >='30' 
and cat1 in ('1','2');

select * from candidates where arc_code is null and substring("ageAsOnDob",1,3)::int >='30' 
and cat1 in ('6');---81

update candidates set arc_code='02' where arc_code is null and substring("ageAsOnDob",1,3)::int >='30' 
and cat1 in ('6');

select * from candidates where arc_code is null and substring("ageAsOnDob",1,3)::int >='30' 
and cat1 in ('0','9') and cat3 is not null ;--6

update candidates set arc_code='03' where arc_code is null and substring("ageAsOnDob",1,3)::int >='30' 
and cat1 in ('0','9') and cat3 is not null ;

select distinct cat1 ,cat2,cat3,count(*) from candidates where arc_code is null and substring("ageAsOnDob",1,3)::int >='30' group by cat1,cat2,cat3;
"0"	"0"	 null	201
"9"	"0"	 null	146


-----------------------debarred checking------------------------------

select a.debarred,a."registrationNo",a.rollno,a.name,b.name as d_name,a.father_name,b.fathername as d_father_name,a.mother_name,b.mothername as d_mother_name,a.dob,b.dob as d_dob,a.gender,a.cat1,
b."debarredFrom",b."debarredUpto",b.reason,b."otherReason"
from candidates a,m_debarred_ssc b where 
b."debarredUpto" >'2025-01-01' and
b."isActive"=true and

--replace((UPPER(a.name)||UPPER(a.father_name)||UPPER(a.mother_name)),' ','') = replace((UPPER(b.name)||UPPER(b.fathername)||UPPER(b.mothername)),' ','')
--and a.dob=b.dob;
 
--replace ((UPPER(b.name)||UPPER(b.mothername)),' ','') = replace ((UPPER(a.name)||UPPER(a.mother_name)),' ','') and a.dob = b.dob;
 
replace ((UPPER(b.name)||UPPER(b.fathername)),' ','') = replace ((UPPER(a.name)||UPPER(a.father_name)),' ','') and a.dob = b.dob;

update candidates set deabrred='Yes', rejection_provision='D' where rollno in ('2405100938','2405104412','2405100508','6006100865');

--------post preference update-------------------------------------

alter table candidates add column post_pref character varying;


update candidates a
set a.post_pref=b."preferredDeptCodeList"
from je2024optionpreference b
where a."registrationNo"=b."registrationNo"
and a.rollno=b."rollNumber";------13060 updates

select rejection_provision,count(*) from candidates where  post_pref is not null group by rejection_provision;
"D"	3
	12
"C"	13045


update candidates a
set

a.merit_c =b.merit_c,
a.merit_em =b.merit_em,
a.cutoff_c =b.cutoff_c,
a.cutoff_em =b.cutoff_em,
a.dob_18_30 =b.dob_18_30,
a.dob_18_32 =b.dob_18_32,
a.catsel_dob_18_30 =b.catsel_dob_18_30,
a.catsel_dob_18_32 =b.catsel_dob_18_32,
a.catsel_c_18_30=b.catsel_c_18_30,
a.catsel_c_18_32 =b.catsel_c_18_32,
a.catsel_em_18_30=b.catsel_em_18_30,
a.catsel_em_18_32 =b.catsel_em_18_32,
a.allocated_category =b.allocated_category,
a.allocated_subject =b.allocated_subject,
a.allocated_post=b.allocated_post,
a.allocated_against_ur =b.allocated_against_ur

from allocated_ashu b
where a."registrationNo"=b.registrationno;---16223 updates


select distinct p1_subject from candidates where allocated_post in ('B','F','G','I','K','M');---CIVIL
select distinct p1_subject from candidates where allocated_post in ('H','L','N');---ELECT
select distinct p1_subject from candidates where allocated_post in ('E','O');---MECH
select distinct p1_subject from candidates where allocated_post in ('A','J','C');---ELECT,MECH

select distinct gender from candidates where allocated_post IN ('A','B');---2




2201001312---isko 01 arc diya in cht



10017661216
10015869992
10001140290
10001271740
10017755601
10012378142
10007657860
10005468976


10012378142
10001140290
10017661216
10017755601
10005468976
10001271740
10007657860
