---with held
select * from  "cgl2024Tier1Marks" where "rollNo" in ('1408016738', '2201152913', '2201396173', '2201372625', '2201287961', '2201358640', '2201195509', '2201322305', '2201232987', '2201016623', '2201050383', '2201316705', '2201219348', '2201370444', '4410028768', '7001013068', '7204033033', '2406034640', '2201135826', '2406034639', '2201243087', '1401022647', '2201195091', '2201121224', '2201228715', '2201300158', '2201373314', '2201395825', '2201006364', '2201112837', '2201153561', '2201158061', '2201345114', '2201144951', '2201106705', '4419003568', '7001017351', '7205000587', '1401032042', '5302005941', '3013065550', '2201073074', '1401017824', '2201230705', '2201180741', '2201323507', '2201344594', '2201023965', '2201145307', '2201398551', '2201158201', '2208020091', '2201044751', '2405102555', '2201216651', '4410038299', '4410069173', '7202004676', '7205037696', '3010007076', '7001027292', '2406029312', '3010028506', '1401045048', '2201290461', '2201183472', '2405023576', '2201366712', '2201259980', '2201402702', '2201110206', '2405097618', '2201178274', '2405030521', '2201409256', '2405058378', '4419002038', '6016018537', '7202006830', '7214003963', '2201039950', '2201158270', '2201300431', '3007023047', '2201007085', '2201325522', '2201224121', '2002012453', '2201400726', '2201402609', '2201074242', '2201111965', '2003007734', '2201337483', '2405038806', '2201088216', '2201372501', '4410124031', '6016014447', '7202007866', '8201038093', '2406034638', '6006007743', '3206172371', '2201229143', '2201053324', '2201331198', '2201228624', '2201088504', '2201404860', '2201183689', '2405066182', '2405080165', '2201308638', '2201204912', '2201388963', '2201273785', '2405026288', '4415028430', '7001000540', '7202016986', '9001000839', '2201281536', '4410111443', '3010116066', '2201374254', '2201122979', '2201337497', '2201290960', '2201252497', '2201266810', '2201147318', '2405069667', '2201073799', '2201250250', '2201032270', '2219002552', '2201218727', '2201272639', '4419002822', '7001004676', '7204013682', '9001025072', '3001006706', '2201417969', '4404009343');

---debarred
select * from  "cgl2024Tier1Marks" where "rollNo" in('1007004546','3009100985','3008003432','4410039433','8601000783','8201031251','9213005982','1401016418','3016008638','3013010343','4417007130','8601108253','8201014375','3003071768','3206128241','3003035750','4426009020','8208003423','8201016067','3010103858','3206021309','3013033915','4605017818','8006010994','8201041708','3201002057','3009027729','4410022674','4601009198','8603011606','8012006697','3001006955','3010005902','4410076418','8601069113','8601105344','8012011381','3009086680','3009033086','4604031052','8201017941','8601044579','9213009222'
);

Create table statistics
(
DriveID character varying,
ExamID character varying,
ParticipantID character varying,
Name character varying,
ParticipantType character varying,
TestCenterCode character varying,
TestCenterName character varying,
LanName character varying,
City character varying,
State character varying,
Country	character varying,
Subject character varying,
QuestionPaperName character varying,
TotalQuestions character varying,
QuestionsNotVisited character varying,
QuestionsNotAttempted character varying,
QuestionsAttempted character varying,
QuestionsAttemptedandMarkedForReview character varying,
QuestionsNotAttemptedandMarkedForReview character varying,
TotalAttempted character varying,
TotalCorrect character varying,
TotalWrong character varying,
DelayedDurationsec character varying,
SubmitTime character varying,
Statistics numeric,
Score numeric,
FirstLoginTime character varying,
ProfileConfirmTime	character varying,
RingtheBellTime	character varying,
DefaultLanguage character varying,
MaximumMarks numeric,
Date_Shift character varying,
SystemName character varying
)

Create table paper2
(
DriveID character varying,
ExamID character varying,
ParticipantID character varying,
Name character varying,
ParticipantType character varying,
TestCenterCode character varying,
TestCenterName character varying,
LanName character varying,
City character varying,
State character varying,
Country	character varying,
Subject character varying,
QuestionPaperName character varying,
TotalQuestions character varying,
QuestionsNotVisited character varying,
QuestionsNotAttempted character varying,
QuestionsAttempted character varying,
QuestionsAttemptedandMarkedForReview character varying,
QuestionsNotAttemptedandMarkedForReview character varying,
TotalAttempted character varying,
TotalCorrect character varying,
TotalWrong character varying,
DelayedDurationsec character varying,
SubmitTime character varying,
ModuleIMathematicalAbilities numeric,
ModuleIIReasoningandGeneralIntelligence	numeric,
section1totalscore numeric,
ModuleIEnglishLanguageandComprehension	numeric,
ModuleIIGeneralAwareness numeric,
section2totalscore numeric,
ModuleIComputerKnowledgeModule	numeric,
section3totalscore numeric,
overallscore numeric,
normalized_score_section1 numeric,
normalized_score_section2 numeric,
normalized_score_section3 numeric,
normalized_score_overall numeric,
FirstLoginTime character varying,
ProfileConfirmTime	character varying,
RingtheBellTime	character varying,
DefaultLanguage character varying,
MaximumMarks numeric,
Normalized_score numeric,
Date_Shift character varying,
SystemName character varying
)

psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_cgle2024_allocation_final

select participantid from statistics
where participantid not in (select participantid from paper2);---11 candidates paper2 not given but paper3 given

select * from paper2 where participantid in (
'3009051306',
'2201026152',
'3015002530',
'3201003882',
'6016007271',
'2201314053',
'7208030346',
'4205049051',
'9001003846',
'3206152813',
'7205026342'); ---no records found


"7202016986"
"8201038093"
"3206172371"

create table candidates as select * from cgl2024applications;

alter table candidates add column cat1 character varying;
alter table candidates add column cat2 character varying;
alter table candidates add column cat3 character varying;
alter table candidates add column agerelax_code character varying;
alter table candidates add column service_period character varying;
alter table candidates add column exsm_length character varying;
alter table candidates add column exs_reservation character varying;

do
$$
begin

update candidates set cat1='9' where category='UR';--32712
update candidates set cat1='1' where category='SC';--29583
update candidates set cat1='2' where category='ST';--14680
update candidates set cat1='6' where category='OBC';--53193
update candidates set cat1='0' where category='EWS';--22919

end
$$

update candidates set cat2='3' where "isEsm"=true;--9169


do
$$
begin

update candidates set cat3='5' where "typeOfPwbd"='HH';--1723
update candidates set cat3='4' where "typeOfPwbd"='OH';--1827
update candidates set cat3='8' where "typeOfPwbd"='Others';--1073
update candidates set cat3='7' where "typeOfPwbd"='VH';--1272

end
$$

update candidates set gender='1' where gender='Female';--24875
update candidates set gender='2' where gender='Male';--128212

update candidates a set a.service_period=a."lengthOfService" where cat2='3';
update candidates set exsm_length=trim(exsm_length) where cat2='3' ;

update candidates set exs_reservation='Yes' where cat2='3' ;
update candidates set exs_reservation='No' where cat2='3' and "isCivilPost"=true;---276


update candidates set agerelax_code='01' where "ageRelaxationId"='ih1djoyt2kgf229';	
update candidates set agerelax_code='11' where "ageRelaxationId"='wojitdagdziiwgx';	
update candidates set agerelax_code='13' where "ageRelaxationId"='6ly0j96t4r8e09y';	
update candidates set agerelax_code='02' where "ageRelaxationId"='f88b40f0x6b8uhu';	
update candidates set agerelax_code='03' where "ageRelaxationId"='v5s160kz5ijqm71';	
update candidates set agerelax_code='04' where "ageRelaxationId"='wnu48loa2gpoc81';	
update candidates set agerelax_code='05' where "ageRelaxationId"='hbzcuto411rkoa5';	
update candidates set agerelax_code='06' where "ageRelaxationId"='2gwbhj4sehodhvb';	
update candidates set agerelax_code='08' where "ageRelaxationId"='jhnwgzl6gdh3v6x';	
update candidates set agerelax_code='09' where "ageRelaxationId"='97obhuytxkkv3zu';	
update candidates set agerelax_code='10' where "ageRelaxationId"='4kscaj5wcxzlplm';	
update candidates set agerelax_code='12' where "ageRelaxationId"='xupgg5uzqd2tyoq';	

-----cat1 changed from SC to OBC as per email

select * from candidates where regno in 			('10012877650');---not present
select category,cat1 from candidates where regno in ('10009510896');--sc to obc
select category,cat1 from candidates where regno in ('10001233862');--sc to obc
select  category,cat1 from candidates where regno in('10011730323');--not present
select category,cat1 from candidates where regno in ('10001285298');--sc to obc
select category,cat1 from candidates where regno in ('10009003992');--sc to obc
select category,cat1 from candidates where regno in ('10009287653');--sc to obc

alter table candidates add column t1_eng numeric;
alter table candidates add column t1_ga numeric;
alter table candidates add column t1_gi numeric;
alter table candidates add column t1_qa numeric;
alter table candidates add column t1_score numeric;
alter table candidates add column t1_normalized numeric;
alter table candidates add column tier1 numeric;



-----tier1 marks update------	
	
update candidates a
set a.t1_eng=b.p1_english_comprehension,
a.t1_ga =b.p1_general_awareness,
a.t1_gi =b.p1_general_intelligence_and_reasoning,
a.t1_qa =b.p1_quantitative_aptitude,
a.t1_score =b.p1_raw_score,
a.t1_normalized =b.p1_normalized_score,
a.tier1=b.p1_normalized_score
from tier1_marks b
where a.rollno=b.rollno
and a.regno=b.registrationno;


pg_dump -U postgres -h 10.246.126.173 -p 5432 -t arc_table -F c -f C:\Users\Public\arc_table.dump alloc_cgle2023_allocation_final
pg_restore -U postgres -h 10.246.126.173 -p 5432 -d alloc_cgle2024_allocation_final -t arc_table C:\Users\Public\arc_table.dump


alter table candidates add column dob_flag_18_27 character varying;
alter table candidates add column dob_flag_20_30 character varying;
alter table candidates add column dob_flag_18_30 character varying;
alter table candidates add column dob_flag_18_32 character varying;
alter table candidates add column dob_flag_it_18_30 character varying;

-----age relaxation given-----

select * from candidates where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null ;---13876

---esm---

select  rollno,cat1,cat2,cat3,gender,agerelax_code,dob,service_period,dob_flag_18_27,remarks from candidates where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 ='3' ;---10

update candidates set agerelax_code='06',remarks='age relaxation given'
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 ='3' ;---10

------sc/st pwd
select  rollno,cat1,cat2,cat3,gender,agerelax_code,dob,service_period,dob_flag_18_27,remarks from candidates 
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('1','2') ;---49

update candidates set agerelax_code='05',remarks='age relaxation given'
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('1','2');---49

---obc pwbd
select  rollno,cat1,cat2,cat3,gender,agerelax_code,dob,service_period,dob_flag_18_27,remarks from candidates 
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('6') ;---165

update candidates set agerelax_code='04',remarks='age relaxation given'
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('6');---165


---ur/ews pwbd

select  rollno,cat1,cat2,cat3,gender,agerelax_code,dob,service_period,dob_flag_18_27,remarks from candidates 
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('9','0') ;---219

update candidates set agerelax_code='03',remarks='age relaxation given'
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 is null and cat3 is not null and cat1 in ('9','0');---219

---sc/st 

select  rollno,cat1,cat2,cat3,gender,agerelax_code,dob,service_period,dob_flag_18_27,remarks from candidates 
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 is null and cat3 is null and cat1 in ('1','2') ;---1895

