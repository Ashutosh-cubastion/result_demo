--------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------SICPO 2020-------------------------------------------------------------------------------------
select * from t_notification_ssc order by no_id

--update t_notification_ssc set no_dvflag=null where no_id=20

select * from t_appl_dv_sicpo2020candidatedetails_ssc,t_appl_dv_sicpo2020_education_qual_ssc
where t_appl_dv_sicpo2020candidatedetails_ssc.advc_rollno=t_appl_dv_sicpo2020_education_qual_ssc.aeq_rollno--2859

-------------------------------------------------------------------------------------------------
copy candidates from 'E:\Allocation\SICPO2020_Final_Allocation\candidates.csv' delimiter ',' csv header--2859 
--------------------------------------------------------------------------------------------------------------------------------------
------------------------------------Data Sanity---------------------------------------------------------------------------------------
select count(rollno) from candidates--2859 

select count(rollno) from candidates where rollno is null or rollno='';--0
select count(rollno) from candidates where regno is null or regno='';--0
select count(rollno) from candidates where name is null or name='';--0
select count(rollno) from candidates where father_name is null or father_name='';--0
select count(rollno) from candidates where mother_name is null or mother_name='';--0
select count(rollno) from candidates where dob is null;--0
select count(rollno) from candidates where gender is null or gender='';--0
select distinct gender,count(rollno) from candidates group by gender order by gender
--------------------------------------
"1";328
"2";2531
--------------------------------------
select count(rollno) from candidates where cat1_dv is null or cat1_dv='';--0
select distinct cat1_dv,count(rollno) from candidates group by cat1_dv order by cat1_dv
-------------------------------------
"0";446
"1";362
"11";76
"12";2
"2";279
"6";858
"9";836
-------------------------------------
select count(rollno) from candidates where cat2 is null or cat2='';--0
select distinct cat2,count(rollno) from candidates group by cat2 order by cat2
--update candidates set cat2='3' where cat2='Yes';--325
--update candidates set cat2='0' where cat2='No';--2534
-------------------------------------
"0";2534
"3";325
-------------------------------------
select count(rollno) from candidates where cat2='3' and (serviceperiod is null or serviceperiod ='');--0 
select count(rollno) from candidates where cat2='3' and discharged_date is null;--0
select count(rollno) from candidates where cat2='3' and (exs_reservation is null or exs_reservation=''); --0 
select count(rollno) from candidates where cat2='3' and exsvc_joining_date is null;--0
select distinct exs_reservation,count(rollno) from candidates where cat2='3' group by exs_reservation order by exs_reservation
-------------------------------------
"Yes";325
-------------------------------------
select distinct gender,count(rollno) from candidates where cat2='3' group by gender order by gender
------------------------------------------------------
2-Male --325
------------------------------------------------------
select count(rollno) from candidates where cat2='3'--325
select * from candidates where cat2='3'

-- Alter table candidates add column exsm_length character varying;

select serviceperiod,substring(serviceperiod,0,3) from candidates where cat2='3'
update candidates set exsm_length=substring(serviceperiod,0,3) where cat2='3'--325

select rollno from candidates where exsm_length like '%/%' --2201041509
select * from candidates where rollno='2201041509'
--update candidates set exsm_length='1' where exsm_length='1/'
------------------------------------------------------
select count(rollno) from candidates where isexs_specialquota='Yes'--21

select distinct cat2 from candidates where isexs_specialquota='Yes'
--------------------------------------------------------
3
--------------------------------------------------------
select distinct isexs_specialquota,count(rollno) from candidates where cat2='3' group by isexs_specialquota order by isexs_specialquota
--------------------------------------------------------
"No";304
"Yes";21
--------------------------------------------------------
select distinct cat2,count(rollno) from candidates where isexs_specialquota='Yes' group by cat2 order by cat2
--------------------------------------------------------
3 ---Ex-serviceman --21
--------------------------------------------------------
select distinct isexs_specialquota,count(rollno) from candidates where cat2='0' group by isexs_specialquota order by isexs_specialquota
------------------------------------------------------
"";2534
------------------------------------------------------
select distinct isncc_certificate,count(rollno) from candidates group by isncc_certificate order by isncc_certificate
-----------------------------------------------------------------------
"No"	2488
"Yes"	371
-----------------------------------------------------------------------
select distinct typeof_ncccertificate,count(rollno) from candidates where isncc_certificate='Yes' group by typeof_ncccertificate order by typeof_ncccertificate
-----------------------------------------------------------------------
"1"	70   -- Type A
"2"	70   -- Type B
"3"	231  -- Type C
-----------------------------------------------------------------------
select distinct isdept_candidate,count(rollno) from candidates group by isdept_candidate order by isdept_candidate 
------------------------------------------------------
"No";2848
"Yes";11
------------------------------------------------------
select distinct minority_community,count(rollno) from candidates group by minority_community order by minority_community 
-------------------------------------
"No";2827
"Yes";32
-------------------------------------
select count(rollno) from candidates where minority_community='Yes' and (minority_name is null or minority_name ='');--0
select distinct minority_name,count(rollno) from candidates  where minority_community='Yes' group by minority_name order by minority_name 
-------------------------------------
"Christians";22
"Muslims";10
-------------------------------------
select distinct agerelax_code,count(rollno) from candidates group by agerelax_code order by agerelax_code
--update candidates set agerelax_code=null where agerelax_code='0';--1482
--update candidates set agerelax_code='1' where agerelax_code='1,5';--424
--update candidates set agerelax_code='2' where agerelax_code='2,3';--524
--update candidates set agerelax_code='6' where agerelax_code='6,3';--325
--update candidates set agerelax_code='17' where agerelax_code='17,5';--4
--update candidates set agerelax_code='18' where agerelax_code='18,8';--4
--------------------------------------------------------------------------------------------------------
"1";424
"17";4
"18";4
"2";524
"6";325
"";1578
--------------------------------------------------------------------------------------------------------
select distinct rejection_provision,count(rollno) from candidates group by rejection_provision order by rejection_provision
-------------------------------------
"C";2412
"P";417
"R";28
"W";2
-------------------------------------
select count(rollno) from candidates where posteligiblefor_dept_code is null or posteligiblefor_dept_code ='';--0
select count(rollno) from candidates where postpreference_dv_option is null or postpreference_dv_option ='';--0
select rollno,examregion_code,rejection_provision from candidates where postpreference_dv_option is null or postpreference_dv_option ='' order by rollno;--0
-------------------------------------------------------
select distinct examregion_code,count(rollno) from candidates group by examregion_code order by examregion_code
-------------------------------------------------------
"CR";545
"ER";114
"KKR";48
"MPR";125
"NER";48
"NR";1721
"NWR";125
"SR";68
"WR";65
-------------------------------------------------------
select distinct isdvcomplete,count(rollno) from candidates group by isdvcomplete order by isdvcomplete
-------------------------------------------------------
"Yes";2859
-------------------------------------------------------
select rollno,examregion_code,rejection_provision,isdvcomplete from candidates where isdvcomplete='No' order by rollno--0
-------------------------------------------------------
-------------------------------------------------------
select rollno,regno,name,father_name,mother_name,dob,gender,cat1_dv,cat2,exs_reservation_dv from candidates where cat2='3' order by rollno
--------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
Alter table candidates add column cat1_m character varying;
Alter table candidates add column cat1_remarks character varying;
-- update candidates set cat1_m=cat1_dv;--2859 
------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------
Alter table candidates add column cat1_cpo character varying;
Alter table candidates add column cat1_dp character varying;
----------------------------------------------------------------------------------
-- update candidates set cat1_cpo=cat1_m; --2859 
-- update candidates set cat1_dp=cat1_m;  --2859   
----------------------------------------------------------------------------------
select rollno,cat1_dv,cat1_m,cat1_cpo,cat1_dp from candidates where cat1_m='11'; --76
-- update candidates set cat1_cpo='9' where cat1_m='11';--76
-- update candidates set cat1_dp='6' where cat1_m='11';--76
----------------------------------------------------------------------------------
select rollno,cat1_dv,cat1_m,cat1_cpo,cat1_dp from candidates where cat1_m='12'; --2
-- update candidates set cat1_cpo='0' where cat1_m='12';--2
-- update candidates set cat1_dp='6' where cat1_m='12';--2
----------------------------------------------------------------------------------
select count(rollno) from candidates where cat1_m<>cat1_dp--78
select count(rollno) from candidates where cat1_m<>cat1_cpo--78
----------------------------------------------------------------------------------
Alter table candidates add column dob1 date;
-- update candidates set dob1=dob; --2859 
----------------------------------------------------------------------------------
select dob,dob1 from candidates where rollno=''
--update candidates set dob1='' where rollno=''
---------------------------Marks Update-----------------------------------------------------------------------------------------------
copy marks from 'E:\Allocation\SICPO2020_Final_Allocation\sicpo2020_marks.csv' delimiter ',' csv header--3060 
--------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------
select count(rollno) from candidates --2859
select count(rollno) from marks --3060
-----------------------------------------------------------------------
Alter table candidates  add column gi double precision;
Alter table candidates  add column eng double precision;
Alter table candidates  add column qa double precision;
Alter table candidates  add column gk double precision;
Alter table candidates  add column score_p1 double precision;
Alter table candidates  add column ncc_p1 double precision;
Alter table candidates  add column score_p2 double precision;	
Alter table candidates  add column ncc_p2 double precision;
Alter table candidates  add column pet character varying;
Alter table candidates  add column medical character varying;
-----------------------------------------------------------------------
select count(*) from candidates,marks where candidates.rollno = marks.rollno and candidates.regno = marks.regno--2859
-----------------------------------------------------------------------
update candidates set gi=marks.gi,eng=marks.eng,qa=marks.qa,gk=marks.gk,score_p1=marks.normalised,
ncc_p1=0.0,score_p2=marks.score_p2,ncc_p2=0.0,pet=marks.pet,medical=marks.medical 
from marks where candidates.rollno = marks.rollno and candidates.regno = marks.regno--2859
--------------------------------------------------------------------------------------------------------------------------------------
select distinct typeof_ncccertificate,count(rollno) from candidates where isncc_certificate='Yes' group by typeof_ncccertificate order by typeof_ncccertificate
-----------------------------------------------------------------------
"1"	70   -- Type A -- 4.00  marks each paper
"2"	70   -- Type B -- 6.00  marks each paper
"3"	231  -- Type C -- 10.00 marks each paper
--------------------------------------------------------------------------------------------------------------------------------------
update candidates set ncc_p1= 4.00,ncc_p2= 4.00 where candidates.typeof_ncccertificate = '1';  -- Type A 70

