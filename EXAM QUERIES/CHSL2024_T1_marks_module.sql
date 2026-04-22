create table "chsl2024Tier1Marks" as
select "registrationNo","rollNo",name,"fatherName","motherName",dob,gender,cat1,cat2,cat3,gi,ga,qa,eng,score,normalized,normalized as final_score from "chsl2024Tier1Marks_test" ;

-----1390690

update "chsl2024Tier1Marks" set dob= to_date(dob,'dd-mm-yy');---1390690

select gender,count(*) from "chsl2024Tier1Marks" group by gender;

update "chsl2024Tier1Marks" set gender='MALE' where gender='M';---896848
update "chsl2024Tier1Marks" set gender='FEMALE' where gender='F';---493838
update "chsl2024Tier1Marks" set gender='TRANSGENDER' where gender='T';---4

select cat1,count(*) from "chsl2024Tier1Marks" group by cat1;

update "chsl2024Tier1Marks" set cat1='EWS' where cat1='0';----109224
update "chsl2024Tier1Marks" set cat1='SC' where cat1='1';---297819
update "chsl2024Tier1Marks" set cat1='ST' where cat1='2';----94796
update "chsl2024Tier1Marks" set cat1='OBC' where cat1='6';---599183
update "chsl2024Tier1Marks" set cat1='UR' where cat1='9';----289668

select cat2,count(*) from "chsl2024Tier1Marks" group by cat2;

update "chsl2024Tier1Marks" set cat2='ESM' where cat2='3';---7870

select cat3,count(*) from "chsl2024Tier1Marks" group by cat3;

update "chsl2024Tier1Marks" set cat3='OH' where cat3='4';---10807
update "chsl2024Tier1Marks" set cat3='HH' where cat3='5';---2752
update "chsl2024Tier1Marks" set cat3='VH' where cat3='7';----3939
update "chsl2024Tier1Marks" set cat3='OTHERS' where cat3='8';---1947

alter table "chsl2024Tier1Marks" rename column gi to p1_general_intelligence;
alter table "chsl2024Tier1Marks" rename column ga to p1_general_awareness;
alter table "chsl2024Tier1Marks" rename column qa to p1_quantitative_aptitude;
alter table "chsl2024Tier1Marks" rename column eng to p1_english_language;
alter table "chsl2024Tier1Marks" rename column score to p1_raw_score;
alter table "chsl2024Tier1Marks" rename column normalized to "p1_final_score_(normalized)";
alter table "chsl2024Tier1Marks" rename column final_score to tier1;

alter table "chsl2024Tier1Marks" add column "isActive" boolean;
alter table "chsl2024Tier1Marks" add column "excludedNotice" text;

update "chsl2024Tier1Marks" set "isActive"=true,
"excludedNotice"='No';

"10000000014"	"8601007115"	"BHUKYA NAVEEN PATNAIK" -----ST "10000000071"
"10000000073"	"8003009881"	"PUVVADI SANTHOSH KUMAR"----EWS
"10000000074"	"2201137419"	"SANGAM BARNWAL"-----UR
"10000000075"	"2405094521"	"SALONI VERMA"----obc
"10000000371"	"2002008030"	"CHAYA"----SC
"10000000445"	"9009001751"	"DHARMESHA"---ESM
"10000000937"	"2405062548"	"KHUSHBU SAINI"---OH
"10000001595"	"2201311639"	"RAMANAND YADAV"---VH
"10000002688"	"2405016405"	"RAVI KUMAR AGARWAL"---HH
"10000003726"	"3206056352"	"AMRIT RAJ"----OTHERS


select count(*) from "chsl2024Tier1Marks_test" where cat2='""' limit 100;-----1382819
select count(*) from "chsl2024Tier1Marks_test" where cat3='""' limit 100;-----1371245
update "chsl2024Tier1Marks_test" set cat3= null where cat3='""';