update candidates set agerelax_code='01',remarks='age relaxation given'
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 is null and cat3 is null and cat1 in ('1','2');---1895

---obc
select  rollno,cat1,cat2,cat3,gender,agerelax_code,dob,service_period,dob_flag_18_27,remarks from candidates 
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 is null and cat3 is null and cat1 in ('6') ;---1491

update candidates set agerelax_code='02',remarks='age relaxation given'
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code is null and cat2 is null and cat3 is null and cat1 in ('6');---1491

-----ur/ews

select  rollno,cat1,cat2,cat3,gender,agerelax_code,dob,service_period,dob_flag_18_27,remarks from candidates 
where substring("ageAsOnDob",1,3)::int >='27' and agerelax_code IS NULL and cat2 is null and cat3 is null and cat1 in ('9','0') ;---10047


select * from sp_get_dob_flag('CGL',4);

----verification dob FLAG 

---dob_flag_18_27---

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 
from candidates where dob_flag_18_27='99' and agerelax_code is null;

select distinct cat1,cat2,cat3
from candidates where dob_flag_18_27='99' and agerelax_code is null;--0,9

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 
from candidates where dob_flag_18_27='99' and agerelax_code is not null;

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 
from candidates where dob='1997-08-02';--dd-mm-yyy

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 
from candidates where dob_flag_18_27='99'  and dob::character varying like '%1994%' and cat1 in ('1','2')--no records

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 
from candidates where dob_flag_18_27='99'  and dob::character varying like '%1992-08%' and cat1 in ('1','2')--ALL DOB 1992-08-01

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 
from candidates where dob_flag_18_27='99'  and dob::character varying like '%1994-08%' and cat1 in ('1','2')--NO RECORD

-----dob_flag_20_30

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27,dob_flag_20_30 
from candidates where dob_flag_20_30='99' and agerelax_code='06';---no such

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30
from candidates where dob_flag_20_30='99' and agerelax_code is null;

select distinct cat1,cat2,cat3
from candidates where dob_flag_20_30='99' and agerelax_code is null;--0,9

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27,dob_flag_20_30 
from candidates where dob_flag_20_30='99' and agerelax_code is not null;

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27,dob_flag_20_30 
from candidates where dob='1994-08-02';--dd-mm-yyy

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30
from candidates where dob_flag_20_30='99'  and dob::character varying like '%1989-08%' and cat1 in ('1','2')--no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30
from candidates where dob_flag_20_30='99'  and dob::character varying like '%1992-08%' and cat1 in ('6')--NO RECORD

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30
from candidates where dob_flag_20_30='U'  ;

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30
from candidates where dob='2004-08-02';  --all underage

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30
from candidates where dob='2004-08-01';  --all 9

----dob_flag_18_30-----

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27,dob_flag_20_30 ,dob_flag_18_30
from candidates where dob_flag_18_30='99' and agerelax_code='06';---no such

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30
from candidates where dob_flag_18_30='99' and agerelax_code is null;

select distinct cat1,cat2,cat3
from candidates where dob_flag_18_30='99' and agerelax_code is null;--0,9

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27,dob_flag_20_30,dob_flag_18_30 
from candidates where dob_flag_18_30='99' and agerelax_code is not null;

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27,dob_flag_20_30 ,dob_flag_18_30
from candidates where dob='1994-08-02';--dd-mm-yyy

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30
from candidates where dob_flag_18_30='99'  and dob::character varying like '%1989-08%' and cat1 in ('1','2')--no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30
from candidates where dob_flag_18_30='99'  and dob::character varying like '%1991-08%' and cat1 in ('6')--1 ,dob 1991-08-01

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30
from candidates where dob_flag_20_30='U'  ;---no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30
from candidates where dob='2006-08-02';  --no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30
from candidates where dob='2006-08-01';  --no record

---dob_flag_18_32--

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27,dob_flag_20_30 ,dob_flag_18_30,dob_flag_18_32
from candidates where agerelax_code='06'and dob_flag_18_32='99' ---no such

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30,dob_flag_18_32
from candidates where dob_flag_18_32='99' and agerelax_code is null;--no such

select distinct cat1,cat2,cat3
from candidates where dob_flag_18_32='99' and agerelax_code is null;--no such

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27,dob_flag_20_30,dob_flag_18_30 ,dob_flag_18_32
from candidates where dob_flag_18_32='99' and agerelax_code is not null;

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27,dob_flag_20_30 ,dob_flag_18_30,dob_flag_18_32
from candidates where dob='1992-08-02';--dd-mm-yyy

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30,dob_flag_18_32
from candidates where dob_flag_18_32='99'  and dob::character varying like '%1987-08%' and cat1 in ('1','2')--no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30,dob_flag_18_32
from candidates where dob_flag_18_32='99'  and dob::character varying like '%1989-08%' and cat1 in ('6')--1 ,dob 1991-08-01

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30,dob_flag_18_32
from candidates where dob_flag_18_32='U'  ;---no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30,dob_flag_18_32
from candidates where dob='2006-08-02';  --no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_27 ,dob_flag_20_30,dob_flag_18_30,dob_flag_18_32
from candidates where dob='2006-08-01';  --no record

---dob_flag_it_18_30-----

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_30,dob_flag_it_18_30
from candidates where agerelax_code='06'and dob_flag_it_18_30='99' ---no such

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_30,dob_flag_it_18_30
from candidates where dob_flag_it_18_30='99' and agerelax_code is null;--no such

select distinct cat1,cat2,cat3
from candidates where dob_flag_it_18_30='99' and agerelax_code is null;--no such

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,dob_flag_18_30 ,dob_flag_it_18_30
from candidates where dob_flag_it_18_30='99' and agerelax_code is not null;

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_30,dob_flag_it_18_30
from candidates where dob='1994-08-02';--dd-mm-yyy

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_30,dob_flag_it_18_30
from candidates where dob_flag_it_18_30='99'  and dob::character varying like '%1989-08%' and cat1 in ('1','2')--no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,service_period,exsm_length ,remarks,dob_flag_18_30,dob_flag_it_18_30
from candidates where dob_flag_it_18_30='99'  and dob::character varying like '%1991-08%' and cat1 in ('6');---no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_30,dob_flag_it_18_30
from candidates where dob_flag_it_18_30='U'  ;---no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_30,dob_flag_it_18_30
from candidates where dob='2006-08-02';  --no record

select rollno,cat1,cat2,cat3,gender,agerelax_code,dob as dob1,"ageAsOnDob",service_period,exsm_length ,remarks,dob_flag_18_30,dob_flag_it_18_30
from candidates where dob='2006-08-01';  --no record


alter table candidates add column catsel_dob_18_27 character varying;
alter table candidates add column catsel_dob_20_30 character varying;
alter table candidates add column catsel_dob_18_30 character varying;
alter table candidates add column catsel_dob_18_32 character varying;
alter table candidates add column catsel_dob_it_18_30 character varying;

select distinct dob_flag_18_27,catsel_dob_18_27,count(*) from candidates group by dob_flag_18_27,catsel_dob_18_27;