update candidates set ncc_p1= 6.00,ncc_p2= 6.00 where candidates.typeof_ncccertificate = '2';  -- Type B 70

update candidates set ncc_p1= 10.00,ncc_p2= 10.00 where candidates.typeof_ncccertificate = '3';  -- Type C 231
--------------------------------------------------------------------------------------------------------------------------------------
Alter table candidates  add column paper1 double precision;
Alter table candidates  add column paper2 double precision;

update candidates set paper1= score_p1 + ncc_p1;
update candidates set paper2= score_p2 + ncc_p2;

--------------------------------------------------------------------------------------------------------------------------------------
Alter table candidates  add column total double precision;
update candidates set total=paper1+paper2;--2859
--------------------------------------------------------------------------------------------------------------------------------------
copy debbaredcandidates from 'E:\Allocation\SICPO2020_Final_Allocation\debbaredcandidates.csv' delimiter ',' csv header;--1556 

select * from debbaredcandidates--1556

================== debarred checking query ===========================

select c.regno,c.rollno,c.name,c.father_name,c.mother_name,c.dob,(replace(c.name,' ','')||replace(c.father_name,' ','')||replace(c.mother_name,' ','')) as concat_cand_name_father_name_mother_name,
dt.cand_name_father_name_mother_name from candidates c,debbaredcandidates dt where (replace(c.name,' ','')||replace(c.father_name,' ','')||replace(c.mother_name,' ',''))=dt.cand_name_father_name_mother_name--0

select c.regno,c.rollno,c.name,c.father_name,c.mother_name,c.dob,(replace(c.name,' ','')||replace(c.father_name,' ','')) as concat_cand_name_father_name,dt.cand_name_father_name
from candidates c,debbaredcandidates dt where (replace(c.name,' ','')||replace(c.father_name,' ',''))=dt.cand_name_father_name --6

select c.regno,c.rollno,c.name,c.father_name,c.mother_name,c.dob,(replace(c.name,' ','')||replace(c.mother_name,' ','')) as concat_cand_name_mother_name,dt.cand_name_mother_name
from candidates c,debbaredcandidates dt where (replace(c.name,' ','')||replace(c.mother_name,' ',''))=dt.cand_name_mother_name --16

select c.regno,c.rollno,c.name,c.father_name,c.mother_name,c.dob,(replace(c.name,' ','')||replace(c.father_name,' ','')) as concat_cand_name_father_name,dt.cand_name_father_name
from candidates c,debbaredcandidates dt where (replace(c.name,' ','')||replace(c.father_name,' ',''))=dt.cand_name_father_name and c.dob=dt.cand_dob --0

------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------Merit-----------------------------------------------------------------------------------------------
alter table candidates add column meritm integer;
alter table candidates add column meritf integer;

select * from sp_get_merit('SICPO20',1);
select * from sp_get_merit('SICPO20',2);

select count(rollno) from candidates where meritm is not null; --2504
select count(rollno) from candidates where meritf is not null; --327

select count(rollno) from candidates where meritm is null and meritf is null; --28
select count(rollno) from candidates where rejection_provision ='R'; --28
---------------------------------DOB flag----------------------------------------------------------------------------------------------------
alter table candidates add column dob_flag_cpo character varying;
alter table candidates add column dob_flag_dp character varying;

select * from sp_get_dob_flag('SICPO20',3);
select * from sp_get_dob_flag('SICPO20',4);
----------------------------------------------------------------------------------
select count(rollno) from candidates where dob_flag_cpo is null or dob_flag_cpo='';--28
select count(rollno) from candidates where dob_flag_cpo='99';--8
select rollno,dob1,cat1_dv,cat1_m,cat1_cpo as cat1,cat2,gender,agerelax_code,exsm_length,dob_flag_cpo from candidates where dob_flag_cpo='99' order by rollno;--8
------------------------------------------------------------------------------------------------------------------------------------
"1005000165"	"1988-03-13"	"11""11""9"	"0"	"2"	"18"		"99"
"2201006631"	"1991-06-04"	"9"	"9"	"9"	"0"	"2"	"17"		"99"
"2201014762"	"1992-04-08"	"9"	"9"	"9"	"0"	"2"	"17"		"99"
"2201030692"	"1992-01-01"	"6"	"6"	"6"	"0"	"2"	"18"		"99"
"2201048594"	"1993-10-20"	"9"	"9"	"9"	"0"	"2"	"17"		"99"
"2201062738"	"1994-07-16"	"9"	"9"	"9"	"0"	"2"	"17"		"99"
"2201076091"	"1990-07-06"	"6"	"6"	"6"	"0"	"2"	"18"		"99"
"2201092696"	"1992-08-02"	"6"	"6"	"6"	"0"	"2"	"18"		"99"
------------------------------------------------------------------------------------------------------------------------------------
select rollno,dob1,cat1_cpo as cat1,cat2,gender,agerelax_code,exsm_length,dob_flag_cpo from candidates where dob_flag_cpo='99' and cat1_cpo='0';--0
select rollno,dob1,cat1_cpo as cat1,cat2,gender,agerelax_code,exsm_length,dob_flag_cpo from candidates where dob_flag_cpo='99' and cat1_cpo='1';--0
select rollno,dob1,cat1_cpo as cat1,cat2,gender,agerelax_code,exsm_length,dob_flag_cpo from candidates where dob_flag_cpo='99' and cat1_cpo='2';--0
select rollno,dob1,cat1_cpo as cat1,cat2,gender,agerelax_code,exsm_length,dob_flag_cpo from candidates where dob_flag_cpo='99' and cat1_cpo='6';--3
select rollno,dob1,cat1_dv,cat1_m,cat1_cpo as cat1,cat2,gender,agerelax_code,exsm_length,dob_flag_cpo from candidates where dob_flag_cpo='99' and cat1_cpo='9';--5
----------------------------------------------------------------------------------
select distinct dob_flag_cpo,count(rollno) from candidates group by dob_flag_cpo order by dob_flag_cpo
----------------------------------------------------------------------------------
"01"	246
"02"	216
"06"	319
"9"		2042
"99"	8
		28
----------------------------------------------------------------------------------
select count(rollno) from candidates where dob_flag_dp is null or dob_flag_dp='';--28
select count(rollno) from candidates where dob_flag_dp='99';--0
select rollno,dob1,cat1_dp as cat1,cat2,gender,agerelax_code,exsm_length,dob_flag_dp from candidates where dob_flag_dp='99';--0
----------------------------------------------------------------------------------
select distinct dob_flag_dp,count(rollno) from candidates  group by dob_flag_dp order by dob_flag_dp
----------------------------------------------------------------------------------
"01"	246
"02"	216
"06"	319
"17"	4
"18"	4
"9"		2042
		28
-----------------------------------------------------------------------------------------------------------------
------------------------------CATSEL DOB flag-----------------------------------------------------------------
alter table candidates add column catsel_dob_cpo character varying;
alter table candidates add column catsel_dob_dp character varying;

select * from sp_get_catseldob_flag('SICPO20',5);
select * from sp_get_catseldob_flag('SICPO20',6);
-----------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where (catsel_dob_cpo is null or catsel_dob_cpo='');--56
select * from candidates where (catsel_dob_cpo is null or catsel_dob_cpo='') and  (dob_flag_cpo is null or dob_flag_cpo=''); --28
select * from candidates where (catsel_dob_cpo is null or catsel_dob_cpo='') and  (dob_flag_cpo is not null or dob_flag_cpo<>''); --28
select * from candidates where (catsel_dob_cpo is null or catsel_dob_cpo='') and  (dob_flag_cpo is not null and dob_flag_cpo<>'99'); --20

select count(rollno) from candidates where (catsel_dob_cpo is null or catsel_dob_cpo='') and (meritm is not null or meritf is not null); --28
-----------------------------------------------------------------------------------------------------------------
select distinct catsel_dob_cpo,count(rollno) from candidates group by catsel_dob_cpo order by catsel_dob_cpo
-----------------------------------------------------------------------------------------------------------------
	28
"1"	140
"2"	106
"3"	319
"6"	196
"9"	2042
	28
------------------------------------------------------------------------------------------------------------------------------------------
select distinct dob_flag_cpo,count(rollno) from candidates where (catsel_dob_cpo is null or catsel_dob_cpo='') and (meritm is not null or meritf is not null)
group by dob_flag_cpo order by dob_flag_cpo
------------------------------------------------------------------------------------------------------------------------------------------
"02"	20
"99"	8
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where catsel_dob_dp is null or catsel_dob_dp=''; --28

select distinct catsel_dob_dp,count(rollno) from candidates group by catsel_dob_dp order by catsel_dob_dp
------------------------------------------------------------------------------------------------------------------------------------------
"1"	140
"2"	106
"3"	319
"6"	218
"9"	2048
	28
-----------------------------------------------------------------------------------------------------------------
------------------------------CUTOFF Female flag---------------------------------------------------------------------------------------------------
alter table candidates add column cutoff_flag_female_cpo character varying;
alter table candidates add column cutoff_flag_female_dp character varying;

select * from sp_get_cutoff('SICPO20',7);
select * from sp_get_cutoff('SICPO20',8);

---------------------------cutoff_flag_female_cpo checking------------------------------------------
select rollno,cat1_cpo,cat1_m,cat2,gender,paper1,total,meritf,cutoff_flag_female_cpo from candidates 
where meritf is not null and (cutoff_flag_female_cpo is null or cutoff_flag_female_cpo='') order by paper1--12
--note paper 1 cut-off (118.38628) or Total cut-off (279.60209) not clreaed under UR category - all female candidates cat1_cpo is 9

select rollno,cat1_cpo,cat1_m,cat2,gender,paper1,total,meritf,cutoff_flag_female_cpo from candidates 
where meritf is not null and (cutoff_flag_female_cpo<>'')--315

select rollno,cat1_cpo,cat1_m,cat2,gender,paper1,total,meritf,cutoff_flag_female_cpo from candidates 
where meritf is not null order by meritf--327

select rollno,cat1_cpo,cat1_m,cat2,gender,paper1,total,meritf,cutoff_flag_female_cpo from candidates 
where meritf is not null and cat2='3' order by meritf--0
---------------------------cutoff_flag_female_dp checking------------------------------------------
select rollno,cat1_dp,cat1_m,cat2,gender,paper1,total,meritf,cutoff_flag_female_dp from candidates 
where meritf is not null and (cutoff_flag_female_dp is null or cutoff_flag_female_dp='') order by paper1--10
--note paper 1 cut-off (118.38628) or Total cut-off (279.60209) not clreaed under UR category - all female candidates cat1_dp is 9 

select rollno,cat1_dp,cat1_m,cat2,gender,paper1,total,meritf,cutoff_flag_female_dp from candidates 
where meritf is not null and (cutoff_flag_female_dp<>'')--317

select rollno,cat1_dp,cat1_m,cat2,gender,paper1,total,meritf,cutoff_flag_female_dp from candidates 
where meritf is not null order by meritf--327

select rollno,cat1_dp,cat1_m,cat2,gender,paper1,total,meritf,cutoff_flag_female_dp from candidates 
where meritf is not null and cat2='3' order by meritf--0
------------------------------------------------------------------------------------------------------
select rollno,cat1_dp,cat1_cpo,cat1_m,cat2,gender,paper1,total,meritf,cutoff_flag_female_dp,cutoff_flag_female_cpo from candidates 
where meritf is not null and cutoff_flag_female_cpo<>cutoff_flag_female_dp--18
--All candidates cat1_m is 11 or 12 and cat1_cpo is 9 or 0 and cat1_dp is 6