CREATE TABLE IF NOT EXISTS public.cut_off_table
(
    serial_id integer NOT NULL,
    category character varying(1) COLLATE pg_catalog."default",
    tier1 numeric,
    tier2 numeric,
    additional_paper numeric,
    dest_mistakes numeric,
    ckt_marks numeric,
    cut_off_name character varying(50) COLLATE pg_catalog."default",
    remarks text COLLATE pg_catalog."default",
	session1 numeric,
	session2 numeric,
    CONSTRAINT cut_off_table_pkey PRIMARY KEY (serial_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cut_off_table
    OWNER to postgres;
	
----tier2 marks----

alter table candidates add column t2_math numeric;
alter table candidates add column t2_gi numeric;
alter table candidates add column t2p1s1scor numeric;
alter table candidates add column t2p1s1norm numeric;
alter table candidates add column t2p1s1 numeric;
alter table candidates add column t2_eng numeric;
alter table candidates add column t2_ga numeric;
alter table candidates add column t2p1s2scor numeric;
alter table candidates add column t2p1s2norm numeric;
alter table candidates add column t2p1s2 numeric;
alter table candidates add column t2p2 numeric;
alter table candidates add column ckt_marks numeric;

----debarred

update candidates set debarred='Yes' where regno in ('10008201545','10006806859','10013978720','10012670189','10006134255','10016495826','10010430723','10011552416','10009918478','10013972436','10005874550','10002156973','10008011170','10009222887','10000855213','10000028664','10010367988','10001048179','10008656023','10006521094','10013786419','10000913097','10006795534','10001061822','10001273190','10005909949','10001753682','10001008565','10005838874','10000960362','10001259726','10001749522','10000951501','10000759224','10001606836'
);	

--10001292299


create table post_preference
( regno character varying,
post_pref character varying,
rollno character varying);

\copy post_preference from 'C:\Users\SalauddinKhan\Desktop\CGL 2024\cgl2024optionpreference.csv' csv header;--COPY 113632

select count(distinct regno) from post_preference;--113628
select count(distinct rollno) from post_preference;--113628


---vacancy converter---------

create table vacancy_table as (
select 
postcode as post_code,
nameofdepartment as department,
postname as post,
agelimit as age_limit,
'UR' as category,
'9' as category_code,
paylevel as pay_level,
postclassification as post_classification,
cpt_dest,
ur as initial_vacancy from vacancy
union all

select 
postcode as post_code,
nameofdepartment as department,
postname as post,
agelimit as age_limit,
'SC' as category,
'1' as category_code,
paylevel as pay_level,
postclassification as post_classification,
cpt_dest,
sc as initial_vacancy from vacancy
union all

select 
postcode as post_code,
nameofdepartment as department,
postname as post,
agelimit as age_limit,
'ST' as category,
'2' as category_code,
paylevel as pay_level,
postclassification as post_classification,
cpt_dest,
st as initial_vacancy from vacancy
union all

select 
postcode as post_code,
nameofdepartment as department,
postname as post,
agelimit as age_limit,
'EWS' as category,
'0' as category_code,
paylevel as pay_level,
postclassification as post_classification,
cpt_dest,
ews as initial_vacancy from vacancy
union all

select 
postcode as post_code,
nameofdepartment as department,
postname as post,
agelimit as age_limit,
'OBC' as category,
'6' as category_code,
paylevel as pay_level,
postclassification as post_classification,
cpt_dest,
obc as initial_vacancy from vacancy
union all

select 
postcode as post_code,
nameofdepartment as department,
postname as post,
agelimit as age_limit,
'OH' as category,
'4' as category_code,
paylevel as pay_level,
postclassification as post_classification,
cpt_dest,
oh as initial_vacancy from vacancy
union all

select 
postcode as post_code,
nameofdepartment as department,
postname as post,
agelimit as age_limit,
'HH' as category,
'5' as category_code,
paylevel as pay_level,
postclassification as post_classification,
cpt_dest,
hh as initial_vacancy from vacancy
union all

select 
postcode as post_code,
nameofdepartment as department,
postname as post,
agelimit as age_limit,
'VH' as category,
'7' as category_code,
paylevel as pay_level,
postclassification as post_classification,
cpt_dest,
vh as initial_vacancy from vacancy
union all

select 
postcode as post_code,
nameofdepartment as department,
postname as post,
agelimit as age_limit,
'Others' as category,
'8' as category_code,
paylevel as pay_level,
postclassification as post_classification,
cpt_dest,
other as initial_vacancy from vacancy
union all

	select 
postcode as post_code,
nameofdepartment as department,
postname as post,
agelimit as age_limit,
'ESM' as category,
'3' as category_code,
paylevel as pay_level,
postclassification as post_classification,
cpt_dest,
esm as initial_vacancy from vacancy
	);
	
	
select sum(initial_vacancy) from vacancy_table where category_code in ('0','1','2','6','9');---18174
select sum(initial_vacancy) from vacancy_table where category_code not in ('0','1','2','6','9');---1818

B14,B16,B17,B18,B24,B25,B30,B32,B37,B38,B40,B43
	
D01,D02,D03,D04,D06,D07,D09,D10,D11,D12,D13,D14,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27

B04,B09,B10,B12,B19,B20,B21,B23,B26,B27,B28,B31,B33,B34,B35,B36,B39,B41,B42,B44,C02
	
B05,B08,B11,B22,B34


-- Table: public.m_post_list

-- DROP TABLE IF EXISTS public.m_post_list;

CREATE TABLE IF NOT EXISTS public.m_post_list
(
    post_list_name text COLLATE pg_catalog."default" NOT NULL,
    posts text[] COLLATE pg_catalog."default",
    catsel_dob text COLLATE pg_catalog."default",
    catsel text COLLATE pg_catalog."default",
    merit text COLLATE pg_catalog."default",
    CONSTRAINT post_list_pk PRIMARY KEY (post_list_name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.m_post_list
    OWNER to postgres;

-----DEST exemption not allowed
	
'D08','D16','B03','B06','B07','B14','B16','B17','B18','B24','B25','B30','B32','B37','B38','B40','B43','D05'

in ('B19','B22','B31') and candidate_record.cat3 in ('4','5','7','8')

create table skilltest
(
asr_rollno character varying,
asr_region_code	character varying,
asr_date_appeared character varying,
asr_batch_no character varying,
asr_spelling_mistakes numeric,
asr_half_error numeric,
asr_misc_error numeric,
asr_punctuation_error numeric,
asr_paragraphic_error numeric,
asr_total_mistakes	numeric,
asr_no_of_word_original numeric,
asr_per_of_error numeric,
asr_stenograde character varying,
asr_remarks character varying
);

alter table skilltest add constraint pk_skill primary key(asr_rollno);


update candidates a
set
a.t2_math=b.ModuleIMathematicalAbilities,
a.t2_gi=b.ModuleIIReasoningandGeneralIntelligence,
a.t2p1s1scor =b.section1totalscore,
a.t2p1s1norm =b.normalized_score_section1,
a.t2p1s1 =b.normalized_score_section1,
a.t2_eng =b.ModuleIEnglishLanguageandComprehension,
a.t2_ga =b.ModuleIIGeneralAwareness,
a.t2p1s2scor =b.section2totalscore,
a.t2p1s2norm =b.normalized_score_section2,
a.t2p1s2 =b.normalized_score_section2,
a.ckt_marks =b.normalized_score_section3
from paper2_revised b where a.rollno=b.participantid;---153076 updates

--11 candidates marks present in statistics but not in paper2_revised

select * from candidates where t2p2 is not null and t2p1s2 is null;---11
"3009051306"
"2201026152"
"3015002530"
"3201003882"
"6016007271"
"7208030346"
"4205049051"
"9001003846"
"3206152813"
"7205026342"
"2201314053"

update candidates a
set
a.t2p2 =b.score
from statistics b where a.rollno=b.participantid;---9604 updates

select participantid from statistics where participantid not in(select rollno from candidates);---no such


alter table candidates add column dest_mistakes numeric;
alter table candidates add column dest_exempted text;

select * from candidates where t2p2 is not null and t2p1s2 is null;---11

update candidates a
set a.dest_mistakes=b.asr_per_of_error
from skilltest b where a.rollno=b.asr_rollno;---129615

--23472 candidates not given skilltest.

alter table candidates add column post_preference_original text;
alter table candidates add column post_preference text;

select count(*) from post_preference ;---113631

update candidates a
set a.post_preference_original=b.post_pref,
a.post_preference=b.post_pref
from post_preference b where a.regno=b.regno;---113564

select * from post_preference where regno='10009200745';---2 same records
select * from post_preference where regno='10010116436';---3 same records

select * from candidates where rollno='2201425296';---iska skilltest ka dekhna hei konsa record consider hoga

alter table candidates add column rej_prov character varying;
alter table candidates add column remarks character varying;


update candidates set rej_prov='D' where debarred='Yes';--38 
update candidates set rej_prov='C' where t2p1s2 is not null;---153076

C:\Users\Public\CGLE2024_Allocation_Final\CheckAllocation\checkalloc.csv
C:\Users\Public\CGLE2024_Allocation_Final\CheckNotAllocation\checknotalloc.csv

alter table candidates add column cand_name character varying;

update candidates set cand_name=name;
update candidates set cand_name=new_name where new_name is not null;---386

----merit-----

alter table candidates add column merit_all integer;
alter table candidates add column merit_r integer;


select distinct "isApplyingMoSPI","hasEQForMoSPI","isApplyingRGI","hasEQForRGI",count(*) from candidates where t2p2 is not null and t2p1s2 is not null
group by "isApplyingMoSPI","hasEQForMoSPI","isApplyingRGI","hasEQForRGI";---9590

false			false				3
false			true	"TRUE"		40
true	"TRUE"	false				7824
true	"TRUE"	true	"TRUE"		1726

select count(*) from candidates where rej_prov='C' and t2p2 is not null and t2p1s2 is not null and ("isApplyingMoSPI"=true or "isApplyingRGI"=true);---9590

select * from sp_get_merit('CGL',1);
--merit_all updated successfully for 153076 candidates

select * from sp_get_merit('CGL',2);
--merit_r updated successfully for 9590 candidates


update candidates
set post_preference=replace(post_preference,'B20,',''),
remarks=remarks||' CP not allowed in B20' where post_preference like '%B20%' and "isBenchmarkDisabilityOh"=true;---162

update candidates
set post_preference=replace(post_preference,',B20',''),
remarks=remarks||' CP not allowed in B20' where post_preference like '%B20%' and "isBenchmarkDisabilityOh"=true;---0

update candidates
set post_preference_original=replace(post_preference_original,'B20,','')
where post_preference_original like '%B20%' and "isBenchmarkDisabilityOh"=true;---162

update candidates
set post_preference_original=replace(post_preference_original,',B20','')
where post_preference_original like '%B20%' and "isBenchmarkDisabilityOh"=true;---0

---dest exempted---319 but found 317

'1004026591','1203007863','1203008805','1401030418','1408007773','1408010271','1408011685','2002003219','2002011144','2002015242','2002018500','2002020547','2002020590','2003015195','2003015279','2006003004','2006006072','2006015190','2201001729','2201004427','2201016900','2201038519','2201040726','2201046465','2201050104','2201058422','2201076308','2201076884','2201085440','2201085655','2201085817','2201093377','2201094823','2201109407','2201111248','2201112053','2201120996','2201121340','2201123069','2201123294','2201128189','2201130400','2201130522','2201147561','2201147572','2201154644','2201156642','2201158906','2201159155','2201168457','2201180717','2201183117','2201190393','2201192300','2201192358','2201194609','2201216342','2201219131','2201219199','2201219390','2201219621','2201224002','2201226106','2201228690','2201230479','2201231016','2201235694','2201240353','2201252587','2201262059','2201266892','2201267001','2201267281','2201276006','2201286033','2201299790','2201300074','2201302075','2201302315','2201302471','2201309060','2201309183','2201323828','2201323840','2201325497','2201335048','2201335494','2201342882','2201344629','2201358305','2201358552','2201365471','2201370284','2201370437','2201370488','2201379563','2201391548','2201395396','2201395537','2201402530','2201413472','2201413640','2201413774','2201425297','2201425304','2201439878','2201440030','2201045682','2401003891','2404012905','2405012374','2405021511','2405022961','2405023114','2405036135','2405036291','2405050724','2405053902','2405073672','2405073704','2405079139','2405084732','2405090332','2405092029','2405095972','2406008025','2406023774','2406028725','2406032656','3001001048','3001009333','3001013702','3001015736','3001022291','3001028670','3001039490','3001039561','3001045821','3001045850','3003011909','3003024613','3003034326','3003036635','3003043423','3003048326','3003050808','3003055876','3003058352','3003058391','3003058494','3003063490','3003083676','3005017749','3005017901','3005022018','3005034064','3007003360','3007007767','3007021237','3008001663','3008012084','3008012672','3009009344','3009037885','3009051918','3009055485','3009058879','3009073186','3009118147','3010005132','3010007359','3010020167','3010030978','3010037352','3010039583','3010042671','3010045991','3010049304','3010050400','3010052526','3010058947','3010072903','3010079310','3010084788','3010090954','3010091021','3010091161','3010092214','3010097604','3010108343','3011001525','3011005341','3011012803','3011014281','3011015292','3011017431','3011023549','3011028161','3011032159','3013060672','3013066323','3013074760','3013077545','3013100103','3201000513','3205019028','3206000150','3206024452','3206033230','3206038113','3206043903','3206047780','3206078096','3206097510','3206106086','3206120020','3206140110','3206157387','3206158525','3209011262','3209015851','3209017093','4205008435','4205015609','4205030779','4205042940','4205047087','4205055756','4205059401','4205064636','4206000495','4206002762','4206005115','4206011915','4207002130','4207009984','4207017784','4410008782','4410017663','4410034790','4410041289','4410045194','4410045920','4410048112','4410060960','4410062295','4410094104','4410098060','4410107532','4410110193','4410112808','4410120485','4410121643','4417000155','4417004841','4417005090','4417010606','4417010895','4417016405','4426001285','4605012827','4609009086','4609015586','5105020406','5501003416','5701000050','6001016896','6001037875','6001038986','6005003777','6005006142','6005010601','6005023002','6007008667','6007016667','6014002162','6015004863','6016004962','6016020477','6204013133','7001008297','7001012653','7002002608','7202016021','7204035692','7204035748','7204047791','7205004957','7205013784','7207000312','7207000703','7207005100','7208035340','7208037758','7208055255','7801000376','8003000207','8003004298','8004004532','8007002470','8009001950','8012012416','8201002682','8204008589','8207003611','8601012712','8601014329','8601017923','8601035062','8601035266','8601037840','8601067441','8601087563','8601128142','8603011273','9001018455','9001025128','9205000765','9211018688'

2201094823
2201323828
2201425297
2201045682
3005017749


update candidates set dest_mistakes='0',dest_exempted='Y'
where rollno in ('1004026591','1203007863','1203008805','1401030418','1408007773','1408010271','1408011685','2002003219','2002011144','2002015242','2002018500','2002020547','2002020590','2003015195','2003015279','2006003004','2006006072','2006015190','2201001729','2201004427','2201016900','2201038519','2201040726','2201046465','2201050104','2201058422','2201076308','2201076884','2201085440','2201085655','2201085817','2201093377','2201094823','2201109407','2201111248','2201112053','2201120996','2201121340','2201123069','2201123294','2201128189','2201130400','2201130522','2201147561','2201147572','2201154644','2201156642','2201158906','2201159155','2201168457','2201180717','2201183117','2201190393','2201192300','2201192358','2201194609','2201216342','2201219131','2201219199','2201219390','2201219621','2201224002','2201226106','2201228690','2201230479','2201231016','2201235694','2201240353','2201252587','2201262059','2201266892','2201267001','2201267281','2201276006','2201286033','2201299790','2201300074','2201302075','2201302315','2201302471','2201309060','2201309183','2201323828','2201323840','2201325497','2201335048','2201335494','2201342882','2201344629','2201358305','2201358552','2201365471','2201370284','2201370437','2201370488','2201379563','2201391548','2201395396','2201395537','2201402530','2201413472','2201413640','2201413774','2201425297','2201425304','2201439878','2201440030','2201045682','2401003891','2404012905','2405012374','2405021511','2405022961','2405023114','2405036135','2405036291','2405050724','2405053902','2405073672','2405073704','2405079139','2405084732','2405090332','2405092029','2405095972','2406008025','2406023774','2406028725','2406032656','3001001048','3001009333','3001013702','3001015736','3001022291','3001028670','3001039490','3001039561','3001045821','3001045850','3003011909','3003024613','3003034326','3003036635','3003043423','3003048326','3003050808','3003055876','3003058352','3003058391','3003058494','3003063490','3003083676','3005017749','3005017901','3005022018','3005034064','3007003360','3007007767','3007021237','3008001663','3008012084','3008012672','3009009344','3009037885','3009051918','3009055485','3009058879','3009073186','3009118147','3010005132','3010007359','3010020167','3010030978','3010037352','3010039583','3010042671','3010045991','3010049304','3010050400','3010052526','3010058947','3010072903','3010079310','3010084788','3010090954','3010091021','3010091161','3010092214','3010097604','3010108343','3011001525','3011005341','3011012803','3011014281','3011015292','3011017431','3011023549','3011028161','3011032159','3013060672','3013066323','3013074760','3013077545','3013100103','3201000513','3205019028','3206000150','3206024452','3206033230','3206038113','3206043903','3206047780','3206078096','3206097510','3206106086','3206120020','3206140110','3206157387','3206158525','3209011262','3209015851','3209017093','4205008435','4205015609','4205030779','4205042940','4205047087','4205055756','4205059401','4205064636','4206000495','4206002762','4206005115','4206011915','4207002130','4207009984','4207017784','4410008782','4410017663','4410034790','4410041289','4410045194','4410045920','4410048112','4410060960','4410062295','4410094104','4410098060','4410107532','4410110193','4410112808','4410120485','4410121643','4417000155','4417004841','4417005090','4417010606','4417010895','4417016405','4426001285','4605012827','4609009086','4609015586','5105020406','5501003416','5701000050','6001016896','6001037875','6001038986','6005003777','6005006142','6005010601','6005023002','6007008667','6007016667','6014002162','6015004863','6016004962','6016020477','6204013133','7001008297','7001012653','7002002608','7202016021','7204035692','7204035748','7204047791','7205004957','7205013784','7207000312','7207000703','7207005100','7208035340','7208037758','7208055255','7801000376','8003000207','8003004298','8004004532','8007002470','8009001950','8012012416','8201002682','8204008589','8207003611','8601012712','8601014329','8601017923','8601035062','8601035266','8601037840','8601067441','8601087563','8601128142','8603011273','9001018455','9001025128','9205000765','9211018688');


---provisionally alloted tier2 court CASE---

'1004005834','1004023718','1010003345','1010003913','1010006267','1401010369','1401014511','1401029973','1401043554','1401047119','1403002262','1403006802','1403015220','1404014831','1404020397','1408004611','1408011546','1801004819','1801005956','1801008866','1801011369','2002006215','2002007470','2002009181','2002011293','2002020253','2003001764','2003003760','2003004886','2003012755','2003013492','2003014227','2003015615','2003018737','2006011554','2006011895','2006015213','2201002890','2201005851','2201006110','2201010783','2201025370','2201028167','2201028912','2201031069','2201032665','2201035279','2201035722','2201039400','2201041656','2201048555','2201054227','2201055226','2201060600','2201061620','2201065549','2201067389','2201074050','2201087675','2201103908','2201104773','2201107437','2201110196','2201117333','2201126137','2201131635','2201137226','2201137978','2201144489','2201145478','2201146346','2201152488','2201158428','2201162694','2201165910','2201170040','2201180216','2201182823','2201183663','2201185388','2201189670','2201190425','2201193238','2201197315','2201198292','2201201934','2201202415','2201203167','2201205406','2201213106','2201215665','2201224898','2201227626','2201228874','2201229811','2201231123','2201231737','2201233882','2201235659','2201239562','2201239828','2201241436','2201241795','2201242627','2201242808','2201243824','2201244207','2201247227','2201251678','2201263990','2201268271','2201281754','2201289607','2201296619','2201301766','2201302749','2201303054','2201307019','2201307251','2201307282','2201312089','2201313424','2201314509','2201319568','2201321373','2201322112','2201328008','2201328445','2201330204','2201338458','2201339563','2201342923','2201343891','2201345313','2201345580','2201346560','2201347813','2201355918','2201357671','2201357947','2201358482','2201365571','2201374709','2201374743','2201383630','2201384696','2201395709','2201397786','2201401433','2201408717','2201409743','2201414960','2201415135','2201424479','2208008985','2208010687','2208012749','2208013290','2219004560','2401007205','2401009565','2401015366','2404001006','2404003719','2404005501','2404006965','2404014354','2404015657','2405001054','2405004091','2405013299','2405014075','2405016742','2405022355','2405046178','2405048354','2405049175','2405057782','2405063411','2405063622','2405065686','2405075479','2405077452','2405093998','2405094426','2405097115','2405097746','2405099233','2405099310','2405101904','2406001390','2406002002','2406006953','2406026355','2406027991','3001037665','3001038631','3002002295','3002006555','3003001694','3003005835','3003031988','3003045920','3003047471','3003071815','3003075945','3003076364','3003080237','3003081123','3003086971','3005002701','3005004321','3005005600','3005008610','3005013689','3005027891','3007021214','3008008270','3008012768','3009001304','3009007484','3009007801','3009008115','3009011785','3009014274','3009020802','3009021154','3009061222','3009065819','3009066904','3009074724','3009077832','3009084632','3009092999','3009096991','3009102499','3009102755','3009102976','3009107079','3010000826','3010005346','3010010749','3010012736','3010027268','3010035697','3010036670','3010038021','3010051110','3010057275','3010069273','3010069581','3010079305','3010109131','3010113721','3011008137','3011014206','3011017395','3011020077','3011020641','3011027161','3011032368','3013004242','3013010798','3013017850','3013022611','3013025348','3013037221','3013062867','3013065374','3013065465','3013066564','3013069887','3013082803','3013092505','3013095408','3016002128','3016003491','3016006706','3016012084','3016014947','3201001834','3201004303','3201004398','3201014823','3201020351','3202000094','3203003355','3203007658','3203011241','3205000915','3206001151','3206002951','3206009798','3206014690','3206021266','3206032036','3206033440','3206035089','3206038453','3206042789','3206045632','3206052499','3206054738','3206063971','3206064712','3206067406','3206067671','3206069590','3206074716','3206075476','3206080256','3206091356','3206099661','3206115993','3206117805','3206123363','3206140542','3206150501','3206155589','3206171771','3207006308','3207007802','3209003725','3209016603','4205007595','4205020348','4205024044','4205027860','4205045838','4205046615','4205047439','4205048081','4205060160','4206005597','4206007488','4206020449','4206021515','4207007029','4207013780','4404003222','4404004692','4404010945','4404012590','4410014192','4410017629','4410032531','4410044920','4410076675','4410088952','4410092641','4410095890','4410123875','4415005377','4415022733','4415029947','4417000293','4417000940','4417010549','4426003989','4602006450','4604022038','4604037486','4609006457','4611006296','5105023222','6001005463','6001006995','6001030316','6001031618','6001032548','6001036121','6005001413','6005005203','6005011355','6005011489','6005014312','6005014791','6005016660','6005017897','6005018167','6005018962','6005024555','6006005022','6007000225','6007003143','6014006259','6016003118','6016003157','6016003618','6016005405','6016005846','6016009324','6016014554','6016021603','6016022402','6016022894','6204009696','6204014688','6204015828','6204016899','7001005872','7001008902','7001022505','7007007080','7012005676','7204006578','7204010906','7204011077','7204011825','7205013963','7205029707','7208047753','8007015170','8008027085','8201003645','8201005723','8201005853','8201014455','8201051529','8202003375','8603001754','8603004010','9001017266','9002013085','9206010709','9211020135','9213016688'

update candidates 
set rej_prov='W',
remarks=remarks||' Court Case' 
where rollno in ('1004005834','1004023718','1010003345','1010003913','1010006267','1401010369','1401014511','1401029973','1401043554','1401047119','1403002262','1403006802','1403015220','1404014831','1404020397','1408004611','1408011546','1801004819','1801005956','1801008866','1801011369','2002006215','2002007470','2002009181','2002011293','2002020253','2003001764','2003003760','2003004886','2003012755','2003013492','2003014227','2003015615','2003018737','2006011554','2006011895','2006015213','2201002890','2201005851','2201006110','2201010783','2201025370','2201028167','2201028912','2201031069','2201032665','2201035279','2201035722','2201039400','2201041656','2201048555','2201054227','2201055226','2201060600','2201061620','2201065549','2201067389','2201074050','2201087675','2201103908','2201104773','2201107437','2201110196','2201117333','2201126137','2201131635','2201137226','2201137978','2201144489','2201145478','2201146346','2201152488','2201158428','2201162694','2201165910','2201170040','2201180216','2201182823','2201183663','2201185388','2201189670','2201190425','2201193238','2201197315','2201198292','2201201934','2201202415','2201203167','2201205406','2201213106','2201215665','2201224898','2201227626','2201228874','2201229811','2201231123','2201231737','2201233882','2201235659','2201239562','2201239828','2201241436','2201241795','2201242627','2201242808','2201243824','2201244207','2201247227','2201251678','2201263990','2201268271','2201281754','2201289607','2201296619','2201301766','2201302749','2201303054','2201307019','2201307251','2201307282','2201312089','2201313424','2201314509','2201319568','2201321373','2201322112','2201328008','2201328445','2201330204','2201338458','2201339563','2201342923','2201343891','2201345313','2201345580','2201346560','2201347813','2201355918','2201357671','2201357947','2201358482','2201365571','2201374709','2201374743','2201383630','2201384696','2201395709','2201397786','2201401433','2201408717','2201409743','2201414960','2201415135','2201424479','2208008985','2208010687','2208012749','2208013290','2219004560','2401007205','2401009565','2401015366','2404001006','2404003719','2404005501','2404006965','2404014354','2404015657','2405001054','2405004091','2405013299','2405014075','2405016742','2405022355','2405046178','2405048354','2405049175','2405057782','2405063411','2405063622','2405065686','2405075479','2405077452','2405093998','2405094426','2405097115','2405097746','2405099233','2405099310','2405101904','2406001390','2406002002','2406006953','2406026355','2406027991','3001037665','3001038631','3002002295','3002006555','3003001694','3003005835','3003031988','3003045920','3003047471','3003071815','3003075945','3003076364','3003080237','3003081123','3003086971','3005002701','3005004321','3005005600','3005008610','3005013689','3005027891','3007021214','3008008270','3008012768','3009001304','3009007484','3009007801','3009008115','3009011785','3009014274','3009020802','3009021154','3009061222','3009065819','3009066904','3009074724','3009077832','3009084632','3009092999','3009096991','3009102499','3009102755','3009102976','3009107079','3010000826','3010005346','3010010749','3010012736','3010027268','3010035697','3010036670','3010038021','3010051110','3010057275','3010069273','3010069581','3010079305','3010109131','3010113721','3011008137','3011014206','3011017395','3011020077','3011020641','3011027161','3011032368','3013004242','3013010798','3013017850','3013022611','3013025348','3013037221','3013062867','3013065374','3013065465','3013066564','3013069887','3013082803','3013092505','3013095408','3016002128','3016003491','3016006706','3016012084','3016014947','3201001834','3201004303','3201004398','3201014823','3201020351','3202000094','3203003355','3203007658','3203011241','3205000915','3206001151','3206002951','3206009798','3206014690','3206021266','3206032036','3206033440','3206035089','3206038453','3206042789','3206045632','3206052499','3206054738','3206063971','3206064712','3206067406','3206067671','3206069590','3206074716','3206075476','3206080256','3206091356','3206099661','3206115993','3206117805','3206123363','3206140542','3206150501','3206155589','3206171771','3207006308','3207007802','3209003725','3209016603','4205007595','4205020348','4205024044','4205027860','4205045838','4205046615','4205047439','4205048081','4205060160','4206005597','4206007488','4206020449','4206021515','4207007029','4207013780','4404003222','4404004692','4404010945','4404012590','4410014192','4410017629','4410032531','4410044920','4410076675','4410088952','4410092641','4410095890','4410123875','4415005377','4415022733','4415029947','4417000293','4417000940','4417010549','4426003989','4602006450','4604022038','4604037486','4609006457','4611006296','5105023222','6001005463','6001006995','6001030316','6001031618','6001032548','6001036121','6005001413','6005005203','6005011355','6005011489','6005014312','6005014791','6005016660','6005017897','6005018167','6005018962','6005024555','6006005022','6007000225','6007003143','6014006259','6016003118','6016003157','6016003618','6016005405','6016005846','6016009324','6016014554','6016021603','6016022402','6016022894','6204009696','6204014688','6204015828','6204016899','7001005872','7001008902','7001022505','7007007080','7012005676','7204006578','7204010906','7204011077','7204011825','7205013963','7205029707','7208047753','8007015170','8008027085','8201003645','8201005723','8201005853','8201014455','8201051529','8202003375','8603001754','8603004010','9001017266','9002013085','9206010709','9211020135','9213016688');
;

select count(*) from candidates where post_preference is not null and dest_mistakes is null;---3322

update candidates
set rej_prov ='R',
remarks =remarks||' Dest mistakes not available but Dest is Mandatory' 
where dest_mistakes is null;---23157


select * from candidates where dest_mistakes is null;----23157

select * from candidates where dest_mistakes is null and post_preference_original is not null;----3322

----cutoff_flag----

alter table candidates add column cutoff_flag_jso character varying;
alter table candidates add column cutoff_flag_all character varying;
alter table candidates add column cutoff_flag_cpt character varying;
alter table candidates add column cutoff_flag_dest character varying;
alter table candidates add column cutoff_flag_si character varying;



'1004026591', '1203007863', '1203008805', '1401030418', '1408007773', '1408010271', '1408011685', '2002003219', '2002011144', '2002015242', '2002018500', '2002020547', '2002020590', '2003015195', '2003015279', '2006003004', '2006006072', '2006015190', '2201001729', '2201004427', '2201016900', '2201038519', '2201040726', '2201046465', '2201050104', '2201058422', '2201076308', '2201076884', '2201085440', '2201085655', '2201085817', '2201093377', '2201094823', '2201109407', '2201111248', '2201112053', '2201120996', '2201121340', '2201123069', '2201123294', '2201128189', '2201130400', '2201130522', '2201147561', '2201147572', '2201154644', '2201156642', '2201158906', '2201159155', '2201168457', '2201180717', '2201183117', '2201190393', '2201192300', '2201192358', '2201194609', '2201216342', '2201219131', '2201219199', '2201219390', '2201219621', '2201224002', '2201226106', '2201228690', '2201230479', '2201231016', '2201235694', '2201240353', '2201252587', '2201262059', '2201266892', '2201267001', '2201267281', '2201276006', '2201286033', '2201299790', '2201300074', '2201302075', '2201302315', '2201302471', '2201309060', '2201309183', '2201323828', '2201323840', '2201325497', '2201335048', '2201335494', '2201342882', '2201344629', '2201358305', '2201358552', '2201365471', '2201370284', '2201370437', '2201370488', '2201379563', '2201391548', '2201395396', '2201395537', '2201402530', '2201413472', '2201413640', '2201413774', '2201425297', '2201425304', '2201439878', '2201440030', '2201045682', '2401003891', '2404012905', '2405012374', '2405021511', '2405022961', '2405023114', '2405036135', '2405036291', '2405050724', '2405053902', '2405073672', '2405073704', '2405079139', '2405084732', '2405090332', '2405092029', '2405095972', '2406008025', '2406023774', '2406028725', '2406032656', '3001001048', '3001009333', '3001013702', '3001015736', '3001022291', '3001028670', '3001039490', '3001039561', '3001045821', '3001045850', '3003011909', '3003024613', '3003034326', '3003036635', '3003043423', '3003048326', '3003050808', '3003055876', '3003058352', '3003058391', '3003058494', '3003063490', '3003083676', '3005017749', '3005017901', '3005022018', '3005034064', '3007003360', '3007007767', '3007021237', '3008001663', '3008012084', '3008012672', '3009009344', '3009037885', '3009051918', '3009055485', '3009058879', '3009073186', '3009118147', '3010005132', '3010007359', '3010020167', '3010030978', '3010037352', '3010039583', '3010042671', '3010045991', '3010049304', '3010050400', '3010052526', '3010058947', '3010072903', '3010079310', '3010084788', '3010090954', '3010091021', '3010091161', '3010092214', '3010097604', '3010108343', '3011001525', '3011005341', '3011012803', '3011014281', '3011015292', '3011017431', '3011023549', '3011028161', '3011032159', '3013060672', '3013066323', '3013074760', '3013077545', '3013100103', '3201000513', '3205019028', '3206000150', '3206024452', '3206033230', '3206038113', '3206043903', '3206047780', '3206078096', '3206097510', '3206106086', '3206120020', '3206140110', '3206157387', '3206158525', '3209011262', '3209015851', '3209017093', '4205008435', '4205015609', '4205030779', '4205042940', '4205047087', '4205055756', '4205059401', '4205064636', '4206000495', '4206002762', '4206005115', '4206011915', '4207002130', '4207009984', '4207017784', '4410008782', '4410017663', '4410034790', '4410041289', '4410045194', '4410045920', '4410048112', '4410060960', '4410062295', '4410094104', '4410098060', '4410107532', '4410110193', '4410112808', '4410120485', '4410121643', '4417000155', '4417004841', '4417005090', '4417010606', '4417010895', '4417016405', '4426001285', '4605012827', '4609009086', '4609015586', '5105020406', '5501003416', '5701000050', '6001016896', '6001037875', '6001038986', '6005003777', '6005006142', '6005010601', '6005023002', '6007008667', '6007016667', '6014002162', '6015004863', '6016004962', '6016020477', '6204013133', '7001008297', '7001012653', '7002002608', '7202016021', '7204035692', '7204035748', '7204047791', '7205004957', '7205013784', '7207000312', '7207000703', '7207005100', '7208035340', '7208037758', '7208055255', '7801000376', '8003000207', '8003004298', '8004004532', '8007002470', '8009001950', '8012012416', '8201002682', '8204008589', '8207003611', '8601012712', '8601014329', '8601017923', '8601035062', '8601035266', '8601037840', '8601067441', '8601087563', '8601128142', '8603011273', '9001018455', '9001025128', '9205000765', '9211018688'

---cut of flag-----

select * from sp_get_cut_off('CGL',13);--jso

select * from sp_get_cut_off('CGL',14);--all

select * from sp_get_cut_off('CGL',15);--cpt

select * from sp_get_cut_off('CGL',16);--dest

select * from sp_get_cut_off('CGL',17);--si

----catsel flag---

alter table candidates add column catsel_cpt_18_27 character varying;
alter table candidates add column catsel_cpt_18_30 character varying;
alter table candidates add column catsel_cpt_20_30 character varying;
alter table candidates add column catsel_dest_18_27 character varying;
alter table candidates add column catsel_all_18_27 character varying;
alter table candidates add column catsel_all_18_30 character varying;
alter table candidates add column catsel_all_20_30 character varying;
alter table candidates add column catsel_all_it_18_30 character varying;
alter table candidates add column catsel_jso_18_32 character varying;
alter table candidates add column catsel_si_18_30 character varying;

select * from sp_get_catsel('CGL',18);
select * from sp_get_catsel('CGL',19);
select * from sp_get_catsel('CGL',20);
select * from sp_get_catsel('CGL',21);
select * from sp_get_catsel('CGL',22);
select * from sp_get_catsel('CGL',23);
select * from sp_get_catsel('CGL',24);
select * from sp_get_catsel('CGL',28);
select * from sp_get_catsel('CGL',29);

do
$$

begin

Alter table vacancy_table add column current integer;
Alter table vacancy_table add column allocated integer;
Alter table vacancy_table add column left_vacancy integer;
Alter table vacancy_table add column allocated_oh integer;
Alter table vacancy_table add column allocated_hh integer;
Alter table vacancy_table add column allocated_vh integer;
Alter table vacancy_table add column allocated_ph_others integer;
Alter table vacancy_table add column allocated_esm integer;
Alter table vacancy_table add column lowest_total numeric;
Alter table vacancy_table add column lowest_additional_paper numeric;
Alter table vacancy_table add column lowest_t2p1s1 numeric;
Alter table vacancy_table add column lowest_dob date;
Alter table vacancy_table add column max_merit integer;

end
$$

update vacancy_table
set current=initial_vacancy;

update vacancy_table
set allocated_oh ='0',
allocated_hh ='0',
allocated_vh ='0',
allocated_ph_others ='0',
allocated_esm ='0';

update vacancy_table
set left_vacancy =current;

update vacancy_table
set allocated ='0';

do
$$
BEGIN

Alter table candidates add column allocated_category_r character varying(10) COLLATE pg_catalog."default";
Alter table candidates add column allocated_post_r character varying(10) COLLATE pg_catalog."default";
Alter table candidates add column allocated_against_ur_r character varying(5) COLLATE pg_catalog."default";
Alter table candidates add column allocated_preference_position_r integer;
Alter table candidates add column allocated_category_all character varying(5) COLLATE pg_catalog."default";
Alter table candidates add column allocated_post_all character varying(5) COLLATE pg_catalog."default";
Alter table candidates add column allocated_against_ur_all character varying(5) COLLATE pg_catalog."default";
Alter table candidates add column allocated_preference_position_all integer;
Alter table candidates add column alloc_rejection_reason text COLLATE pg_catalog."default";
Alter table candidates add column allocated_post character varying(10) COLLATE pg_catalog."default";
Alter table candidates add column allocated_category character varying(10) COLLATE pg_catalog."default";
Alter table candidates add column allocated_position integer;
Alter table candidates add column allocated_against_ur character varying(5) COLLATE pg_catalog."default";

end
$$



select sum(allocated) from vacancy_table;--0
select sum(initial_vacancy),sum(current) from vacancy_table;---19992,19992
select sum(initial_vacancy),sum(current) from vacancy_table where category_code in ('1','2','6','0','9');---18174,18174
select sum(initial_vacancy),sum(current) from vacancy_table where category_code in ('4','5','7','8','3');---1818,1818


-----------------allocation-------------------------------

-- DROP INDEX IF EXISTS public.candidates_alloc_key_indx;

CREATE INDEX IF NOT EXISTS candidates_alloc_key_indx
    ON public.candidates USING btree
    (allocated_category COLLATE pg_catalog."default" ASC NULLS LAST, allocated_post COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX IF NOT EXISTS candidates_alloc_key_indx_r
    ON public.candidates USING btree
    (allocated_category_r COLLATE pg_catalog."default" ASC NULLS LAST, allocated_post_r COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
	
CREATE INDEX IF NOT EXISTS candidates_alloc_key_indx_all
    ON public.candidates USING btree
    (allocated_category_all COLLATE pg_catalog."default" ASC NULLS LAST, allocated_post_all COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;	

select * from sp_get_allocation_r('CGL',31);--allocated_r updated successfully for 851 candidates

select * from sp_get_allocation_all('CGL',32);---allocated_all updated successfully for 19139 candidates


select SUM(initial_vacancy),sum(current) from vacancy_table where post_code in ('C01','C02');---263,263

select count(*) from candidates where allocated_post_r is not null;---851
select count(*) from candidates where allocated_post_all is not null;---19139



-------------------------- ROUND 1 ----------------------------------------------------------------------

select * from candidates limit 5;

select 
count(1) filter( where allocated_preference_position_r=1 and allocated_post_r in ('C01','C02')) as jso_1st_position,
count(1) filter (where allocated_preference_position_all=1 and allocated_post_all is not null) as all_1st_position,
count(1) filter (where  allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<>1
     and allocated_preference_position_all<>1 and allocated_preference_position_r>allocated_preference_position_all) as "r>all",
count(1) filter (where allocated_category_all is not null and allocated_category_r is not null  
	and allocated_preference_position_r<allocated_preference_position_all and allocated_preference_position_r<>1 and allocated_preference_position_all<>1) as "r<all" 
from candidates ;

--------only R
select count(*) from candidates where allocated_post_r is not null and allocated_post_all is null;
--------only all
select count(*) from candidates where allocated_post_r is null and allocated_post_all is not null;
select count(*) from candidates where allocated_post_all is not null
---common in all--
select count(*) from candidates where allocated_post_r is not null and allocated_post_all is not null
select rollno,post_preference,allocated_preference_position_all,allocated_preference_position_r,allocated_preference_position_f from candidates where allocated_post_r is not null and allocated_post_f is not null and allocated_post_all is not null


select * into candidates_bkp1 from candidates;
select * into vacancy_table_bkp1 from vacancy_table;

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',35);---Total 114 vacancies updated

select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18198,0,18198

UPDATE public.candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;

----------------------------------------------- ROUND 2 ----------------------------------------------------------------------
select * from vacancy_table order by post_code,category_code;

select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 819 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 17376 candidates

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',35);--Total 114 vacancies updated

UPDATE public.candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;

select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18189,0,18189

update candidates set post_preference=post_preference_original 
 where rollno in ('9205011447','9211003449','3009105606','3206109454','3206109454','8201034442','2201367999','3206029797','3206029797','2201360026','2201360026','2405060038','9211003046','4410019334'
);

update candidates set post_preference=post_preference_original 
where rollno in('2201394145','2201190393','2201343218','8008024475','4410052706','4410014570');

update candidates set post_preference=post_preference_original where rollno in('3013054335','2201398441','1408011135','3206115505','2201216864');


----------------------------------------- round 3 ---------------------------------------------------------------------------------------

select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 814 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 17372 candidates

select * from sp_copy_post_preference();

select count(*) from candidates where allocated_post_r is not null;--814
select count(*) from candidates where allocated_post_all is not null;--17372

--all okay

2201394145,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 119262
2201190393,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 121506
2201343218,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 123872
8008024475,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 123904
4410052706,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 125245
4410014570,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 127228

1408011135,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 124575
3206115505,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 125410
2201216864,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 126160

---r<all

select rollno from candidates where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C01';---131
 
select rollno from candidates where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C02';---3
 
update candidates set post_preference='C01' where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C01';--131
 
update candidates set post_preference='C02' where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C02';---3

select * from sp_adjust_vacancy('CGL',35);---Total 113 vacancies updated

UPDATE candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;

select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18187,0,18187

----------------------------------------------- round 4 ---------------------------------------------------------------------------------
select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 811 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 17373 candidates

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',35);

UPDATE candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;
	
update candidates set post_preference='C01' where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C01';

select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18177,0,18177


-------------------------------------------------- round 5 --------------------------------------------------------------------------------------

select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 810 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 17364 candidates

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',35);---Total 115 vacancies updated

UPDATE candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;

select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18177,0,18177
	
	
--------------------------------------------- round 6 --------------------------------------------------------------------------------------------------

select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 810 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 17364 candidates

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',35);---Total 115 vacancies updated

UPDATE candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;

select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18177,0,18177


---------------------------------------------- round 7 -----------------------------------------------------------------------------------------------------------

select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 810 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 17364 candidates

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',35);---Total 115 vacancies updated

select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18177,0,18177

UPDATE candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;
-------------------------------------------------------------------------------------------------------------------------------

select rollno,name,merit_all,merit_f,post_preference,allocated_preference_position_f,allocated_preference_position_all from 
candidates where allocated_category_all is not null and allocated_category_f is not null and allocated_Category_r is null 
and allocated_preference_position_f>allocated_preference_position_all and allocated_preference_position_f<>1 and allocated_preference_position_all<>1

select rollno,name,merit_all,merit_f,post_preference,allocated_preference_position_f,allocated_preference_position_all from 
candidates where allocated_category_all is not null and allocated_category_f is not null and allocated_Category_r is null 
and allocated_preference_position_f<allocated_preference_position_all and allocated_preference_position_f<>1 and allocated_preference_position_all<>1

update candidates set post_preference=allocated_post_f  
where allocated_category_all is not null and allocated_category_f is not null and allocated_Category_r is null 
and allocated_preference_position_f<allocated_preference_position_all and allocated_preference_position_f<>1 and allocated_preference_position_all<>1


select rollno,name,post_preference,allocated_preference_position_r,allocated_preference_position_all from candidates 
where allocated_category_all is not null and allocated_category_r is not null and allocated_category_f is null 
and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1

update candidates set post_preference='C34' 
where allocated_category_all is not null and allocated_category_r is not null and allocated_category_f is null 
and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1

update candidates set post_preference=post_preference_original where rollno::bigint in
(8206001211)

select * from candidates where rollno='8206001211'



-------------------------------------------------------------------------------------------------------------------------------------------



select merit_all from candidates where rollno='7001002726'
select * from candidates where allocated_post_r is not null
select * from vacancy_table where left_vacancy<0
select sum(allocated) from vacancy_table_bkp_11052023_1105pm_2ndround where post_code in ('C34')


select 
select * from vacancy_table_bkp_11052023_1105pm_2ndround where current<>initial_vacancy

select * from master_table order by serial

select * from candidates limit 10

select * from vacancy_table where post_code='C34'


select * from candidates where allocated_against_ur='1'

select * from candidates where rollno in ('3009111365','3001002896')

select * from master_table order by serial

select * from vacancy_table where left_vacancy>0

select count(*) from candidates inner join candidates_bkp_13052023_428pm_2ndround on 
candidates.rollno=candidates_bkp_13052023_428pm_2ndround.rollno
and (candidates.allocated_category<>candidates_bkp_13052023_428pm_2ndround.allocated_category
or candidates.allocated_post<>candidates_bkp_13052023_428pm_2ndround.allocated_post) -- 12

select count(*) from candidates inner join candidates_bkp_13052023_224pm_2ndround on 
candidates.rollno=candidates_bkp_13052023_224pm_2ndround.rollno
where candidates.allocated_category is not null and candidates_bkp_13052023_224pm_2ndround.allocated_category is not null
and (candidates.allocated_category||candidates.allocated_post)<>(candidates_bkp_13052023_224pm_2ndround.allocated_category||candidates_bkp_13052023_224pm_2ndround.allocated_post) -- 68



select count(*) from candidates inner join candidates_bkp_13052023_224pm_2ndround on 
candidates.rollno=candidates_bkp_13052023_224pm_2ndround.rollno
where candidates.allocated_category is null and candidates_bkp_13052023_224pm_2ndround.allocated_category is not null-- 6

select count(*) from candidates inner join candidates_bkp_13052023_224pm_2ndround on 
candidates.rollno=candidates_bkp_13052023_224pm_2ndround.rollno
where candidates.allocated_category is not null and candidates_bkp_13052023_224pm_2ndround.allocated_category is null -- 6




select count(*) from candidates inner join candidates_bkp_13052023_428pm_2ndround on 
candidates.rollno=candidates_bkp_13052023_428pm_2ndround.rollno
and (candidates.allocated_category<>candidates_bkp_13052023_428pm_2ndround.allocated_category
and candidates.allocated_post=candidates_bkp_13052023_428pm_2ndround.allocated_post)





select count(*) from 

select * from sp_copy_post_preference()

select rollno,allocated_category||allocated_post from candidates where allocated_category is not null

select * from vacancy_table where post_code='B24'

select * from candidates where allocated_post='B24' and allocated_category='3'

select * into candidates_bkp_13052023_626pm_2ndround from candidates
select * into vacancy_table_bkp_13052023_626pm_2ndround from vacancy_table
select * from function_pref_check_and_update()

UPDATE public.candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_f=null, allocated_post_f=null, allocated_against_ur_f=null, allocated_preference_position_f=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null
	
select * from vacancy_table where post_code in ('A01','A02')
	

('D08','D16','B03','B06','B07','B14','B16','B17','B18','B24','B25','B30','B32','B37','B38','B40','B43','D05') and candidate_record.dest_exempted='Y')) then
9205011447,Wrong Allocation- keyvalue - 9C01 Last Merit- 555 candidate merit name - merit_r candidate merit- 163
9211003449,Wrong Allocation- keyvalue - 9C01 Last Merit- 555 candidate merit name - merit_r candidate merit- 75
3009105606,Wrong Allocation- keyvalue - 0C01 Last Merit- 825 candidate merit name - merit_r candidate merit- 125
3206109454,Wrong Allocation- keyvalue - 9C01 Last Merit- 555 candidate merit name - merit_r candidate merit- 131
3206109454,Wrong Allocation- keyvalue - 0C01 Last Merit- 825 candidate merit name - merit_r candidate merit- 131
8201034442,Wrong Allocation- keyvalue - 6C01 Last Merit- 1010 candidate merit name - merit_r candidate merit- 881
2201367999,Wrong Allocation- keyvalue - 6C01 Last Merit- 1010 candidate merit name - merit_r candidate merit- 559
3206029797,Wrong Allocation- keyvalue - 9C01 Last Merit- 555 candidate merit name - merit_r candidate merit- 447
3206029797,Wrong Allocation- keyvalue - 6C01 Last Merit- 1010 candidate merit name - merit_r candidate merit- 447
2201360026,Wrong Allocation- keyvalue - 9C01 Last Merit- 555 candidate merit name - merit_r candidate merit- 97
2201360026,Wrong Allocation- keyvalue - 6C01 Last Merit- 1010 candidate merit name - merit_r candidate merit- 97
2405060038,Wrong Allocation- keyvalue - 6C01 Last Merit- 1010 candidate merit name - merit_r candidate merit- 417
9211003046,Wrong Allocation- keyvalue - 6C01 Last Merit- 1010 candidate merit name - merit_r candidate merit- 829
4410019334,Wrong Allocation- keyvalue - 9C01 Last Merit- 555 candidate merit name - merit_r candidate merit- 252


'9205011447','9211003449','3009105606','3206109454','3206109454','8201034442','2201367999','3206029797','3206029797','2201360026','2201360026','2405060038','9211003046','4410019334'


2201394145,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 119262
2201190393,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 121506
2201343218,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 123872
8008024475,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 123904
4410052706,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 125245
4410014570,Wrong Allocation- keyvalue - 8D26 Last Merit- 128202 candidate merit name - merit_all candidate merit- 127228

---------------------reproceesed round 1-------------------------------

select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 851 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 19139 candidates

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',35);--Total 114 vacancies updated

--r<all

select rollno from candidates where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C01';---142
 
select rollno from candidates where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C02';---10
 
update candidates set post_preference='C01' where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C01';--142
 
update candidates set post_preference='C02' where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C02';---10

UPDATE public.candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;
	
------------------------ round 2 -------------------------------------------------	

select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 819 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 17376 candidates

select * from sp_copy_post_preference();

rollno='9205011447';
rollno='9211003449';
rollno='3009105606';
rollno='3206109454';
rollno='8201034442';
rollno='2201367999';
rollno='3206029797';
rollno='2201360026';
rollno='3203005727';
rollno='2201023095';
rollno='2405060038';
rollno='4415028573';
rollno='9211003046';
rollno='9009018539';
rollno='4410019334';
rollno='2401005832';
rollno='3013054335';
rollno='2201398441';

select rollno from candidates where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C01';---44
 
select rollno from candidates where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C02';---2
 
update candidates set post_preference='C01' where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C01';--44
 
update candidates set post_preference='C02' where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C02';---2

select * from sp_adjust_vacancy('CGL',35);--Total 114 vacancies updated

select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18182,0,18182

------------------------------ round 3 --------------------------------

select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 814 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 17365 candidates

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',35);--Total 114 vacancies updated

select rollno from candidates where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C01';---24
 
select rollno from candidates where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C02';---0
 
update candidates set post_preference='C01' where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C01';--24
 
update candidates set post_preference='C02' where allocated_category_all is not null and allocated_category_r is not null and allocated_preference_position_r<allocated_preference_position_all
and allocated_preference_position_r<>1 and allocated_preference_position_all<>1 and allocated_post_r='C02';---0

select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18181,0,18181


UPDATE public.candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;
	
------------------------------- round 4 ---------------------------------------------------------------
select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 811 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 17367 candidates

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',35);--Total 114 vacancies updated

UPDATE public.candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;
	

select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18177,0,18177

---------------------------- round 5 --------------------------------------------
select * from sp_get_allocation_r('CGL',31);--allocation_r updated successfully for 810 candidates

select * from sp_get_allocation_all('CGL',32);--allocated_all updated successfully for 17364 candidates

select * from sp_copy_post_preference();

select * from sp_check_allocation('CGL',33);

select * from sp_check_notallocation('CGL',34);

select * from function_pref_check_and_update();

select * from sp_adjust_vacancy('CGL',35);--Total 115 vacancies updated

UPDATE public.candidates set 
	allocated_category_r=null, allocated_post_r=null, allocated_against_ur_r=null, allocated_preference_position_r=null,
	allocated_category_all=null, allocated_post_all=null, allocated_against_ur_all=null, allocated_preference_position_all=null,
	allocated_post=null, allocated_category=null, allocated_position=null, allocated_against_ur=null;
	
select SUM(initial_vacancy),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table ;---19992,18177,0,18177

------------- round 6 -----------------------------------------------------------------------------------------

cancelled/rejected---77

'3013168023','3206066438','3003139281','3206398861','3206153362','3003078721','3206033131','3206309179','3206108845','3003004189','3010160059','3013069388','3003055905','3203004321','3009160911','3206286362','3003108650','4207017370','4207012399','8204000044','8008000156','8201000129','8201001221','8601005695','8201002351','8601008969','8601010054','8601011105','8207002852','8010004408','8201006072','8007014454','8603004604','8603004678','8604004368','8601038838','8004012349','8603008536','8601044633','8603012165','8603012005','8604010999','8604016415','8604018256','8204003226','8008003991','8601017645','8601022982','8601023682','8007020813','8206005257','8601027291','8601027500','8604005107','8003008333','8603009085','8003011036','8601045291','8601048232','8603010315','8004016869','8601060588','8601062084','8004019603','8007051268','8601064398','8008023223','8004023036','8201029901','8004027729','8208013173','9010017406','9011001745','9001004338','9001039665','9001002962','9011001212'

select * from candidates_bkp_shared where rollno in ('3013168023','3206066438','3003139281','3206398861','3206153362','3003078721','3206033131','3206309179','3206108845','3003004189','3010160059','3013069388','3003055905','3203004321','3009160911','3206286362','3003108650','4207017370','4207012399','8204000044','8008000156','8201000129','8201001221','8601005695','8201002351','8601008969','8601010054','8601011105','8207002852','8010004408','8201006072','8007014454','8603004604','8603004678','8604004368','8601038838','8004012349','8603008536','8601044633','8603012165','8603012005','8604010999','8604016415','8604018256','8204003226','8008003991','8601017645','8601022982','8601023682','8007020813','8206005257','8601027291','8601027500','8604005107','8003008333','8603009085','8003011036','8601045291','8601048232','8603010315','8004016869','8601060588','8601062084','8004019603','8007051268','8601064398','8008023223','8004023036','8201029901','8004027729','8208013173','9010017406','9011001745','9001004338','9001039665','9001002962','9011001212');
---found only 8603009085
select 169.76307+153.95711;----323.72018

SUSPECTED/WITHHELD ---148

'1404001857','1404013718','1404017240','1404020729','1404021858','1401003089','1401005919','1401020741','1401024306','1401070376','1401089509','1004009179','1004011200','1004016465','1408014562','1408016101','1408016102','1408016614','1408023529','1408026008','1403005407','1403015364','1403023042','1010012476','1203011483','1007004247','2201528082','2201527318','7202027532','7202029566','7204004779','7204020304','7205013880','7207008430','7214013712','7204029326','7204026361','7204029601','7001007246','7202021308','7208015379','7208038924','7205040131','7204006674','7205043943','7208038215','7201026838','7201028056','7201013744','7201019609','7205006787','7205018657','8001008225','8001008610','8001009185','8001011580','8001011883','8003000046','8003000659','8003001562','8003003295','8003004498','8003005483','8003007693','8003021042','8003024152','8003025179','8007001920','8007009012','8007014885','8007022754','8007023084','8007023850','8007024371','8007028062','8007028203','8007032284','8007036134','8007037057','8007037928','8007038880','8007038981','8007039965','8007041127','8007042604','8007043853','8007044378','8007049272','8007050027','8007050055','8007052046','8007064736','8007067534','8007070173','8007071487','8007071601','8007078930','8007082837','8007083766','8008000245','8010006162','8010010572','8010013245','8010015872','8010018386','8010018832','8011007421','8201005424','8201008203','8201009340','8201018172','8201024478','8201040402','8202001146','8202011799','8204031588','8206004619','8208005031','8601006490','8601006860','8601008658','8601008930','8601011274','8601023060','8601024126','8601029238','8601033195','8601054709','8601060433','8601062035','8601062551','8601066105','8601066269','8601066363','8601067855','8601071913','8601081386','8601082236','8601087412','8601087791','8601099819','8601100741','8601101986','8601102298','8601106248','8604003108','8604010497','9001021208'

debarred---427

'1805030840','1408011988','2405018995','2201094829','2201114221','2201415415','2201381391','2201118288','2201000983','2201313859','2201026020','2201305166','2201457672','2201515010','2201466197','2201151964','2201304976','2201330821','2201277785','2201362476','2201068688','2201415401','2201489582','2201328579','2201362501','2201405511','2201228969','2201050274','2201209827','2201353956','2201328949','2201153713','2201188673','2201516870','2201177050','2201379643','2201043332','2201189918','2405017619','2201507081','2201035460','2201094800','2201413639','2201337160','2201235155','2201252339','2201126510','2201143893','2201337522','2201103172','2201405223','2201196693','2201444206','2201002174','2201215813','2201405466','2201102905','2201254634','2201092933','2201101244','2405070706','2201406424','2201506671','2201235525','2201287865','2201481401','2201207506','2201263103','2406052373','2201145632','2201209080','2201413561','2201287828','2201119764','2201034024','2201407302','2201000823','2201100866','2201286493','2201118392','2201457325','2201118433','2201339274','2201094235','2201169314','2201050317','2201353935','2201330104','2201209748','2201101466','2201356320','2201188671','2201288400','2201227396','2201143827','2201196407','2201413727','2201489701','2404026464','2201068865','2201153811','2201227092','2201127930','2201198913','2405150606','2201000888','2201075352','2201277922','2201151893','2201151625','2201152165','2201405406','2201043524','2201179478','2201049896','2201092731','2201169376','2201026061','2404022083','2201328880','2201481772','2201076035','2201067212','2201413671','2201515166','2201489835','2201355775','2201051554','2201439234','2201506512','2201279605','2201215905','2201254100','2201151600','2201313222','2404005930','2201190273','2201128425','2201432047','2201002385','2201208133','2201100950','2201102679','2201414976','2201067533','2201000497','2406050025','2201354588','2201092800','2406021426','2405053217','2201516575','2201489733','2201303765','2201051556','2201430533','2201406354','2201336918','2201188273','2201169239','2201177213','2201041945','2201517339','2201362851','2201456211','2201432526','2404013843','2201151709','2201288455','2201491462','2201092791','2201228483','2201465946','2404013622','2201229049','2201028209','2201190216','2201067569','2201050245','2201143720','2201491105','2405099446','2201209443','2201262852','2201517062','2201432505','2201514878','2404011097','2201177191','2201126793','2201067561','2201235716','2201304792','2201313577','2201101101','2405030625','2201491815','2201152052','2201465880','2201262884','2201107458','2201075729','2201177678','2201389528','2201489511','2201330906','2201328557','2201413223','2201010852','2201217414','2201262660','2201190274','2201228353','2201413550','2201094546','2201101266','2201260881','2201364443','2201483123','2201287617','2201252466','2201009337','2201026103','2201388208','2201464188','2201304981','2201517351','2405153356','2201337529','2201050440','2201235767','2406001275','2201077680','2201075463','2201093044','2201362489','2201430453','2201076041','2201027888','2201151604','2404016850','2201355626','2201456255','2201489628','2201033878','2201094746','2201028136','2201043214','2201120283','2201189996','2405090873','2201328515','2201482980','2201481791','2401024053','2201240526','2201172584','2201224433','2201019722','2201012239','2201392466','2201447300','2405168563','2201254635','2201207068','2201026985','2201123111','2201145143','2201481864','2201411649','2201161844','2201420288','2201003631','2201168324','2201208222','2201208901','2201263741','2406048756','2201116928','2201248970','2006000236','2201348302','2406043188','2405010676','2201391533','2201221153','2405103822','2201002965','2201508513','2201196809','2201288150','2201043267','2201216260','2201075692','2201491613','2201286527','2201126880','2201002548','2406035509','2406005703','2201188668','2201103031','2201101017','2405027524','2201152322','2201508142','2201119645','2201260995','2201077162','2201277854','2405159058','2201313022','2201328707','2201305483','2201389614','2201338847','2201311415','2201440824','2405159019','2006010629','2201508492','2201438899','2201404983','2201515273','2201052440','2201288298','2201405414','2201330175','2405018160','2405104919','2405090469','2201275329','2201122945','3001047879','3001051432','3001058423','3001074552','3007002632','3007053063','3008005022','3009122079','3009029942','3010206025','3010037200','3010108765','3010177853','3010001863','3010220407','3010005959','3010043068','3010185224','3010224125','3010202007','3010003611','3011005272','3011020092','3011022881','3011055376','3016003831','3016023061','3003029558','3003013949','3003054765','3003111938','3003025846','3003030295','3003068734','3003101704','3003075998','3003089518','3003060510','3003073851','3003100201','3003126769','3003126818','3003049354','3013198455','3013033132','3013002211','3013097864','3013117029','3201013442','3201018615','3203002504','3203015785','3203022410','3205007853','3205012324','3205027152','3205032995','3205035173','3206323355','3206062523','3206296093','3206366438','3206119340','3206204265','3206210521','3206093359','3206101859','3206409101','3206042610','3206103265','3209018140','6005028700','6016011248','6014001340','6001000296','6015008923','6016014318','6204030120','6001025365','6006048218','6001047228','6015004381','6005008345','6204006691','6014003970','6001037199','6015013495','6204021233','6005035699','9011000401','9005017403','9005000347','9009006037 ','9001005535'
---28 found out of which 4 were allocated

update candidates set rej_prov ='R'  where rollno in ('3013168023','3206066438','3003139281','3206398861','3206153362','3003078721','3206033131','3206309179','3206108845','3003004189','3010160059','3013069388','3003055905','3203004321','3009160911','3206286362','3003108650','4207017370','4207012399','8204000044','8008000156','8201000129','8201001221','8601005695','8201002351','8601008969','8601010054','8601011105','8207002852','8010004408','8201006072','8007014454','8603004604','8603004678','8604004368','8601038838','8004012349','8603008536','8601044633','8603012165','8603012005','8604010999','8604016415','8604018256','8204003226','8008003991','8601017645','8601022982','8601023682','8007020813','8206005257','8601027291','8601027500','8604005107','8003008333','8603009085','8003011036','8601045291','8601048232','8603010315','8004016869','8601060588','8601062084','8004019603','8007051268','8601064398','8008023223','8004023036','8201029901','8004027729','8208013173','9010017406','9011001745','9001004338','9001039665','9001002962','9011001212'
);

update candidates set rej_prov ='W'  where rollno in ('1404001857','1404013718','1404017240','1404020729','1404021858','1401003089','1401005919','1401020741','1401024306','1401070376','1401089509','1004009179','1004011200','1004016465','1408014562','1408016101','1408016102','1408016614','1408023529','1408026008','1403005407','1403015364','1403023042','1010012476','1203011483','1007004247','2201528082','2201527318','7202027532','7202029566','7204004779','7204020304','7205013880','7207008430','7214013712','7204029326','7204026361','7204029601','7001007246','7202021308','7208015379','7208038924','7205040131','7204006674','7205043943','7208038215','7201026838','7201028056','7201013744','7201019609','7205006787','7205018657','8001008225','8001008610','8001009185','8001011580','8001011883','8003000046','8003000659','8003001562','8003003295','8003004498','8003005483','8003007693','8003021042','8003024152','8003025179','8007001920','8007009012','8007014885','8007022754','8007023084','8007023850','8007024371','8007028062','8007028203','8007032284','8007036134','8007037057','8007037928','8007038880','8007038981','8007039965','8007041127','8007042604','8007043853','8007044378','8007049272','8007050027','8007050055','8007052046','8007064736','8007067534','8007070173','8007071487','8007071601','8007078930','8007082837','8007083766','8008000245','8010006162','8010010572','8010013245','8010015872','8010018386','8010018832','8011007421','8201005424','8201008203','8201009340','8201018172','8201024478','8201040402','8202001146','8202011799','8204031588','8206004619','8208005031','8601006490','8601006860','8601008658','8601008930','8601011274','8601023060','8601024126','8601029238','8601033195','8601054709','8601060433','8601062035','8601062551','8601066105','8601066269','8601066363','8601067855','8601071913','8601081386','8601082236','8601087412','8601087791','8601099819','8601100741','8601101986','8601102298','8601106248','8604003108','8604010497','9001021208'
);

update candidates set rej_prov ='D' where rollno in ('1805030840','1408011988','2405018995','2201094829','2201114221','2201415415','2201381391','2201118288','2201000983','2201313859','2201026020','2201305166','2201457672','2201515010','2201466197','2201151964','2201304976','2201330821','2201277785','2201362476','2201068688','2201415401','2201489582','2201328579','2201362501','2201405511','2201228969','2201050274','2201209827','2201353956','2201328949','2201153713','2201188673','2201516870','2201177050','2201379643','2201043332','2201189918','2405017619','2201507081','2201035460','2201094800','2201413639','2201337160','2201235155','2201252339','2201126510','2201143893','2201337522','2201103172','2201405223','2201196693','2201444206','2201002174','2201215813','2201405466','2201102905','2201254634','2201092933','2201101244','2405070706','2201406424','2201506671','2201235525','2201287865','2201481401','2201207506','2201263103','2406052373','2201145632','2201209080','2201413561','2201287828','2201119764','2201034024','2201407302','2201000823','2201100866','2201286493','2201118392','2201457325','2201118433','2201339274','2201094235','2201169314','2201050317','2201353935','2201330104','2201209748','2201101466','2201356320','2201188671','2201288400','2201227396','2201143827','2201196407','2201413727','2201489701','2404026464','2201068865','2201153811','2201227092','2201127930','2201198913','2405150606','2201000888','2201075352','2201277922','2201151893','2201151625','2201152165','2201405406','2201043524','2201179478','2201049896','2201092731','2201169376','2201026061','2404022083','2201328880','2201481772','2201076035','2201067212','2201413671','2201515166','2201489835','2201355775','2201051554','2201439234','2201506512','2201279605','2201215905','2201254100','2201151600','2201313222','2404005930','2201190273','2201128425','2201432047','2201002385','2201208133','2201100950','2201102679','2201414976','2201067533','2201000497','2406050025','2201354588','2201092800','2406021426','2405053217','2201516575','2201489733','2201303765','2201051556','2201430533','2201406354','2201336918','2201188273','2201169239','2201177213','2201041945','2201517339','2201362851','2201456211','2201432526','2404013843','2201151709','2201288455','2201491462','2201092791','2201228483','2201465946','2404013622','2201229049','2201028209','2201190216','2201067569','2201050245','2201143720','2201491105','2405099446','2201209443','2201262852','2201517062','2201432505','2201514878','2404011097','2201177191','2201126793','2201067561','2201235716','2201304792','2201313577','2201101101','2405030625','2201491815','2201152052','2201465880','2201262884','2201107458','2201075729','2201177678','2201389528','2201489511','2201330906','2201328557','2201413223','2201010852','2201217414','2201262660','2201190274','2201228353','2201413550','2201094546','2201101266','2201260881','2201364443','2201483123','2201287617','2201252466','2201009337','2201026103','2201388208','2201464188','2201304981','2201517351','2405153356','2201337529','2201050440','2201235767','2406001275','2201077680','2201075463','2201093044','2201362489','2201430453','2201076041','2201027888','2201151604','2404016850','2201355626','2201456255','2201489628','2201033878','2201094746','2201028136','2201043214','2201120283','2201189996','2405090873','2201328515','2201482980','2201481791','2401024053','2201240526','2201172584','2201224433','2201019722','2201012239','2201392466','2201447300','2405168563','2201254635','2201207068','2201026985','2201123111','2201145143','2201481864','2201411649','2201161844','2201420288','2201003631','2201168324','2201208222','2201208901','2201263741','2406048756','2201116928','2201248970','2006000236','2201348302','2406043188','2405010676','2201391533','2201221153','2405103822','2201002965','2201508513','2201196809','2201288150','2201043267','2201216260','2201075692','2201491613','2201286527','2201126880','2201002548','2406035509','2406005703','2201188668','2201103031','2201101017','2405027524','2201152322','2201508142','2201119645','2201260995','2201077162','2201277854','2405159058','2201313022','2201328707','2201305483','2201389614','2201338847','2201311415','2201440824','2405159019','2006010629','2201508492','2201438899','2201404983','2201515273','2201052440','2201288298','2201405414','2201330175','2405018160','2405104919','2405090469','2201275329','2201122945','3001047879','3001051432','3001058423','3001074552','3007002632','3007053063','3008005022','3009122079','3009029942','3010206025','3010037200','3010108765','3010177853','3010001863','3010220407','3010005959','3010043068','3010185224','3010224125','3010202007','3010003611','3011005272','3011020092','3011022881','3011055376','3016003831','3016023061','3003029558','3003013949','3003054765','3003111938','3003025846','3003030295','3003068734','3003101704','3003075998','3003089518','3003060510','3003073851','3003100201','3003126769','3003126818','3003049354','3013198455','3013033132','3013002211','3013097864','3013117029','3201013442','3201018615','3203002504','3203015785','3203022410','3205007853','3205012324','3205027152','3205032995','3205035173','3206323355','3206062523','3206296093','3206366438','3206119340','3206204265','3206210521','3206093359','3206101859','3206409101','3206042610','3206103265','3209018140','6005028700','6016011248','6014001340','6001000296','6015008923','6016014318','6204030120','6001025365','6006048218','6001047228','6015004381','6005008345','6204006691','6014003970','6001037199','6015013495','6204021233','6005035699','9011000401','9005017403','9005000347','9009006037 ','9001005535'
);	
	
	
select distinct rej_prov,count(*) from candidates group by rej_prov;
"C"	129474
"D"	66
"R"	23144
"W"	403

	
DO
$$
declare 

min_totalall numeric;
min_t2p1s1 numeric;
max_dob date;
max_merit_all integer;
vacancy_record record;

begin

for vacancy_record in execute 'select post_code, category_code from vacancy_table where post_code not in (''C01'',''C02'')'
loop

min_totalall =0;
min_t2p1s1 =0;
max_dob =null;
max_merit_all =0;


raise info '%,post_code ',vacancy_record.post_code;
raise info '%,category_code ',vacancy_record.category_code;

select coalesce(min(t2p1s1+t2p1s2),0) from candidates where  allocated_category=vacancy_record.category_code and allocated_post=vacancy_record.post_code into min_totalall;
raise info 'min_totalall %',min_totalall;

select coalesce(min (t2p1s1)::numeric, 0) from candidates where allocated_category=vacancy_record.category_code and allocated_post=vacancy_record.post_code and (t2p1s1+t2p1s2)=min_totalall into  min_t2p1s1;

raise info 'min_t2p1s1 %', min_t2p1s1;

select max (dob)  from candidates where allocated_category=vacancy_record.category_code and allocated_post=vacancy_record.post_code and (t2p1s1+t2p1s2)=min_totalall and t2p1s1=min_t2p1s1 into max_dob;
select max(merit_all) from candidates where allocated_category=vacancy_record.category_code and allocated_post=vacancy_record.post_code and (t2p1s1+t2p1s2)=min_totalall and t2p1s1=min_t2p1s1 and dob=max_dob into max_merit_all;

update vacancy_table set lowest_total=min_totalall, lowest_t2p1s1=min_t2p1s1, lowest_dob=max_dob,  max_merit=max_merit_all where category_code=vacancy_record.category_code and post_code=vacancy_record.post_code;
   

end loop;
end;
$$
-------------------------------------

DO
$$
declare 

min_totalr numeric;
min_t2p1s1 numeric;
min_t2p2 numeric;
max_dob date;
max_merit_r integer;
vacancy_record record;

begin

for vacancy_record in execute 'select post_code, category_code from vacancy_table where post_code in (''C01'',''C02'')'
loop

min_totalr=0;
min_t2p2=0;
min_t2p1s1=0;
max_dob=null;
max_merit_r=0;

raise info '%,post_code ',vacancy_record.post_code;
raise info '%,category_code ',vacancy_record.category_code;

select coalesce(min((t2p1s1+t2p1s2+t2p2)::numeric),0) from candidates where  allocated_category=vacancy_record.category_code and allocated_post=vacancy_record.post_code into min_totalr;
raise info 'min_totalr %',min_totalr;

select coalesce(min (t2p2)::numeric, 0) from candidates where allocated_category=vacancy_record.category_code and allocated_post=vacancy_record.post_code and (t2p1s1+t2p1s2+t2p2)=min_totalr into  min_t2p2;

raise info 't2p2 %', min_t2p2;

select coalesce(min (t2p1s1)::numeric, 0) from candidates where allocated_category=vacancy_record.category_code and allocated_post=vacancy_record.post_code and (t2p1s1+t2p1s2+t2p2)=min_totalr and t2p2=min_t2p2 into  min_t2p1s1;
select max (dob)  from candidates where allocated_category=vacancy_record.category_code and allocated_post=vacancy_record.post_code and (t2p1s1+t2p1s2+t2p2)=min_totalr and t2p2=min_t2p2 and t2p1s1=min_t2p1s1 into max_dob;
select max(merit_r) from candidates where allocated_category=vacancy_record.category_code and allocated_post=vacancy_record.post_code and (t2p1s1+t2p1s2+t2p2)=min_totalr and t2p2=min_t2p2 and t2p1s1=min_t2p1s1 and dob=max_dob into max_merit_r;

update vacancy_table set lowest_total=min_totalr,lowest_additional_paper=min_t2p2, lowest_t2p1s1=min_t2p1s1,lowest_dob=max_dob,  max_merit=max_merit_r where category_code=vacancy_record.category_code and post_code=vacancy_record.post_code;
   

end loop;
end;
$$	