------------------------------CUTOFF MALE flag---------------------------------------------------------------------------------------------------
alter table candidates add column cutoff_flag_male_cpo character varying;
alter table candidates add column cutoff_flag_male_dp character varying;
alter table candidates add column cutoff_flag_male_spclexs_dp character varying;

select * from sp_get_cutoff('SICPO20',9);
select * from sp_get_cutoff('SICPO20',10);
select * from sp_get_cutoff('SICPO20',11);

-----------------------cutoff_flag_male_cpo checking------------------------------------------------
select rollno,cat1_m,cat1_cpo as cat1,cat1_dp,cat2,gender,paper1,total,meritm,cutoff_flag_male_cpo from candidates 
where (cutoff_flag_male_cpo is null or cutoff_flag_male_cpo='') and meritm is not null order by paper1 --76


select rollno,cat1_m,cat1_cpo as cat1,cat1_dp,cat2,gender,paper1,total,meritm,cutoff_flag_male_cpo from candidates 
where cat1_cpo='9' and (cutoff_flag_male_cpo is null or cutoff_flag_male_cpo='') and meritm is not null order by paper1 --76
--note paper 1 cut-off (114.67434) or Total cut-off (250.45154) not clreaed under UR category - all male candidates cat1_cpo is 9 

select rollno,cat1_m,cat1_cpo as cat1,cat1_dp,cat2,gender,paper1,total,meritm,cutoff_flag_male_cpo from candidates 
where cat1_cpo='0' and (cutoff_flag_male_cpo is null or cutoff_flag_male_cpo='') and meritm is not null order by paper1 --0

select rollno,cat1_m,cat1_cpo as cat1,cat1_dp,cat2,gender,paper1,total,meritm,cutoff_flag_male_cpo from candidates 
where cat1_cpo='6' and (cutoff_flag_male_cpo is null or cutoff_flag_male_cpo='') and meritm is not null order by paper1 --0

select rollno,cat1_m,cat1_cpo as cat1,cat1_dp,cat2,gender,paper1,total,meritm,cutoff_flag_male_cpo from candidates 
where cat1_cpo='2' and (cutoff_flag_male_cpo is null or cutoff_flag_male_cpo='') and meritm is not null order by paper1 --0

select rollno,cat1_m,cat1_cpo as cat1,cat1_dp,cat2,gender,paper1,total,meritm,cutoff_flag_male_cpo from candidates 
where cat1_cpo='1' and (cutoff_flag_male_cpo is null or cutoff_flag_male_cpo='') and meritm is not null order by paper1 --0
-----------------------cutoff_flag_male_dp checking------------------------------------------------
select rollno,cat1_m,cat1_cpo,cat1_dp as cat1,cat2,gender,paper1,total,meritm,cutoff_flag_male_dp from candidates 
where (cutoff_flag_male_dp is null or cutoff_flag_male_dp='') and meritm is not null order by paper1--68

select rollno,cat1_m,cat1_cpo,cat1_dp as cat1,cat2,gender,paper1,total,meritm,cutoff_flag_male_dp from candidates 
where cat1_dp='9' and (cutoff_flag_male_dp is null or cutoff_flag_male_dp='') and meritm is not null order by paper1--66
--note paper 1 cut-off (114.67434) or Total cut-off (250.45154) not clreaed under UR category - all male candidates cat1_dp is 9 

select rollno,cat1_m,cat1_cpo,cat1_dp as cat1,cat2,gender,paper1,total,meritm,cutoff_flag_male_dp from candidates 
where cat1_dp='0' and (cutoff_flag_male_dp is null or cutoff_flag_male_dp='') and meritm is not null order by paper1 --0

select rollno,cat1_m,cat1_cpo,cat1_dp as cat1,cat2,gender,paper1,total,meritm,cutoff_flag_male_dp from candidates 
where cat1_dp='6' and (cutoff_flag_male_dp is null or cutoff_flag_male_dp='') and meritm is not null order by paper1 --2
--note paper 1 cut-off (107.93953) or Total cut-off (178.3209) not clreaed under UR category - all male candidates cat1_dp is 6

select rollno,cat1_m,cat1_cpo,cat1_dp as cat1,cat2,gender,paper1,total,meritm,cutoff_flag_male_dp from candidates 
where cat1_dp='2' and (cutoff_flag_male_dp is null or cutoff_flag_male_dp='') and meritm is not null order by paper1 --0

select rollno,cat1_m,cat1_cpo,cat1_dp as cat1,cat2,gender,paper1,total,meritm,cutoff_flag_male_dp from candidates  
where cat1_dp='1' and (cutoff_flag_male_dp is null or cutoff_flag_male_dp='') and meritm is not null order by paper1 --0

-----------------------------cutoff_flag_male_spclexs_dp checking------------------------------------------
select rollno,cat1_m,cat1_cpo,isexs_specialquota,cat1_dp as cat1,cat2,gender,paper1,total,meritm,cutoff_flag_male_spclexs_dp from candidates 
where cat2='3' and isexs_specialquota='Yes' order by paper1--21

select rollno,cat1_m,cat1_cpo,isexs_specialquota,cat1_dp as cat1,cat2,gender,paper1,total,meritm,cutoff_flag_male_spclexs_dp from candidates 
where cat2='3' and isexs_specialquota='Yes' and meritm is not null order by paper1--21

select rollno,cat1_m,cat1_cpo as cat1,isexs_specialquota,cat1_dp,cat2,gender,paper1,total,meritm,cutoff_flag_male_cpo,cutoff_flag_male_dp,cutoff_flag_male_spclexs_dp ,postpreference_dv_option from candidates 
where cat2='3' and isexs_specialquota='Yes' and meritm is not null order by meritm--21

select rollno,cat1_m,cat1_cpo,cat1_dp,isexs_specialquota,cat2,gender,paper1,total,meritm,cutoff_flag_male_cpo,cutoff_flag_male_dp,cutoff_flag_male_spclexs_dp from candidates 
where cutoff_flag_male_dp<>cutoff_flag_male_cpo--50
--cat_m mai 11 or 12 hai cat1_cpo mai 9 or 0 and cat1_dp mai 6 

select distinct cat1_dp from candidates where cutoff_flag_male_dp<>cutoff_flag_male_cpo--50 
------------------------------------------------------------------------------------------------------------------
"6"
------------------------------------------------------------------------------------------------------------------
------------------------------CATSEL flag---------------------------------------------------------------------------------------------------
alter table candidates add column catsel_female_cpo character varying;
alter table candidates add column catsel_female_dp character varying;
alter table candidates add column catsel_male_cpo character varying;
alter table candidates add column catsel_male_dp character varying;
alter table candidates add column catsel_male_spclexs_dp character varying;

select * from sp_get_catsel('SICPO20',12);
select * from sp_get_catsel('SICPO20',13);
select * from sp_get_catsel('SICPO20',14);
select * from sp_get_catsel('SICPO20',15);
select * from sp_get_catsel('SICPO20',16);

------------------------------CATSEL flag checking---------------------------------------------------------------------------------------------------
select rollno,cat1_m,cat1_cpo as cat1,cat2,exs_reservation,catsel_dob_cpo as catsel_dob,cutoff_flag_female_cpo as cut_off_flag,catsel_female_cpo from candidates where meritf is not null and (catsel_female_cpo is null or catsel_female_cpo='') order by meritf--15
select rollno,cat1_dp as cat1,cat2,exs_reservation,catsel_dob_dp as catsel_dob,cutoff_flag_female_dp as cut_off_flag,catsel_female_dp from candidates where meritf is not null and (catsel_female_dp is null or catsel_female_dp='') order by meritf--10
select rollno,cat1_cpo as cat1,cat2,exs_reservation,catsel_dob_cpo as catsel_dob,cutoff_flag_male_cpo as cut_off_flag,catsel_male_cpo from candidates where meritm is not null and(catsel_male_cpo is null or catsel_male_cpo='') order by meritm--96
select rollno,cat1_dp as cat1,cat2,exs_reservation,catsel_dob_dp as catsel_dob,cutoff_flag_male_dp as cut_off_flag,catsel_male_dp from candidates where meritm is not null and(catsel_male_dp is null or catsel_male_dp='') order by meritm--68
select rollno,cat1_dp as cat1,cat2,exs_reservation,catsel_dob_dp as catsel_dob,cutoff_flag_male_spclexs_dp as cut_off_flag,catsel_male_spclexs_dp from candidates where isexs_specialquota='Yes' and meritm is not null and (catsel_male_spclexs_dp is null or catsel_male_spclexs_dp='') order by meritm--0
------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------Vacancy Table--------------------------------------------------------------------------------------------------------------------------
copy vacancy_male from 'E:\Allocation\SICPO2020_Final_Allocation\vacancy_male.csv' delimiter ',' csv header--45
copy vacancy_female from 'E:\Allocation\SICPO2020_Final_Allocation\vacancy_female.csv' delimiter ',' csv header--30

select * from vacancy_male order by slno--45
select * from vacancy_female order by slno--30

------------------------------------------------------------------------------------------------

pg_dump -h localhost -U postgres -p 5432 -d alloc_sicpo2020allocation_final -f "E:\Allocation\SICPO2020_Final_Allocation\alloc_sicpo2020allocation_final.backup"

psql -h localhost -U postgres -p 5432 -d alloc_sicpo2020allocation_final -f "F:\Allocation Programs\SICPO2020_Final_Allocation\alloc_sicpo2020allocation_final.backup"
--------------------------Allocation------------------------------------------------------------------------------------------------------
  alter table vacancy_female add column current integer;
  alter table vacancy_female add column allocated integer;
  alter table vacancy_female add column left_vacancy integer;
  alter table vacancy_female add column min_marks double precision;
  alter table vacancy_female add column min_paper1 double precision;
  alter table vacancy_female add column min_paper2 double precision;
  alter table vacancy_female add column min_marks_cand_dob date;
  alter table vacancy_female add column max_merit integer;
------------------------------------------------------------------------------------------------
  alter table vacancy_male add column current integer;
  alter table vacancy_male add column allocated integer;
  alter table vacancy_male add column left_vacancy integer;
  alter table vacancy_male add column min_marks double precision;
  alter table vacancy_male add column min_paper1 double precision;
  alter table vacancy_male add column min_paper2 double precision;
  alter table vacancy_male add column min_marks_cand_dob date;
  alter table vacancy_male add column max_merit integer;
------------------------------------------------------------------------------------------------
  alter table candidates add column allocated_category character varying;
  alter table candidates add column allocated_post character varying;
  alter table candidates add column allocated_against_ur character varying;
  alter table candidates add column sub_category character varying;
-----------------------------------------------------------------------------------------------------------------------------------------
-- update candidates set allocated_category=null,allocated_post=null,allocated_against_ur=null,sub_category=null;
------------------------------------------------------------------------------------------------
--update vacancy_female set current=initial_vacancy,allocated=null,left_vacancy=null;
--update vacancy_male set current=initial_vacancy,allocated=null,left_vacancy=null;

--update vacancy_male set min_marks=null,min_paper1=null,min_paper2=null,min_marks_cand_dob=null,max_merit=null;
--update vacancy_female set min_marks=null,min_paper1=null,min_paper2=null,min_marks_cand_dob=null,max_merit=null;

--update vacancy_male set current=initial_vacancy,allocated=null,left_vacancy=null,min_marks=null,min_paper1=null,min_paper2=null,min_marks_cand_dob=null,max_merit=null;
--update vacancy_female set current=initial_vacancy,allocated=null,left_vacancy=null,min_marks=null,min_paper1=null,min_paper2=null,min_marks_cand_dob=null,max_merit=null;
------------------------------------------------------------------------------------------------
select count(rollno) from candidates--2859
select * from vacancy_female order by slno--30
select * from vacancy_male order by slno--45

update candidates set allocated_category=null,allocated_post=null,allocated_against_ur=null,sub_category=null;
update vacancy_female set current=initial_vacancy,allocated=null,left_vacancy=null;
update vacancy_male set current=initial_vacancy,allocated=null,left_vacancy=null;
---------------------------------------------------------------------------------------------
------------------------After 1st Time Allocation-------------------------------------------------
---------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category is not null --1692
select count(rollno) from candidates where allocated_category is not null and gender='2';--1561
select count(rollno) from candidates where allocated_category is not null and gender='1';--131

select sum(initial_vacancy) from vacancy_male--1563
select sum(allocated) from vacancy_male--1561
select sum(left_vacancy) from vacancy_male--2

select * from vacancy_male where left_vacancy<>'0' order by slno
--------------------------------------------------
14	"SIDP"	"A"	"1"	"3*"	1	1	1	0	1
15	"SIDP"	"A"	"2"	"3*"	1	1	1	0	1
--------------------------------------------------
select rollno,cat1_dp as cat1,cat2,isexs_specialquota,gender,paper1::numeric as paper1,total::numeric as total,
meritm,cutoff_flag_male_spclexs_dp,catsel_male_spclexs_dp,allocated_category,allocated_post,allocated_against_ur,sub_category
from candidates where isexs_specialquota='Yes' and meritm is not null order by meritm--21
--------------------------------------------------
select sum(initial_vacancy) from vacancy_female--131
select sum(allocated) from vacancy_female--131
select sum(left_vacancy) from vacancy_female--0

select * from vacancy_female where left_vacancy<>'0'
---------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category in ('9','1','2','6','0') and gender='2'--1422
select count(rollno) from candidates where allocated_category in ('3') and gender='2'--139

select sum(allocated) from vacancy_male where category_code in ('9','1','2','6','0')--1422
select sum(allocated) from vacancy_male where category_code in ('3')--139

select sum(current) from vacancy_male where category_code in ('9','1','2','6','0')--1424
select sum(current) from vacancy_male where category_code in ('3')--139

select sum(left_vacancy) from vacancy_male where category_code in ('9','1','2','6','0')--2

select * from vacancy_male where category_code in ('9','1','2','6','0') and  left_vacancy>0 order by slno
--------------------------------------------------
14	"SIDP"	"A"	"1"	"3*"	1	1	1	0	1
15	"SIDP"	"A"	"2"	"3*"	1	1	1	0	1
--------------------------------------------------
select sum(left_vacancy) from vacancy_male where category_code in ('3');--0
select * from vacancy_male where category_code in ('3') and  left_vacancy>0;--0

select sum(initial_vacancy) from vacancy_male where category_code in ('9','1','2','6','0');--1424
select sum(initial_vacancy) from vacancy_male where category_code='3';--139
--------------------------------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category in ('9','1','2','6','0') and gender='1';--131
select count(rollno) from candidates where allocated_category in ('3') and gender='1';--0

select sum(allocated) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(allocated) from vacancy_female where category_code in ('3');--null

select sum(current) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(current) from vacancy_female where category_code in ('3');--null

select sum(left_vacancy) from vacancy_female where category_code in ('9','1','2','6','0');--0
select * from vacancy_female where category_code in ('9','1','2','6','0') and  left_vacancy>0;--0

select sum(left_vacancy) from vacancy_female where category_code in ('3');--null
select * from vacancy_female where category_code in ('3') and  left_vacancy>0;--0

select sum(initial_vacancy) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(initial_vacancy) from vacancy_female where category_code='3';--null
--------------------------------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where  allocated_against_ur<>'';--0
select count(rollno) from candidates where  allocated_against_ur='';--1561
select count(rollno) from candidates where  allocated_against_ur is not null;--1561

select count(rollno) from candidates where  allocated_against_ur='1';--0
-----------------------------After Adjust Programm(Other than Post-A)-------------------------------------------
select * from vacancy_male where initial_vacancy<>current order by slno--10 
-------------------------------------------------------------------------------------
16	"BSF"	"B"	"9"	"0"	94	94	77
18	"BSF"	"B"	"6"	"0"	63	63	56
22	"CISF"	"C"	"9"	"0"	8	8	6
28	"CRPF"	"D"	"9"	"0"	421	421	356
30	"CRPF"	"D"	"6"	"0"	281	281	246
31	"CRPF"	"D"	"1"	"0"	156	156	151
32	"CRPF"	"D"	"2"	"0"	78	78	76
34	"ITBPF"	"E"	"9"	"0"	22	22	20
36	"ITBPF"	"E"	"6"	"0"	7	7	5
40	"SSB"	"F"	"9"	"0"	8	8	6
-------------------------------------------------------------------------------------
------------------Mannual Adjust for SPCL EX serviceman vacancy(Post-A)-------------------------------------------
select * from vacancy_male where left_vacancy<>'0' order by slno
--------------------------------------------------
14	"SIDP"	"A"	"1"	"3*"	1	1	1	0	1
15	"SIDP"	"A"	"2"	"3*"	1	1	1	0	1
-------------------------------------------------------------------------------------
select * from vacancy_male where post_code='A' and category_code in ('1','2') and sub_category_code in ('3','3*') order by slno
-------------------------------------------------------------------------------------
9	"SIDP"	"A"	"1"	"3"		0	0	0	0	0
10	"SIDP"	"A"	"2"	"3"		0	0	0	0	0
--------------------------------------------------
14	"SIDP"	"A"	"1"	"3*"	1	1	1	0	1
15	"SIDP"	"A"	"2"	"3*"	1	1	1	0	1
-------------------------------------------------------------------------------------
update vacancy_male set current=1 where post_code='A' and category_code='1' and sub_category_code='3';
update vacancy_male set current=0 where post_code='A' and category_code='1' and sub_category_code='3*';

update vacancy_male set current=1 where post_code='A' and category_code='2' and sub_category_code='3';
update vacancy_male set current=0 where post_code='A' and category_code='2' and sub_category_code='3*';

--------After Update Post A vacancy only for sub category code 3 and 3* -------------------------------------------

select * from vacancy_male where post_code='A' and category_code in ('1','2') and sub_category_code in ('3','3*') order by slno
-------------------------------------------------------------------------------------
9	"SIDP"	"A"	"1"	"3"		0	0	1	0	0
10	"SIDP"	"A"	"2"	"3"		0	0	1	0	0
--------------------------------------------------
14	"SIDP"	"A"	"1"	"3*"	1	1	0	0	1
15	"SIDP"	"A"	"2"	"3*"	1	1	0	0	1
-------------------------------------------------------------------------------------
select * from vacancy_male where initial_vacancy<>current order by slno--14
-------------------------------------------------------------------------------------
9	"SIDP"	"A"	"1"	"3"	0	0	1	0	0
10	"SIDP"	"A"	"2"	"3"	0	0	1	0	0
14	"SIDP"	"A"	"1"	"3*"1	1	0	0	1
15	"SIDP"	"A"	"2"	"3*"1	1	0	0	1
16	"BSF"	"B"	"9"	"0"	94	94	77		
18	"BSF"	"B"	"6"	"0"	63	63	56		
22	"CISF"	"C"	"9"	"0"	8	8	6		
28	"CRPF"	"D"	"9"	"0"	421	421	356		
30	"CRPF"	"D"	"6"	"0"	281	281	246		
31	"CRPF"	"D"	"1"	"0"	156	156	151		
32	"CRPF"	"D"	"2"	"0"	78	78	76		
34	"ITBPF"	"E"	"9"	"0"	22	22	20		
36	"ITBPF"	"E"	"6"	"0"	7	7	5		
40	"SSB"	"F"	"9"	"0"	8	8	6				
-------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
update candidates set allocated_category=null,allocated_post=null,allocated_against_ur=null,sub_category=null;

update vacancy_female set current=initial_vacancy,allocated=null,left_vacancy=null;
update vacancy_male set allocated=null,left_vacancy=null;

---------------------------------------------------------------------------------------------
----------------------------After 2nd Time Allocation---------------------------------------
---------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category is not null --1555
select count(rollno) from candidates where allocated_category is not null and gender='2';--1424
select count(rollno) from candidates where allocated_category is not null and gender='1';--131

select sum(initial_vacancy) from vacancy_male--1563
select sum(allocated) from vacancy_male--1424
select sum(left_vacancy) from vacancy_male--0

select * from vacancy_male where left_vacancy<>'0' order by slno
--------------------------------------------------
select sum(initial_vacancy) from vacancy_female--131
select sum(allocated) from vacancy_female--131
select sum(left_vacancy) from vacancy_female--0

select * from vacancy_female where left_vacancy<>'0'
---------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category in ('9','1','2','6','0') and gender='2';--1285
select count(rollno) from candidates where allocated_category in ('3') and gender='2';--139

select sum(allocated) from vacancy_male where category_code in ('9','1','2','6','0');--1285
select sum(allocated) from vacancy_male where category_code in ('3');--139

select sum(current) from vacancy_male where category_code in ('9','1','2','6','0');--1285
select sum(current) from vacancy_male where category_code in ('3');--139

select sum(left_vacancy) from vacancy_male where category_code in ('9','1','2','6','0');--0

select * from vacancy_male where category_code in ('9','1','2','6','0') and  left_vacancy>0 order by slno
--------------------------------------------------
--------------------------------------------------
select sum(left_vacancy) from vacancy_male where category_code in ('3');--0
select * from vacancy_male where category_code in ('3') and  left_vacancy>0;--0

select sum(initial_vacancy) from vacancy_male where category_code in ('9','1','2','6','0');--1424
select sum(initial_vacancy) from vacancy_male where category_code='3';--139
--------------------------------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category in ('9','1','2','6','0') and gender='1';--131
select count(rollno) from candidates where allocated_category in ('3') and gender='1';--0

select sum(allocated) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(allocated) from vacancy_female where category_code in ('3');--null

select sum(current) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(current) from vacancy_female where category_code in ('3');--null

select sum(left_vacancy) from vacancy_female where category_code in ('9','1','2','6','0');--0
select * from vacancy_female where category_code in ('9','1','2','6','0') and  left_vacancy>0;--0

select sum(left_vacancy) from vacancy_female where category_code in ('3');--null
select * from vacancy_female where category_code in ('3') and  left_vacancy>0;--0

select sum(initial_vacancy) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(initial_vacancy) from vacancy_female where category_code='3';--null
--------------------------------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where  allocated_against_ur<>'';--0
select count(rollno) from candidates where  allocated_against_ur='';--1424
select count(rollno) from candidates where  allocated_against_ur is not null;--1424

select count(rollno) from candidates where  allocated_against_ur='1';--0
-----------------------------After 2 time Adjust Programm(Other than Post-A)-------------------------------------------
select * from vacancy_male where initial_vacancy<>current order by slno--14
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
9	"SIDP"	"A"	"1"	"3"	0	0	1	1	0
10	"SIDP"	"A"	"2"	"3"	0	0	1	1	0
14	"SIDP"	"A"	"1"	"3*"1	1	0	0	0
15	"SIDP"	"A"	"2"	"3*"1	1	0	0	0
16	"BSF"	"B"	"9"	"0"	94	94	77		
18	"BSF"	"B"	"6"	"0"	63	63	56		
22	"CISF"	"C"	"9"	"0"	8	8	6		
28	"CRPF"	"D"	"9"	"0"	421	421	356		
30	"CRPF"	"D"	"6"	"0"	281	281	245		   ------diffrence from previous
31	"CRPF"	"D"	"1"	"0"	156	156	151		
32	"CRPF"	"D"	"2"	"0"	78	78	77		   ------diffrence from previous
34	"ITBPF"	"E"	"9"	"0"	22	22	20		
36	"ITBPF"	"E"	"6"	"0"	7	7	5		
40	"SSB"	"F"	"9"	"0"	8	8	6		
-------------------------------------------------------------------------------------
9	"SIDP"	"A"	"1"	"3"	0	0	1	0	0
10	"SIDP"	"A"	"2"	"3"	0	0	1	0	0
14	"SIDP"	"A"	"1"	"3*"1	1	0	0	1
15	"SIDP"	"A"	"2"	"3*"1	1	0	0	1
16	"BSF"	"B"	"9"	"0"	94	94	77		
18	"BSF"	"B"	"6"	"0"	63	63	56		
22	"CISF"	"C"	"9"	"0"	8	8	6		
28	"CRPF"	"D"	"9"	"0"	421	421	356		
30	"CRPF"	"D"	"6"	"0"	281	281	246		   ------diffrence from previous
31	"CRPF"	"D"	"1"	"0"	156	156	151		
32	"CRPF"	"D"	"2"	"0"	78	78	76	       ------diffrence from previous	
34	"ITBPF"	"E"	"9"	"0"	22	22	20		
36	"ITBPF"	"E"	"6"	"0"	7	7	5		
40	"SSB"	"F"	"9"	"0"	8	8	6
----------------------------------------------------------------------------------------------------------------
update candidates set allocated_category=null,allocated_post=null,allocated_against_ur=null,sub_category=null;

update vacancy_female set current=initial_vacancy,allocated=null,left_vacancy=null;
update vacancy_male set allocated=null,left_vacancy=null;
---------------------------------------------------------------------------------------------
----------------------------After 3rd Time Allocation---------------------------------------
---------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category is not null --1555
select count(rollno) from candidates where allocated_category is not null and gender='2';--1424
select count(rollno) from candidates where allocated_category is not null and gender='1';--131

select sum(initial_vacancy) from vacancy_male--1563
select sum(allocated) from vacancy_male--1424
select sum(left_vacancy) from vacancy_male--0

select * from vacancy_male where left_vacancy<>'0' order by slno
--------------------------------------------------
select sum(initial_vacancy) from vacancy_female--131
select sum(allocated) from vacancy_female--131
select sum(left_vacancy) from vacancy_female--0

select * from vacancy_female where left_vacancy<>'0'
---------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category in ('9','1','2','6','0') and gender='2';--1285
select count(rollno) from candidates where allocated_category in ('3') and gender='2';--139

select sum(allocated) from vacancy_male where category_code in ('9','1','2','6','0');--1285
select sum(allocated) from vacancy_male where category_code in ('3');--139

select sum(current) from vacancy_male where category_code in ('9','1','2','6','0');--1285
select sum(current) from vacancy_male where category_code in ('3');--139

select sum(left_vacancy) from vacancy_male where category_code in ('9','1','2','6','0');--0

select * from vacancy_male where category_code in ('9','1','2','6','0') and  left_vacancy>0 order by slno
--------------------------------------------------
select sum(left_vacancy) from vacancy_male where category_code in ('3');--0
select * from vacancy_male where category_code in ('3') and  left_vacancy>0;--0

select sum(initial_vacancy) from vacancy_male where category_code in ('9','1','2','6','0');--1424
select sum(initial_vacancy) from vacancy_male where category_code='3';--139
--------------------------------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category in ('9','1','2','6','0') and gender='1';--131
select count(rollno) from candidates where allocated_category in ('3') and gender='1';--0

select sum(allocated) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(allocated) from vacancy_female where category_code in ('3');--null

select sum(current) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(current) from vacancy_female where category_code in ('3');--null

select sum(left_vacancy) from vacancy_female where category_code in ('9','1','2','6','0');--0
select * from vacancy_female where category_code in ('9','1','2','6','0') and  left_vacancy>0;--0

select sum(left_vacancy) from vacancy_female where category_code in ('3');--null
select * from vacancy_female where category_code in ('3') and  left_vacancy>0;--0

select sum(initial_vacancy) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(initial_vacancy) from vacancy_female where category_code='3';--null
--------------------------------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where  allocated_against_ur<>'';--0
select count(rollno) from candidates where  allocated_against_ur='';--1424
select count(rollno) from candidates where  allocated_against_ur is not null;--1424

select count(rollno) from candidates where  allocated_against_ur='1';--0
-----------------------------After 3 time Adjust Programm(Other than Post-A)-------------------------------------------
select * from vacancy_male where initial_vacancy<>current order by slno--14
-------------------------------------------------------------------------------------
9	"SIDP"	"A"	"1"	"3"	0	0	1	1	0
10	"SIDP"	"A"	"2"	"3"	0	0	1	1	0
14	"SIDP"	"A"	"1"	"3*"1	1	0	0	0
15	"SIDP"	"A"	"2"	"3*"1	1	0	0	0
16	"BSF"	"B"	"9"	"0"	94	94	77		
18	"BSF"	"B"	"6"	"0"	63	63	56		
22	"CISF"	"C"	"9"	"0"	8	8	6		
28	"CRPF"	"D"	"9"	"0"	421	421	356		
30	"CRPF"	"D"	"6"	"0"	281	281	245		
31	"CRPF"	"D"	"1"	"0"	156	156	151		
32	"CRPF"	"D"	"2"	"0"	78	78	77		
34	"ITBPF"	"E"	"9"	"0"	22	22	20		
36	"ITBPF"	"E"	"6"	"0"	7	7	5		
40	"SSB"	"F"	"9"	"0"	8	8	6		
-------------------------------------------------------------------------------------
9	"SIDP"	"A"	"1"	"3"	0	0	1	1	0
10	"SIDP"	"A"	"2"	"3"	0	0	1	1	0
14	"SIDP"	"A"	"1"	"3*"1	1	0	0	0
15	"SIDP"	"A"	"2"	"3*"1	1	0	0	0
16	"BSF"	"B"	"9"	"0"	94	94	77		
18	"BSF"	"B"	"6"	"0"	63	63	56		
22	"CISF"	"C"	"9"	"0"	8	8	6		
28	"CRPF"	"D"	"9"	"0"	421	421	356		
30	"CRPF"	"D"	"6"	"0"	281	281	245		   
31	"CRPF"	"D"	"1"	"0"	156	156	151		
32	"CRPF"	"D"	"2"	"0"	78	78	77		   
34	"ITBPF"	"E"	"9"	"0"	22	22	20		
36	"ITBPF"	"E"	"6"	"0"	7	7	5		
40	"SSB"	"F"	"9"	"0"	8	8	6		
-------------------------------------------------------------------------------------
NO diffrence from previous	
----------------------------------------------------------------------------------------------------------------
update candidates set allocated_category=null,allocated_post=null,allocated_against_ur=null,sub_category=null;

update vacancy_female set current=initial_vacancy,allocated=null,left_vacancy=null;
update vacancy_male set allocated=null,left_vacancy=null;
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
----------------------------After 4th/Final Time Allocation---------------------------------------
---------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category is not null --1555
select count(rollno) from candidates where allocated_category is not null and gender='2';--1424
select count(rollno) from candidates where allocated_category is not null and gender='1';--131

select sum(initial_vacancy) from vacancy_male--1563
select sum(allocated) from vacancy_male--1424
select sum(left_vacancy) from vacancy_male--0

select * from vacancy_male where left_vacancy<>'0' order by slno
--------------------------------------------------
select sum(initial_vacancy) from vacancy_female--131
select sum(allocated) from vacancy_female--131
select sum(left_vacancy) from vacancy_female--0

select * from vacancy_female where left_vacancy<>'0'
---------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category in ('9','1','2','6','0') and gender='2';--1285
select count(rollno) from candidates where allocated_category in ('3') and gender='2';--139

select sum(allocated) from vacancy_male where category_code in ('9','1','2','6','0');--1285
select sum(allocated) from vacancy_male where category_code in ('3');--139

select sum(current) from vacancy_male where category_code in ('9','1','2','6','0');--1285
select sum(current) from vacancy_male where category_code in ('3');--139

select sum(left_vacancy) from vacancy_male where category_code in ('9','1','2','6','0');--0

select * from vacancy_male where category_code in ('9','1','2','6','0') and  left_vacancy>0 order by slno
--------------------------------------------------
select sum(left_vacancy) from vacancy_male where category_code in ('3');--0
select * from vacancy_male where category_code in ('3') and  left_vacancy>0;--0

select sum(initial_vacancy) from vacancy_male where category_code in ('9','1','2','6','0');--1424
select sum(initial_vacancy) from vacancy_male where category_code='3';--139
--------------------------------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where allocated_category in ('9','1','2','6','0') and gender='1';--131
select count(rollno) from candidates where allocated_category in ('3') and gender='1';--0

select sum(allocated) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(allocated) from vacancy_female where category_code in ('3');--null

select sum(current) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(current) from vacancy_female where category_code in ('3');--null

select sum(left_vacancy) from vacancy_female where category_code in ('9','1','2','6','0');--0
select * from vacancy_female where category_code in ('9','1','2','6','0') and  left_vacancy>0;--0

select sum(left_vacancy) from vacancy_female where category_code in ('3');--null
select * from vacancy_female where category_code in ('3') and  left_vacancy>0;--0

select sum(initial_vacancy) from vacancy_female where category_code in ('9','1','2','6','0');--131
select sum(initial_vacancy) from vacancy_female where category_code='3';--null
--------------------------------------------------------------------------------------------------------------------------------------------
select count(rollno) from candidates where  allocated_against_ur<>'';--0
select count(rollno) from candidates where  allocated_against_ur='';--1424
select count(rollno) from candidates where  allocated_against_ur is not null;--1424

select count(rollno) from candidates where  allocated_against_ur='1';--0
-------------------------------------------------------------------------------------------------------------------
select * from vacancy_female --30
select * from vacancy_female where current=allocated--30
select * from vacancy_male --45
select * from vacancy_male where current=allocated--45
-----------------------------------------------------------------------------------------------------------------------
select  131+1424=1555
------------------------------------------------------------------------------------------------------------------------------------------------
copy (select * from candidates order by meritm,meritf)
to 'F:\Allocation Programs\SICPO2020_Final_Allocation\sicpo2020_allocation\candidate_sicpo2020.csv' delimiter ',' csv header--2859 

copy (select rollno,regno,concat(allocated_category,allocated_post,sub_category) as allocated_category_allocated_post_sub_category from candidates where  gender='2' order by meritm)
to 'F:\Allocation Programs\SICPO2020_Final_Allocation\sicpo2020_allocation\rollkey_sicpo2020_male.csv' delimiter ',' csv header--2531

copy (select rollno,regno,concat(allocated_category,allocated_post) as allocated_category_allocated_post from candidates where gender='1' order by meritf)
to 'F:\Allocation Programs\SICPO2020_Final_Allocation\sicpo2020_allocation\rollkey_sicpo2020_female.csv' delimiter ',' csv header--328

copy (select * from vacancy_female order by slno)
to 'F:\Allocation Programs\SICPO2020_Final_Allocation\sicpo2020_allocation\vacancy_female.csv' delimiter ',' csv header--30

copy (select * from vacancy_male order by slno)
to 'F:\Allocation Programs\SICPO2020_Final_Allocation\sicpo2020_allocation\vacancy_male.csv' delimiter ',' csv header--45
-------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------Mismatch checking------------------------------------------------------------------------------------------------------------
select a.rollno,a.allocated_category,b.allocated_category,a.allocated_post,b.allocated_post
from candidates a, candidates_old b where a.rollno=b.rollno and a.regno=b.regno and 
a.allocated_category=b.allocated_category and a.allocated_post=b.allocated_post--1550
--------------------------------------------------------------------------------------------------------------------------
select * from candidates where rollno ='2411003150'

-------------------------------------------------------------------------------------------------------------------------------------------------
select rollno,regno,concat(allocated_post,allocated_category,sub_category) as allocated_category_allocated_post_sub_category from candidates where rollno in ('2201083024','2201035718','2201044432','2201091817',
'2201045769','2201080402','3010002765','2201072270','2405032706','2201065754',
'2411003150','2201087442','3013002445','2405025063','2201042198','7208702971','2405018819','2201105170',
'4410015024','8001000945')  order by rollno
-------------------------------------------------------------------------------------------------------------------------------------------------
"2201035718"	"94000012137"	"9F0"
"2201042198"	"84000170519"	"3B0"
"2201044432"	"40000826742"	"9A0"
"2201045769"	"74000226669"	"6B0"
"2201065754"	"93000557789"	     
"2201072270"	"40000825391"	"3C0"
"2201080402"	"40000788993"	"3C0"
"2201083024"	"40001631830"	"9C0"
"2201087442"	"20001364146"	"9A3*"
"2201091817"	"40000986449"	"9E0"
"2201105170"	"40000784754"	"3D0"
"2405018819"	"20000843472"	"6A3*"
"2405025063"	"20000917095"	"3E0"
"2405032706"	"20000812548"	
"2411003150"	"82000264699"	"6D0"
"3010002765"	"73000373025"	
"3013002445"	"30000682955"	"9A3*"
"4410015024"	"40000786948"	
"7208702971"	"50001695353"	"9A3*"
"8001000945"	"10000492291"	"3D0"
-------------------------------------------------------------------------------------------------------------------------------------------------