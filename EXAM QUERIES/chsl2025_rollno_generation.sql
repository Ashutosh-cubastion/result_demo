create table mother_table_chsl2025 as
(select "registrationNo" as reg_id, name as cand_name, gender,
category,case when "isPwbd"=true then 'Yes'
when "isPwbd"=false then 'No' end as ph, "typeOfPwbd" as ph_code,
null as center_name, null as center_code, null as old_center_code,
case when "isEsm"=true then 'Yes'
when "isEsm"=false then 'No'end as ex_serviceman, 
case when "isCivilPost"=true then 'Yes'
when "isCivilPost"=false then 'No' end as exs_res_availed,
case when "isBenchmarkDisabilityVh"=true then 'Yes'
when "isBenchmarkDisabilityVh"=false then 'No' end as is_pwbd_blindness,
case when "isBenchmarkDisabilityOh"=true then 'Yes'
when "isBenchmarkDisabilityOh"=false then 'No' end as suffer_cerebralpalsy,
case when "isPhysicalLimitToWrite"=true then 'Yes'
when "isPhysicalLimitToWrite"=false then 'No' end as locomotor,
case when "isScribe"=true then 'Yes'
when "isScribe"=false then 'No' end as scribe_required,
case when "isOwnScribe"=true then 'Yes'
when "isOwnScribe"=false then 'No' end as own_scribe,
 "scribeMedium" as scribe_medium,
"createdAt"::date AS form_completion_date, to_char("createdAt", 'HH24:MI:SS') AS form_completion_time
from "chsl2025Applications_12_08_2025_final");


select category,count(*) from mother_table_chsl2025 group by category;
select ph,count(*) from mother_table_chsl2025 group by ph;
select ph_code,count(*) from mother_table_chsl2025 group by ph_code;
select ex_serviceman,count(*) from mother_table_chsl2025 group by ex_serviceman;
select exs_res_availed,count(*) from mother_table_chsl2025 group by exs_res_availed;
select is_pwbd_blindness,count(*) from mother_table_chsl2025 group by is_pwbd_blindness;
select suffer_cerebralpalsy,count(*) from mother_table_chsl2025 group by suffer_cerebralpalsy;
select locomotor,count(*) from mother_table_chsl2025 group by locomotor;
select scribe_required,count(*) from mother_table_chsl2025 group by scribe_required;
select own_scribe,count(*) from mother_table_chsl2025 group by own_scribe;
select scribe_medium,count(*) from mother_table_chsl2025 group by scribe_medium;

select category,count(*) from "chsl2025Applications_12_08_2025_final" group by category;
select "isPwbd",count(*) from "chsl2025Applications_12_08_2025_final" group by "isPwbd";
select "typeOfPwbd",count(*) from "chsl2025Applications_12_08_2025_final" group by "typeOfPwbd";
select "isEsm",count(*) from "chsl2025Applications_12_08_2025_final" group by "isEsm";
select "isCivilPost",count(*) from "chsl2025Applications_12_08_2025_final" group by "isCivilPost";
select "isBenchmarkDisabilityVh",count(*) from "chsl2025Applications_12_08_2025_final" group by "isBenchmarkDisabilityVh";
select "isBenchmarkDisabilityOh",count(*) from "chsl2025Applications_12_08_2025_final" group by "isBenchmarkDisabilityOh";
select "isPhysicalLimitToWrite",count(*) from "chsl2025Applications_12_08_2025_final" group by "isPhysicalLimitToWrite";
select "isScribe",count(*) from "chsl2025Applications_12_08_2025_final" group by "isScribe";
select "isOwnScribe",count(*) from "chsl2025Applications_12_08_2025_final" group by "isOwnScribe";
select "scribeMedium",count(*) from "chsl2025Applications_12_08_2025_final" group by "scribeMedium";

select * from chsl_2025_tier1_candidate_checkins limit 10;----1547180

alter table mother_table_chsl2025 add column city_code character varying;
alter table mother_table_chsl2025 add column city_name character varying;
alter table mother_table_chsl2025 add column exam_date date;
alter table mother_table_chsl2025 add column shift character varying;

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift=b.shift
from chsl_2025_tier1_candidate_checkins b where a.reg_id=b.candidate_id;---1547178 updates

select * from chsl_2025_tier1_candidate_checkins where candidate_id in 
(select distinct reg_id from mother_table_chsl2025 where shift is null );

select * from chsl_2025_tier1_candidate_checkins where candidate_id not in 
(select distinct reg_id from mother_table_chsl2025 );


---dob (yyyy-mm-dd)
---gender 1,2 3,
category ----1,2,
ph,
ph_code ----4,5,7,8
ex_servieman
ex_res_availed
suffer
is_pwbd
locomo
scribe_reg
scrin_med
own_scri
centre_name1
centre_name2
centre_name3
form_date
form_time
cbe_medium
self_checkin_----yes/no
city_code
city_name
exam_date
shift
bucket,
langue
slot_ph
slot_created_at
venue_code

create table mother_table_chsl2025 as
(select "registrationNo" as reg_id, name as cand_name, dob, gender,
category,case when "isPwbd"=true then 'Yes'
when "isPwbd"=false then 'No' end as ph, "typeOfPwbd" as ph_code,
case when "isEsm"=true then 'Yes'
when "isEsm"=false then 'No'end as ex_serviceman, 
case when "isCivilPost"=true then 'Yes'
when "isCivilPost"=false then 'No' end as exs_res_availed,
case when "isBenchmarkDisabilityOh"=true then 'Yes'
when "isBenchmarkDisabilityOh"=false then 'No' end as suffer_cerebralpalsy,
case when "isBenchmarkDisabilityVh"=true then 'Yes'
when "isBenchmarkDisabilityVh"=false then 'No' end as is_pwbd_blindness,
case when "isPhysicalLimitToWrite"=true then 'Yes'
when "isPhysicalLimitToWrite"=false then 'No' end as locomotor,
case when "isScribe"=true then 'Yes'
when "isScribe"=false then 'No' end as scribe_required,
"scribeMedium" as scribe_medium,
case when "isOwnScribe"=true then 'Yes'
when "isOwnScribe"=false then 'No' end as own_scribe,
"centreName1" as centre_name1,
"centreName2" as centre_name2,
"centreName3" as centre_name3,
"cbeMedium" as cbe_medium,
"createdAt"::date AS form_completion_date, to_char("createdAt", 'HH24:MI:SS') AS form_completion_time
from "chsl2025Applications_12_08_2025_final");

update mother_table_chsl2025 a
set 
a.self_checkin='Yes',
a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift=b.shift,
a.bucket=b.bucket,
a.slot_language=b.language_index,
a.slot_ph=b.ph,
a.slot_createdat=b.created_at
from chsl_2025_tier1_candidate_checkins b where a.reg_id=b.candidate_id;

update mother_table_chsl2025 set gender='1' where gender='Female';----128253
update mother_table_chsl2025 set gender='2' where gender='Male';----1854819
update mother_table_chsl2025 set gender='3' where gender='Transgender';----29

select distinct PH_CODE,count(*) from mother_table_chsl2025 group by PH_CODE;

update mother_table_chsl2025 set ph_code='4' where ph_code='OH';----22317
update mother_table_chsl2025 set ph_code='5' where ph_code='HH';----5406
update mother_table_chsl2025 set ph_code='7' where ph_code='VH';----7779
update mother_table_chsl2025 set ph_code='8' where ph_code='Others';---4395

update mother_table_chsl2025 set self_checkin='No' where self_checkin is null;---1525923


10000023327
10000060845
10000162938
10000701364
10000769930
10000787343
10000933139
10000992431
10001017479
10001324086
10001605996
10001639659
10001656154
10002040937
10005800855
10005815851
10005893636
10005906866
10005913935
10005930479
10005964016
10006118233
10006349368
10006677323
10006713127
10007985005
10007998801
10008083281
10008097797
10008235324
10008325533
10008545026
10008554562
10008715740
10008851405
10009130029
10009168777
10009350878
10009594017
10009625373
10009965855
10010379014
10010480072
10010501885
10010524533
10010570364
10010603966
10010604022
10010719156
10010895992
10011011089
10011089991
10011197426
10011216082
10011223152
10011383151
10011439622
10011480420
10011525539
10011594850
10011699548
10011701391
10012269354
10012352597
10012379623
10012521174
10012544932
10012834838
10013007498
10013087361
10013544606
10013571772
10013955588
10014135684
10014164044
10014340460
10014459799
10014752207
10014856024
10015653807
10015655227
10015663610
10016106120
10016301757
10016379010
10016569550
10017599685
10017674682
10018623945
10020585865
10021599477
10021727224
10021748006
10021933326
10021984726
10022099176
10022105015
10022127683
10022278375
10023305586
10023519055
10023622408
10023723601
10023737032
10023797608
10024010119
10024085588
10024165500
10024215523
10024293208
10024293957
10024369800
10024556714
10024582828
10024794256
10024795959
10024813656
10024934793
10025006797
10025077879
10025140562
10025221195
10025246300
10025249127
10025326208
10025402320
10025526926
10025561892
10025581479
10025655377
10025746532
10025806395
10025827355
10025844497
10025921559
10025954078
10026006368
10026154142
10026169464
10026172194
10026211973
10026297848
10026302372


create table chsl_2025_tier1_venues
(
	SRNO integer,
	EDU_CODE character varying,
	SSC_CODE character varying,
	REGION character varying,
	STATE character varying,
	CENTRE_CODE character varying,
	ADVERTISED_CITY character varying,
	VENUE_NAME character varying,
	VENUE_ADDRESS character varying,
	PINCODE	character varying,
	ACTUAL_CITY character varying,
	ACTUAL_STATE character varying,
	PH_FRIENDLY character varying,
	PH_COUNT integer,
	MAX integer,
	TOTAL integer,
	TOTAL_SHIFT integer,
	capacity integer,
	examdate1 character varying,
	examdate date,
	shift integer,
	remaining_capacity integer
);

create table chsl2025_city as
(select examdate,shift,centre_code,sum(ph_count) as ph_count,sum(capacity) as total_capacity from 
chsl_2025_tier1_venues group by examdate,shift,centre_code order by examdate,shift,centre_code);


with cte as
(
	select exam_date,shift,city_code,count(*) as slotted_capacity from chsl_2025_tier1_candidate_checkins group by exam_date,shift,city_code order by exam_date,shift,city_code
)
update chsl2025_city a 
set a.slotted_capacity= b.slotted_capacity
from cte as b where
a.examdate=b.exam_date and a.shift=b.shift and a.centre_code=b.city_code;---5439 updates

alter table chsl2025_city add column remaining_capacity integer;

update chsl2025_city
set remaining_capacity= total_capacity;

update chsl2025_city
set remaining_capacity= total_capacity-slotted_capacity
where slotted_capacity is not null;

select * from chsl2025_city where centre_code='1010' and examdate='2025-11-12' and shift='2';
select * from chsl2025_city where centre_code='2201' and examdate='2025-11-13' and shift='1';

select distinct b.exam_date,b.shift,count(*)
from mother_table_chsl2025 a,chsl_2025_tier1_candidate_checkins b
where a.reg_id=b.candidate_id
and a.cbe_medium='23 - Urdu'
group by b.exam_date,b.shift;

select a.*,b.* 
from mother_table_chsl2025 a,chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='23 - Urdu';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='23 - Urdu'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='23 - Urdu';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='13 - Manipuri (also Meitei or Meithei)'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='13 - Manipuri (also Meitei or Meithei)';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='12 - Malayalam'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='12 - Malayalam';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='14 - Marathi'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='14 - Marathi';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='17 - Punjabi'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='17 - Punjabi';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='03 - Assamese'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='03 - Assamese';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='3',
a.bucket='ac',
a.slot_language='03 - Assamese'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='03 - Assamese'
and b.exam_date='2025-11-22' and b.city_code='5107';-----shift 3 9 candidates

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='21 - Tamil'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='21 - Tamil';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='22 - Telugu'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='22 - Telugu';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='16 - Odiya'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='16 - Odiya';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='08 - Kannada'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='08 - Kannada';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='3',
a.bucket='ac',
a.slot_language='08 - Kannada'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='08 - Kannada'
and b.exam_date='2025-11-15' and b.city_code='9012';---24 candidates shift 3 allocated

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date='2025-11-29',
a.shift='1',
a.bucket='ac',
a.slot_language='08 - Kannada'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='08 - Kannada'
and b.exam_date='2025-11-22' and b.city_code='9012';---74 candidates shifted to 29th shift1

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='07 - Gujarati'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='07 - Gujarati';

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date='2025-11-15',
a.shift='1',
a.bucket='ac',
a.slot_language='07 - Gujarati'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='07 - Gujarati'
and b.exam_date='2025-11-30' and b.city_code='7011';----1 candidate shifted to 15th shift1

update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='04 - Bengali'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='04 - Bengali';


update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='01 - Hindi'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='01 - Hindi';


update mother_table_chsl2025 a
set a.city_code=b.city_code,
a.city_name=b.city_name,
a.exam_date=b.exam_date,
a.shift='1',
a.bucket='ac',
a.slot_language='02 - English'
from chsl_2025_tier1_city_selections b
where a.reg_id=b.candidate_id
and a.cbe_medium='02 - English';

with cte as
(
	select exam_date,shift,city_code,count(*) as slotted_capacity from mother_table_chsl2025 group by exam_date,shift,city_code order by exam_date,shift,city_code
)
update chsl2025_city a 
set a.slotted_capacity_new= b.slotted_capacity
from cte as b where
a.examdate=b.exam_date and a.shift=b.shift::integer and a.centre_code=b.city_code;----

select * from pwd_cand_ranking_allocation order by form_completion_date,form_completion_time::time limit 10;
alter table pwd_cand_ranking_allocation add column pwd_rank integer;


UPDATE pwd_cand_ranking_allocation
SET pwd_rank = sub.rn
FROM (
  SELECT reg_id, ROW_NUMBER() OVER (ORDER BY form_completion_date,form_completion_time::time) AS rn
  FROM pwd_cand_ranking_allocation 
) AS sub
WHERE pwd_cand_ranking_allocation.reg_id = sub.reg_id;

select * into male_cand_ranking_allocation from mother_table_chsl2025 where self_checkin='No' and ph='No' and gender='2'  ;---843870

alter table male_cand_ranking_allocation add column male_rank integer;

UPDATE male_cand_ranking_allocation
SET male_rank = sub.rn
FROM (
  SELECT reg_id, ROW_NUMBER() OVER (ORDER BY form_completion_date,form_completion_time::time) AS rn
  FROM male_cand_ranking_allocation 
) AS sub
WHERE male_cand_ranking_allocation.reg_id = sub.reg_id;

select * into female_cand_ranking_allocation from mother_table_chsl2025 where self_checkin='No' and ph='No' and gender in ('1','3')  ;---645962

alter table female_cand_ranking_allocation add column female_rank integer;

UPDATE female_cand_ranking_allocation
SET female_rank = sub.rn
FROM (
  SELECT reg_id, ROW_NUMBER() OVER (ORDER BY form_completion_date,form_completion_time::time) AS rn
  FROM female_cand_ranking_allocation 
) AS sub
WHERE female_cand_ranking_allocation.reg_id = sub.reg_id;


'10024221367', '10018785788', '10025897801', '10011578119', '10022006210', '10021799299', '10021035330', '10024256672', '10010615810', '10001270890', '10008978195', '10023626771', '10024260360', '10017429256'


create table chsl2025_allocations_p
(registrationNo character varying,
 isPwbd character varying,	
 gender character varying,
 allocated_centreCode character varying,
 allocated_exam_date date,
 allocated_shift character varying,
 allocated_round character varying,
 createdAt date
)

select b.* from mother_table_chsl2025 a, chsl2025_allocations_p b 
where a.reg_id=b.registrationno
and b.allocated_centreCode NOT IN (a.centre_code1, a.centre_code2, a.centre_code3);

select b.* from mother_table_chsl2025 a, chsl2025_allocations_m b 
where a.reg_id=b.registrationno
and b.allocated_centreCode NOT IN (a.centre_code1, a.centre_code2, a.centre_code3);

select b.* from mother_table_chsl2025 a, chsl2025_allocations_f b 
where a.reg_id=b.registrationno
and b.allocated_centreCode NOT IN (a.centre_code1, a.centre_code2, a.centre_code3);

select distinct a.self_checkin from mother_table_chsl2025 a, chsl2025_allocations_m b 
where a.reg_id=b.registrationno;---No

select distinct a.self_checkin from mother_table_chsl2025 a, chsl2025_allocations_f b 
where a.reg_id=b.registrationno;---No

select distinct a.self_checkin from mother_table_chsl2025 a, chsl2025_allocations_m b 
where a.reg_id=b.registrationno;---No

update mother_table_chsl2025 a
set a.city_code=b.allocated_centreCode,
a.exam_date=b.allocated_exam_date,
a.shift=b.allocated_shift
from chsl2025_allocations_p b 
where a.reg_id=b.registrationno;----20047 updates

update mother_table_chsl2025 a
set a.city_code=b.allocated_centreCode,
a.exam_date=b.allocated_exam_date,
a.shift=b.allocated_shift
from chsl2025_allocations_m b 
where a.reg_id=b.registrationno;---- 650120 updates

update mother_table_chsl2025 a
set a.city_code=b.allocated_centreCode,
a.exam_date=b.allocated_exam_date,
a.shift=b.allocated_shift
from chsl2025_allocations_f b 
where a.reg_id=b.registrationno;---- 592255 updates


create table chsl2025_eng_hin as
(
select distinct exam_date,shift,city_code,self_checkin,count(*) filter (where cbe_medium='01 - Hindi') as hindi ,
count(*) filter (where cbe_medium='02 - English') as english
from mother_table_chsl2025 where shift is not null and self_checkin='No' and exam_date in ('2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20','2025-11-21','2025-11-22')
group by exam_date,shift,city_code,self_checkin
);

create table chsl2025_other_lang1 as
(
select distinct exam_date,shift,city_code,count(*) filter (where cbe_medium='13 - Manipuri (also Meitei or Meithei)') as manipuri ,
count(*) filter (where cbe_medium='03 - Assamese') as Assamese,
count(*) filter (where cbe_medium='10 - Konkani') as Konkani,
count(*) filter (where cbe_medium='23 - Urdu') as Urdu,
count(*) filter (where cbe_medium='12 - Malayalam') as Malayalam,
count(*) filter (where cbe_medium='16 - Odiya') as Odiya,
count(*) filter (where cbe_medium='22 - Telugu') as Telugu
from mother_table_chsl2025 where shift is not null and exam_date not in ('2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20','2025-11-21','2025-11-22')
group by exam_date,shift,city_code
);

 '5301','5501','5502','5601','9001'

create table chsl2025_other_lang2 as
(
select distinct exam_date,shift,city_code,
count(*) filter (where cbe_medium='08 - Kannada)') as kannada ,
count(*) filter (where cbe_medium='14 - Marathi') as marathi,
count(*) filter (where cbe_medium='21 - Tamil') as tamil,
count(*) filter (where cbe_medium='17 - Punjabi') as punjabi
from mother_table_chsl2025 where shift is not null and exam_date not in ('2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20','2025-11-21','2025-11-22','2025-11-24','2025-11-25','2025-11-26','2025-11-27')
group by exam_date,shift,city_code
);

create table chsl2025_other_lang3 as
(
select distinct exam_date,shift,city_code,
count(*) filter (where cbe_medium='04 - Bengali') as bengali ,
count(*) filter (where cbe_medium='07 - Gujarati') as Gujarati
from mother_table_chsl2025 where shift is not null and exam_date in ('2025-11-12','2025-11-13','2025-11-14')
group by exam_date,shift,city_code
);

create table chsl2025_eng_hin_allday as
(
select distinct exam_date,shift,city_code,self_checkin,
count(*) filter (where cbe_medium='01 - Hindi') as hindi ,
count(*) filter (where cbe_medium='02 - English') as english
from mother_table_chsl2025 where shift is not null and self_checkin='No' 
group by exam_date,shift,city_code,self_checkin
);

------check points------

select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='01 - Hindi';--all day excpet 16,23
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='02 - English';---all day excpet 16,23
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='03 - Assamese';---15,17,18,19,20,21,22--ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='04 - Bengali';---15,17,18,19,20,21,22,24,25,26,27,28,29,30--ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='07 - Gujarati';---15,17,18,19,20,21,22,24,25,26,27,28,29,30---ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='08 - Kannada';----15,17,18,19,20,21,22,24,25,26,27---ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='10 - Konkani';----15--ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='12 - Malayalam';----15,17,18,19,20--ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='13 - Manipuri (also Meitei or Meithei)';---15--ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='14 - Marathi';---15,17,18,19,20,21,22,24,25---ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='16 - Odiya';---15,17,18,19,20,21,22---ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='17 - Punjabi';--15,17,18,19,20,21,22,24,25---ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='21 - Tamil';---15,17,18,19,20,21,22,24---ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='22 - Telugu';---15,17,18,19,20,21---ok
select distinct exam_date from mothertable_satishsir where city_code is not null and  cbe_medium='23 - Urdu';---15---ok

select a.reg_id,a.city_code as mother_city,b.city_code as checkin_city,a.centre_code1, a.centre_code2, a.centre_code3 
from mothertable_satishsir a,chsl_2025_tier1_candidate_checkins b
where a.reg_id=b.candidate_id and
a.city_code <> b.city_code;


select distinct a.city_code,b.city_code
from mothertable_satishsir a,chsl_2025_tier1_candidate_checkins b
where a.reg_id=b.candidate_id and
a.city_code <> b.city_code;

"8007"	"8012"
"8001"	"8011"

select a.reg_id,a.city_code as mother_city,b.city_code as checkin_city,a.exam_date as mother_date,b.exam_date as checkin_date
from mothertable_satishsir a,chsl_2025_tier1_candidate_checkins b
where a.reg_id=b.candidate_id and
a.exam_date<>b.exam_date;---no records


select a.reg_id,a.city_code as mother_city,b.city_code as checkin_city,a.exam_date as mother_date,b.exam_date as checkin_date,a.shift as mother_shift,b.shift as checkin_shift
from mothertable_satishsir a,chsl_2025_tier1_candidate_checkins b
where a.reg_id=b.candidate_id and
a.shift::int<>b.shift;---no records

select reg_id,city_code,centre_code1, centre_code2, centre_code3 ,
substring(city_code,1,1) as region_alloted,substring(centre_code1,1,1)as cen1,substring(centre_code2,1,1) as cen2, substring(centre_code3,1,1) as cen3
from mothertable_satishsir 
where self_checkin='No' and city_code is not null
and substring(city_code,1,1) not in (substring(centre_code1,1,1),substring(centre_code2,1,1),substring(centre_code3,1,1));---9149 differenr regions alloted

select * from mothertable_satishsir 
where self_checkin='No' and city_code is not null
and substring(city_code,1,1) not in (substring(centre_code1,1,1),substring(centre_code2,1,1),substring(centre_code3,1,1));




select * from mothertable_satishsir_ph limit 10;
select * from city_shift_plan limit 10;


WITH 
-- Step 1: Pick random mothertable_satishsir_latest from shift 2 (to move → shift 3)
from_shift2 AS (
  SELECT reg_id, city_code, 3 AS new_shift
  FROM (
    SELECT c.*,
           ROW_NUMBER() OVER (PARTITION BY c.city_code ORDER BY random()) AS rn
    FROM mothertable_satishsir_ph c
    JOIN city_shift_plan p ON c.city_code = p.city_code
    WHERE c.shift = '2'
	and c.ph_code in ('4','5')
  ) x
  JOIN city_shift_plan p USING (city_code)
  WHERE x.rn <= p.no_to_shift
),

-- Step 2: Pick random mothertable_satishsir_latest from shift 3 (to move → shift 2)
from_shift3 AS (
  SELECT reg_id, city_code, 2 AS new_shift
  FROM (
    SELECT c.*,
           ROW_NUMBER() OVER (PARTITION BY c.city_code ORDER BY random()) AS rn
    FROM mothertable_satishsir_ph c
    JOIN city_shift_plan p ON c.city_code = p.city_code
    WHERE c.shift = '3' and c.is_pwbd_blindness='Yes'
  ) x
  JOIN city_shift_plan p USING (city_code)
  WHERE x.rn <= p.no_to_shift
),

-- Step 3: Combine both lists
combined AS (
  SELECT * FROM from_shift2
  UNION ALL
  SELECT * FROM from_shift3
)

--select * from combined;

-- Step 4: Perform the actual swap
UPDATE mothertable_satishsir_ph c
SET shift = combined.new_shift
FROM combined
WHERE c.reg_id = combined.reg_id;

select * from mothertable_satishsir_latest where reg_id in('10025931753','10022301948','10010593103','10023676374','10010069296','10022299711','10010303747','10011204591','10025053104','10026251636','10016236476','10025246187','10023252229','10010168885','10025640055','10021800167','10011027558','10009731050','10022013143','10024805638','10023606394','10025522073','10023610076','10009857624','10025519068','10024074456','10024730583','10025242993','10023999682','10013576213','10010329369','10024952913','10017122781','10011243143','10024607731','10023685715','10023311048','10019835075','10011238554','10014396894','10025047812','10019131469','10019842184','10025036285','10024846108','10010738598','10010226934','10010316052','10019895006','10025376466','10024631344','10025268319','10023663833','10026077077','10025778258','10010414129','10025150993','10008631863','10025196966','10013446905','10023570187','10018212860','10016464154','10025203175','10025929660','10023577464','10021155928','10023576339','10023978968','10025244744','10008305389','10023575384','10024310240','10026241616','10020892852','10011260565','10023581263','10013990214','10013404035','10009298871','10017835364','10021078513','10025385552','10025264686','10014080168','10024308025','10013284848','10012646034','10026030808','10024353432','10022359478','10025804643','10023584434','10015284408','10025929937','10023595453','10015537122','10009049976','10019669826','10023608048','10011636835','10020319956','10016916120','10022312251','10023611118','10009400496','10018641396','10023522316','10023663304','10025519032','10023715678','10010704193','10006656907','10025519203','10024024741','10010843876','10009300756','10025898397','10021497223','10025045459','10025045139','10013162570','10014607634','10025266744','10010870019','10024023463','10016878651','10015025693','10007526416','10023581821','10025930018','10023605767','10008426372','10010562262','10024386327','10012694757','10023670210','10025045934','10024809035','10012324851','10023660071','10001099256','10023215289','10023661002','10023661172','10014196935','10025267717','10023704394','10017462350','10018563165','10024981994','10009537108','10023671721','10024386713','10022378751','10009117737','10024726968','10011312688','10023685858','10009368618','10014635159','10012180327','10016334050','10015063315','10011484437','10010499437','10013531318','10025153026','10023634906','10025520456','10022213253','10023986452','10024308521','10008103652','10023943964','10025927292','10023883363','10019682925','10023285560','10011381165','10022443724','10018219572','10024118714','10017874124','10024952227','10011177120','10011367076','10023732416','10018947922','10008489195','10009593072','10009502432','10015009775','10025048646','10010160785','10010200712','10014344649','10020098797','10023625182','10023776078','10024813928','10025381355','10025934062','10023766876','10025267584','10023991132','10023795854','10025807355','10023785365','10023795975','10024388676','10018906418','10023891796','10024387075','10023888232','10023826959','10025153849','10024933685','10019067350','10005757815','10024027168','10010600613','10013115010','10025048652','10025934470','10011108773','10015149621','10025267835','10023788318','10023789259','10009957153','10025268729','10024311232','10023831806','10023926229','10006700761','10023800525','10023799751','10022165051','10012174323','10023895745','10019099098','10017723677','10023880395','10023834500','10009158881','10011234943','10009853664','10023879066','10023879288','10023929599','10010091309','10023993574','10023899742','10009781176','10010560748','10019674844','10014204738','10023884155','10023930814','10023882239','10024031293','10021937366','10010717280','10018471812','10009463731','10026222557','10023466798','10023929172','10011561921','10023906214','10023915104','10010094145','10023917766','10022031763','10025481916','10023389085','10010838094','10023374446','10025382932','10024602883','10023942635','10024495502','10012359074','10011000495','10011457759','10024316647','10014576518','10024029393','10022183825','10023999483','10025936286','10025807370','10018628309','10010725025','10024033253','10022556260','10023960234','10025156018','10025934503','10025810212','10013630569','10024003006','10023965819','10011318066','10023826290','10008378046','10023968778','10023971378','10019855862','10011405041','10023979270','10023430077','10023975566','10023251460','10024392408','10011454858','10024395235','10013410371','10024014282','10016336078','10024017182','10013978977','10024019562','10024317316','10017574491','10024019270','10020368128','10010408000','10012334712','10010703954','10017890842','10025383662','10001705199','10024044683','10009270278','10010573691','10024056364','10024395065','10025053999','10024492744','10024071568','10010193853','10019037077','10006130320','10024179785','10024131664','10024180758','10025384917','10002170976','10010475138','10024181188','10023267231','10023934972','10025074647','10014000785','10013312670','10011128091','10011166734','10022556538','10024237168','10013681438','10024155475','10024151664','10011590609','10009801730','10014676607','10024823191','10025305279','10011103559','10024187798','10009898447','10024243235','10014353009','10024613864','10024192854','10024193683','10024197158','10002173994','10024197595','10024195834','10023903045','10013871284','10020373210','10024203579','10024818452','10016281975','10024207596','10008514059','10013354622','10024206361','10024210836','10024212820','10023423879','10024212942','10019595560','10016072889','10010931879','10010696265','10010586095','10020330015','10011460930','10017026493','10012509107','10023253564','10024253630','10025158015','10005790936','10010190113','10024258799','10014199906','10024255099','10024263825','10020404831','10010786270','10011054256','10013867162','10018276021','10010740197','10024616967','10010137766','10011505346','10019471171','10012589921','10025056072','10020884019','10022351526','10014624473','10017557766','10010735272','10017742786','10002117768','10014202325','10026220057','10024329586','10019108337','10015558012','10016226477','10010357302','10024305286','10024304862','10025274369','10011704341','10009676411','10012059819','10024333076','10023317283','10024404927','10016785603','10018672082','10018792574','10012512008','10011230285','10024359999','10024341788','10010587089','10024336969','10024342321','10010330291','10009241964','10022164098','10009809564','10016594733','10013591520','10009924602','10023930141','10017469268','10011168113','10025160843','10024344300','10024352437','10025386481','10024354595','10024354253','10008515999','10025387894','10005494450','10025938536','10012520771','10024360579','10010179074','10010042882','10024415397','10024368008','10024254462','10025058794','10024376296','10023298056','10024379161','10024609410','10024501933','10011246885','10014673971','10023667175','10024828115','10012944511','10024501150','10010606087','10025277192','10013421189','10025528654','10025933158','10022227801','10006348075','10024835192','10024401106','10012561870','10002153663','10020904733','10012748203','10016020074','10024391031','10016061361','10024457651','10024457429','10011179016','10024458787','10011270433','10025385286','10009772642','10024454020','10024462531','10010097990','10010760715','10024464131','10024467265','10024467731','10024839063','10024471279','10011021842','10009924775','10011527586','10022370033','10024622775','10024622651','10024511871','10024532808','10024478786','10024472501','10023474427','10009465192','10011293452','10009934849','10024482705','10013798760','10013698545','10024621963','10009605280','10024217743','10024118513','10024517893','10025161427','10012376843','10024518042','10024520215','10010402354','10016327912','10021148843','10010572463','10024849254','10023466491','10014430445','10024851616','10017478931','10017700587','10023569692','10005728124','10005743136','10014425039','10024462969','10014643445','10025529009','10024200670','10024532366','10024535924','10024632362','10012609691','10024536933','10024394389','10024536438','10011497283','10024022388','10010085270','10024538325','10024540728','10010899585','10009202401','10009550023','10010067422','10023722021','10024638499','10012849805','10024644476','10022386160','10009895993','10010825061','10024644861','10022263839','10023943197','10024549143','10024039228','10024556236','10024556686','10009939693','10025389708','10025161884','10024559308','10024648501','10023227034','10010421553','10010241199','10010707207','10025272906','10024860026','10009783841','10024567829','10024563989','10024651118','10016930744','10021269268','10024640176','10022567704','10020747950','10024660254','10009429710','10024425347','10010600985','10024472075','10016205550','10024867451','10025061851','10009528966','10017622931','10024672173','10024669734','10010053014','10013848124','10010573971','10016832767','10024684243','10024687221','10024869400','10025439926','10009280811','10024689896','10022484565','10010250259','10024696082','10023661984','10024697024','10024673293','10025065018','10025939648','10011452245','10023351050','10024867526','10015221263','10024713974','10010017282','10019125295','10016877192','10021497187','10024718004','10009320440','10024721670','10024716783','10024713597','10024713179','10025389321','10026135997','10010309355','10024745144','10020847753','10010432668','10025069096','10010559779','10024657377','10024729599','10024577507','10015527086','10010889210','10016303947','10024774022','10024828313','10005468428','10000680798','10025280922','10024527205','10025071020','10025383454','10013019334','10024795198','10009654204','10024803022','10025531334','10025167366','10025075258','10012562174','10025079019','10008761084','10017685627','10009324376','10025945643','10010073382','10025080166','10024641283','10025782293','10024881220','10016873631','10025167156','10025082520','10008517887','10025811869','10001784948','10022435923','10024904712','10000905395','10024909095','10024911651','10025395563','10024109755','10024911271','10024909673','10017471315','10025283652','10024907975','10014291653','10023786222','10024916967','10023665778','10024087124','10024928817','10011351251','10009688085','10011292916','10024932755','10012893217','10008527103','10009553697','10025170542','10025090982','10024936211','10010434408','10025169975','10025091496','10025091483','10024137424','10024755068','10011260623','10026237077','10025092343','10024619981','10022442715','10024948347','10011626144','10024963560','10012517788','10024959949','10016032291','10024964301','10010599766','10024954127','10025397594','10019618744','10024940104','10010603534','10013821164','10020400808','10025534098','10011244772','10022089338','10014789147','10008192916','10015157557','10026234790','10008223296','10009242355','10025534237','10025003796','10025534988','10023657160','10025035070','10025946633','10010688174','10010598151','10010230172','10021967792','10024866976','10010726108','10026057384','10011108983','10025102050','10025173780','10025672320','10025104560','10025286303','10025285159','10025115803','10024558979','10008109308','10011053668','10025122291','10025123565','10011350069','10025123289','10024753445','10025124839','10015522094','10005780022','10025129213','10022458083','10011259533','10010088513','10009791549','10025133673','10025134507','10025134717','10012207972','10014316631','10025454012','10025533954','10025287523','10025139170','10024568327','10025141032','10025139520','10020674092','10025140836','10025141908','10026058940','10010993312','10009472812','10025147476','10008333294','10025150111','10011445009','10010937619','10024663103','10025186181','10014280413','10025289563','10012973498','10014626283','10010928144','10009961014','10010921061','10025175853','10023972121','10010916977','10025289868','10025191295','10013142701','10025537634','10024178749','10025189751','10025195830','10025283060','10015736351','10025198153','10025263219','10025200129','10025200571','10023361692','10025204783','10025210683','10025395853','10025213463','10025212576','10009557583','10025158046','10025220526','10023340779','10014743320','10026238042','10015921618','10019097133','10025295488','10010469484','10025126418','10025558412','10025178334','10010307979','10025231627','10025235003','10009965034','10016016904','10006661148','10019700983','10018425815','10009908946','10025251164','10010269715','10025251494','10016222529','10025259708','10014450027','10018701392','10015278595','10022013038','10025302270','10010358664','10025303119','10025303309','10025304743','10016109882','10025304729','10025305754','10025305654','10025276951','10022444191','10025308423','10025309835','10008188718','10017721101','10025312348','10019062132','10025315128','10025312560','10016127508','10006274114','10025320122','10025323972','10011079830','10024274143','10010287695','10008562275','10013914713','10016864372','10025342788','10025342655','10009889548','10020997122','10020887652','10023921092','10025815301','10025346630','10010888109','10025346583','10025347399','10025348074','10025348699','10024701953','10025413292','10025157887','10025350035','10009882654','10025414019','10026100510','10025348986','10022249041','10024336211','10024866300','10025294177','10011248047','10025351960','10025265412','10025353656','10017228979','10025355296','10014420438','10025350189','10025415176','10025415751','10016439930','10025356414','10020011872','10025252545','10008750962','10025543178','10013407338','10025363048','10025417195','10025542285','10025417452','10025358987','10014792428','10025366608','10016320783','10025418109','10025371099','10025501428','10010552828','10021980744','10025420466','10024509001','10012272637','10013792361','10010888326','10025749681','10025951906','10025544337','10021307505','10020149729','10025424939','10025425100','10019925660','10009904264','10025438384','10025438504','10025440861','10008138506','10011141823','10009927820','10025443536','10025446677','10013570921','10013936005','10013782298','10013195611','10022165141','10014207981','10025453090','10025248659','10010903329','10025383477','10025950752','10025455802','10011342018','10011511474','10010437035','10025457561','10025460176','10025455583','10014506885','10025462694','10016984837','10010482388','10026065119','10025474140','10008693058','10025480071','10023520232','10024027912','10001617747','10024933762','10024079610','10025491949','10018392360','10012511943','10020791328','10025492818','10016337229','10020616443','10015851862','10025498880','10025500162','10018447392','10025502118','10015390707','10011129791','10025504393','10025504898','10010899809','10025504637','10025506717','10010571543','10010791341','10025508366','10010574451','10025512045','10014776988','10013833716','10025512319','10025513654','10016981559','10011301219','10025514108','10015893860','10021157261','10026241433','10025513349','10011249964','10025512261','10025516416','10012834949','10013971095','10014166521','10022021366','10025566176','10010439052','10024396242','10025566697','10025520789','10010579070','10025569517','10025570688','10025571866','10025572795','10025572462','10016220596','10025573934','10025569216','10025431517','10013531695','10025580320','10014277616','10025580361','10010052171','10011236934','10025581343','10025687935','10017492013','10013273126','10025583933','10025583808','10025521026','10015001595','10025585780','10012489073','10018517636','10025588299','10025583898','10025584041','10012754499','10025595522','10008448547','10026238723','10025686750','10022279338','10014432323','10017093857','10025604133','10020737101','10014823518','10025605410','10025687507','10006567095','10011463210','10025611066','10025612451','10011625722','10025613579','10023557409','10025691441','10008037634','10025620928','10010579074','10024483350','10026243292','10025624352','10009903199','10025944727','10025622042','10010372350','10025812555','10025628943','10023883596','10025630078','10017476354','10025694019','10025632930','10018864646','10025641808','10025474733','10025956238','10025646496','10009217114','10025648916','10025649860','10025650481','10025653962','10012921866','10024708335','10010281788','10026057076','10024898757','10015796477','10010124596','10025700925','10025898013','10010436072','10001222682','10011344349','10025715684','10025716555','10025820432','10025717377','10025721643','10008808162','10017022495','10012605317','10025727018','10025728927','10025960976','10025731231','10025732348','10022550179','10025728594','10025813379','10025739257','10025739946','10008578247','10025741106','10010780034','10025707708','10018471660','10025749326','10013644400','10017810569','10002095116','10025754459','10025959823','10025756502','10025758407','10025759175','10025759796','10009832166','10025765826','10011245182','10013503367','10023417420','10025768743','10025755570','10025769315','10025769943','10025771120','10025772341','10024838401','10010313633','10026244162','10025778225','10025780180','10025783635','10009395742','10022392446','10025797301','10013704955','10017682153','10025798950','10025914476','10025412545','10017074466','10016798001','10025802239','10025476927','10025830062','10025964857','10021630186','10025835054','10022467044','10020851518','10017592095','10010738240','10025851322','10025851166','10026242919','10025852241','10025853808','10010201792','10010054484','10025856065','10025860462','10009821288','10025805856','10025859751','10025863482','10024839609','10025863528','10025863531','10018670980','10026234002','10025870034','10011137301','10018669668','10025876904','10025780409','10025876500','10011327351','10025880171','10025563079','10025884232','10025884253','10019837014','10025885829','10006565338','10019974830','10013400648','10009550502','10025884801','10017780050','10005633918','10010868071','10025865406','10025889274','10016324450','10022416122','10025892813','10009466482','10010241175','10016929379','10025879118','10016866968','10011129678','10005460676','10025896307','10010495914','10009444603','10025902536','10016439680','10025848821','10019548109','10011057223','10017303118','10025909923','10025911456','10026248713','10025913966','10015791211','10025916561','10006543644','10011088725','10025918986','10025921282','10025568891','10025921309','10009924704','10009371691','10025924189','10026078922','10025924255','10025926680','10025925623','10025966724','10017145626','10010178611','10026078857','10012460930','10025987951','10009399393','10025989779','10025990693','10011248693','10025992414','10025731119','10010707938','10026251334','10026081806','10015071413','10025993393','10023379771','10025994019','10025994353','10025995878','10025996000','10026082572','10009471218','10025780972','10026082267','10017378562','10025817093','10025996280','10026250367','10025999710','10025999330','10018016755','10022080097','10026001248','10013575500','10026001937','10022443732','10026002895','10025999909','10005757075','10011063907','10026005936','10010774136','10026077618','10026008884','10026084417','10026008641','10009790667','10026011831','10026010429','10014214877','10005507433','10011075245','10009821119','10019124469','10014688108','10001240338','10025817435','10026024656','10026027025','10009447797','10009530237','10026031398','10015404064','10012591276','10015008452','10026035754','10013146511','10026250760','10026036631','10026085357','10024647064','10026038791','10026041554','10017110770','10019947041','10008643333','10012338927','10009958002','10026044660','10010766052','10009820194','10019064662','10026046461','10010144164','10008299920','10012656032','10026160419','10015143250','10023783411','10005763875','10010349251','10009299686','10016909159','10025971577','10010559048','10017952360','10026165607','10026166466','10013869589','10011179471','10010874798','10009691690','10024408111','10010077842','10026090614','10014595320','10026090522','10026171033','10022516282','10008585887','10010248474','10026088498','10026171932','10001770381','10026172379','10011746189','10026170681','10026173080','10026255909','10026175163','10026174098','10010600000','10026174720','10026258927','10026175487','10026090551','10026251865','10012747587','10026180106','10026258976','10026261136','10012797284','10018454089','10026095024','10026263590','10026263524','10008143408','10026087161','10026264449','10026264660','10026242573','10026261801','10011062912','10025821409','10026182309','10021348918','10010565448','10011130195','10019097439','10026092679','10011041050','10010322942','10026267334','10017724860','10019017992','10010929377','10025867833','10019132210','10026097475','10026105171','10026105662','10008485967','10026265213','10023275766','10013404157','10026077903','10026106011','10010369691','10026181091','10026107581','10026112589','10026113614','10026113406','10026114799','10014695373','10011499376','10018487176','10026271051','10016940298','10017063303','10026260838','10026268921','10025512762','10026118072','10011376423','10014704950','10026191604','10026123843','10019207120','10009365722','10018450871','10021193502','10010084641','10026272068','10026273718','10024769960','10026271775','10009385579','10025933117','10014358839','10015126659','10014633714','10010830891','10013570770','10026279889','10022180733','10026278120','10025530920','10026281173','10014430720','10023406920','10026276260','10025223073','10026279560','10026281738','10010843961','10026184846','10010310400','10009933504','10010570980','10006419096','10026185758','10026192597','10010775554','10026284188','10001591901','10011554654','10026121146','10010039023','10026194753','10026194552','10016553365','10011206823','10026194747','10013094070','10020118792','10026203375','10025052046','10026204913','10011326414','10013174757','10026209953','10026287839','10010884103','10022092882','10013173435','10026212988','10026214367','10026211795','10026215880','10012649444','10026135416','10026216624','10009708008','10026218753','10026211723','10016029835','10009547154','10010495114','10026293761','10019027197','10021230213','10026297731','10015554332','10024561202','10012716622','10017753942','10026316457','10024929950','10017419739','10025605822','10013873321','10008289424','10008534540','10008416977','10000761119','10026200475','10010587355','10011582638','10013526786','10023670163','10023561081','10010506803','10008179832','10011064263','10019429094','10025928946','10014397086','10013417876','10014355446','10022186976','10016857663','10015662687','10025046284','10016649590','10011713642','10008386955','10023552218','10013656135','10006108940','10025928087','10016410954','10005782980','10010396999','10010327074','10010812184','10024023568','10013763789','10026219396','10010249287','10012149927','10022012661','10002068980','10009360344','10025377365','10016131286','10013373799','10025265064','10008095455','10023557964','10009286302','10025516592','10022051960','10010764828','10008204654','10023558889','10013317738','10023561297','10020886144','10023563613','10016171929','10009109929','10009685873','10025517733','10010833324','10020010096','10022433614','10013168659','10025151161','10023571656','10025802832','10011440031','10011624358','10012855889','10014113022','10018905363','10021820513','10023578785','10023659559','10009381084','10022351167','10010946925','10022087070','10013943461','10000944013','10016304900','10013461564','10023583240','10025151572','10009170843','10000775827','10013833679','10015464899','10010843649','10001022414','10022248430','10021966749','10023481080','10009060393','10000843396','10012283548','10014450851','10018937959','10008013475','10010018531','10019001285','10010408614','10023597007','10013157469','10011443512','10011585386','10019634276','10010786944','10023600161','10023613353','10008538072','10023616094','10023608511','10019639444','10010605338','10001032979','10012178708','10011555542','10011109727','10023411797','10018293671','10018523831','10018397499','10009525973','10022213017','10011237222','10001686949','10012714367','10020413414','10009312849','10006113916','10006544803','10005662332','10008012027','10020625443','10022327429','10023382481','10011076752','10023756805','10009590603','10019413525','10008528031','10025931573','10012224025','10020611069','10025045418','10024297288','10012587803','10010747386','10011436350','10025266751','10024047966','10014732269','10012354368','10005722082','10021992689','10023739471','10008491367','10014693748','10010317433','10010861896','10015254950','10023774070','10023654185','10008477965','10022005352','10005947935','10017621760','10017625378','10024309814','10017027040','10008963446','10000084321','10016000910','10023988253','10020485679','10014792842','10010842343','10011172597','10023258771','10021966036','10023659762','10009460940','10010314914','10023704802','10010298948','10020242323','10020911281','10024311441','10023932130','10024622796','10014154394','10015027098','10023685605','10018739236','10015506959','10023686346','10006612456','10014290713','10018182235','10025661894','10010492110','10024230032','10016033460','10009685071','10001010107','10009679880','10010686506','10023664260','10012555684','10010586275','10025380197','10009495733','10012001549','10008156603','10023658608','10023709497','10017645351','10011606665','10025267997','10014358863','10001835931','10022552712','10023708320','10013186680','10023698154','10022074816','10023682864','10010387647','10025048090','10013162207','10009357223','10011788754','10012980612','10025855875','10010047057','10011496697','10023712726','10014419246','10024309107','10013340173','10020579359','10025930795','10008318358','10024603426','10025153364','10016054812','10023720178','10024026906','10023420944','10025266959','10023715422','10023326186','10013742217','10023721559','10018186798','10012278544','10014233316','10016158574','10014710475','10009426006','10012699833','10023749934','10010512606','10011512166','10021327358','10023750833','10001263337','10023635494','10023779192','10023926622','10023732044','10012291183','10012840058','10023751144','10023750281','10019192008','10013254605','10023716423','10013009129','10021966577','10023752576','10018585283','10024389156','10023412605','10023269223','10024074757','10019186600','10023434254','10025520735','10012906432','10010742395','10023779715','10009717782','10023925119','10009938008','10009878795','10009245126','10023501081','10024814752','10013212255','10024081068','10020728553','10024074799','10001046608','10021965539','10009144759','10023784088','10021079581','10015158531','10006802813','10016500803','10005756523','10024027020','10012966650','10023782317','10026227719','10008600635','10009877826','10019429139','10017195513','10023883394','10010193001','10024604415','10026225993','10012373094','10022228683','10023820362','10023310008','10010011164','10023827032','10002162920','10014777632','10025934081','10016877690','10023990390','10020910591','10021926754','10023682242','10024610789','10018625706','10023832143','10023833446','10008521170','10014678813','10015454930','10022021792','10023835522','10013967566','10017263351','10023671946','10015079458','10013624991','10018472209','10016665641','10013314280','10012461129','10010814629','10012203588','10025522958','10012014227','10025050892','10021660809','10023817726','10000671642','10026051105','10013841178','10025382488','10026044933','10025871781','10023625648','10013406335','10021617165','10019226370','10023478234','10024231842','10001792788','10010018554','10010692404','10020158811','10023660652','10010799932','10014108635','10023385816','10005732148','10016153622','10023718936','10021292119','10023886219','10014316520','10010249160','10001813163','10023928167','10024233017','10013134069','10010989390','10011457168','10015240400','10015549731','10012741093','10012116285','10014567109','10011385263','10018027051','10009739576','10011160952','10009429379','10001000000','10001351841','10009387159','10012136052','10025270419','10023906002','10020631099','10013115402','10023666670','10023911861','10014190841','10011258970','10009318570','10008075035','10005910596','10009787265','10011702418','10016969161','10023915951','10000052059','10023917915','10022139600','10018456599','10022576572','10012966632','10008480863','10023511954','10013328768','10025855013','10023936249','10013499608','10012428094','10011650514','10024030470','10023995372','10008678449','10019696582','10012758924','10024174997','10001173413','10023496057','10013891952','10014544656','10012885582','10000944570','10025271814','10023957953','10022342243','10024081433','10023933514','10019117241','10020702944','10016992712','10010043013','10016050725','10023965306','10022259386','10009940195','10000170291','10008108738','10023966766','10001327059','10014486066','10023968607','10011439259','10023962670','10023966823','10005787076','10011919598','10012959428','10013363965','10010602040','10023975969','10014963965','10014432860','10008416952','10012090999','10023977326','10014171083','10023978544','10009277733','10025266686','10013994006','10017236334','10023983707','10010783874','10016810513','10008478662','10023938413','10009291379','10001239758','10012948902','10010404972','10024017533','10024015167','10019198327','10018079077','10010328173','10008187993','10024021710','10026052079','10016113269','10010125612','10011063303','10023362042','10015408625','10009579100','10013364165','10024039958','10024041302','10013369169','10023929480','10024045141','10016581226','10024052036','10025492849','10013943807','10001760478','10024087346','10010690745','10026225394','10008684522','10020007591','10010940294','10002106768','10024045451','10021959287','10024063561','10006552275','10009135851','10008507267','10023656143','10018010850','10022070142','10024070923','10023753080','10011440648','10019893267','10008522418','10011636182','10009942816','10024177734','10023705176','10009300653','10008017791','10015292050','10014408938','10017499685','10014996830','10010257769','10012463359','10015193339','10014769572','10008201070','10024049092','10024130248','10024180528','10015699194','10001057752','10025048434','10009695741','10006557724','10024136246','10026054112','10008154220','10011238839','10014514651','10016321861','10023247358','10001664214','10024142516','10007985372','10011237532','10024144960','10023427793','10015542303','10013852772','10014230489','10025667814','10008588251','10017432062','10010268665','10021148736','10010107965','10024318076','10019813472','10009397502','10015311818','10022314375','10011189185','10016075255','10019767257','10026052245','10008378251','10024179691','10022034049','10010864341','10022179348','10024190460','10010744235','10009375104','10006640888','10024194367','10015284197','10008139276','10023758366','10017580420','10005467929','10006788104','10010921069','10016319763','10017619952','10024322936','10002129482','10025055062','10024202924','10024184886','10024205199','10011277739','10008759161','10018415957','10010143612','10019490540','10017596438','10008378930','10008435212','10024214600','10008458752','10010304327','10025937954','10013515491','10024324000','10024215858','10024215530','10012243168','10024397170','10006110894','10022247003','10009089091','10017235124','10009898199','10013940552','10024222288','10010694741','10015578863','10012291971','10022437686','10012555742','10012303893','10023446693','10006520566','10021974133','10024254775','10024244819','10005837509','10024616027','10025387608','10024322117','10024258823','10024399671','10010775380','10008550429','10024262496','10010484510','10025668262','10020944353','10014546828','10014431764','10024260848','10023660178','10025936800','10025526504','10009220505','10025275583','10016027462','10015014130','10024280336','10021444880','10010802927','10017067130','10014522642','10009456154','10001805148','10024404059','10008205913','10009565094','10006701924','10025386610','10013237286','10009365070','10024302970','10012850843','10006827386','10000725342','10017509820','10019129158','10024305122','10013693921','10006109371','10018019005','10001073425','10020752752','10024334623','10009583946','10024338167','10011445761','10008510060','10024338319','10024406043','10008192232','10022582547','10023967829','10018568884','10024343566','10024341361','10024400776','10014642724','10017230872','10024405320','10024350983','10025275388','10025938406','10022423510','10024347762','10021467950','10010394815','10024349400','10018379812','10024348062','10011732720','10024352114','10011367219','10013118097','10010760511','10008773240','10024387670','10022578056','10009237786','10009606937','10024307348','10009353674','10013152252','10010365812','10024362328','10009159250','10017459727','10011297247','10024365759','10001773049','10010906612','10009884437','10010238666','10020193598','10017121403','10022466186','10011376011','10013118362','10025938890','10021312691','10024013387','10002160659','10013156379','10012504079','10024381987','10011262471','10012340402','10012736841','10017116446','10015832548','10024415075','10023259034','10014687384','10018767180','10024420036','10022538692','10011646256','10009625900','10024404714','10025732609','10008349490','10020744609','10006693634','10012607386','10005788265','10024613657','10019777699','10006660117','10020994496','10010254427','10024121046','10000729061','10022275227','10021392162','10024840614','10023253603','10024427190','10024836741','10024452916','10024450820','10024833761','10009572753','10015531983','10010691574','10009891717','10002149656','10008570678','10017658492','10024457842','10007524992','10018720930','10024460346','10009195214','10017590450','10024464049','10025050891','10011665956','10005665164','10024474321','10010149806','10012353664','10010480769','10024479709','10024484252','10013439488','10008033266','10011314549','10024480106','10016646601','10005865187','10024480307','10006522095','10024621966','10024487184','10024616836','10024844106','10013117227','10006639441','10015882272','10018754753','10017957901','10024516140','10008218718','10024444236','10022427589','10013926954','10009306959','10024509410','10014300843','10025161536','10024524237','10010237692','10024839197','10011186780','10010872289','10009278708','10024526970','10025161320','10023936957','10025160931','10014215507','10009943069','10024526918','10017375967','10011127231','10016919802','10025042547','10002101545','10010210356','10024634320','10024622689','10016165664','10024634598','10010323155','10009543052','10014489030','10024843249','10009882522','10024634989','10024538020','10020007614','10018391463','10015310082','10020450439','10018645430','10010125286','10013368350','10013135732','10009367225','10022015895','10016711140','10024546299','10013971364','10018033117','10011034108','10024552409','10010372516','10018934515','10001651788','10022360959','10012386731','10024556659','10024549455','10021757911','10024561894','10024562605','10024959872','10024572357','10025942593','10013664790','10012122313','10025044143','10024397452','10014437497','10017817451','10013070731','10024579271','10024270083','10025390773','10019445715','10025941785','10024415761','10006691218','10019078407','10024709429','10008078897','10014172302','10005706382','10008386031','10005658016','10024671127','10024667723','10009306410','10021526816','10024672904','10024636647','10024673613','10017508382','10012073155','10016777696','10024679917','10013262090','10024616689','10013877103','10024681534','10010826547','10010360566','10017697886','10025530373','10010294285','10024697532','10024691020','10024692739','10010723895','10017280261','10018858844','10017371193','10012737925','10024692398','10022207894','10021968768','10009845099','10017758809','10011366303','10017295508','10022013362','10001311003','10025065852','10010351975','10009131681','10017616834','10014476723','10023366745','10009325504','10010982794','10013927006','10026128348','10013243958','10001759442','10011501506','10010808065','10013687589','10013035326','10016896136','10021594275','10011070768','10024626186','10014285030','10019440219','10025484784','10025166563','10010022587','10010204390','10012923638','10012582548','10024873982','10005967380','10013594951','10005794715','10014207760','10018981218','10017052898','10025073441','10025072832','10025070181','10024954354','10015771849','10018120345','10013195694','10011348412','10010079931','10011362737','10005771971','10025942929','10006628805','10014319828','10011258771','10006131602','10010109899','10024895347','10024897479','10024895495','10024730335','10026136985','10024906061','10023473433','10009364135','10023273634','10008245680','10024886660','10016295317','10025082653','10008777496','10024915034','10023717234','10025078027','10024902785','10026210328','10025533314','10025168540','10010098452','10025085442','10016467509','10011056483','10019542173','10021730166','10005883162','10020531984','10009930743','10024916890','10025086871','10017357350','10018545238','10024926431','10014061977','10005822479','10010133859','10012287185','10020969733','10010040388','10012637262','10025089933','10008504814','10006631441','10025091807','10009400626','10001210578','10024602513','10016057871','10024946195','10024876288','10024504988','10011603398','10014262710','10014802763','10017672311','10024949437','10015908793','10024954574','10012396718','10024943132','10012799901','10024960985','10024950826','10025092299','10017681397','10021163209','10008454993','10021373668','10002033851','10024944574','10009471030','10024563006','10009315072','10024957870','10024814855','10025171479','10025019140','10001445257','10023273963','10006100510','10015585259','10008875344','10011119140','10025033361','10010832213','10025284423','10025035139','10021049726','10014261892','10011181746','10025036987','10001274961','10015382269','10014238570','10019185658','10012977970','10024825864','10009926231','10025095895','10019008724','10006541325','10008572545','10012653173','10025040656','10013330421','10025038429','10006128502','10011269063','10011040792','10010842469','10016467862','10017515733','10014624656','10014215552','10016333869','10017384173','10013822081','10010927503','10016373373','10018799279','10025097961','10008466047','10017187770','10011282125','10012015129','10009655855','10012212804','10026056382','10025491376','10010409111','10009957366','10002171334','10010495411','10009246013','10016656174','10025116651','10025116721','10008091495','10000842781','10011079688','10018534213','10025118344','10025118136','10023422451','10011460573','10025119210','10024276680','10012027111','10009952506','10017478081','10011439952','10025120874','10009914759','10025121325','10010271206','10025122587','10009204744','10025175913','10017969914','10001036259','10023479294','10019435600','10025066310','10025126039','10025126656','10014111184','10020524138','10010840094','10025128516','10025130671','10012383909','10025399593','10013996726','10025122497','10016634404','10009550918','10025134411','10025399444','10012031535','10001074748','10018675423','10025136276','10023271823','10025136840','10010013329','10025937230','10012347727','10020913428','10010705854','10025142117','10025142597','10008223869','10010835507','10016687675','10025143307','10025396906','10017633321','10011263420','10025286647','10002058495','10024461384','10011033146','10010604102','10010441172','10025184029','10022171599','10025184662','10016648048','10021027272','10016520754','10025186674','10018316228','10010045509','10025947990','10017550483','10021639125','10025163635','10026237683','10025189337','10025188985','10011581249','10008789317','10025188684','10025192301','10020001035','10016954378','10025948017','10010202278','10020098440','10023258089','10010460407','10021943405','10014148864','10016460301','10025202642','10023261664','10020420252','10025209830','10017553532','10013184020','10008987119','10010487485','10012324027','10025538393','10025214722','10025401407','10025068826','10001691626','10022319628','10011531400','10025219621','10013798041','10025219484','10017001507','10017853219','10025535088','10015449111','10025671979','10020737819','10006530493','10013822451','10025293990','10009319259','10025227515','10014189689','10025230270','10025230355','10016557086','10025232041','10015390823','10016406514','10025297424','10014219947','10021068392','10025234848','10021075667','10008229708','10025236727','10009038793','10013820722','10025237833','10025175579','10024683258','10014719679','10025242352','10013706822','10008586091','10025243755','10017625678','10008526647','10025947629','10014235797','10025678832','10025299316','10025944165','10022066577','10010854999','10016326008','10005860320','10025264011','10024956930','10012344464','10010726593','10025303564','10010688845','10020122394','10025305340','10025305326','10025306877','10010252179','10010952938','10025308888','10025311967','10013939826','10009829576','10013602896','10020928763','10014417368','10014323608','10025679948','10025314582','10013710013','10025317453','10008654919','10012571648','10025197451','10017055333','10008392381','10019643088','10014330698','10008760252','10026056914','10021258029','10014966754','10016570655','10016607180','10024242742','10008465454','10010828431','10025333307','10011526485','10011962940','10018018439','10017603141','10021975679','10020827400','10025338785','10014592470','10008109110','10008574959','10011234116','10012549733','10025341734','10010742499','10025343597','10009556726','10017387541','10009560183','10025339934','10025346494','10025347055','10016007771','10016801459','10025413180','10013324021','10025349603','10010360025','10006810827','10025349813','10016225908','10025349684','10025352430','10025543040','10015617062','10025357131','10025415709','10025327960','10001767160','10008905371','10006108134','10025354066','10018849870','10025413714','10014969004','10025354206','10025367128','10013165524','10009890362','10011613811','10000921741','10013342569','10025418829','10023436240','10013761465','10010078397','10013385182','10012072770','10010417291','10001798300','10009934424','10011568386','10014686710','10015092421','10025951125','10016165943','10017491564','10015234083','10019910368','10016848071','10009770580','10016729180','10016952730','10025349444','10016209619','10013985192','10025428161','10025422849','10012882217','10013636898','10014290943','10025429309','10015510537','10011362109','10025430565','10016447581','10025431163','10024647735','10025430840','10025436593','10009600587','10025432999','10025508725','10018052949','10025438584','10010284143','10011487096','10025482629','10013377812','10025441927','10025444125','10025445044','10025445554','10025550643','10021263109','10011334157','10025446826','10009496512','10025447089','10000880243','10018792049','10022028696','10021942282','10025452575','10017523510','10016577885','10025443059','10010591984','10009577123','10010345058','10011458846','10025279090','10025459776','10012853839','10009767769','10013981048','10025462363','10013505884','10010260032','10010605401','10025461212','10014060991','10025471936','10025474588','10023372862','10017342686','10015794285','10018774486','10019009623','10025472926','10011020152','10010041214','10013019193','10025406573','10024428424','10001215460','10000052626','10010988408','10014418031','10025168850','10008841266','10016826764','10020587725','10005901485','10025495924','10025497184','10020395208','10010255941','10012674098','10025502700','10016693092','10013086299','10025506151','10009737284','10016296542','10025507209','10025507102','10017458793','10014605559','10013246562','10018120482','10000792889','10025514203','10016328070','10022088735','10025562184','10012247573','10025564584','10000981884','10025566929','10010553258','10018770160','10023708262','10016707251','10010250223','10025568827','10011369553','10017559890','10014437875','10025569631','10016454292','10016570890','10001263050','10025570795','10025573868','10025576793','10025573315','10016895284','10015169757','10011389041','10015490342','10000924668','10012863383','10009685722','10001690691','10014019493','10025584092','10020757662','10026057531','10011333966','10011634970','10022041793','10014745264','10016190089','10025593181','10006169357','10020446132','10025599643','10025600309','10025602204','10001081159','10011369846','10010710930','10018580355','10017461140','10013195854','10012895145','10025610360','10016969213','10013059283','10025610299','10025610565','10005860224','10025615936','10021217257','10012401619','10014547834','10025619734','10026241829','10025620281','10014424403','10025896035','10023272884','10020521881','10025624497','10018121688','10019185309','10025622975','10023481064','10012548517','10016560305','10014452785','10016350255','10025630847','10024561522','10016825441','10016753866','10008506347','10025694083','10025695506','10025640492','10020289544','10023217440','10009003716','10010392768','10020416021','10020936505','10016570496','10017553558','10022338580','10025645451','10010946300','10008488726','10012885464','10019911841','10012393832','10017933986','10025649876','10025512915','10011175139','10017251322','10014117994','10025652873','10025655414','10005732233','10026069416','10010567268','10025698388','10017738704','10025700136','10025701307','10021409971','10026067178','10024415270','10009323668','10009986179','10012212674','10011340665','10026041678','10024343522','10019241916','10025714565','10008828545','10018686251','10008136822','10010343850','10025717566','10018223740','10025717664','10024578620','10011448570','10014083374','10023803186','10021453173','10010346866','10005776296','10025727401','10000880326','10011198056','10018537623','10012946966','10002037565','10018516084','10023670748','10012906875','10012125564','10001154989','10025740833','10008014346','10010229011','10025746206','10019368911','10011459965','10020318356','10025753694','10025752562','10011577737','10024859295','10011659390','10024637320','10026241268','10000929246','10020280596','10024187100','10025757022','10011313461','10021499671','10012298877','10024657231','10018126597','10018858676','10020593963','10010515751','10008330143','10008506211','10006578734','10023727727','10016885042','10008556965','10025775841','10025764889','10025771527','10025772181','10025769369','10016981561','10017170769','10011693404','10019642845','10010813231','10017005005','10012804213','10013326198','10025770981','10010686219','10023410122','10025778589','10025780147','10019817010','10009425600','10025789575','10025961998','10025795371','10026245133','10005873976','10022097339','10008461324','10013937284','10011474285','10014132799','10013368767','10008591961','10017182239','10022440731','10014795270','10026245228','10016679329','10023885032','10015134632','10020849490','10009097532','10018839223','10014031657','10011475728','10026248190','10010575198','10011707549','10019037991','10009902805','10025851613','10010454604','10023664675','10025804700','10014095030','10026070530','10001202483','10025776455','10010902671','10026074849','10016731982','10011601542','10018959167','10025856774','10011144300','10014068709','10009539163','10023461964','10025860110','10020372848','10025862696','10026247962','10013623919','10026027155','10025864366','10025867280','10024951834','10008602660','10010333554','10025873088','10016111361','10008578043','10009615827','10025964547','10022384356','10013762158','10025875102','10014274364','10008035003','10020292858','10021433823','10025878819','10025876786','10025880348','10013195360','10008035454','10024909136','10018293238','10010373724','10025884580','10025882743','10011114313','10026075935','10025863819','10025970594','10025884916','10025887107','10025888941','10021304391','10025888208','10008377239','10013403653','10010478586','10025460278','10026076171','10010038365','10008977409','10015453292','10021037475','10010586589','10025893658','10021088093','10008570931','10012843628','10025893316','10017635841','10012126142','10025901001','10022061942','10014886090','10025904486','10018797769','10013633173','10011591049','10020559764','10016310999','10015865174','10012558774','10025915752','10021295468','10025120368','10010172210','10009603136','10015831184','10013581549','10025917295','10021984828','10006695954','10024549787','10025921924','10026073492','10009237010','10000089078','10016800984','10009098562','10026246802','10026077449','10013752517','10011920232','10016711751','10025846398','10025974724','10026078256','10012205996','10011519750','10025711728','10009295931','10026080190','10025985304','10025985726','10025986591','10020736924','10005857220','10019936634','10012118308','10010269298','10011123420','10009545204','10010906236','10016892424','10009596771','10016323482','10014986106','10013682727','10014119723','10025930657','10001694802','10025995448','10006480211','10024418271','10015773176','10024388505','10006696921','10025998359','10010085002','10020275377','10026000875','10017522878','10010616760','10008424475','10026082257','10005651552','10026003398','10015461700','10011565689','10018240194','10026006021','10026084448','10026005074','10014120615','10013348276','10011570432','10026009298','10024560353','10010215371','10009831371','10020537247','10014266233','10018010729','10026012302','10021262414','10020976269','10012557997','10011593402','10017264795','10026083411','10017067055','10018079032','10026022173','10013255642','10017380687','10026025854','10025033263','10013774804','10008195408','10022323618','10026030848','10026028148','10000844132','10022227475','10016481217','10019112486','10009957360','10013439157','10017692870','10014028476','10013151808','10002083533','10011040000','10001699591','10014627095','10026086940','10026042252','10010690722','10011368510','10019320963','10015213451','10016011365','10009829640','10017494456','10026045470','10015334309','10015931498','10026158684','10010861720','10026085145','10016911913','10024010217','10018855954','10026160243','10025878443','10026159233','10011558832','10025394499','10020813865','10026162519','10026161881','10026162683','10009583058','10016996144','10026005789','10026162473','10025529300','10008564177','10021568937','10009294331','10026008682','10017358563','10014688056','10010125792','10017199527','10011188709','10026165606','10026166049','10026165135','10008762333','10026254341','10013529816','10020505447','10026165503','10020629735','10013794206','10021363925','10026085985','10013092912','10026168124','10016658499','10026168708','10012680558','10016560104','10009313649','10023248711','10011012013','10026171392','10026253789','10010234225','10009523657','10011026730','10026166226','10010834830','10011563939','10026231541','10014944926','10026090031','10026068869','10026086986','10014817402','10023539978','10011284303','10006528641','10006113387','10026258265','10026089860','10002148379','10010727646','10022555673','10026253610','10013036895','10026088468','10026178271','10026254492','10010223257','10018272258','10026178920','10017646717','10023972104','10009893918','10026179425','10013885192','10011333568','10026259259','10011242881','10011196193','10020523901','10026259688','10005607673','10012906977','10026180383','10026256311','10026178031','10011485798','10011123294','10010724900','10014696242','10026262760','10005839546','10021164745','10026264608','10024564553','10026168590','10002036056','10010049960','10026265861','10010838247','10023460523','10026242970','10015913975','10019680151','10012524649','10024147382','10026177908','10012673452','10026097160','10026264867','10026094883','10012276404','10001647346','10009981850','10015229177','10018512940','10017651131','10013278887','10010426456','10014041269','10018975459','10023411255','10025674048','10010122528','10022395643','10026107820','10026111889','10026255332','10026113800','10010363852','10020427035','10021067261','10026211745','10011997939','10024749659','10018133004','10026113652','10019890277','10019489253','10014071894','10017530716','10019784275','10019710586','10011613242','10009619004','10010848256','10026115362','10010993388','10020362225','10013753902','10019701026','10023401176','10025843259','10019249078','10024668062','10008773794','10010470684','10026121655','10013356217','10026123912','10011108553','10026270742','10014601606','10001051190','10026124669','10020376727','10011069762','10026179620','10026252472','10019116960','10025982545','10012564716','10010421217','10025661418','10026275159','10013887738','10026269157','10021159526','10013093968','10013112829','10011255139','10013705825','10025834949','10023229941','10008016879','10014311116','10013701352','10011019163','10025979894','10011601693','10026277131','10009064727','10018579162','10026279123','10015271876','10026283771','10021772939','10023494162','10026278781','10015754746','10023266327','10026188961','10026282802','10026188536','10018276314','10010985209','10020786857','10026187684','10016316645','10026183734','10010890216','10026183460','10021207558','10026187276','10016852790','10026187337','10014616025','10009289606','10013004059','10026190548','10023357658','10010897945','10026190812','10010088423','10024847680','10026191763','10006464214','10026193028','10026198499','10026153321','10026197495','10005866531','10018568024','10011582500','10009497358','10023564865','10026199128','10023319755','10018869398','10013606346','10012797233','10009767633','10015013497','10023747676','10012364428','10012831964','10010587876','10017702549','10026201638','10009776738','10008520545','10026205018','10018300983','10006893781','10026203732','10011255688','10012785245','10026182185','10010872105','10014151224','10026209160','10026211275','10009955580','10026211376','10026212951','10019899917','10026214497','10009607702','10026213409','10018512649','10026284046','10026215061','10026212888','10015046252','10026209562','10011264447','10023646398','10017284580','10020990713','10014281980','10016051922','10015432158','10007527005','10011183446','10026293518','10011895431','10006806014','10026300693','10025561549','10026302458','10022124052','10012675229','10026286147','10015379636','10020733765','10016267004','10026305138','10026312509','10011205258','10023383185','10010559403','10026319392','10009734755','10026319615','10013983084','10011082157','10025730826','10011080824','10024742487','10009316532','10022159178','10025830361','10025042625','10025045119','10025658258','10019587414','10013606547','10025151233','10023611593','10023581747','10005790632','10023568778','10016647643','10012640025','10000781652','10000727115','10014700047','10001141238','10001798209','10025931132','10019561134','10016127272','10001619603','10013135148','10019061995','10016765189','10019677090','10023752931','10015441467','10023756375','10023756269','10010180844','10017334948','10010034636','10019847866','10013127124','10024099876','10025448168','10010469664','10009985222','10009295607','10019173358','10012812049','10024082296','10017856829','10014511291','10024051911','10023231710','10025936548','10022145374','10025525023','10023996016','10024611475','10020710147','10015202010','10021177676','10025530113','10025245311','10024187967','10023353347','10020519830','10008738793','10019339076','10018216579','10013556681','10025274632','10021163631','10024223237','10012465813','10025272516','10023749754','10009643009','10025934956','10025937406','10024829925','10019626911','10024330706','10024269111','10024116173','10019888363','10013735271','10023484355','10016870549','10022237147','10024343396','10024340371','10008138150','10019926240','10013651341','10012392445','10023759778','10010784921','10000795553','10001161250','10012388120','10023635132','10009379464','10023589467','10019663465','10024449270','10001360289','10010156014','10010141409','10024275343','10010214065','10024842818','10010329077','10019375400','10011774615','10024488993','10024276494','10013140615','10025276749','10017852053','10020205323','10019752979','10010819025','10019274028','10024549651','10014609137','10020879421','10016316530','10013674166','10012578546','10024844800','10012016483','10011779324','10024857068','10024653532','10011580037','10024648033','10024660656','10024665856','10005922532','10013511111','10009644755','10023952702','10024672511','10016535735','10024676471','10024690707','10024229230','10024695035','10011265475','10024678941','10014136550','10024719160','10024727955','10011973287','10018690099','10012050569','10025161052','10025814604','10025120941','10020307449','10020284955','10010792720','10008207660','10026137866','10024908337','10025168086','10001049724','10024919987','10021016392','10013784780','10025061176','10014048179','10024955480','10010081912','10018126025','10010774880','10025530846','10018977165','10011736437','10025037668','10024835099','10025039832','10025040773','10025041328','10025041647','10025282194','10024875012','10025279601','10024673609','10025284587','10016874689','10025119946','10019148844','10009453799','10020006622','10018111364','10025132712','10013633557','10011513652','10025139506','10015702314','10018402717','10024782642','10024628391','10022557301','10017644463','10024748556','10025202548','10009794172','10013760051','10012737849','10017429159','10020800039','10025226544','10009965104','10011609728','10009378287','10026060970','10017204687','10012039120','10025297435','10025221702','10013772774','10024779243','10020416666','10015496896','10025319987','10025815020','10024939366','10025145138','10024305363','10024601408','10011090841','10025346057','10009675832','10019088678','10025349933','10008064295','10025072487','10024440903','10016131576','10024608174','10025268245','10025363699','10021485217','10025367755','10025367849','10008013634','10025370261','10009866087','10025386654','10016802057','10009369402','10020412475','10025426409','10025429970','10016088208','10025429423','10025428754','10025547448','10018518177','10025349426','10025434104','10010212141','10019917436','10025459394','10014309818','10025483221','10013651398','10015198425','10019498647','10018280334','10012244558','10009968998','10019515806','10025492370','10015320748','10021081193','10025538115','10019924221','10025576317','10025578234','10025579188','10006816270','10025582357','10025587090','10018556232','10019793205','10026045160','10025604299','10013592858','10020304677','10025609443','10015083457','10019059440','10020602408','10022153861','10001835706','10020746051','10023997001','10006895869','10008809363','10009876651','10024637094','10022316183','10025700885','10020897736','10008025526','10015162867','10025766925','10009643310','10014992379','10009583059','10021050401','10025744320','10009332797','10025764268','10010878032','10025768497','10025773256','10020946376','10025784042','10001683935','10025692902','10025658092','10025782709','10010936395','10012178605','10014595868','10016009891','10026072637','10019896564','10021471702','10020540269','10025966959','10025857101','10025479976','10020374628','10014782465','10025889166','10025894149','10025895369','10025899331','10025900803','10025627145','10025950046','10024155425','10025880699','10026071732','10025927574','10025774591','10026078882','10025332032','10025546003','10024142170','10020823974','10025687537','10025958312','10025849038','10025993470','10026081866','10020624819','10018923110','10019140155','10025694489','10010996548','10011492225','10014633087','10019399121','10020620728','10017284213','10015483800','10020796986','10011270606','10015336119','10024149022','10021260650','10022277483','10009974385','10018644943','10020782597','10026163084','10021802732','10026143013','10025990243','10016289171','10013123532','10014779340','10026165959','10026174013','10019763803','10019795308','10026091405','10026102816','10026264045','10015806527','10026261404','10022041472','10026178676','10026180987','10008678462','10005771106','10010837664','10019646812','10026235841','10026273495','10025961847','10020318848','10026184483','10026278678','10010602785','10013214167','10026188085','10014838538','10011879194','10026195808','10009903137','10002150063','10026209906','10026285080','10018219399','10026074143','10025285867','10009146542','10010378575','10025923719','10021919763','10014128995','10009033780','10010745113','10000926856','10021148482','10006809947','10019078575','10012124342','10018570597','10000845453','10013986257','10025265210','10011993666','10011791735','10019863608','10023589020','10012885672','10010908632','10013217944','10019462913','10011960301','10000897015','10023328739','10016903200','10019320877','10013142178','10001148373','10018546235','10025190101','10010461895','10025191404','10011638356','10015082694','10018791862','10000989096','10011252665','10010320409','10005944838','10021492613','10000865046','10024488500','10024247523','10013564412','10026199936','10021968954','10011862747','10014922827','10014191251','10023701932','10023656244','10025315101','10013717706','10008378188','10022038879','10014689445','10025804571','10023771707','10023688984','10018492868','10018625177','10024046380','10014872875','10015236311','10011262350','10014883568','10020887950','10012087330','10023639554','10010125548','10020660784','10020672968','10023641257','10012129043','10015079670','10023752336','10020446259','10022481790','10002054866','10023818686','10001128826','10001166069','10005768401','10009022011','10009188645','10002130153','10001169644','10008013309','10010109336','10013378591','10023746293','10019838934','10025932794','10000837249','10008877683','10008829882','10019286229','10011986379','10017816744','10016944450','10016450605','10018559533','10012111109','10009773273','10015724582','10021146795','10001004313','10000984774','10022155037','10011828780','10001815002','10005764518','10011163614','10015419209','10009356412','10013310481','10001628893','10024025033','10018861613','10023297680','10005706747','10020562753','10012983291','10024264435','10005702095','10024390911','10021164435','10014821646','10025731591','10020538252','10008817894','10021941035','10024081582','10005963429','10009601303','10001106032','10010247556','10024233923','10010440437','10022405720','10011128420','10023975822','10013293622','10023819159','10024082233','10009772255','10002042605','10026191942','10008855094','10018488516','10005854678','10013621078','10024020574','10008243843','10024304769','10001161368','10018307128','10012960619','10000839769','10015138155','10018677095','10013162235','10018427090','10016207542','10024066118','10006676988','10010326737','10006121059','10019661676','10016897578','10020049373','10013810514','10008458664','10019186610','10015820038','10020322822','10010427014','10001825689','10024143597','10018502209','10006454121','10015396048','10020393858','10018744886','10024242800','10012687949','10002171181','10014785075','10012004630','10014244368','10008505505','10008672600','10020525367','10013823230','10009780326','10018308378','10012976918','10014436645','10023517220','10012956617','10011489214','10024197704','10000994751','10001325555','10010619484','10024096847','10025384725','10007517992','10012487972','10016626966','10024256229','10017546816','10006549797','10001648455','10010183872','10009492629','10013640908','10024075772','10009683256','10015868852','10014089131','10025056452','10006682122','10015696812','10011007403','10014760231','10015681121','10014303644','10002124375','10024330038','10009630216','10024338084','10017099134','10011757606','10015658441','10012145439','10024192602','10024407311','10024327499','10008844681','10019679604','10024353505','10001802324','10018338790','10021970671','10019585900','10019475095','10024373187','10011496733','10009390873','10022385603','10020841400','10011601708','10023283111','10023563458','10000930627','10010220552','10010982827','10014857391','10015207905','10001082246','10021114263','10008341278','10010983700','10020338515','10010878024','10012778926','10019121407','10018323317','10009397561','10020384774','10025054677','10009960166','10019185540','10021118064','10011644387','10020086185','10015557618','10013651223','10016925589','10024638667','10025056830','10001053539','10024545432','10018943191','10011857138','10012938372','10024559541','10017226343','10024591471','10010246767','10005705327','10002104507','10010557400','10006640541','10024679416','10010242483','10012586142','10022123177','10010241598','10012192802','10023834189','10020332052','10025062856','10024710560','10019906351','10025390651','10017328782','10024724848','10009033859','10024723813','10024512842','10025063910','10005714144','10015173778','10020630665','10001676269','10008237143','10012843995','10020175838','10019622124','10011272370','10011397462','10014780773','10008505007','10000081526','10010218531','10008072023','10005730222','10010584832','10000728057','10001615344','10019943344','10024889628','10015483752','10011914827','10001235878','10019189986','10019817721','10024912950','10015696833','10024793358','10024716491','10021945688','10006549543','10021514738','10024968401','10013695249','10014718780','10010272432','10008747660','10024471990','10009915020','10014154680','10020275408','10025260563','10011440558','10025036242','10011042623','10019468497','10025106504','10025108172','10017230638','10025112705','10013369789','10024176223','10023966664','10025117435','10018329646','10019494913','10009862596','10005943444','10015415861','10024801773','10024803002','10014991225','10016874794','10021320145','10022258530','10023795501','10018790404','10015377404','10012509651','10019456878','10009647876','10014293336','10025200663','10025285335','10025208143','10026051664','10021298116','10012787253','10019821107','10025288674','10016468467','10025222203','10025222154','10024893654','10025294918','10014804789','10013907691','10025201284','10020609037','10016076509','10013735248','10025253288','10025239353','10019907871','10009096243','10010235614','10025255854','10001062756','10018829838','10011508613','10025262074','10025303316','10019826939','10005828002','10014360084','10025302079','10018233213','10023495955','10015403817','10026199616','10016194930','10000832656','10016992068','10019468459','10025539896','10009144431','10015648057','10006627199','10020845300','10025264959','10025340155','10025950466','10017420210','10024401764','10025347247','10019729418','10011231353','10011249921','10002093544','10019990565','10013372781','10024772446','10018702670','10009396291','10017093086','10017000191','10025676252','10010277978','10000813609','10013874499','10020938523','10008971259','10001360181','10020156301','10000732573','10017703682','10019571890','10011376662','10011551361','10020332756','10021129101','10001312460','10014155973','10020275347','10008441827','10023562848','10019752179','10025950774','10020800040','10024437711','10016015421','10022449277','10025446676','10009633541','10013244255','10016929387','10019227694','10014160481','10000723686','10010464990','10025462954','10005879118','10020173270','10013832741','10025494555','10025495711','10016599986','10020694841','10025551334','10019364545','10001259955','10025498772','10009161632','10011541545','10015099935','10020182499','10020798657','10025568078','10016219424','10024224740','10025572710','10011239595','10019885185','10014273752','10025586326','10011218438','10019112860','10009913882','10009670449','10010331431','10001597404','10025486795','10016784702','10012629072','10010374759','10025228461','10014392186','10016763208','10015559900','10018983329','10013240657','10025549283','10024818212','10017456402','10013866400','10015577716','10020761616','10023960623','10001138843','10016081835','10000080606','10009644839','10014603470','10010170975','10017122744','10012681845','10025646663','10020759409','10019729119','10011024659','10015386089','10009750838','10009766973','10025707905','10023818878','10011499582','10015608555','10011569294','10025717301','10001092216','10025716129','10013197029','10013622503','10025728540','10021616395','10010815745','10025734297','10025728013','10011065169','10025688163','10018311641','10010983595','10018471726','10009915584','10008798915','10020169709','10010330767','10016461903','10005652041','10016068670','10000760082','10025784849','10014790116','10014195466','10025791750','10019153702','10002132458','10010322454','10015482234','10000759133','10012978527','10016613549','10025825057','10011739361','10024708741','10025848415','10021809002','10025853524','10019987899','10025860771','10025967790','10022010501','10020166040','10025878667','10010119789','10018457004','10011698580','10025972000','10010560319','10025967102','10025897575','10010337589','10014107820','10008672151','10000986081','10010399981','10021372777','10021050817','10009931186','10017172706','10001356570','10014537596','10000928138','10000998752','10010393449','10015744622','10017265772','10008085736','10014649808','10026081732','10015391047','10006649854','10015342886','10000879757','10008501117','10021000108','10013995810','10017365403','10000989328','10008403233','10026012005','10025980826','10010690062','10012131589','10026078706','10012376059','10001090985','10020062972','10026013659','10016681619','10011138415','10026152975','10016399500','10010930293','10000918906','10011158692','10026035423','10019771168','10026039490','10025987923','10023803816','10006481110','10019175513','10015406819','10020292512','10012527787','10026071584','10017947776','10019847619','10016272120','10018633969','10002085920','10009657732','10024931112','10013571701','10005879419','10026160665','10010761517','10017014787','10006779087','10018958176','10025955034','10017349473','10026164128','10017118173','10010748679','10025656989','10020102980','10001168860','10008528989','10012585079','10018961728','10024660994','10026163466','10008064983','10026171752','10020686075','10020086995','10026256222','10016078882','10025774323','10014615222','10014191158','10026092413','10021141013','10021258531','10017076447','10021248238','10012065135','10019751684','10008641947','10022157748','10019513743','10020873384','10025167626','10009837348','10011050555','10016068135','10016962480','10011820520','10019522979','10014923150','10010261419','10018317048','10008202717','10018516338','10018014807','10015341660','10015124786','10026268659','10010258035','10016937978','10026275743','10019113599','10020442817','10026279998','10020325844','10026164529','10026188337','10026189913','10026192917','10019557872','10017233671','10023491404','10016816800','10026280967','10017292309','10011402008','10021974838','10026170653','10024031366','10026284714','10024543722','10026213394','10026217977','10026218362','10020880975','10026115168','10019134271','10020682410','10022229680','10025089264','10023675913','10023390451','10024623178','10009538054','10023762790','10023764883','10023329080','10012997071','10023465937','10023832868','10017352674','10025522732','10014127586','10022455977','10023783369','10023883243','10016591192','10023900003','10023978135','10022081406','10025806838','10023909131','10022039376','10019888809','10025934714','10024608262','10009311478','10023923058','10012807549','10025575774','10022485266','10024818216','10016997493','10025271779','10013136523','10023999008','10025963649','10024393002','10019604803','10024617389','10022562183','10001226409','10010049449','10024317742','10025810942','10011390564','10024389788','10023959111','10023540273','10024179344','10010082964','10010124101','10022001973','10016939031','10009925645','10024186758','10023914001','10009837633','10024244184','10024194233','10024245061','10024823067','10012467012','10018157357','10024207016','10018732949','10008968363','10014994733','10024255564','10024326812','10011011632','10024264530','10017117605','10024822257','10024614963','10012216166','10025516720','10005800953','10008736387','10013294475','10017655765','10024330081','10024403928','10006136680','10024318615','10010740483','10009615495','10024345354','10011372587','10024407590','10024242473','10009359827','10024254789','10013299569','10024833269','10010339259','10009450036','10016011053','10024378449','10024378047','10024377635','10024380779','10024424831','10023910543','10024181348','10011670056','10025522493','10011631287','10024400415','10021939387','10018513797','10011122961','10024459591','10024511059','10024458896','10023567595','10021994398','10023315804','10024465474','10009161678','10015952828','10024469259','10024427130','10024480064','10013246939','10024481623','10024482865','10024488453','10013770677','10024414039','10023307915','10024515674','10024546642','10024512717','10023321572','10015543161','10020057232','10011350036','10024524172','10009404697','10008738985','10025278171','10025059177','10025601859','10016830302','10020486791','10024852947','10024538373','10024542216','10025391215','10024556702','10024654472','10024854610','10021646943','10009244383','10024669221','10008045655','10024672881','10024677627','10025943963','10025931228','10024689871','10024691623','10023444159','10024699785','10024633472','10022108089','10024705513','10025393481','10015536775','10011174459','10001605935','10010775543','10025393863','10008111090','10024729600','10024766037','10017570900','10025384267','10025079806','10025472386','10024889941','10014499697','10019195908','10025945167','10024897430','10024718588','10024622097','10026136139','10022007061','10011558048','10025084723','10024823171','10025814826','10008642523','10025533558','10025284093','10018208304','10011060042','10024939119','10024952803','10024943920','10014228484','10014292748','10024547430','10025094385','10016848440','10022288773','10023804525','10011619835','10025945823','10023247215','10025047633','10010380297','10020009045','10025108801','10012045805','10025119761','10010979692','10016204461','10025122765','10021131687','10016299455','10024459590','10008126748','10025130844','10014503924','10011073239','10009549849','10021749856','10008644505','10025181146','10015707748','10010109085','10024808351','10009209442','10025271969','10009361582','10025196565','10001611834','10025201784','10025201572','10010096015','10014799996','10025204494','10025206245','10025200806','10022277345','10025212169','10017710835','10019074141','10025226796','10025226977','10023486497','10025232080','10017536553','10025233396','10024732087','10026060305','10008893288','10025534150','10014133937','10019556466','10010211212','10015211444','10010342994','10018574153','10024199297','10011384528','10025309443','10025245375','10014613330','10025313863','10025314096','10025316333','10025321937','10008035144','10025506379','10025332035','10025678363','10011962178','10010894123','10020005988','10025191349','10024898389','10025356225','10024864471','10009591503','10025366294','10025935796','10025368361','10025417904','10025370138','10025543405','10011326879','10010231679','10008147651','10009526895','10009784062','10025427800','10001345580','10025429397','10025387404','10026064014','10025433379','10015335646','10025735084','10010748046','10025438156','10025138429','10017756899','10025816537','10025442033','10025447037','10022080841','10010436111','10025444925','10013954170','10025452528','10023361793','10010090395','10025416638','10025453751','10009982271','10025455098','10026242446','10026054284','10025459169','10025829416','10010433291','10025462700','10025472088','10011620973','10025158401','10017550683','10025383559','10009929863','10024589514','10017217113','10025494012','10025494499','10014837313','10015059323','10025497887','10010046356','10025501783','10023430520','10021895381','10024298767','10015564936','10025503812','10025507291','10025507159','10012572409','10025108825','10001826869','10025566380','10016133642','10025687171','10025572070','10020695262','10025571383','10022319841','10012791825','10026232864','10025581722','10024815225','10011261957','10024455697','10024937734','10025585718','10025585558','10025586371','10024496379','10025594979','10009852918','10015368418','10011542917','10013657244','10025604179','10024635836','10025615169','10025692722','10020082641','10025617759','10016283268','10016901717','10015143988','10026241577','10011148257','10025331944','10011255875','10025643548','10025645648','10010042261','10026243694','10011465192','10015172315','10025328390','10024939302','10017149081','10025715119','10026059830','10006578413','10025718038','10021230801','10019201577','10013386688','10022180413','10013856501','10015594751','10025726032','10026242562','10025302350','10025202154','10025688779','10011825099','10026139007','10025748340','10025750818','10025751447','10025750688','10025752442','10025756389','10025761637','10010687304','10025643482','10025772875','10024709853','10001270944','10025599826','10010691856','10009247358','10012606683','10025784104','10010984782','10026241509','10024163735','10024684319','10025797317','10025801836','10009361810','10011081319','10013906231','10025836520','10023514829','10026243860','10025848940','10024227395','10025856912','10026074980','10025857827','10025855465','10025856468','10025832472','10025863083','10025863323','10025558798','10015472427','10025866446','10025765439','10012946060','10011222069','10025312456','10010514320','10011121384','10024718228','10009606840','10026246026','10005469837','10010372877','10025889163','10012123297','10016194317','10025893068','10025898282','10009607410','10011238666','10024320648','10016929251','10025849769','10025902834','10025922326','10025921691','10016120602','10025925534','10025926714','10022373842','10014075552','10015487189','10026248040','10023464689','10010588739','10005729726','10001187590','10025801369','10025990311','10025997158','10008767936','10026000824','10011474738','10026250707','10026007198','10026007098','10026007503','10009689239','10026010320','10026009945','10026082727','10026004313','10026012945','10026013811','10025834911','10026020302','10020595964','10026024883','10026027127','10026000636','10026025976','10016553728','10026032036','10026146606','10026039816','10025962181','10010105951','10026042235','10018485668','10026151313','10026044716','10016382271','10025853587','10026082495','10026124665','10011326788','10018651661','10015868396','10020374116','10026059659','10021466343','10026159670','10013413029','10026165706','10025802764','10026168867','10024714953','10008626783','10026248727','10011583683','10020980115','10026171587','10026090652','10026127075','10025927344','10020951101','10026176200','10026175920','10026178123','10026177293','10026259070','10016947347','10026180378','10026259665','10026181006','10015282075','10026181137','10014387264','10013988559','10010929360','10016732747','10024695358','10026266239','10025969467','10019552544','10009507147','10016141524','10014620329','10026097152','10010969264','10025300756','10019568355','10023356985','10026266768','10026097890','10025659764','10026109386','10025234673','10011149605','10026110173','10010299113','10026107851','10022304545','10024306841','10026247009','10026181543','10026255214','10026277349','10026276297','10026274420','10026275724','10026273965','10015540319','10009043590','10026092191','10026279186','10019055937','10009690245','10026181548','10014498905','10017487981','10012948018','10005847847','10024712454','10026191043','10026284642','10010104051','10009044854','10017467182','10026205396','10026195124','10016461199','10026284862','10002044453','10026211203','10026212130','10026213724','10008477065','10026284606','10010564034','10017287984','10026217732','10016448132','10026278240','10026286591','10010753220','10026302305','10026293823','10026310536','10026320315','10016729377','10026149937','10025323161','10013695283','10008633196','10023534149','10023518004','10011623813','10011912280','10019375014','10021146636','10024127670','10020024850','10014022042','10023352054','10025265692','10023561474','10025046362','10020400291','10013316925','10010877415','10025038417','10023238127','10023570090','10025803841','10001835369','10008065607','10025042943','10020303289','10023627120','10020834190','10009398794','10016794981','10017496381','10011397920','10019847499','10011338797','10025044828','10026123614','10019323257','10024336871','10009143389','10022416385','10026222466','10023654139','10023473628','10015125340','10012698951','10017088731','10010226939','10022483417','10001807284','10021739270','10023609068','10023717136','10023716669','10025268142','10019294170','10001604168','10025932774','10013681496','10012906029','10023719986','10025653263','10023718707','10025380045','10024604094','10010142616','10018800347','10008060327','10006277314','10000869656','10014596221','10014567353','10016341470','10023500921','10001474939','10017422191','10011512684','10025802797','10025381570','10013141587','10014594770','10010047426','10023749321','10013705992','10012885608','10023827651','10023827134','10018791240','10023991925','10016193194','10024080349','10011387601','10019407204','10025122454','10024078443','10016123698','10017755174','10023930609','10014875003','10023906136','10012243677','10024733996','10009638163','10012274628','10023919611','10024474622','10017498439','10016219656','10009516475','10022399683','10023993924','10024001042','10009644544','10022458114','10023966834','10023964823','10023975897','10023903195','10023797293','10024016470','10011709551','10012043627','10017474572','10023958579','10025382455','10025937721','10024087165','10025271951','10025385677','10009239242','10018800894','10011548869','10013438425','10022009162','10015712506','10011913453','10009914459','10011966399','10001761536','10024175368','10021147641','10015626750','10020741532','10015171179','10009364425','10016537447','10024188171','10016224605','10022024569','10009242787','10024233777','10022297981','10009859536','10024199291','10015566200','10015412539','10019467815','10014556886','10021024508','10016456344','10024395953','10020455114','10024243348','10024204377','10024250230','10009812818','10024254282','10010552957','10024261970','10006591381','10006821857','10000838309','10018584597','10011460976','10015477647','10009516118','10008004457','10001821236','10024403887','10006522559','10008527880','10012826735','10024329381','10025934598','10026220593','10024337358','10016798498','10024338436','10024408114','10011253980','10023795040','10015248895','10023244519','10024411540','10014486497','10025808722','10025053924','10012016044','10013112799','10013498654','10024377996','10019940776','10025160334','10018309217','10025863912','10024499121','10023303462','10015788268','10017547629','10024451732','10023758915','10024393627','10016905284','10010847071','10022284234','10010878681','10024452951','10024457931','10016315830','10024510097','10022173310','10019809673','10024468341','10024468156','10023611895','10019648036','10024481163','10023704023','10024369463','10026228473','10024618094','10024608985','10008734323','10016490887','10020670600','10024525905','10011477676','10015485170','10024481789','10024624654','10024527412','10024528188','10024531747','10019633118','10010246426','10022212689','10021353544','10018503225','10024396283','10016872618','10011173249','10001297894','10019578425','10022416174','10024558733','10025056622','10009599224','10010204019','10024571425','10017922660','10016468823','10020885703','10011792517','10024651397','10011450196','10024937259','10024659619','10019503342','10024660222','10025277242','10024690303','10024683935','10026051897','10024693083','10024695800','10025391170','10022148507','10020333356','10010930846','10024486506','10020088295','10014820763','10022371980','10008221203','10025393292','10023889755','10024714708','10024708970','10024717806','10014520325','10024730907','10024730352','10024738238','10024727322','10012500399','10013762281','10010163623','10000986074','10024737365','10010097222','10019843602','10017094928','10011240653','10008557875','10014126736','10025080293','10013260945','10011327636','10025168944','10017552084','10010503733','10026133426','10025389955','10024178284','10008528496','10024924453','10024733066','10011304247','10025533507','10010933343','10018864125','10024968282','10023656289','10021161968','10024963738','10014993321','10025394408','10012192297','10024983003','10025396999','10018791512','10016463222','10023289092','10024896181','10009535202','10023244956','10001043917','10022242741','10025173244','10016003984','10025106866','10025175206','10017677596','10008832618','10023746736','10025116700','10022077504','10012592391','10025126396','10025127815','10025125859','10011237068','10025128391','10015363299','10025134624','10025135365','10010520457','10025142621','10016775954','10025146594','10008720421','10022131025','10025150074','10016111128','10021546266','10016784603','10024699305','10025187292','10014988527','10006110638','10025172319','10025188452','10013539994','10025174306','10019774946','10012117903','10023405298','10025047456','10010105482','10021924166','10014822382','10014283750','10025202807','10020802820','10015052325','10025210287','10025221561','10021971772','10006459255','10010691072','10024651439','10020946482','10025239103','10025244950','10017210149','10016482186','10013803823','10025163085','10025527758','10006119368','10025261979','10025262420','10025299689','10025303043','10019904455','10020534711','10011573756','10024517488','10025312849','10017313946','10025317893','10010209784','10025318596','10025318409','10025677415','10026131960','10025322436','10015686850','10013690567','10016693438','10000958566','10007658953','10018453442','10015109293','10025330135','10025089054','10012318745','10012585402','10015063498','10016940316','10026138021','10024203174','10025325756','10020430726','10009909599','10025348139','10012333648','10023253607','10009815972','10016003107','10025354851','10025801126','10017244112','10025359859','10013270764','10025472494','10001305795','10025366976','10011747983','10020181000','10020353031','10025370569','10024457185','10024939666','10021208407','10009155096','10001756137','10025955746','10022129232','10021511955','10025436466','10019980920','10013645459','10022340432','10019006603','10025445496','10017322193','10012949796','10025452219','10025449264','10016549813','10010881173','10015292445','10008310351','10025456382','10014375089','10025458979','10009852777','10025460250','10016355010','10008759694','10014407272','10010687127','10009546575','10012194348','10025946138','10015277005','10020595770','10014192933','10020497963','10015332377','10024828973','10025498964','10008761321','10022549735','10013414614','10009524553','10025562798','10011003636','10015473745','10025818235','10001300427','10025571401','10022561843','10025250644','10021969764','10025583741','10025588417','10026065895','10025590696','10025590504','10010721343','10010028253','10019731207','10014896790','10025607079','10014688254','10024041395','10025611114','10025611929','10025612353','10025614389','10025595659','10011363896','10009544301','10024186906','10010724506','10025622936','10019810676','10015246996','10014266690','10018524987','10024737811','10025626413','10025626946','10020134462','10018461656','10025695179','10012378519','10010072985','10020667682','10021414078','10006630566','10016629874','10025647031','10023466490','10018126523','10021823234','10010381204','10014389202','10008512471','10026068225','10026238954','10020096351','10025714823','10018827305','10012813907','10020287293','10024918632','10023355883','10015835288','10019852156','10011260439','10014898129','10018819186','10018577150','10025744140','10025015986','10013351609','10011767108','10019546190','10012645572','10014613256','10012290540','10014959816','10018036168','10023420137','10011540303','10025542953','10025770614','10025775642','10025960757','10025768785','10025630932','10014724920','10010890582','10023696379','10008487735','10010384351','10013305648','10025950874','10025792099','10018849057','10026064190','10025799365','10025799732','10010459104','10011210922','10025787063','10026071746','10010904969','10011679846','10026135933','10010752755','10014510592','10011200531','10005877314','10025840398','10025842849','10025930934','10023468312','10025775462','10024946540','10025851175','10014909388','10019114085','10023410264','10025855971','10015603015','10024278247','10019499992','10025225784','10025867343','10025871950','10019234614','10019965875','10009925686','10025871860','10025876743','10022287860','10025875938','10017529708','10017993226','10025971410','10010057795','10025889601','10026073189','10010786659','10012122129','10019293856','10008220462','10023894255','10025902353','10017017035','10025910845','10012998123','10026076522','10026222196','10026246319','10025917936','10022368798','10021110998','10001772252','10011098201','10025923726','10019803552','10023394140','10025981098','10020002011','10020677870','10019510910','10026004928','10018480054','10008502098','10010237306','10011576285','10008976895','10017716936','10011483052','10010174523','10025991972','10025992739','10025993921','10025996467','10025998410','10012669832','10020369844','10020610134','10009694383','10026004238','10026003975','10009157601','10026004072','10017011000','10021400128','10026009111','10018976764','10011111702','10016966359','10026008672','10012213533','10020273125','10001754607','10016217831','10013376110','10026017499','10010971294','10026027638','10009152535','10016892264','10021970027','10021003353','10026031208','10011571653','10020151159','10015061413','10026038437','10009431514','10016741329','10024852726','10010503246','10014430353','10026157898','10011102740','10011044264','10012992362','10023492157','10012641116','10010445907','10020877966','10026249764','10014609647','10008322059','10008663378','10022360554','10011426256','10017495011','10026162342','10015487500','10026089237','10026163358','10012737103','10022108809','10019210546','10020900683','10026170584','10024589264','10014733388','10016315525','10026177496','10026126356','10026257097','10026173799','10026074008','10026086311','10005855956','10026088782','10017973252','10026225685','10026255297','10025084358','10026133148','10026260959','10013271563','10026263307','10018500911','10016161160','10023364409','10026219249','10017917439','10026100150','10011052233','10026068241','10017486117','10016791106','10005926322','10014302255','10026263501','10008099169','10026104626','10008124521','10002124146','10026111476','10009434561','10026106172','10010262141','10012090972','10025599695','10011173597','10010609743','10025643841','10026116786','10010471306','10025188476','10025221354','10018525123','10026177328','10026269908','10026229803','10005775474','10011380443','10010503399','10015825703','10026273300','10019133887','10021168282','10014973463','10017141483','10026271664','10010284917','10026190273','10011321370','10017404901','10013157088','10024809501','10015104240','10018598208','10017806404','10025851532','10015943844','10026193040','10026194008','10026192837','10026190976','10008312332','10026195482','10011217097','10020674426','10016022201','10026193876','10018961184','10013532925','10014433400','10018801186','10026282958','10012606483','10026208606','10011396864','10008760934','10026201562','10026217052','10017334389','10010165492','10026260660','10006787346','10026291979','10014880216','10026295334','10017010203','10021835109','10026303064','10026308295','10026311379','10014724486','10026306250','10026051536','10021100000','10026318892','10026003345','10026310853','10026295897','10026248036','10019205242','10014045841','10026323103','10026135315','10012655638','10015935544','10015592990','10008655439','10017294121','10006788708','10016696938','10012208585','10025923053','10022562878','10024608188','10011718420','10024613927','10010817719','10024678427','10014869381','10025994440','10025998009','10011568335','10024113257','10026000341','10026003179','10026007675','10025804132','10015067970','10010987581','10023694354','10025047257','10022238822','10022574624','10024814260','10010774390','10009104233','10010209706','10024202280','10024219707','10011304208','10024508078','10010098321','10022562817','10025939726','10023730175','10024718771','10022009276','10026231243','10012450449','10025211396','10010605379','10023535953','10008465340','10010341985','10011964932','10010101161','10025953508','10009176182','10026048560','10012824881','10026166035','10026116470','10023471597','10013203971','10025619778','10001316746','10023579236','10008528580','10025043226','10001597627','10011215995','10011517269','10023718690','10008502408','10022068003','10010585574','10012315223','10024194643','10024207133','10001643409','10024309674','10007982928','10026055982','10020491563','10017991875','10008485560','10026132549','10014475423','10013207787','10024907502','10010742373','10023725075','10023293514','10016890559','10022462211','10020503208','10011359874','10011047408','10005687725','10025225046','10015042006','10010202160','10025243952','10025303929','10022397115','10008759314','10025551883','10025407316','10025515826','10025659162','10011318875','10015282285','10022503263','10023976227','10023667527','10024547682','10025980417','10026067452','10021224546','10024934633','10026038499','10016652746','10023427255','10026110737','10026275824','10010042285','10014740601','10014357227','10008069172','10026167404','10010471459','10024171087','10025044293','10023427516','10014649563','10011264259','10015081070','10023714890','10005631422','10026046481','10023533534','10025930215','10011336332','10009394056','10023888183','10011751074','10012722951','10023674264','10025393209','10023761644','10002077587','10023668720','10023984480','10022440850','10011438695','10025608533','10023888319','10023680460','10025151903','10023697422','10023689852','10024088617','10024027937','10010808289','10023672980','10010139332','10023755624','10023640697','10008072672','10023924544','10014042333','10022024267','10026052440','10023618681','10023829654','10011545399','10023832007','10023663766','10023790922','10025934717','10023837842','10024309402','10022209004','10020455371','10011458860','10024077660','10023911386','10023912081','10024233500','10023798190','10025931527','10009325708','10023595527','10014590894','10025664409','10024027299','10011026057','10011566920','10025935536','10026221380','10025382564','10014286686','10023981249','10016398724','10019689626','10014492741','10006828219','10024609974','10025271959','10025051761','10015146680','10024314841','10024048226','10024124371','10025810510','10024320131','10024181103','10024239547','10024161456','10012745250','10025053216','10024239583','10024323172','10011009579','10015926693','10024206490','10019060774','10026225817','10024487065','10024255697','10024258766','10025937584','10017467843','10024265776','10015145168','10024811458','10023809894','10026053272','10025697248','10024245535','10024341996','10010702563','10024618189','10025388870','10022037118','10010372647','10024828322','10008488951','10017702739','10024461990','10023677654','10013993860','10024836246','10025267763','10014176213','10019477702','10022425300','10022343796','10024626498','10024511063','10018969730','10009550948','10016830213','10019714628','10024531016','10024529959','10016280004','10023762388','10012710789','10022580085','10011022054','10024541938','10024548913','10024853163','10016921804','10013556510','10009512805','10024658786','10010247152','10024861160','10022138765','10014960684','10024668130','10024674018','10025165025','10024680878','10025393958','10012751427','10024710347','10014686614','10024723608','10025066101','10024726826','10020728065','10026234474','10022062395','10021928335','10025531813','10016763499','10024252020','10024910291','10012930739','10023377183','10024925398','10011992094','10002059951','10009315374','10024934234','10009895501','10024744847','10024956856','10024525756','10018285566','10026058365','10005640020','10026236121','10025284267','10011048026','10026237288','10010107350','10024680609','10009749192','10012537078','10024830786','10012525536','10022315472','10025675136','10019102321','10009809316','10023264452','10025192500','10025195793','10023499337','10008635407','10025205268','10025206980','10010277779','10022423834','10024444620','10025222169','10026061008','10010717155','10025249301','10010469481','10010516206','10025263416','10025306091','10025306998','10025347691','10014138231','10025368147','10013355726','10024581797','10011693869','10025421529','10025430593','10024745388','10021805191','10009828955','10025817847','10025449501','10010696538','10025455006','10015521175','10025476377','10025480201','10025954165','10008428822','10022523475','10025501858','10025503579','10025511781','10025573513','10025579074','10025267210','10025607381','10015712020','10025622032','10025955021','10026244085','10012577712','10010156414','10025652763','10017838381','10010495876','10025704833','10021248099','10015485472','10025713966','10025715595','10025444500','10024572764','10021725900','10025723513','10011332659','10025743133','10009464683','10025749174','10011638384','10025765230','10025773311','10025766264','10014229069','10025779436','10026149129','10012887900','10020794898','10025862031','10025864796','10009630688','10026073389','10025871364','10026244313','10025969791','10025877458','10025887845','10016012634','10011057330','10011271835','10014457331','10025902362','10026077455','10025799846','10011965577','10011597401','10025919484','10026078290','10022088083','10016024181','10025975369','10022356760','10006331952','10009283946','10025976036','10026001699','10017262703','10026007884','10013681459','10014979221','10023357590','10010891107','10026024922','10009771334','10026249752','10021980479','10026250966','10010156232','10016900442','10025597683','10026043403','10023788291','10015483758','10013106146','10015800972','10026086905','10026086332','10026166291','10013321954','10026229557','10026178797','10026174703','10015474267','10013756905','10026092329','10026259266','10021070309','10026027254','10000840243','10026260462','10009543472','10026265005','10026228785','10026098160','10026100646','10022502366','10022323883','10026107393','10025352287','10009885850','10026116825','10026183443','10010142447','10026269961','10026275030','10025402449','10010392111','10011521517','10026088845','10026277853','10026187195','10005859192','10026188742','10026002500','10010713503','10010563317','10026203647','10026201645','10025649894','10005765129','10026289317','10015416505','10026257856','10025623942','10009830612','10022056887','10023564676','10022024147','10023563608','10011005237','10022337931','10011439063','10022300188','10023516255','10018220423','10022034913','10025376308','10012126586','10009377299','10016334932','10023624703','10025265954','10005635904','10023667582','10011384696','10024224680','10023527653','10023658408','10012590827','10010815723','10023705773','10023687701','10023663881','10022297804','10009968098','10008784437','10017527703','10023679670','10009308044','10016669183','10020746859','10014489054','10023989708','10023773850','10009139246','10010865751','10021119074','10023824166','10021208423','10023780936','10023445650','10013400478','10016796396','10015248126','10023754524','10023752862','10021469457','10024029622','10023835355','10024259003','10011290174','10023837341','10023879979','10023838236','10014551360','10023885520','10025930466','10025269133','10018776986','10023913368','10023915944','10024076735','10024029693','10023918712','10012386878','10015157651','10024076421','10010810109','10014280588','10002172266','10023426709','10023715062','10010701325','10010831953','10023975419','10009158663','10016077604','10001134570','10023673410','10020541294','10008163092','10024086794','10000811696','10011596281','10024317220','10013928080','10010552259','10025272695','10021994181','10022198106','10023699672','10013113430','10010761507','10024238926','10013440294','10024239116','10014319190','10024202288','10024208710','10013145764','10024825459','10019759551','10024219669','10015728307','10009926913','10024260111','10024822995','10021955835','10016300237','10011060147','10025276702','10017209218','10012279812','10013505164','10005846666','10024535096','10024371298','10024374685','10011353610','10016459987','10011580641','10016011478','10018607842','10024459372','10017201522','10012890609','10020877077','10024615720','10024413013','10014186972','10024488221','10012838872','10025162274','10009675650','10010359488','10024529858','10024272872','10024534749','10024635474','10001795090','10024532946','10024555708','10025943629','10024648573','10024653329','10024644281','10009887230','10024220960','10022411317','10009897186','10024687951','10025278985','10024706622','10021169515','10020058762','10025057333','10024748955','10024886333','10009322413','10025074073','10024876899','10025073866','10025078481','10022382946','10013325120','10024874653','10025080289','10025080787','10022260046','10010074928','10023339913','10022023111','10022232308','10010735462','10026055683','10024917198','10024917596','10024922806','10024916063','10009702894','10023433223','10021474468','10024721449','10014353867','10024962644','10006127720','10016450709','10025094509','10025284631','10021329826','10025035592','10025035971','10024947121','10021979573','10012957894','10022322641','10011035763','10012217419','10012415894','10005839728','10013438618','10025129463','10025135969','10012923691','10017224370','10026057983','10023312890','10013444339','10025049728','10025189231','10022118756','10025191574','10025199709','10025210628','10010828835','10025293063','10010820553','10025537907','10025225201','10005852194','10013832624','10025230461','10025230727','10025231984','10025234874','10025233920','10025241191','10023479814','10011569080','10014232005','10024751685','10009874426','10020628994','10025302085','10025302986','10013946166','10025307391','10025308564','10025538312','10025539749','10025949285','10025348371','10025342804','10025344206','10023778706','10020833623','10018733562','10025366967','10011600985','10026181534','10011339396','10025421098','10009228803','10013052190','10011487355','10025806365','10012082703','10010782669','10025437593','10025435577','10015752656','10023680647','10025950990','10026236883','10025457247','10021635255','10017819059','10025498883','10025566740','10025574097','10025576172','10010288109','10025681158','10025597330','10025598884','10015778609','10025617863','10013445065','10025622432','10025629471','10025633910','10012192290','10005951793','10020524516','10025651399','10016762749','10025598054','10009517894','10025655691','10025957261','10016088110','10023385464','10025715170','10020090991','10025720028','10026241991','10017355690','10025735323','10010480731','10012181689','10006650664','10025761818','10019164039','10016757868','10025391363','10014387797','10008125471','10025783375','10010824157','10012626290','10012915904','10011159406','10017025402','10010190460','10020917517','10013105873','10025863880','10025867955','10015652281','10023504983','10018716379','10011287672','10016216448','10025889668','10009401805','10025888470','10010410439','10025911839','10009102452','10025911916','10016268246','10025919179','10008469952','10025925012','10025924269','10026070633','10015549494','10017063841','10026085132','10021466076','10013614169','10026015289','10015221689','10026028312','10026031221','10025871774','10009931152','10019979256','10026157334','10010118370','10023769481','10009285038','10011639090','10026256061','10026166814','10026167018','10017749657','10015919317','10024368612','10012961842','10026022857','10026247252','10023670954','10016260718','10015631728','10010861682','10011014184','10026095540','10025716084','10026098860','10019285152','10026101938','10026100213','10026104787','10018999794','10021972119','10021996330','10010993627','10026273515','10010334104','10026266653','10026281900','10026187747','10010929623','10025508059','10026197640','10026198741','10010845522','10026286776','10002090692','10012283792','10026204311','10011268153','10026203573','10026202033','10026191218','10026218294','10015052445','10026302328','10024824889','10019207145','10025033193','10025755086','10013778492','10023493899','10024215924','10002054295','10008929594','10023708212','10015689791','10008005388','10017568442','10016629267','10024269928','10024133114','10023224652','10011228140','10022270605','10024365835','10021808498','10023929545','10008165647','10011686611','10026242643','10024413993','10017609489','10025544483','10006602248','10009046338','10023690159','10026063505','10025334826','10012216155','10025957559','10000827823','10005890455','10010456767','10023602496','10023540478','10010796837','10023789881','10023576016','10008151980','10023772583','10011874129','10008856101','10022494581','10021683844','10001768186','10025040922','10010113034','10008180278','10023642149','10009137627','10005834169','10005478784','10015616854','10008290984','10023757447','10000830382','10009142764','10001216881','10006657762','10002068598','10021661363','10017272449','10023221216','10001319727','10021953358','10023803171','10009301099','10005666780','10022343755','10014630842','10014992149','10009748038','10009365911','10000849878','10000838230','10023796913','10014874666','10012132873','10010586182','10008721457','10005657737','10015118338','10015270894','10009522768','10005642481','10023988797','10012141899','10008105545','10001246743','10001764724','10016165035','10014058752','10015177619','10006125765','10005935641','10005823099','10010584642','10020171517','10009118450','10013222702','10024094961','10023494328','10008332193','10007530871','10009895573','10005751407','10008092135','10000700180','10002051011','10008346035','10001589657','10024220159','10022241435','10021590749','10008176183','10013182717','10024338989','10012069303','10025276664','10016188321','10023747352','10006100652','10000794603','10000790149','10001805370','10009585148','10024819457','10013239467','10024541014','10017831873','10005898668','10012873982','10024755864','10025939507','10024862693','10001700397','10023576058','10021686222','10012982595','10020994768','10015146322','10025022231','10022365694','10015544653','10010371276','10009106841','10000981741','10012352170','10000193355','10025188248','10021955627','10008071399','10008452149','10017339683','10025686346','10024988140','10012760142','10021876273','10025762724','10020602505','10007523349','10010190916','10001079920','10005934840','10010068982','10006604687','10008060901','10026002880','10026005602','10017522135','10018090911','10026012549','10025370206','10009628757','10008030577','10000052644','10006728367','10009820506','10011242328','10005966756','10008015639','10026214738','10012901938','10019865901','10009564710','10023592623','10023599881','10023694631','10000947583','10014748970','10009429897','10001028008','10009198655','10010621537','10012621240','10008104376','10010574605','10005654001','10010216636','10011100043','10014009954','10016462230','10023798707','10005634066','10008115476','10021724439','10001747834','10005860266','10010804322','10023600135','10012863142','10022348388','10026052543','10019372539','10025322428','10008895829','10024090473','10020602586','10024113291','10008325244','10025821977','10011029297','10012190386','10009801025','10009852170','10018448775','10015545585','10008866038','10010882326','10012209721','10023957407','10014752213','10010977099','10014621028','10010129028','10009511018','10000996379','10010824476','10009492747','10016429291','10023732264','10021309689','10008020571','10022089799','10009379755','10023739887','10009078977','10012175832','10023800367','10012112671','10022470048','10009246429','10012926846','10022437531','10017690280','10002135485','10025725780','10012529096','10026224498','10001189311','10000114346','10005927915','10017874368','10000143815','10016626158','10001730744','10024131018','10006711942','10013213145','10013844501','10024188981','10024217200','10024321409','10014334409','10024139634','10024383896','10025318779','10002127855','10018304633','10024432122','10015009876','10025039449','10005818816','10024473659','10009969698','10024080452','10023615204','10006722387','10012409718','10014063917','10025784471','10024776653','10022020263','10008855487','10022132477','10025040730','10025056956','10001752420','10025157013','10000732583','10008350913','10024240086','10025538064','10024803834','10014157217','10025264943','10013587090','10025315772','10016710375','10013574473','10025540232','10024838406','10025363954','10024296788','10024273444','10016175130','10022139275','10025505741','10025506292','10025512317','10017520777','10013000862','10017588534','10025378477','10000732818','10006101725','10025617202','10025495583','10025747904','10025640093','10006469730','10026072440','10025258108','10025815800','10014221418','10001302479','10025874394','10008955027','10025876140','10014605326','10010127102','10025927428','10017648306','10026005640','10021378833','10023964131','10025642607','10009986030','10024826798','10026164934','10008084595','10010492990','10002173947','10006418805','10026259726','10020243752','10009116788','10001609843','10013364840','10011952865','10013899015','10024819280','10020925411','10009698767','10011061222','10026196670','10023302663','10025764076','10026271326','10026279940','10019002663','10006476554','10013095329','10012064324','10006805146','10026002788','10026001769','10026007897','10009876896','10023776565','10001831156','10005471760','10016904866','10023483225','10012462269','10000884164','10009329750','10024097174','10024213600','10016988205','10024219469','10023268550','10013545567','10014143010','10010175356','10001830690','10008440415','10025454633','10025483027','10018061395','10010412910','10026252258','10026273700','10024038367','10013554329','10012573723','10014233769','10005660056','10023593185','10008327427','10014642409','10000979651','10018030094','10023660762','10015741623','10023641089','10023754317','10023772635','10021598562','10023719254','10014114989','10023779072','10023670206','10023769090','10023774540','10014326306','10010100099','10013787979','10005650007','10023795925','10014366490','10012223256','10010389905','10005913457','10010785587','10005813208','10014288700','10013205854','10023706843','10025808011','10001289959','10001748477','10021668356','10011212639','10008048778','10024089570','10000014995','10024084812','10024090559','10008548026','10024073867','10018487922','10009407663','10024143961','10024150279','10009170552','10024151742','10008053487','10014383262','10014461518','10006110436','10015031841','10014164643','10024497466','10005643502','10023756032','10021959581','10024816984','10022367871','10025039722','10025040748','10025762213','10010981760','10009320311','10009498809','10011055808','10019402440','10009649756','10009738370','10025572232','10024172477','10025632525','10010115937','10001075662','10013752078','10022338610','10010762608','10006113695','10017661654','10026119407','10001075733','10017107843','10008157321','10026313971','10015118980','10006894541','10012193345','10023677822','10023581275','10010733108','10023833642','10012061899','10010691213','10009988204','10001051521','10010737463','10012370028','10024487906','10001062134','10010264641','10022000791','10006548953','10012101053','10023770987','10023543909','10024023432','10012200943','10012256365','10010072303','10021988060','10012171413','10019261156','10013112730','10025970284','10006797160','10023693003','10023881135','10012052637','10023882102','10012069108','10016679668','10023696779','10022501343','10022087619','10009333589','10022473918','10012473061','10022004112','10011013975','10013352516','10012968020','10011841810','10012073818','10023709291','10023949071','10012901627','10022220728','10010066123','10009033715','10008824328','10013359456','10023673653','10023822947','10023777726','10009033054','10025532093','10010980849','10021393882','10014608792','10009087410','10023955766','10023583106','10021922496','10001159864','10023768711','10023593689','10023888260','10009554186','10001023031','10012062631','10023619332','10010582399','10023753364','10012212709','10012188729','10023568353','10022022422','10023654235','10005899078','10022215347','10009414120','10023689230','10012258490','10022422967','10023881289','10009958600','10016484713','10023894330','10009081175','10023891056','10023823820','10023777403','10012094688','10023823972','10023834294','10023783138','10010203084','10023767852','10023516449','10023786903','10022070458','10023834753','10023801981','10023811343','10023812965','10023329300','10009066369','10023838334','10023310196','10019469964','10021840167','10023879925','10023879756','10023832990','10023835852','10023884298','10023311288','10001055177','10009941052','10010190436','10023833986','10023882653','10014243564','10010114795','10023997200','10023741280','10022355522','10023935097','10023309546','10021758254','10012009011','10024020586','10024021810','10023917322','10024032253','10024032337','10022157124','10012179473','10000958689','10000830117','10024808964','10022247096','10010746436','10024182549','10011912366','10021631047','10011252752','10024199020','10011242170','10010838921','10023800407','10009835872','10009786597','10024400395','10024035211','10021913664','10021981847','10010745264','10022170384','10023942358','10024233153','10010701098','10000034890','10010337219','10010748542','10010518831','10009313276','10022268057','10023835837','10025055449','10009951484','10018385848','10001111778','10023805828','10023314284','10024294884','10017059110','10008039783','10024500905','10024441372','10008344241','10009719423','10024616086','10010011184','10006812564','10021900704','10024476813','10009235536','10024970606','10013318279','10015196624','10022542120','10022256528','10009410643','10024626036','10013088746','10010081405','10006699465','10023342936','10023329851','10024654077','10024667606','10025056219','10024712993','10009088204','10022008507','10024735439','10024690516','10023647290','10023937264','10012426106','10011445125','10010595924','10011501179','10025091277','10006704436','10024971077','10006349454','10013418182','10025089671','10024736285','10025104712','10013625558','10023752357','10016564798','10023733892','10000908731','10009475343','10025219570','10011479414','10025219954','10025237526','10008317021','10009139338','10013640987','10012798384','10025315402','10009479724','10012247698','10023523144','10010232576','10012252947','10016926887','10009407207','10024914791','10025578768','10024913839','10025614091','10000964718','10021809758','10006700066','10020901434','10013811124','10015600249','10007988615','10023462387','10006888005','10017311534','10005665617','10025952665','10010146406','10025966068','10010325172','10025909403','10025898890','10015175165','10009129457','10008206199','10013965124','10011608933','10010428499','10024436468','10017273496','10015054113','10025979513','10024550360','10014060257','10013597484','10026110082','10024158357','10011337187','10008138797','10023240067','10022351440','10024380733','10011394072','10026073432','10010810094','10024923994','10009125980','10000697399','10023882093','10021855135','10014335421','10023886863','10023886762','10023575825','10021908100','10024490880','10013155237','10020521676','10001621171','10025922341','10008894439','10016951275','10009061387','10017559349','10009160129','10023683133','10023683749','10021978534','10015445045','10012089280','10024732249','10023747515','10009160894','10022322675','10000709704','10010020899','10023757586','10023479862','10023764394','10023826456','10009503158','10023779319','10023777573','10023985911','10022137037','10023581543','10023991620','10023881063','10023754785','10024232867','10010122913','10013555975','10024079396','10023960197','10010034045','10023837532','10010078668','10012435535','10024035245','10005936259','10000113190','10023370548','10012156594','10009852804','10023314728','10024182532','10024611708','10024180607','10021065721','10018451574','10025264928','10024207242','10018523463','10024218539','10024219542','10024398856','10000139089','10021924224','10025055201','10024347639','10011381153','10024354644','10024355567','10024349823','10025160335','10013128721','10021957157','10024444964','10022087625','10013408550','10024471117','10009140970','10024476214','10023772528','10024478776','10022464401','10024482619','10024480968','10018668355','10011657755','10010834448','10022375630','10016347990','10018478919','10015603575','10021710381','10025059834','10015970753','10025060406','10024857839','10024201863','10023800575','10024735238','10010158560','10024731918','10024889204','10024794590','10013590692','10024784305','10024993065','10010859806','10024774503','10009918926','10023399388','10012476818','10016904474','10025118474','10023636200','10013533132','10025133832','10025145896','10015172793','10025209658','10016165292','10025230995','10025184932','10012765544','10022197774','10015039252','10016761953','10018668486','10023493048','10025163217','10024512763','10023660456','10012101710','10025578080','10025578025','10011443682','10025330075','10025162295','10025665642','10024868225','10009622194','10025908660','10025912518','10008641486','10026037952','10011091043','10023802560','10001077859','10010055445','10023537079','10010823079','10025848927','10009785187','10015463632','10022568980','10001063795','10023585307','10009961658','10011267990','10024389708','10013619040','10023827317','10009927544','10022432860','10012292376','10023833581','10023425688','10023818727','10023801345','10023884331','10024027083','10023883741','10023837310','10014427864','10023832917','10010028048','10023833310','10023833407','10023833397','10023883368','10023879510','10023491327','10022069509','10023835096','10023884357','10012022384','10022430361','10012150239','10022051546','10024387456','10012074655','10023935775','10023882580','10023998656','10025156402','10000899290','10024015151','10023920429','10023739223','10010128135','10014268084','10022421431','10009931599','10010136880','10024385741','10010008403','10024075393','10024014899','10001022288','10024143297','10024112175','10024890076','10022213133','10014724206','10011142272','10011838311','10025941789','10024610810','10019166931','10010952080','10023367063','10023570301','10024219941','10024223089','10024218978','10023899503','10022263307','10024257794','10024473897','10012054805','10010312046','10006691791','10012024318','10024612373','10009980692','10009677959','10010126716','10010384645','10010105685','10024199373','10012921627','10022291233','10000951060','10023802000','10010235031','10024102438','10008170583','10014007315','10009253456','10024349981','10000932086','10012188480','10008487057','10014741506','10012108046','10010559235','10012513077','10024383335','10022216239','10001647390','10009368101','10013464992','10024146753','10024427948','10024447326','10000677341','10024463438','10024232570','10008584366','10024463964','10021912417','10011499984','10021924773','10012040617','10010079724','10009270914','10024535123','10024528078','10023390396','10023398333','10024641137','10024860012','10015313988','10023367779','10022002108','10009169123','10009067800','10024569929','10024585817','10011597744','10010195384','10010013795','10024657406','10009283778','10008756268','10023794841','10012758471','10012797616','10024740107','10020797559','10009251677','10024773605','10024775432','10024786359','10017928757','10011446054','10025163296','10023336318','10005792414','10025088744','10009462251','10017858886','10023349505','10009135752','10012383170','10025013380','10019415940','10025943777','10000185773','10023637679','10012405800','10025101538','10025105065','10025102707','10025105689','10019603205','10025104353','10025115149','10014365878','10023494105','10010728111','10011354376','10011107464','10006348989','10025204097','10023420646','10016057966','10024869186','10025401019','10025212584','10009481190','10009794433','10025222298','10023608615','10025140939','10023796469','10023756435','10025253055','10009272125','10025397367','10025205981','10023510801','10024413165','10021894891','10012197606','10025335494','10025319650','10008030642','10022031263','10010625713','10011095950','10024751910','10024919982','10025361540','10009549610','10022321472','10009417541','10016694750','10009517333','10009824654','10021848436','10008235382','10016038754','10022151176','10011090076','10026063619','10005883952','10025251022','10026063488','10025276103','10024427932','10011413020','10024915897','10012214807','10001771261','10025590743','10024745720','10025613018','10016399745','10025620216','10006602025','10014987828','10025649035','10025651303','10025579314','10024524038','10023645148','10011374642','10025956563','10025321814','10009847134','10024569137','10015412920','10021721008','10010813929','10025765855','10023400488','10024781800','10024985328','10011476987','10025961973','10025960545','10024987529','10024570572','10023791592','10006581789','10010219454','10005703999','10015925317','10025857885','10017825355','10025868274','10025747600','10026146619','10025889371','10025890863','10025897282','10025890851','10022209420','10025900182','10025958526','10025904779','10025901345','10010627460','10025911619','10024461757','10024162440','10025923798','10025921264','10025923710','10025971521','10023811041','10024630264','10010745388','10010569553','10012602486','10026004869','10024919870','10024475744','10025898490','10024701125','10013250667','10013799890','10013827929','10016181558','10024438420','10006701045','10024474289','10025924342','10009177031','10026070967','10014827278','10024547753','10023737193','10026108401','10026062205','10010621945','10024547703','10025543486','10012155280','10024830614','10024447008','10023255106','10017018203','10001003105','10023816754','10011336970','10022058170','10023987214','10009322392','10023527708','10024023551','10023782380','10023271197','10023887504','10009193360','10023885634','10012112145','10023878866','10023832705','10023557273','10009167657','10023603112','10009642821','10021854966','10005667886','10024421949','10009095440','10023331749','10009250250','10023392930','10025231567','10020706343','10024735886','10024746489','10012341145','10024878339','10021856891','10025328586','10025426459','10026058109','10017396258','10021727308','10025927920','10006111019','10010447097','10026270554','10024563775','10011191473','10024510181','10021779073','10021945445','10023540995','10013323099','10015661952','10023557020','10012825718','10023817963','10018500146','10023661564','10023317767','10009931642','10023251575','10000972846','10009972397','10011519998','10025660464','10006887436','10023582104','10000827629','10022061070','10012005472','10023583759','10012467806','10012488757','10012884105','10023981551','10023432211','10023512667','10013233240','10022325280','10023888326','10023888420','10023583804','10023804020','10023715240','10010800388','10010758373','10025651163','10013564927','10024026688','10000153362','10023793946','10023880985','10023800540','10008589885','10023722355','10009070498','10023824199','10024539323','10008865587','10023769697','10008906302','10023441181','10023767912','10023683203','10023489923','10023821185','10021985607','10017577210','10023770073','10023784790','10023452053','10011317581','10023785046','10015594163','10023318411','10023774025','10023258154','10023832605','10023308585','10023313195','10023702312','10023235884','10023827913','10023833421','10023892968','10023893302','10022388472','10021962162','10023800954','10023835721','10022141500','10023808985','10023397428','10023810932','10023890152','10023387157','10022572372','10023397467','10010611439','10021936930','10023808433','10023834140','10022543197','10023291819','10023816082','10023808753','10022439758','10022044708','10023836368','10001102553','10023832722','10023892999','10023770323','10023741553','10023881245','10023883591','10022141104','10023888878','10009061958','10016314159','10024029927','10024031667','10019663922','10015453450','10023906529','10024016387','10010425173','10023826612','10014931670','10000827991','10022041050','10000825183','10024033684','10021893326','10023813339','10009076458','10021850726','10024019787','10024032524','10001067182','10021975129','10023575188','10024036592','10022545290','10024035473','10021961448','10022345720','10022230308','10024041687','10021925602','10022063367','10023577101','10023248832','10023526343','10022082032','10023741531','10023955427','10024035932','10023649136','10001637871','10024032159','10023812808','10023662512','10022012863','10012996765','10023838022','10025658085','10012208993','10024966997','10020963147','10012759459','10009970491','10023671236','10012624867','10011370683','10012047370','10010441934','10024196581','10013153575','10022209563','10012691259','10010414982','10024212742','10024217811','10024220471','10024250730','10010186224','10021961830','10009846213','10010180071','10024270961','10009921003','10024274355','10024330024','10010359016','10009829220','10010968814','10022347895','10010467930','10022259259','10006122062','10010484021','10009489227','10009900142','10010840798','10010870378','10023830837','10010075354','10010874949','10024327004','10006725347','10024077608','10009224516','10022173658','10024432942','10021041052','10023296624','10024386271','10013434120','10010407734','10024141200','10022465380','10024483931','10023887937','10006122058','10023265017','10024624904','10009679469','10024541181','10024542791','10008812126','10008417425','10008936763','10023780838','10008627331','10019446188','10024579008','10025670601','10026056288','10005658273','10011116643','10008140444','10024694250','10024692246','10022182430','10024735639','10023774410','10025074167','10002065171','10025076988','10025167443','10010067344','10010025279','10023263136','10024891215','10024725876','10024830537','10025086775','10014942055','10000027760','10011439681','10012477357','10022188837','10005774102','10024723311','10025947698','10017065434','10023616174','10013878124','10024904660','10019240026','10011700416','10025673616','10025211085','10025216578','10014728608','10013985621','10024603752','10025405625','10016866766','10025250338','10025406640','10024934204','10011238077','10010373976','10022499216','10010956896','10021872649','10006718819','10025507214','10025577720','10014978886','10025955212','10025618325','10025620521','10025620029','10019982419','10025624072','10025630265','10011024674','10009856334','10017153814','10025106044','10017072769','10024083504','10024152495','10001220690','10025654016','10024954404','10012127561','10025750624','10005794979','10022437360','10006720092','10015318303','10024982175','10024997541','10025955229','10010819851','10023770466','10015775037','10025750241','10025967248','10025598400','10009292132','10025905349','10025964908','10023890557','10024023768','10025922631','10010753515','10022440567','10009701201','10023683037','10009102519','10025613734','10023748380','10022483336','10014563187','10000987435','10023885591','10006637270','10016340752','10021837971','10022044835','10010823501','10010444248','10026284711','10025578108','10016610989','10013541702');

delete from mothertable_satishsir_latest where reg_id in('10025931753','10022301948','10010593103','10023676374','10010069296','10022299711','10010303747','10011204591','10025053104','10026251636','10016236476','10025246187','10023252229','10010168885','10025640055','10021800167','10011027558','10009731050','10022013143','10024805638','10023606394','10025522073','10023610076','10009857624','10025519068','10024074456','10024730583','10025242993','10023999682','10013576213','10010329369','10024952913','10017122781','10011243143','10024607731','10023685715','10023311048','10019835075','10011238554','10014396894','10025047812','10019131469','10019842184','10025036285','10024846108','10010738598','10010226934','10010316052','10019895006','10025376466','10024631344','10025268319','10023663833','10026077077','10025778258','10010414129','10025150993','10008631863','10025196966','10013446905','10023570187','10018212860','10016464154','10025203175','10025929660','10023577464','10021155928','10023576339','10023978968','10025244744','10008305389','10023575384','10024310240','10026241616','10020892852','10011260565','10023581263','10013990214','10013404035','10009298871','10017835364','10021078513','10025385552','10025264686','10014080168','10024308025','10013284848','10012646034','10026030808','10024353432','10022359478','10025804643','10023584434','10015284408','10025929937','10023595453','10015537122','10009049976','10019669826','10023608048','10011636835','10020319956','10016916120','10022312251','10023611118','10009400496','10018641396','10023522316','10023663304','10025519032','10023715678','10010704193','10006656907','10025519203','10024024741','10010843876','10009300756','10025898397','10021497223','10025045459','10025045139','10013162570','10014607634','10025266744','10010870019','10024023463','10016878651','10015025693','10007526416','10023581821','10025930018','10023605767','10008426372','10010562262','10024386327','10012694757','10023670210','10025045934','10024809035','10012324851','10023660071','10001099256','10023215289','10023661002','10023661172','10014196935','10025267717','10023704394','10017462350','10018563165','10024981994','10009537108','10023671721','10024386713','10022378751','10009117737','10024726968','10011312688','10023685858','10009368618','10014635159','10012180327','10016334050','10015063315','10011484437','10010499437','10013531318','10025153026','10023634906','10025520456','10022213253','10023986452','10024308521','10008103652','10023943964','10025927292','10023883363','10019682925','10023285560','10011381165','10022443724','10018219572','10024118714','10017874124','10024952227','10011177120','10011367076','10023732416','10018947922','10008489195','10009593072','10009502432','10015009775','10025048646','10010160785','10010200712','10014344649','10020098797','10023625182','10023776078','10024813928','10025381355','10025934062','10023766876','10025267584','10023991132','10023795854','10025807355','10023785365','10023795975','10024388676','10018906418','10023891796','10024387075','10023888232','10023826959','10025153849','10024933685','10019067350','10005757815','10024027168','10010600613','10013115010','10025048652','10025934470','10011108773','10015149621','10025267835','10023788318','10023789259','10009957153','10025268729','10024311232','10023831806','10023926229','10006700761','10023800525','10023799751','10022165051','10012174323','10023895745','10019099098','10017723677','10023880395','10023834500','10009158881','10011234943','10009853664','10023879066','10023879288','10023929599','10010091309','10023993574','10023899742','10009781176','10010560748','10019674844','10014204738','10023884155','10023930814','10023882239','10024031293','10021937366','10010717280','10018471812','10009463731','10026222557','10023466798','10023929172','10011561921','10023906214','10023915104','10010094145','10023917766','10022031763','10025481916','10023389085','10010838094','10023374446','10025382932','10024602883','10023942635','10024495502','10012359074','10011000495','10011457759','10024316647','10014576518','10024029393','10022183825','10023999483','10025936286','10025807370','10018628309','10010725025','10024033253','10022556260','10023960234','10025156018','10025934503','10025810212','10013630569','10024003006','10023965819','10011318066','10023826290','10008378046','10023968778','10023971378','10019855862','10011405041','10023979270','10023430077','10023975566','10023251460','10024392408','10011454858','10024395235','10013410371','10024014282','10016336078','10024017182','10013978977','10024019562','10024317316','10017574491','10024019270','10020368128','10010408000','10012334712','10010703954','10017890842','10025383662','10001705199','10024044683','10009270278','10010573691','10024056364','10024395065','10025053999','10024492744','10024071568','10010193853','10019037077','10006130320','10024179785','10024131664','10024180758','10025384917','10002170976','10010475138','10024181188','10023267231','10023934972','10025074647','10014000785','10013312670','10011128091','10011166734','10022556538','10024237168','10013681438','10024155475','10024151664','10011590609','10009801730','10014676607','10024823191','10025305279','10011103559','10024187798','10009898447','10024243235','10014353009','10024613864','10024192854','10024193683','10024197158','10002173994','10024197595','10024195834','10023903045','10013871284','10020373210','10024203579','10024818452','10016281975','10024207596','10008514059','10013354622','10024206361','10024210836','10024212820','10023423879','10024212942','10019595560','10016072889','10010931879','10010696265','10010586095','10020330015','10011460930','10017026493','10012509107','10023253564','10024253630','10025158015','10005790936','10010190113','10024258799','10014199906','10024255099','10024263825','10020404831','10010786270','10011054256','10013867162','10018276021','10010740197','10024616967','10010137766','10011505346','10019471171','10012589921','10025056072','10020884019','10022351526','10014624473','10017557766','10010735272','10017742786','10002117768','10014202325','10026220057','10024329586','10019108337','10015558012','10016226477','10010357302','10024305286','10024304862','10025274369','10011704341','10009676411','10012059819','10024333076','10023317283','10024404927','10016785603','10018672082','10018792574','10012512008','10011230285','10024359999','10024341788','10010587089','10024336969','10024342321','10010330291','10009241964','10022164098','10009809564','10016594733','10013591520','10009924602','10023930141','10017469268','10011168113','10025160843','10024344300','10024352437','10025386481','10024354595','10024354253','10008515999','10025387894','10005494450','10025938536','10012520771','10024360579','10010179074','10010042882','10024415397','10024368008','10024254462','10025058794','10024376296','10023298056','10024379161','10024609410','10024501933','10011246885','10014673971','10023667175','10024828115','10012944511','10024501150','10010606087','10025277192','10013421189','10025528654','10025933158','10022227801','10006348075','10024835192','10024401106','10012561870','10002153663','10020904733','10012748203','10016020074','10024391031','10016061361','10024457651','10024457429','10011179016','10024458787','10011270433','10025385286','10009772642','10024454020','10024462531','10010097990','10010760715','10024464131','10024467265','10024467731','10024839063','10024471279','10011021842','10009924775','10011527586','10022370033','10024622775','10024622651','10024511871','10024532808','10024478786','10024472501','10023474427','10009465192','10011293452','10009934849','10024482705','10013798760','10013698545','10024621963','10009605280','10024217743','10024118513','10024517893','10025161427','10012376843','10024518042','10024520215','10010402354','10016327912','10021148843','10010572463','10024849254','10023466491','10014430445','10024851616','10017478931','10017700587','10023569692','10005728124','10005743136','10014425039','10024462969','10014643445','10025529009','10024200670','10024532366','10024535924','10024632362','10012609691','10024536933','10024394389','10024536438','10011497283','10024022388','10010085270','10024538325','10024540728','10010899585','10009202401','10009550023','10010067422','10023722021','10024638499','10012849805','10024644476','10022386160','10009895993','10010825061','10024644861','10022263839','10023943197','10024549143','10024039228','10024556236','10024556686','10009939693','10025389708','10025161884','10024559308','10024648501','10023227034','10010421553','10010241199','10010707207','10025272906','10024860026','10009783841','10024567829','10024563989','10024651118','10016930744','10021269268','10024640176','10022567704','10020747950','10024660254','10009429710','10024425347','10010600985','10024472075','10016205550','10024867451','10025061851','10009528966','10017622931','10024672173','10024669734','10010053014','10013848124','10010573971','10016832767','10024684243','10024687221','10024869400','10025439926','10009280811','10024689896','10022484565','10010250259','10024696082','10023661984','10024697024','10024673293','10025065018','10025939648','10011452245','10023351050','10024867526','10015221263','10024713974','10010017282','10019125295','10016877192','10021497187','10024718004','10009320440','10024721670','10024716783','10024713597','10024713179','10025389321','10026135997','10010309355','10024745144','10020847753','10010432668','10025069096','10010559779','10024657377','10024729599','10024577507','10015527086','10010889210','10016303947','10024774022','10024828313','10005468428','10000680798','10025280922','10024527205','10025071020','10025383454','10013019334','10024795198','10009654204','10024803022','10025531334','10025167366','10025075258','10012562174','10025079019','10008761084','10017685627','10009324376','10025945643','10010073382','10025080166','10024641283','10025782293','10024881220','10016873631','10025167156','10025082520','10008517887','10025811869','10001784948','10022435923','10024904712','10000905395','10024909095','10024911651','10025395563','10024109755','10024911271','10024909673','10017471315','10025283652','10024907975','10014291653','10023786222','10024916967','10023665778','10024087124','10024928817','10011351251','10009688085','10011292916','10024932755','10012893217','10008527103','10009553697','10025170542','10025090982','10024936211','10010434408','10025169975','10025091496','10025091483','10024137424','10024755068','10011260623','10026237077','10025092343','10024619981','10022442715','10024948347','10011626144','10024963560','10012517788','10024959949','10016032291','10024964301','10010599766','10024954127','10025397594','10019618744','10024940104','10010603534','10013821164','10020400808','10025534098','10011244772','10022089338','10014789147','10008192916','10015157557','10026234790','10008223296','10009242355','10025534237','10025003796','10025534988','10023657160','10025035070','10025946633','10010688174','10010598151','10010230172','10021967792','10024866976','10010726108','10026057384','10011108983','10025102050','10025173780','10025672320','10025104560','10025286303','10025285159','10025115803','10024558979','10008109308','10011053668','10025122291','10025123565','10011350069','10025123289','10024753445','10025124839','10015522094','10005780022','10025129213','10022458083','10011259533','10010088513','10009791549','10025133673','10025134507','10025134717','10012207972','10014316631','10025454012','10025533954','10025287523','10025139170','10024568327','10025141032','10025139520','10020674092','10025140836','10025141908','10026058940','10010993312','10009472812','10025147476','10008333294','10025150111','10011445009','10010937619','10024663103','10025186181','10014280413','10025289563','10012973498','10014626283','10010928144','10009961014','10010921061','10025175853','10023972121','10010916977','10025289868','10025191295','10013142701','10025537634','10024178749','10025189751','10025195830','10025283060','10015736351','10025198153','10025263219','10025200129','10025200571','10023361692','10025204783','10025210683','10025395853','10025213463','10025212576','10009557583','10025158046','10025220526','10023340779','10014743320','10026238042','10015921618','10019097133','10025295488','10010469484','10025126418','10025558412','10025178334','10010307979','10025231627','10025235003','10009965034','10016016904','10006661148','10019700983','10018425815','10009908946','10025251164','10010269715','10025251494','10016222529','10025259708','10014450027','10018701392','10015278595','10022013038','10025302270','10010358664','10025303119','10025303309','10025304743','10016109882','10025304729','10025305754','10025305654','10025276951','10022444191','10025308423','10025309835','10008188718','10017721101','10025312348','10019062132','10025315128','10025312560','10016127508','10006274114','10025320122','10025323972','10011079830','10024274143','10010287695','10008562275','10013914713','10016864372','10025342788','10025342655','10009889548','10020997122','10020887652','10023921092','10025815301','10025346630','10010888109','10025346583','10025347399','10025348074','10025348699','10024701953','10025413292','10025157887','10025350035','10009882654','10025414019','10026100510','10025348986','10022249041','10024336211','10024866300','10025294177','10011248047','10025351960','10025265412','10025353656','10017228979','10025355296','10014420438','10025350189','10025415176','10025415751','10016439930','10025356414','10020011872','10025252545','10008750962','10025543178','10013407338','10025363048','10025417195','10025542285','10025417452','10025358987','10014792428','10025366608','10016320783','10025418109','10025371099','10025501428','10010552828','10021980744','10025420466','10024509001','10012272637','10013792361','10010888326','10025749681','10025951906','10025544337','10021307505','10020149729','10025424939','10025425100','10019925660','10009904264','10025438384','10025438504','10025440861','10008138506','10011141823','10009927820','10025443536','10025446677','10013570921','10013936005','10013782298','10013195611','10022165141','10014207981','10025453090','10025248659','10010903329','10025383477','10025950752','10025455802','10011342018','10011511474','10010437035','10025457561','10025460176','10025455583','10014506885','10025462694','10016984837','10010482388','10026065119','10025474140','10008693058','10025480071','10023520232','10024027912','10001617747','10024933762','10024079610','10025491949','10018392360','10012511943','10020791328','10025492818','10016337229','10020616443','10015851862','10025498880','10025500162','10018447392','10025502118','10015390707','10011129791','10025504393','10025504898','10010899809','10025504637','10025506717','10010571543','10010791341','10025508366','10010574451','10025512045','10014776988','10013833716','10025512319','10025513654','10016981559','10011301219','10025514108','10015893860','10021157261','10026241433','10025513349','10011249964','10025512261','10025516416','10012834949','10013971095','10014166521','10022021366','10025566176','10010439052','10024396242','10025566697','10025520789','10010579070','10025569517','10025570688','10025571866','10025572795','10025572462','10016220596','10025573934','10025569216','10025431517','10013531695','10025580320','10014277616','10025580361','10010052171','10011236934','10025581343','10025687935','10017492013','10013273126','10025583933','10025583808','10025521026','10015001595','10025585780','10012489073','10018517636','10025588299','10025583898','10025584041','10012754499','10025595522','10008448547','10026238723','10025686750','10022279338','10014432323','10017093857','10025604133','10020737101','10014823518','10025605410','10025687507','10006567095','10011463210','10025611066','10025612451','10011625722','10025613579','10023557409','10025691441','10008037634','10025620928','10010579074','10024483350','10026243292','10025624352','10009903199','10025944727','10025622042','10010372350','10025812555','10025628943','10023883596','10025630078','10017476354','10025694019','10025632930','10018864646','10025641808','10025474733','10025956238','10025646496','10009217114','10025648916','10025649860','10025650481','10025653962','10012921866','10024708335','10010281788','10026057076','10024898757','10015796477','10010124596','10025700925','10025898013','10010436072','10001222682','10011344349','10025715684','10025716555','10025820432','10025717377','10025721643','10008808162','10017022495','10012605317','10025727018','10025728927','10025960976','10025731231','10025732348','10022550179','10025728594','10025813379','10025739257','10025739946','10008578247','10025741106','10010780034','10025707708','10018471660','10025749326','10013644400','10017810569','10002095116','10025754459','10025959823','10025756502','10025758407','10025759175','10025759796','10009832166','10025765826','10011245182','10013503367','10023417420','10025768743','10025755570','10025769315','10025769943','10025771120','10025772341','10024838401','10010313633','10026244162','10025778225','10025780180','10025783635','10009395742','10022392446','10025797301','10013704955','10017682153','10025798950','10025914476','10025412545','10017074466','10016798001','10025802239','10025476927','10025830062','10025964857','10021630186','10025835054','10022467044','10020851518','10017592095','10010738240','10025851322','10025851166','10026242919','10025852241','10025853808','10010201792','10010054484','10025856065','10025860462','10009821288','10025805856','10025859751','10025863482','10024839609','10025863528','10025863531','10018670980','10026234002','10025870034','10011137301','10018669668','10025876904','10025780409','10025876500','10011327351','10025880171','10025563079','10025884232','10025884253','10019837014','10025885829','10006565338','10019974830','10013400648','10009550502','10025884801','10017780050','10005633918','10010868071','10025865406','10025889274','10016324450','10022416122','10025892813','10009466482','10010241175','10016929379','10025879118','10016866968','10011129678','10005460676','10025896307','10010495914','10009444603','10025902536','10016439680','10025848821','10019548109','10011057223','10017303118','10025909923','10025911456','10026248713','10025913966','10015791211','10025916561','10006543644','10011088725','10025918986','10025921282','10025568891','10025921309','10009924704','10009371691','10025924189','10026078922','10025924255','10025926680','10025925623','10025966724','10017145626','10010178611','10026078857','10012460930','10025987951','10009399393','10025989779','10025990693','10011248693','10025992414','10025731119','10010707938','10026251334','10026081806','10015071413','10025993393','10023379771','10025994019','10025994353','10025995878','10025996000','10026082572','10009471218','10025780972','10026082267','10017378562','10025817093','10025996280','10026250367','10025999710','10025999330','10018016755','10022080097','10026001248','10013575500','10026001937','10022443732','10026002895','10025999909','10005757075','10011063907','10026005936','10010774136','10026077618','10026008884','10026084417','10026008641','10009790667','10026011831','10026010429','10014214877','10005507433','10011075245','10009821119','10019124469','10014688108','10001240338','10025817435','10026024656','10026027025','10009447797','10009530237','10026031398','10015404064','10012591276','10015008452','10026035754','10013146511','10026250760','10026036631','10026085357','10024647064','10026038791','10026041554','10017110770','10019947041','10008643333','10012338927','10009958002','10026044660','10010766052','10009820194','10019064662','10026046461','10010144164','10008299920','10012656032','10026160419','10015143250','10023783411','10005763875','10010349251','10009299686','10016909159','10025971577','10010559048','10017952360','10026165607','10026166466','10013869589','10011179471','10010874798','10009691690','10024408111','10010077842','10026090614','10014595320','10026090522','10026171033','10022516282','10008585887','10010248474','10026088498','10026171932','10001770381','10026172379','10011746189','10026170681','10026173080','10026255909','10026175163','10026174098','10010600000','10026174720','10026258927','10026175487','10026090551','10026251865','10012747587','10026180106','10026258976','10026261136','10012797284','10018454089','10026095024','10026263590','10026263524','10008143408','10026087161','10026264449','10026264660','10026242573','10026261801','10011062912','10025821409','10026182309','10021348918','10010565448','10011130195','10019097439','10026092679','10011041050','10010322942','10026267334','10017724860','10019017992','10010929377','10025867833','10019132210','10026097475','10026105171','10026105662','10008485967','10026265213','10023275766','10013404157','10026077903','10026106011','10010369691','10026181091','10026107581','10026112589','10026113614','10026113406','10026114799','10014695373','10011499376','10018487176','10026271051','10016940298','10017063303','10026260838','10026268921','10025512762','10026118072','10011376423','10014704950','10026191604','10026123843','10019207120','10009365722','10018450871','10021193502','10010084641','10026272068','10026273718','10024769960','10026271775','10009385579','10025933117','10014358839','10015126659','10014633714','10010830891','10013570770','10026279889','10022180733','10026278120','10025530920','10026281173','10014430720','10023406920','10026276260','10025223073','10026279560','10026281738','10010843961','10026184846','10010310400','10009933504','10010570980','10006419096','10026185758','10026192597','10010775554','10026284188','10001591901','10011554654','10026121146','10010039023','10026194753','10026194552','10016553365','10011206823','10026194747','10013094070','10020118792','10026203375','10025052046','10026204913','10011326414','10013174757','10026209953','10026287839','10010884103','10022092882','10013173435','10026212988','10026214367','10026211795','10026215880','10012649444','10026135416','10026216624','10009708008','10026218753','10026211723','10016029835','10009547154','10010495114','10026293761','10019027197','10021230213','10026297731','10015554332','10024561202','10012716622','10017753942','10026316457','10024929950','10017419739','10025605822','10013873321','10008289424','10008534540','10008416977','10000761119','10026200475','10010587355','10011582638','10013526786','10023670163','10023561081','10010506803','10008179832','10011064263','10019429094','10025928946','10014397086','10013417876','10014355446','10022186976','10016857663','10015662687','10025046284','10016649590','10011713642','10008386955','10023552218','10013656135','10006108940','10025928087','10016410954','10005782980','10010396999','10010327074','10010812184','10024023568','10013763789','10026219396','10010249287','10012149927','10022012661','10002068980','10009360344','10025377365','10016131286','10013373799','10025265064','10008095455','10023557964','10009286302','10025516592','10022051960','10010764828','10008204654','10023558889','10013317738','10023561297','10020886144','10023563613','10016171929','10009109929','10009685873','10025517733','10010833324','10020010096','10022433614','10013168659','10025151161','10023571656','10025802832','10011440031','10011624358','10012855889','10014113022','10018905363','10021820513','10023578785','10023659559','10009381084','10022351167','10010946925','10022087070','10013943461','10000944013','10016304900','10013461564','10023583240','10025151572','10009170843','10000775827','10013833679','10015464899','10010843649','10001022414','10022248430','10021966749','10023481080','10009060393','10000843396','10012283548','10014450851','10018937959','10008013475','10010018531','10019001285','10010408614','10023597007','10013157469','10011443512','10011585386','10019634276','10010786944','10023600161','10023613353','10008538072','10023616094','10023608511','10019639444','10010605338','10001032979','10012178708','10011555542','10011109727','10023411797','10018293671','10018523831','10018397499','10009525973','10022213017','10011237222','10001686949','10012714367','10020413414','10009312849','10006113916','10006544803','10005662332','10008012027','10020625443','10022327429','10023382481','10011076752','10023756805','10009590603','10019413525','10008528031','10025931573','10012224025','10020611069','10025045418','10024297288','10012587803','10010747386','10011436350','10025266751','10024047966','10014732269','10012354368','10005722082','10021992689','10023739471','10008491367','10014693748','10010317433','10010861896','10015254950','10023774070','10023654185','10008477965','10022005352','10005947935','10017621760','10017625378','10024309814','10017027040','10008963446','10000084321','10016000910','10023988253','10020485679','10014792842','10010842343','10011172597','10023258771','10021966036','10023659762','10009460940','10010314914','10023704802','10010298948','10020242323','10020911281','10024311441','10023932130','10024622796','10014154394','10015027098','10023685605','10018739236','10015506959','10023686346','10006612456','10014290713','10018182235','10025661894','10010492110','10024230032','10016033460','10009685071','10001010107','10009679880','10010686506','10023664260','10012555684','10010586275','10025380197','10009495733','10012001549','10008156603','10023658608','10023709497','10017645351','10011606665','10025267997','10014358863','10001835931','10022552712','10023708320','10013186680','10023698154','10022074816','10023682864','10010387647','10025048090','10013162207','10009357223','10011788754','10012980612','10025855875','10010047057','10011496697','10023712726','10014419246','10024309107','10013340173','10020579359','10025930795','10008318358','10024603426','10025153364','10016054812','10023720178','10024026906','10023420944','10025266959','10023715422','10023326186','10013742217','10023721559','10018186798','10012278544','10014233316','10016158574','10014710475','10009426006','10012699833','10023749934','10010512606','10011512166','10021327358','10023750833','10001263337','10023635494','10023779192','10023926622','10023732044','10012291183','10012840058','10023751144','10023750281','10019192008','10013254605','10023716423','10013009129','10021966577','10023752576','10018585283','10024389156','10023412605','10023269223','10024074757','10019186600','10023434254','10025520735','10012906432','10010742395','10023779715','10009717782','10023925119','10009938008','10009878795','10009245126','10023501081','10024814752','10013212255','10024081068','10020728553','10024074799','10001046608','10021965539','10009144759','10023784088','10021079581','10015158531','10006802813','10016500803','10005756523','10024027020','10012966650','10023782317','10026227719','10008600635','10009877826','10019429139','10017195513','10023883394','10010193001','10024604415','10026225993','10012373094','10022228683','10023820362','10023310008','10010011164','10023827032','10002162920','10014777632','10025934081','10016877690','10023990390','10020910591','10021926754','10023682242','10024610789','10018625706','10023832143','10023833446','10008521170','10014678813','10015454930','10022021792','10023835522','10013967566','10017263351','10023671946','10015079458','10013624991','10018472209','10016665641','10013314280','10012461129','10010814629','10012203588','10025522958','10012014227','10025050892','10021660809','10023817726','10000671642','10026051105','10013841178','10025382488','10026044933','10025871781','10023625648','10013406335','10021617165','10019226370','10023478234','10024231842','10001792788','10010018554','10010692404','10020158811','10023660652','10010799932','10014108635','10023385816','10005732148','10016153622','10023718936','10021292119','10023886219','10014316520','10010249160','10001813163','10023928167','10024233017','10013134069','10010989390','10011457168','10015240400','10015549731','10012741093','10012116285','10014567109','10011385263','10018027051','10009739576','10011160952','10009429379','10001000000','10001351841','10009387159','10012136052','10025270419','10023906002','10020631099','10013115402','10023666670','10023911861','10014190841','10011258970','10009318570','10008075035','10005910596','10009787265','10011702418','10016969161','10023915951','10000052059','10023917915','10022139600','10018456599','10022576572','10012966632','10008480863','10023511954','10013328768','10025855013','10023936249','10013499608','10012428094','10011650514','10024030470','10023995372','10008678449','10019696582','10012758924','10024174997','10001173413','10023496057','10013891952','10014544656','10012885582','10000944570','10025271814','10023957953','10022342243','10024081433','10023933514','10019117241','10020702944','10016992712','10010043013','10016050725','10023965306','10022259386','10009940195','10000170291','10008108738','10023966766','10001327059','10014486066','10023968607','10011439259','10023962670','10023966823','10005787076','10011919598','10012959428','10013363965','10010602040','10023975969','10014963965','10014432860','10008416952','10012090999','10023977326','10014171083','10023978544','10009277733','10025266686','10013994006','10017236334','10023983707','10010783874','10016810513','10008478662','10023938413','10009291379','10001239758','10012948902','10010404972','10024017533','10024015167','10019198327','10018079077','10010328173','10008187993','10024021710','10026052079','10016113269','10010125612','10011063303','10023362042','10015408625','10009579100','10013364165','10024039958','10024041302','10013369169','10023929480','10024045141','10016581226','10024052036','10025492849','10013943807','10001760478','10024087346','10010690745','10026225394','10008684522','10020007591','10010940294','10002106768','10024045451','10021959287','10024063561','10006552275','10009135851','10008507267','10023656143','10018010850','10022070142','10024070923','10023753080','10011440648','10019893267','10008522418','10011636182','10009942816','10024177734','10023705176','10009300653','10008017791','10015292050','10014408938','10017499685','10014996830','10010257769','10012463359','10015193339','10014769572','10008201070','10024049092','10024130248','10024180528','10015699194','10001057752','10025048434','10009695741','10006557724','10024136246','10026054112','10008154220','10011238839','10014514651','10016321861','10023247358','10001664214','10024142516','10007985372','10011237532','10024144960','10023427793','10015542303','10013852772','10014230489','10025667814','10008588251','10017432062','10010268665','10021148736','10010107965','10024318076','10019813472','10009397502','10015311818','10022314375','10011189185','10016075255','10019767257','10026052245','10008378251','10024179691','10022034049','10010864341','10022179348','10024190460','10010744235','10009375104','10006640888','10024194367','10015284197','10008139276','10023758366','10017580420','10005467929','10006788104','10010921069','10016319763','10017619952','10024322936','10002129482','10025055062','10024202924','10024184886','10024205199','10011277739','10008759161','10018415957','10010143612','10019490540','10017596438','10008378930','10008435212','10024214600','10008458752','10010304327','10025937954','10013515491','10024324000','10024215858','10024215530','10012243168','10024397170','10006110894','10022247003','10009089091','10017235124','10009898199','10013940552','10024222288','10010694741','10015578863','10012291971','10022437686','10012555742','10012303893','10023446693','10006520566','10021974133','10024254775','10024244819','10005837509','10024616027','10025387608','10024322117','10024258823','10024399671','10010775380','10008550429','10024262496','10010484510','10025668262','10020944353','10014546828','10014431764','10024260848','10023660178','10025936800','10025526504','10009220505','10025275583','10016027462','10015014130','10024280336','10021444880','10010802927','10017067130','10014522642','10009456154','10001805148','10024404059','10008205913','10009565094','10006701924','10025386610','10013237286','10009365070','10024302970','10012850843','10006827386','10000725342','10017509820','10019129158','10024305122','10013693921','10006109371','10018019005','10001073425','10020752752','10024334623','10009583946','10024338167','10011445761','10008510060','10024338319','10024406043','10008192232','10022582547','10023967829','10018568884','10024343566','10024341361','10024400776','10014642724','10017230872','10024405320','10024350983','10025275388','10025938406','10022423510','10024347762','10021467950','10010394815','10024349400','10018379812','10024348062','10011732720','10024352114','10011367219','10013118097','10010760511','10008773240','10024387670','10022578056','10009237786','10009606937','10024307348','10009353674','10013152252','10010365812','10024362328','10009159250','10017459727','10011297247','10024365759','10001773049','10010906612','10009884437','10010238666','10020193598','10017121403','10022466186','10011376011','10013118362','10025938890','10021312691','10024013387','10002160659','10013156379','10012504079','10024381987','10011262471','10012340402','10012736841','10017116446','10015832548','10024415075','10023259034','10014687384','10018767180','10024420036','10022538692','10011646256','10009625900','10024404714','10025732609','10008349490','10020744609','10006693634','10012607386','10005788265','10024613657','10019777699','10006660117','10020994496','10010254427','10024121046','10000729061','10022275227','10021392162','10024840614','10023253603','10024427190','10024836741','10024452916','10024450820','10024833761','10009572753','10015531983','10010691574','10009891717','10002149656','10008570678','10017658492','10024457842','10007524992','10018720930','10024460346','10009195214','10017590450','10024464049','10025050891','10011665956','10005665164','10024474321','10010149806','10012353664','10010480769','10024479709','10024484252','10013439488','10008033266','10011314549','10024480106','10016646601','10005865187','10024480307','10006522095','10024621966','10024487184','10024616836','10024844106','10013117227','10006639441','10015882272','10018754753','10017957901','10024516140','10008218718','10024444236','10022427589','10013926954','10009306959','10024509410','10014300843','10025161536','10024524237','10010237692','10024839197','10011186780','10010872289','10009278708','10024526970','10025161320','10023936957','10025160931','10014215507','10009943069','10024526918','10017375967','10011127231','10016919802','10025042547','10002101545','10010210356','10024634320','10024622689','10016165664','10024634598','10010323155','10009543052','10014489030','10024843249','10009882522','10024634989','10024538020','10020007614','10018391463','10015310082','10020450439','10018645430','10010125286','10013368350','10013135732','10009367225','10022015895','10016711140','10024546299','10013971364','10018033117','10011034108','10024552409','10010372516','10018934515','10001651788','10022360959','10012386731','10024556659','10024549455','10021757911','10024561894','10024562605','10024959872','10024572357','10025942593','10013664790','10012122313','10025044143','10024397452','10014437497','10017817451','10013070731','10024579271','10024270083','10025390773','10019445715','10025941785','10024415761','10006691218','10019078407','10024709429','10008078897','10014172302','10005706382','10008386031','10005658016','10024671127','10024667723','10009306410','10021526816','10024672904','10024636647','10024673613','10017508382','10012073155','10016777696','10024679917','10013262090','10024616689','10013877103','10024681534','10010826547','10010360566','10017697886','10025530373','10010294285','10024697532','10024691020','10024692739','10010723895','10017280261','10018858844','10017371193','10012737925','10024692398','10022207894','10021968768','10009845099','10017758809','10011366303','10017295508','10022013362','10001311003','10025065852','10010351975','10009131681','10017616834','10014476723','10023366745','10009325504','10010982794','10013927006','10026128348','10013243958','10001759442','10011501506','10010808065','10013687589','10013035326','10016896136','10021594275','10011070768','10024626186','10014285030','10019440219','10025484784','10025166563','10010022587','10010204390','10012923638','10012582548','10024873982','10005967380','10013594951','10005794715','10014207760','10018981218','10017052898','10025073441','10025072832','10025070181','10024954354','10015771849','10018120345','10013195694','10011348412','10010079931','10011362737','10005771971','10025942929','10006628805','10014319828','10011258771','10006131602','10010109899','10024895347','10024897479','10024895495','10024730335','10026136985','10024906061','10023473433','10009364135','10023273634','10008245680','10024886660','10016295317','10025082653','10008777496','10024915034','10023717234','10025078027','10024902785','10026210328','10025533314','10025168540','10010098452','10025085442','10016467509','10011056483','10019542173','10021730166','10005883162','10020531984','10009930743','10024916890','10025086871','10017357350','10018545238','10024926431','10014061977','10005822479','10010133859','10012287185','10020969733','10010040388','10012637262','10025089933','10008504814','10006631441','10025091807','10009400626','10001210578','10024602513','10016057871','10024946195','10024876288','10024504988','10011603398','10014262710','10014802763','10017672311','10024949437','10015908793','10024954574','10012396718','10024943132','10012799901','10024960985','10024950826','10025092299','10017681397','10021163209','10008454993','10021373668','10002033851','10024944574','10009471030','10024563006','10009315072','10024957870','10024814855','10025171479','10025019140','10001445257','10023273963','10006100510','10015585259','10008875344','10011119140','10025033361','10010832213','10025284423','10025035139','10021049726','10014261892','10011181746','10025036987','10001274961','10015382269','10014238570','10019185658','10012977970','10024825864','10009926231','10025095895','10019008724','10006541325','10008572545','10012653173','10025040656','10013330421','10025038429','10006128502','10011269063','10011040792','10010842469','10016467862','10017515733','10014624656','10014215552','10016333869','10017384173','10013822081','10010927503','10016373373','10018799279','10025097961','10008466047','10017187770','10011282125','10012015129','10009655855','10012212804','10026056382','10025491376','10010409111','10009957366','10002171334','10010495411','10009246013','10016656174','10025116651','10025116721','10008091495','10000842781','10011079688','10018534213','10025118344','10025118136','10023422451','10011460573','10025119210','10024276680','10012027111','10009952506','10017478081','10011439952','10025120874','10009914759','10025121325','10010271206','10025122587','10009204744','10025175913','10017969914','10001036259','10023479294','10019435600','10025066310','10025126039','10025126656','10014111184','10020524138','10010840094','10025128516','10025130671','10012383909','10025399593','10013996726','10025122497','10016634404','10009550918','10025134411','10025399444','10012031535','10001074748','10018675423','10025136276','10023271823','10025136840','10010013329','10025937230','10012347727','10020913428','10010705854','10025142117','10025142597','10008223869','10010835507','10016687675','10025143307','10025396906','10017633321','10011263420','10025286647','10002058495','10024461384','10011033146','10010604102','10010441172','10025184029','10022171599','10025184662','10016648048','10021027272','10016520754','10025186674','10018316228','10010045509','10025947990','10017550483','10021639125','10025163635','10026237683','10025189337','10025188985','10011581249','10008789317','10025188684','10025192301','10020001035','10016954378','10025948017','10010202278','10020098440','10023258089','10010460407','10021943405','10014148864','10016460301','10025202642','10023261664','10020420252','10025209830','10017553532','10013184020','10008987119','10010487485','10012324027','10025538393','10025214722','10025401407','10025068826','10001691626','10022319628','10011531400','10025219621','10013798041','10025219484','10017001507','10017853219','10025535088','10015449111','10025671979','10020737819','10006530493','10013822451','10025293990','10009319259','10025227515','10014189689','10025230270','10025230355','10016557086','10025232041','10015390823','10016406514','10025297424','10014219947','10021068392','10025234848','10021075667','10008229708','10025236727','10009038793','10013820722','10025237833','10025175579','10024683258','10014719679','10025242352','10013706822','10008586091','10025243755','10017625678','10008526647','10025947629','10014235797','10025678832','10025299316','10025944165','10022066577','10010854999','10016326008','10005860320','10025264011','10024956930','10012344464','10010726593','10025303564','10010688845','10020122394','10025305340','10025305326','10025306877','10010252179','10010952938','10025308888','10025311967','10013939826','10009829576','10013602896','10020928763','10014417368','10014323608','10025679948','10025314582','10013710013','10025317453','10008654919','10012571648','10025197451','10017055333','10008392381','10019643088','10014330698','10008760252','10026056914','10021258029','10014966754','10016570655','10016607180','10024242742','10008465454','10010828431','10025333307','10011526485','10011962940','10018018439','10017603141','10021975679','10020827400','10025338785','10014592470','10008109110','10008574959','10011234116','10012549733','10025341734','10010742499','10025343597','10009556726','10017387541','10009560183','10025339934','10025346494','10025347055','10016007771','10016801459','10025413180','10013324021','10025349603','10010360025','10006810827','10025349813','10016225908','10025349684','10025352430','10025543040','10015617062','10025357131','10025415709','10025327960','10001767160','10008905371','10006108134','10025354066','10018849870','10025413714','10014969004','10025354206','10025367128','10013165524','10009890362','10011613811','10000921741','10013342569','10025418829','10023436240','10013761465','10010078397','10013385182','10012072770','10010417291','10001798300','10009934424','10011568386','10014686710','10015092421','10025951125','10016165943','10017491564','10015234083','10019910368','10016848071','10009770580','10016729180','10016952730','10025349444','10016209619','10013985192','10025428161','10025422849','10012882217','10013636898','10014290943','10025429309','10015510537','10011362109','10025430565','10016447581','10025431163','10024647735','10025430840','10025436593','10009600587','10025432999','10025508725','10018052949','10025438584','10010284143','10011487096','10025482629','10013377812','10025441927','10025444125','10025445044','10025445554','10025550643','10021263109','10011334157','10025446826','10009496512','10025447089','10000880243','10018792049','10022028696','10021942282','10025452575','10017523510','10016577885','10025443059','10010591984','10009577123','10010345058','10011458846','10025279090','10025459776','10012853839','10009767769','10013981048','10025462363','10013505884','10010260032','10010605401','10025461212','10014060991','10025471936','10025474588','10023372862','10017342686','10015794285','10018774486','10019009623','10025472926','10011020152','10010041214','10013019193','10025406573','10024428424','10001215460','10000052626','10010988408','10014418031','10025168850','10008841266','10016826764','10020587725','10005901485','10025495924','10025497184','10020395208','10010255941','10012674098','10025502700','10016693092','10013086299','10025506151','10009737284','10016296542','10025507209','10025507102','10017458793','10014605559','10013246562','10018120482','10000792889','10025514203','10016328070','10022088735','10025562184','10012247573','10025564584','10000981884','10025566929','10010553258','10018770160','10023708262','10016707251','10010250223','10025568827','10011369553','10017559890','10014437875','10025569631','10016454292','10016570890','10001263050','10025570795','10025573868','10025576793','10025573315','10016895284','10015169757','10011389041','10015490342','10000924668','10012863383','10009685722','10001690691','10014019493','10025584092','10020757662','10026057531','10011333966','10011634970','10022041793','10014745264','10016190089','10025593181','10006169357','10020446132','10025599643','10025600309','10025602204','10001081159','10011369846','10010710930','10018580355','10017461140','10013195854','10012895145','10025610360','10016969213','10013059283','10025610299','10025610565','10005860224','10025615936','10021217257','10012401619','10014547834','10025619734','10026241829','10025620281','10014424403','10025896035','10023272884','10020521881','10025624497','10018121688','10019185309','10025622975','10023481064','10012548517','10016560305','10014452785','10016350255','10025630847','10024561522','10016825441','10016753866','10008506347','10025694083','10025695506','10025640492','10020289544','10023217440','10009003716','10010392768','10020416021','10020936505','10016570496','10017553558','10022338580','10025645451','10010946300','10008488726','10012885464','10019911841','10012393832','10017933986','10025649876','10025512915','10011175139','10017251322','10014117994','10025652873','10025655414','10005732233','10026069416','10010567268','10025698388','10017738704','10025700136','10025701307','10021409971','10026067178','10024415270','10009323668','10009986179','10012212674','10011340665','10026041678','10024343522','10019241916','10025714565','10008828545','10018686251','10008136822','10010343850','10025717566','10018223740','10025717664','10024578620','10011448570','10014083374','10023803186','10021453173','10010346866','10005776296','10025727401','10000880326','10011198056','10018537623','10012946966','10002037565','10018516084','10023670748','10012906875','10012125564','10001154989','10025740833','10008014346','10010229011','10025746206','10019368911','10011459965','10020318356','10025753694','10025752562','10011577737','10024859295','10011659390','10024637320','10026241268','10000929246','10020280596','10024187100','10025757022','10011313461','10021499671','10012298877','10024657231','10018126597','10018858676','10020593963','10010515751','10008330143','10008506211','10006578734','10023727727','10016885042','10008556965','10025775841','10025764889','10025771527','10025772181','10025769369','10016981561','10017170769','10011693404','10019642845','10010813231','10017005005','10012804213','10013326198','10025770981','10010686219','10023410122','10025778589','10025780147','10019817010','10009425600','10025789575','10025961998','10025795371','10026245133','10005873976','10022097339','10008461324','10013937284','10011474285','10014132799','10013368767','10008591961','10017182239','10022440731','10014795270','10026245228','10016679329','10023885032','10015134632','10020849490','10009097532','10018839223','10014031657','10011475728','10026248190','10010575198','10011707549','10019037991','10009902805','10025851613','10010454604','10023664675','10025804700','10014095030','10026070530','10001202483','10025776455','10010902671','10026074849','10016731982','10011601542','10018959167','10025856774','10011144300','10014068709','10009539163','10023461964','10025860110','10020372848','10025862696','10026247962','10013623919','10026027155','10025864366','10025867280','10024951834','10008602660','10010333554','10025873088','10016111361','10008578043','10009615827','10025964547','10022384356','10013762158','10025875102','10014274364','10008035003','10020292858','10021433823','10025878819','10025876786','10025880348','10013195360','10008035454','10024909136','10018293238','10010373724','10025884580','10025882743','10011114313','10026075935','10025863819','10025970594','10025884916','10025887107','10025888941','10021304391','10025888208','10008377239','10013403653','10010478586','10025460278','10026076171','10010038365','10008977409','10015453292','10021037475','10010586589','10025893658','10021088093','10008570931','10012843628','10025893316','10017635841','10012126142','10025901001','10022061942','10014886090','10025904486','10018797769','10013633173','10011591049','10020559764','10016310999','10015865174','10012558774','10025915752','10021295468','10025120368','10010172210','10009603136','10015831184','10013581549','10025917295','10021984828','10006695954','10024549787','10025921924','10026073492','10009237010','10000089078','10016800984','10009098562','10026246802','10026077449','10013752517','10011920232','10016711751','10025846398','10025974724','10026078256','10012205996','10011519750','10025711728','10009295931','10026080190','10025985304','10025985726','10025986591','10020736924','10005857220','10019936634','10012118308','10010269298','10011123420','10009545204','10010906236','10016892424','10009596771','10016323482','10014986106','10013682727','10014119723','10025930657','10001694802','10025995448','10006480211','10024418271','10015773176','10024388505','10006696921','10025998359','10010085002','10020275377','10026000875','10017522878','10010616760','10008424475','10026082257','10005651552','10026003398','10015461700','10011565689','10018240194','10026006021','10026084448','10026005074','10014120615','10013348276','10011570432','10026009298','10024560353','10010215371','10009831371','10020537247','10014266233','10018010729','10026012302','10021262414','10020976269','10012557997','10011593402','10017264795','10026083411','10017067055','10018079032','10026022173','10013255642','10017380687','10026025854','10025033263','10013774804','10008195408','10022323618','10026030848','10026028148','10000844132','10022227475','10016481217','10019112486','10009957360','10013439157','10017692870','10014028476','10013151808','10002083533','10011040000','10001699591','10014627095','10026086940','10026042252','10010690722','10011368510','10019320963','10015213451','10016011365','10009829640','10017494456','10026045470','10015334309','10015931498','10026158684','10010861720','10026085145','10016911913','10024010217','10018855954','10026160243','10025878443','10026159233','10011558832','10025394499','10020813865','10026162519','10026161881','10026162683','10009583058','10016996144','10026005789','10026162473','10025529300','10008564177','10021568937','10009294331','10026008682','10017358563','10014688056','10010125792','10017199527','10011188709','10026165606','10026166049','10026165135','10008762333','10026254341','10013529816','10020505447','10026165503','10020629735','10013794206','10021363925','10026085985','10013092912','10026168124','10016658499','10026168708','10012680558','10016560104','10009313649','10023248711','10011012013','10026171392','10026253789','10010234225','10009523657','10011026730','10026166226','10010834830','10011563939','10026231541','10014944926','10026090031','10026068869','10026086986','10014817402','10023539978','10011284303','10006528641','10006113387','10026258265','10026089860','10002148379','10010727646','10022555673','10026253610','10013036895','10026088468','10026178271','10026254492','10010223257','10018272258','10026178920','10017646717','10023972104','10009893918','10026179425','10013885192','10011333568','10026259259','10011242881','10011196193','10020523901','10026259688','10005607673','10012906977','10026180383','10026256311','10026178031','10011485798','10011123294','10010724900','10014696242','10026262760','10005839546','10021164745','10026264608','10024564553','10026168590','10002036056','10010049960','10026265861','10010838247','10023460523','10026242970','10015913975','10019680151','10012524649','10024147382','10026177908','10012673452','10026097160','10026264867','10026094883','10012276404','10001647346','10009981850','10015229177','10018512940','10017651131','10013278887','10010426456','10014041269','10018975459','10023411255','10025674048','10010122528','10022395643','10026107820','10026111889','10026255332','10026113800','10010363852','10020427035','10021067261','10026211745','10011997939','10024749659','10018133004','10026113652','10019890277','10019489253','10014071894','10017530716','10019784275','10019710586','10011613242','10009619004','10010848256','10026115362','10010993388','10020362225','10013753902','10019701026','10023401176','10025843259','10019249078','10024668062','10008773794','10010470684','10026121655','10013356217','10026123912','10011108553','10026270742','10014601606','10001051190','10026124669','10020376727','10011069762','10026179620','10026252472','10019116960','10025982545','10012564716','10010421217','10025661418','10026275159','10013887738','10026269157','10021159526','10013093968','10013112829','10011255139','10013705825','10025834949','10023229941','10008016879','10014311116','10013701352','10011019163','10025979894','10011601693','10026277131','10009064727','10018579162','10026279123','10015271876','10026283771','10021772939','10023494162','10026278781','10015754746','10023266327','10026188961','10026282802','10026188536','10018276314','10010985209','10020786857','10026187684','10016316645','10026183734','10010890216','10026183460','10021207558','10026187276','10016852790','10026187337','10014616025','10009289606','10013004059','10026190548','10023357658','10010897945','10026190812','10010088423','10024847680','10026191763','10006464214','10026193028','10026198499','10026153321','10026197495','10005866531','10018568024','10011582500','10009497358','10023564865','10026199128','10023319755','10018869398','10013606346','10012797233','10009767633','10015013497','10023747676','10012364428','10012831964','10010587876','10017702549','10026201638','10009776738','10008520545','10026205018','10018300983','10006893781','10026203732','10011255688','10012785245','10026182185','10010872105','10014151224','10026209160','10026211275','10009955580','10026211376','10026212951','10019899917','10026214497','10009607702','10026213409','10018512649','10026284046','10026215061','10026212888','10015046252','10026209562','10011264447','10023646398','10017284580','10020990713','10014281980','10016051922','10015432158','10007527005','10011183446','10026293518','10011895431','10006806014','10026300693','10025561549','10026302458','10022124052','10012675229','10026286147','10015379636','10020733765','10016267004','10026305138','10026312509','10011205258','10023383185','10010559403','10026319392','10009734755','10026319615','10013983084','10011082157','10025730826','10011080824','10024742487','10009316532','10022159178','10025830361','10025042625','10025045119','10025658258','10019587414','10013606547','10025151233','10023611593','10023581747','10005790632','10023568778','10016647643','10012640025','10000781652','10000727115','10014700047','10001141238','10001798209','10025931132','10019561134','10016127272','10001619603','10013135148','10019061995','10016765189','10019677090','10023752931','10015441467','10023756375','10023756269','10010180844','10017334948','10010034636','10019847866','10013127124','10024099876','10025448168','10010469664','10009985222','10009295607','10019173358','10012812049','10024082296','10017856829','10014511291','10024051911','10023231710','10025936548','10022145374','10025525023','10023996016','10024611475','10020710147','10015202010','10021177676','10025530113','10025245311','10024187967','10023353347','10020519830','10008738793','10019339076','10018216579','10013556681','10025274632','10021163631','10024223237','10012465813','10025272516','10023749754','10009643009','10025934956','10025937406','10024829925','10019626911','10024330706','10024269111','10024116173','10019888363','10013735271','10023484355','10016870549','10022237147','10024343396','10024340371','10008138150','10019926240','10013651341','10012392445','10023759778','10010784921','10000795553','10001161250','10012388120','10023635132','10009379464','10023589467','10019663465','10024449270','10001360289','10010156014','10010141409','10024275343','10010214065','10024842818','10010329077','10019375400','10011774615','10024488993','10024276494','10013140615','10025276749','10017852053','10020205323','10019752979','10010819025','10019274028','10024549651','10014609137','10020879421','10016316530','10013674166','10012578546','10024844800','10012016483','10011779324','10024857068','10024653532','10011580037','10024648033','10024660656','10024665856','10005922532','10013511111','10009644755','10023952702','10024672511','10016535735','10024676471','10024690707','10024229230','10024695035','10011265475','10024678941','10014136550','10024719160','10024727955','10011973287','10018690099','10012050569','10025161052','10025814604','10025120941','10020307449','10020284955','10010792720','10008207660','10026137866','10024908337','10025168086','10001049724','10024919987','10021016392','10013784780','10025061176','10014048179','10024955480','10010081912','10018126025','10010774880','10025530846','10018977165','10011736437','10025037668','10024835099','10025039832','10025040773','10025041328','10025041647','10025282194','10024875012','10025279601','10024673609','10025284587','10016874689','10025119946','10019148844','10009453799','10020006622','10018111364','10025132712','10013633557','10011513652','10025139506','10015702314','10018402717','10024782642','10024628391','10022557301','10017644463','10024748556','10025202548','10009794172','10013760051','10012737849','10017429159','10020800039','10025226544','10009965104','10011609728','10009378287','10026060970','10017204687','10012039120','10025297435','10025221702','10013772774','10024779243','10020416666','10015496896','10025319987','10025815020','10024939366','10025145138','10024305363','10024601408','10011090841','10025346057','10009675832','10019088678','10025349933','10008064295','10025072487','10024440903','10016131576','10024608174','10025268245','10025363699','10021485217','10025367755','10025367849','10008013634','10025370261','10009866087','10025386654','10016802057','10009369402','10020412475','10025426409','10025429970','10016088208','10025429423','10025428754','10025547448','10018518177','10025349426','10025434104','10010212141','10019917436','10025459394','10014309818','10025483221','10013651398','10015198425','10019498647','10018280334','10012244558','10009968998','10019515806','10025492370','10015320748','10021081193','10025538115','10019924221','10025576317','10025578234','10025579188','10006816270','10025582357','10025587090','10018556232','10019793205','10026045160','10025604299','10013592858','10020304677','10025609443','10015083457','10019059440','10020602408','10022153861','10001835706','10020746051','10023997001','10006895869','10008809363','10009876651','10024637094','10022316183','10025700885','10020897736','10008025526','10015162867','10025766925','10009643310','10014992379','10009583059','10021050401','10025744320','10009332797','10025764268','10010878032','10025768497','10025773256','10020946376','10025784042','10001683935','10025692902','10025658092','10025782709','10010936395','10012178605','10014595868','10016009891','10026072637','10019896564','10021471702','10020540269','10025966959','10025857101','10025479976','10020374628','10014782465','10025889166','10025894149','10025895369','10025899331','10025900803','10025627145','10025950046','10024155425','10025880699','10026071732','10025927574','10025774591','10026078882','10025332032','10025546003','10024142170','10020823974','10025687537','10025958312','10025849038','10025993470','10026081866','10020624819','10018923110','10019140155','10025694489','10010996548','10011492225','10014633087','10019399121','10020620728','10017284213','10015483800','10020796986','10011270606','10015336119','10024149022','10021260650','10022277483','10009974385','10018644943','10020782597','10026163084','10021802732','10026143013','10025990243','10016289171','10013123532','10014779340','10026165959','10026174013','10019763803','10019795308','10026091405','10026102816','10026264045','10015806527','10026261404','10022041472','10026178676','10026180987','10008678462','10005771106','10010837664','10019646812','10026235841','10026273495','10025961847','10020318848','10026184483','10026278678','10010602785','10013214167','10026188085','10014838538','10011879194','10026195808','10009903137','10002150063','10026209906','10026285080','10018219399','10026074143','10025285867','10009146542','10010378575','10025923719','10021919763','10014128995','10009033780','10010745113','10000926856','10021148482','10006809947','10019078575','10012124342','10018570597','10000845453','10013986257','10025265210','10011993666','10011791735','10019863608','10023589020','10012885672','10010908632','10013217944','10019462913','10011960301','10000897015','10023328739','10016903200','10019320877','10013142178','10001148373','10018546235','10025190101','10010461895','10025191404','10011638356','10015082694','10018791862','10000989096','10011252665','10010320409','10005944838','10021492613','10000865046','10024488500','10024247523','10013564412','10026199936','10021968954','10011862747','10014922827','10014191251','10023701932','10023656244','10025315101','10013717706','10008378188','10022038879','10014689445','10025804571','10023771707','10023688984','10018492868','10018625177','10024046380','10014872875','10015236311','10011262350','10014883568','10020887950','10012087330','10023639554','10010125548','10020660784','10020672968','10023641257','10012129043','10015079670','10023752336','10020446259','10022481790','10002054866','10023818686','10001128826','10001166069','10005768401','10009022011','10009188645','10002130153','10001169644','10008013309','10010109336','10013378591','10023746293','10019838934','10025932794','10000837249','10008877683','10008829882','10019286229','10011986379','10017816744','10016944450','10016450605','10018559533','10012111109','10009773273','10015724582','10021146795','10001004313','10000984774','10022155037','10011828780','10001815002','10005764518','10011163614','10015419209','10009356412','10013310481','10001628893','10024025033','10018861613','10023297680','10005706747','10020562753','10012983291','10024264435','10005702095','10024390911','10021164435','10014821646','10025731591','10020538252','10008817894','10021941035','10024081582','10005963429','10009601303','10001106032','10010247556','10024233923','10010440437','10022405720','10011128420','10023975822','10013293622','10023819159','10024082233','10009772255','10002042605','10026191942','10008855094','10018488516','10005854678','10013621078','10024020574','10008243843','10024304769','10001161368','10018307128','10012960619','10000839769','10015138155','10018677095','10013162235','10018427090','10016207542','10024066118','10006676988','10010326737','10006121059','10019661676','10016897578','10020049373','10013810514','10008458664','10019186610','10015820038','10020322822','10010427014','10001825689','10024143597','10018502209','10006454121','10015396048','10020393858','10018744886','10024242800','10012687949','10002171181','10014785075','10012004630','10014244368','10008505505','10008672600','10020525367','10013823230','10009780326','10018308378','10012976918','10014436645','10023517220','10012956617','10011489214','10024197704','10000994751','10001325555','10010619484','10024096847','10025384725','10007517992','10012487972','10016626966','10024256229','10017546816','10006549797','10001648455','10010183872','10009492629','10013640908','10024075772','10009683256','10015868852','10014089131','10025056452','10006682122','10015696812','10011007403','10014760231','10015681121','10014303644','10002124375','10024330038','10009630216','10024338084','10017099134','10011757606','10015658441','10012145439','10024192602','10024407311','10024327499','10008844681','10019679604','10024353505','10001802324','10018338790','10021970671','10019585900','10019475095','10024373187','10011496733','10009390873','10022385603','10020841400','10011601708','10023283111','10023563458','10000930627','10010220552','10010982827','10014857391','10015207905','10001082246','10021114263','10008341278','10010983700','10020338515','10010878024','10012778926','10019121407','10018323317','10009397561','10020384774','10025054677','10009960166','10019185540','10021118064','10011644387','10020086185','10015557618','10013651223','10016925589','10024638667','10025056830','10001053539','10024545432','10018943191','10011857138','10012938372','10024559541','10017226343','10024591471','10010246767','10005705327','10002104507','10010557400','10006640541','10024679416','10010242483','10012586142','10022123177','10010241598','10012192802','10023834189','10020332052','10025062856','10024710560','10019906351','10025390651','10017328782','10024724848','10009033859','10024723813','10024512842','10025063910','10005714144','10015173778','10020630665','10001676269','10008237143','10012843995','10020175838','10019622124','10011272370','10011397462','10014780773','10008505007','10000081526','10010218531','10008072023','10005730222','10010584832','10000728057','10001615344','10019943344','10024889628','10015483752','10011914827','10001235878','10019189986','10019817721','10024912950','10015696833','10024793358','10024716491','10021945688','10006549543','10021514738','10024968401','10013695249','10014718780','10010272432','10008747660','10024471990','10009915020','10014154680','10020275408','10025260563','10011440558','10025036242','10011042623','10019468497','10025106504','10025108172','10017230638','10025112705','10013369789','10024176223','10023966664','10025117435','10018329646','10019494913','10009862596','10005943444','10015415861','10024801773','10024803002','10014991225','10016874794','10021320145','10022258530','10023795501','10018790404','10015377404','10012509651','10019456878','10009647876','10014293336','10025200663','10025285335','10025208143','10026051664','10021298116','10012787253','10019821107','10025288674','10016468467','10025222203','10025222154','10024893654','10025294918','10014804789','10013907691','10025201284','10020609037','10016076509','10013735248','10025253288','10025239353','10019907871','10009096243','10010235614','10025255854','10001062756','10018829838','10011508613','10025262074','10025303316','10019826939','10005828002','10014360084','10025302079','10018233213','10023495955','10015403817','10026199616','10016194930','10000832656','10016992068','10019468459','10025539896','10009144431','10015648057','10006627199','10020845300','10025264959','10025340155','10025950466','10017420210','10024401764','10025347247','10019729418','10011231353','10011249921','10002093544','10019990565','10013372781','10024772446','10018702670','10009396291','10017093086','10017000191','10025676252','10010277978','10000813609','10013874499','10020938523','10008971259','10001360181','10020156301','10000732573','10017703682','10019571890','10011376662','10011551361','10020332756','10021129101','10001312460','10014155973','10020275347','10008441827','10023562848','10019752179','10025950774','10020800040','10024437711','10016015421','10022449277','10025446676','10009633541','10013244255','10016929387','10019227694','10014160481','10000723686','10010464990','10025462954','10005879118','10020173270','10013832741','10025494555','10025495711','10016599986','10020694841','10025551334','10019364545','10001259955','10025498772','10009161632','10011541545','10015099935','10020182499','10020798657','10025568078','10016219424','10024224740','10025572710','10011239595','10019885185','10014273752','10025586326','10011218438','10019112860','10009913882','10009670449','10010331431','10001597404','10025486795','10016784702','10012629072','10010374759','10025228461','10014392186','10016763208','10015559900','10018983329','10013240657','10025549283','10024818212','10017456402','10013866400','10015577716','10020761616','10023960623','10001138843','10016081835','10000080606','10009644839','10014603470','10010170975','10017122744','10012681845','10025646663','10020759409','10019729119','10011024659','10015386089','10009750838','10009766973','10025707905','10023818878','10011499582','10015608555','10011569294','10025717301','10001092216','10025716129','10013197029','10013622503','10025728540','10021616395','10010815745','10025734297','10025728013','10011065169','10025688163','10018311641','10010983595','10018471726','10009915584','10008798915','10020169709','10010330767','10016461903','10005652041','10016068670','10000760082','10025784849','10014790116','10014195466','10025791750','10019153702','10002132458','10010322454','10015482234','10000759133','10012978527','10016613549','10025825057','10011739361','10024708741','10025848415','10021809002','10025853524','10019987899','10025860771','10025967790','10022010501','10020166040','10025878667','10010119789','10018457004','10011698580','10025972000','10010560319','10025967102','10025897575','10010337589','10014107820','10008672151','10000986081','10010399981','10021372777','10021050817','10009931186','10017172706','10001356570','10014537596','10000928138','10000998752','10010393449','10015744622','10017265772','10008085736','10014649808','10026081732','10015391047','10006649854','10015342886','10000879757','10008501117','10021000108','10013995810','10017365403','10000989328','10008403233','10026012005','10025980826','10010690062','10012131589','10026078706','10012376059','10001090985','10020062972','10026013659','10016681619','10011138415','10026152975','10016399500','10010930293','10000918906','10011158692','10026035423','10019771168','10026039490','10025987923','10023803816','10006481110','10019175513','10015406819','10020292512','10012527787','10026071584','10017947776','10019847619','10016272120','10018633969','10002085920','10009657732','10024931112','10013571701','10005879419','10026160665','10010761517','10017014787','10006779087','10018958176','10025955034','10017349473','10026164128','10017118173','10010748679','10025656989','10020102980','10001168860','10008528989','10012585079','10018961728','10024660994','10026163466','10008064983','10026171752','10020686075','10020086995','10026256222','10016078882','10025774323','10014615222','10014191158','10026092413','10021141013','10021258531','10017076447','10021248238','10012065135','10019751684','10008641947','10022157748','10019513743','10020873384','10025167626','10009837348','10011050555','10016068135','10016962480','10011820520','10019522979','10014923150','10010261419','10018317048','10008202717','10018516338','10018014807','10015341660','10015124786','10026268659','10010258035','10016937978','10026275743','10019113599','10020442817','10026279998','10020325844','10026164529','10026188337','10026189913','10026192917','10019557872','10017233671','10023491404','10016816800','10026280967','10017292309','10011402008','10021974838','10026170653','10024031366','10026284714','10024543722','10026213394','10026217977','10026218362','10020880975','10026115168','10019134271','10020682410','10022229680','10025089264','10023675913','10023390451','10024623178','10009538054','10023762790','10023764883','10023329080','10012997071','10023465937','10023832868','10017352674','10025522732','10014127586','10022455977','10023783369','10023883243','10016591192','10023900003','10023978135','10022081406','10025806838','10023909131','10022039376','10019888809','10025934714','10024608262','10009311478','10023923058','10012807549','10025575774','10022485266','10024818216','10016997493','10025271779','10013136523','10023999008','10025963649','10024393002','10019604803','10024617389','10022562183','10001226409','10010049449','10024317742','10025810942','10011390564','10024389788','10023959111','10023540273','10024179344','10010082964','10010124101','10022001973','10016939031','10009925645','10024186758','10023914001','10009837633','10024244184','10024194233','10024245061','10024823067','10012467012','10018157357','10024207016','10018732949','10008968363','10014994733','10024255564','10024326812','10011011632','10024264530','10017117605','10024822257','10024614963','10012216166','10025516720','10005800953','10008736387','10013294475','10017655765','10024330081','10024403928','10006136680','10024318615','10010740483','10009615495','10024345354','10011372587','10024407590','10024242473','10009359827','10024254789','10013299569','10024833269','10010339259','10009450036','10016011053','10024378449','10024378047','10024377635','10024380779','10024424831','10023910543','10024181348','10011670056','10025522493','10011631287','10024400415','10021939387','10018513797','10011122961','10024459591','10024511059','10024458896','10023567595','10021994398','10023315804','10024465474','10009161678','10015952828','10024469259','10024427130','10024480064','10013246939','10024481623','10024482865','10024488453','10013770677','10024414039','10023307915','10024515674','10024546642','10024512717','10023321572','10015543161','10020057232','10011350036','10024524172','10009404697','10008738985','10025278171','10025059177','10025601859','10016830302','10020486791','10024852947','10024538373','10024542216','10025391215','10024556702','10024654472','10024854610','10021646943','10009244383','10024669221','10008045655','10024672881','10024677627','10025943963','10025931228','10024689871','10024691623','10023444159','10024699785','10024633472','10022108089','10024705513','10025393481','10015536775','10011174459','10001605935','10010775543','10025393863','10008111090','10024729600','10024766037','10017570900','10025384267','10025079806','10025472386','10024889941','10014499697','10019195908','10025945167','10024897430','10024718588','10024622097','10026136139','10022007061','10011558048','10025084723','10024823171','10025814826','10008642523','10025533558','10025284093','10018208304','10011060042','10024939119','10024952803','10024943920','10014228484','10014292748','10024547430','10025094385','10016848440','10022288773','10023804525','10011619835','10025945823','10023247215','10025047633','10010380297','10020009045','10025108801','10012045805','10025119761','10010979692','10016204461','10025122765','10021131687','10016299455','10024459590','10008126748','10025130844','10014503924','10011073239','10009549849','10021749856','10008644505','10025181146','10015707748','10010109085','10024808351','10009209442','10025271969','10009361582','10025196565','10001611834','10025201784','10025201572','10010096015','10014799996','10025204494','10025206245','10025200806','10022277345','10025212169','10017710835','10019074141','10025226796','10025226977','10023486497','10025232080','10017536553','10025233396','10024732087','10026060305','10008893288','10025534150','10014133937','10019556466','10010211212','10015211444','10010342994','10018574153','10024199297','10011384528','10025309443','10025245375','10014613330','10025313863','10025314096','10025316333','10025321937','10008035144','10025506379','10025332035','10025678363','10011962178','10010894123','10020005988','10025191349','10024898389','10025356225','10024864471','10009591503','10025366294','10025935796','10025368361','10025417904','10025370138','10025543405','10011326879','10010231679','10008147651','10009526895','10009784062','10025427800','10001345580','10025429397','10025387404','10026064014','10025433379','10015335646','10025735084','10010748046','10025438156','10025138429','10017756899','10025816537','10025442033','10025447037','10022080841','10010436111','10025444925','10013954170','10025452528','10023361793','10010090395','10025416638','10025453751','10009982271','10025455098','10026242446','10026054284','10025459169','10025829416','10010433291','10025462700','10025472088','10011620973','10025158401','10017550683','10025383559','10009929863','10024589514','10017217113','10025494012','10025494499','10014837313','10015059323','10025497887','10010046356','10025501783','10023430520','10021895381','10024298767','10015564936','10025503812','10025507291','10025507159','10012572409','10025108825','10001826869','10025566380','10016133642','10025687171','10025572070','10020695262','10025571383','10022319841','10012791825','10026232864','10025581722','10024815225','10011261957','10024455697','10024937734','10025585718','10025585558','10025586371','10024496379','10025594979','10009852918','10015368418','10011542917','10013657244','10025604179','10024635836','10025615169','10025692722','10020082641','10025617759','10016283268','10016901717','10015143988','10026241577','10011148257','10025331944','10011255875','10025643548','10025645648','10010042261','10026243694','10011465192','10015172315','10025328390','10024939302','10017149081','10025715119','10026059830','10006578413','10025718038','10021230801','10019201577','10013386688','10022180413','10013856501','10015594751','10025726032','10026242562','10025302350','10025202154','10025688779','10011825099','10026139007','10025748340','10025750818','10025751447','10025750688','10025752442','10025756389','10025761637','10010687304','10025643482','10025772875','10024709853','10001270944','10025599826','10010691856','10009247358','10012606683','10025784104','10010984782','10026241509','10024163735','10024684319','10025797317','10025801836','10009361810','10011081319','10013906231','10025836520','10023514829','10026243860','10025848940','10024227395','10025856912','10026074980','10025857827','10025855465','10025856468','10025832472','10025863083','10025863323','10025558798','10015472427','10025866446','10025765439','10012946060','10011222069','10025312456','10010514320','10011121384','10024718228','10009606840','10026246026','10005469837','10010372877','10025889163','10012123297','10016194317','10025893068','10025898282','10009607410','10011238666','10024320648','10016929251','10025849769','10025902834','10025922326','10025921691','10016120602','10025925534','10025926714','10022373842','10014075552','10015487189','10026248040','10023464689','10010588739','10005729726','10001187590','10025801369','10025990311','10025997158','10008767936','10026000824','10011474738','10026250707','10026007198','10026007098','10026007503','10009689239','10026010320','10026009945','10026082727','10026004313','10026012945','10026013811','10025834911','10026020302','10020595964','10026024883','10026027127','10026000636','10026025976','10016553728','10026032036','10026146606','10026039816','10025962181','10010105951','10026042235','10018485668','10026151313','10026044716','10016382271','10025853587','10026082495','10026124665','10011326788','10018651661','10015868396','10020374116','10026059659','10021466343','10026159670','10013413029','10026165706','10025802764','10026168867','10024714953','10008626783','10026248727','10011583683','10020980115','10026171587','10026090652','10026127075','10025927344','10020951101','10026176200','10026175920','10026178123','10026177293','10026259070','10016947347','10026180378','10026259665','10026181006','10015282075','10026181137','10014387264','10013988559','10010929360','10016732747','10024695358','10026266239','10025969467','10019552544','10009507147','10016141524','10014620329','10026097152','10010969264','10025300756','10019568355','10023356985','10026266768','10026097890','10025659764','10026109386','10025234673','10011149605','10026110173','10010299113','10026107851','10022304545','10024306841','10026247009','10026181543','10026255214','10026277349','10026276297','10026274420','10026275724','10026273965','10015540319','10009043590','10026092191','10026279186','10019055937','10009690245','10026181548','10014498905','10017487981','10012948018','10005847847','10024712454','10026191043','10026284642','10010104051','10009044854','10017467182','10026205396','10026195124','10016461199','10026284862','10002044453','10026211203','10026212130','10026213724','10008477065','10026284606','10010564034','10017287984','10026217732','10016448132','10026278240','10026286591','10010753220','10026302305','10026293823','10026310536','10026320315','10016729377','10026149937','10025323161','10013695283','10008633196','10023534149','10023518004','10011623813','10011912280','10019375014','10021146636','10024127670','10020024850','10014022042','10023352054','10025265692','10023561474','10025046362','10020400291','10013316925','10010877415','10025038417','10023238127','10023570090','10025803841','10001835369','10008065607','10025042943','10020303289','10023627120','10020834190','10009398794','10016794981','10017496381','10011397920','10019847499','10011338797','10025044828','10026123614','10019323257','10024336871','10009143389','10022416385','10026222466','10023654139','10023473628','10015125340','10012698951','10017088731','10010226939','10022483417','10001807284','10021739270','10023609068','10023717136','10023716669','10025268142','10019294170','10001604168','10025932774','10013681496','10012906029','10023719986','10025653263','10023718707','10025380045','10024604094','10010142616','10018800347','10008060327','10006277314','10000869656','10014596221','10014567353','10016341470','10023500921','10001474939','10017422191','10011512684','10025802797','10025381570','10013141587','10014594770','10010047426','10023749321','10013705992','10012885608','10023827651','10023827134','10018791240','10023991925','10016193194','10024080349','10011387601','10019407204','10025122454','10024078443','10016123698','10017755174','10023930609','10014875003','10023906136','10012243677','10024733996','10009638163','10012274628','10023919611','10024474622','10017498439','10016219656','10009516475','10022399683','10023993924','10024001042','10009644544','10022458114','10023966834','10023964823','10023975897','10023903195','10023797293','10024016470','10011709551','10012043627','10017474572','10023958579','10025382455','10025937721','10024087165','10025271951','10025385677','10009239242','10018800894','10011548869','10013438425','10022009162','10015712506','10011913453','10009914459','10011966399','10001761536','10024175368','10021147641','10015626750','10020741532','10015171179','10009364425','10016537447','10024188171','10016224605','10022024569','10009242787','10024233777','10022297981','10009859536','10024199291','10015566200','10015412539','10019467815','10014556886','10021024508','10016456344','10024395953','10020455114','10024243348','10024204377','10024250230','10009812818','10024254282','10010552957','10024261970','10006591381','10006821857','10000838309','10018584597','10011460976','10015477647','10009516118','10008004457','10001821236','10024403887','10006522559','10008527880','10012826735','10024329381','10025934598','10026220593','10024337358','10016798498','10024338436','10024408114','10011253980','10023795040','10015248895','10023244519','10024411540','10014486497','10025808722','10025053924','10012016044','10013112799','10013498654','10024377996','10019940776','10025160334','10018309217','10025863912','10024499121','10023303462','10015788268','10017547629','10024451732','10023758915','10024393627','10016905284','10010847071','10022284234','10010878681','10024452951','10024457931','10016315830','10024510097','10022173310','10019809673','10024468341','10024468156','10023611895','10019648036','10024481163','10023704023','10024369463','10026228473','10024618094','10024608985','10008734323','10016490887','10020670600','10024525905','10011477676','10015485170','10024481789','10024624654','10024527412','10024528188','10024531747','10019633118','10010246426','10022212689','10021353544','10018503225','10024396283','10016872618','10011173249','10001297894','10019578425','10022416174','10024558733','10025056622','10009599224','10010204019','10024571425','10017922660','10016468823','10020885703','10011792517','10024651397','10011450196','10024937259','10024659619','10019503342','10024660222','10025277242','10024690303','10024683935','10026051897','10024693083','10024695800','10025391170','10022148507','10020333356','10010930846','10024486506','10020088295','10014820763','10022371980','10008221203','10025393292','10023889755','10024714708','10024708970','10024717806','10014520325','10024730907','10024730352','10024738238','10024727322','10012500399','10013762281','10010163623','10000986074','10024737365','10010097222','10019843602','10017094928','10011240653','10008557875','10014126736','10025080293','10013260945','10011327636','10025168944','10017552084','10010503733','10026133426','10025389955','10024178284','10008528496','10024924453','10024733066','10011304247','10025533507','10010933343','10018864125','10024968282','10023656289','10021161968','10024963738','10014993321','10025394408','10012192297','10024983003','10025396999','10018791512','10016463222','10023289092','10024896181','10009535202','10023244956','10001043917','10022242741','10025173244','10016003984','10025106866','10025175206','10017677596','10008832618','10023746736','10025116700','10022077504','10012592391','10025126396','10025127815','10025125859','10011237068','10025128391','10015363299','10025134624','10025135365','10010520457','10025142621','10016775954','10025146594','10008720421','10022131025','10025150074','10016111128','10021546266','10016784603','10024699305','10025187292','10014988527','10006110638','10025172319','10025188452','10013539994','10025174306','10019774946','10012117903','10023405298','10025047456','10010105482','10021924166','10014822382','10014283750','10025202807','10020802820','10015052325','10025210287','10025221561','10021971772','10006459255','10010691072','10024651439','10020946482','10025239103','10025244950','10017210149','10016482186','10013803823','10025163085','10025527758','10006119368','10025261979','10025262420','10025299689','10025303043','10019904455','10020534711','10011573756','10024517488','10025312849','10017313946','10025317893','10010209784','10025318596','10025318409','10025677415','10026131960','10025322436','10015686850','10013690567','10016693438','10000958566','10007658953','10018453442','10015109293','10025330135','10025089054','10012318745','10012585402','10015063498','10016940316','10026138021','10024203174','10025325756','10020430726','10009909599','10025348139','10012333648','10023253607','10009815972','10016003107','10025354851','10025801126','10017244112','10025359859','10013270764','10025472494','10001305795','10025366976','10011747983','10020181000','10020353031','10025370569','10024457185','10024939666','10021208407','10009155096','10001756137','10025955746','10022129232','10021511955','10025436466','10019980920','10013645459','10022340432','10019006603','10025445496','10017322193','10012949796','10025452219','10025449264','10016549813','10010881173','10015292445','10008310351','10025456382','10014375089','10025458979','10009852777','10025460250','10016355010','10008759694','10014407272','10010687127','10009546575','10012194348','10025946138','10015277005','10020595770','10014192933','10020497963','10015332377','10024828973','10025498964','10008761321','10022549735','10013414614','10009524553','10025562798','10011003636','10015473745','10025818235','10001300427','10025571401','10022561843','10025250644','10021969764','10025583741','10025588417','10026065895','10025590696','10025590504','10010721343','10010028253','10019731207','10014896790','10025607079','10014688254','10024041395','10025611114','10025611929','10025612353','10025614389','10025595659','10011363896','10009544301','10024186906','10010724506','10025622936','10019810676','10015246996','10014266690','10018524987','10024737811','10025626413','10025626946','10020134462','10018461656','10025695179','10012378519','10010072985','10020667682','10021414078','10006630566','10016629874','10025647031','10023466490','10018126523','10021823234','10010381204','10014389202','10008512471','10026068225','10026238954','10020096351','10025714823','10018827305','10012813907','10020287293','10024918632','10023355883','10015835288','10019852156','10011260439','10014898129','10018819186','10018577150','10025744140','10025015986','10013351609','10011767108','10019546190','10012645572','10014613256','10012290540','10014959816','10018036168','10023420137','10011540303','10025542953','10025770614','10025775642','10025960757','10025768785','10025630932','10014724920','10010890582','10023696379','10008487735','10010384351','10013305648','10025950874','10025792099','10018849057','10026064190','10025799365','10025799732','10010459104','10011210922','10025787063','10026071746','10010904969','10011679846','10026135933','10010752755','10014510592','10011200531','10005877314','10025840398','10025842849','10025930934','10023468312','10025775462','10024946540','10025851175','10014909388','10019114085','10023410264','10025855971','10015603015','10024278247','10019499992','10025225784','10025867343','10025871950','10019234614','10019965875','10009925686','10025871860','10025876743','10022287860','10025875938','10017529708','10017993226','10025971410','10010057795','10025889601','10026073189','10010786659','10012122129','10019293856','10008220462','10023894255','10025902353','10017017035','10025910845','10012998123','10026076522','10026222196','10026246319','10025917936','10022368798','10021110998','10001772252','10011098201','10025923726','10019803552','10023394140','10025981098','10020002011','10020677870','10019510910','10026004928','10018480054','10008502098','10010237306','10011576285','10008976895','10017716936','10011483052','10010174523','10025991972','10025992739','10025993921','10025996467','10025998410','10012669832','10020369844','10020610134','10009694383','10026004238','10026003975','10009157601','10026004072','10017011000','10021400128','10026009111','10018976764','10011111702','10016966359','10026008672','10012213533','10020273125','10001754607','10016217831','10013376110','10026017499','10010971294','10026027638','10009152535','10016892264','10021970027','10021003353','10026031208','10011571653','10020151159','10015061413','10026038437','10009431514','10016741329','10024852726','10010503246','10014430353','10026157898','10011102740','10011044264','10012992362','10023492157','10012641116','10010445907','10020877966','10026249764','10014609647','10008322059','10008663378','10022360554','10011426256','10017495011','10026162342','10015487500','10026089237','10026163358','10012737103','10022108809','10019210546','10020900683','10026170584','10024589264','10014733388','10016315525','10026177496','10026126356','10026257097','10026173799','10026074008','10026086311','10005855956','10026088782','10017973252','10026225685','10026255297','10025084358','10026133148','10026260959','10013271563','10026263307','10018500911','10016161160','10023364409','10026219249','10017917439','10026100150','10011052233','10026068241','10017486117','10016791106','10005926322','10014302255','10026263501','10008099169','10026104626','10008124521','10002124146','10026111476','10009434561','10026106172','10010262141','10012090972','10025599695','10011173597','10010609743','10025643841','10026116786','10010471306','10025188476','10025221354','10018525123','10026177328','10026269908','10026229803','10005775474','10011380443','10010503399','10015825703','10026273300','10019133887','10021168282','10014973463','10017141483','10026271664','10010284917','10026190273','10011321370','10017404901','10013157088','10024809501','10015104240','10018598208','10017806404','10025851532','10015943844','10026193040','10026194008','10026192837','10026190976','10008312332','10026195482','10011217097','10020674426','10016022201','10026193876','10018961184','10013532925','10014433400','10018801186','10026282958','10012606483','10026208606','10011396864','10008760934','10026201562','10026217052','10017334389','10010165492','10026260660','10006787346','10026291979','10014880216','10026295334','10017010203','10021835109','10026303064','10026308295','10026311379','10014724486','10026306250','10026051536','10021100000','10026318892','10026003345','10026310853','10026295897','10026248036','10019205242','10014045841','10026323103','10026135315','10012655638','10015935544','10015592990','10008655439','10017294121','10006788708','10016696938','10012208585','10025923053','10022562878','10024608188','10011718420','10024613927','10010817719','10024678427','10014869381','10025994440','10025998009','10011568335','10024113257','10026000341','10026003179','10026007675','10025804132','10015067970','10010987581','10023694354','10025047257','10022238822','10022574624','10024814260','10010774390','10009104233','10010209706','10024202280','10024219707','10011304208','10024508078','10010098321','10022562817','10025939726','10023730175','10024718771','10022009276','10026231243','10012450449','10025211396','10010605379','10023535953','10008465340','10010341985','10011964932','10010101161','10025953508','10009176182','10026048560','10012824881','10026166035','10026116470','10023471597','10013203971','10025619778','10001316746','10023579236','10008528580','10025043226','10001597627','10011215995','10011517269','10023718690','10008502408','10022068003','10010585574','10012315223','10024194643','10024207133','10001643409','10024309674','10007982928','10026055982','10020491563','10017991875','10008485560','10026132549','10014475423','10013207787','10024907502','10010742373','10023725075','10023293514','10016890559','10022462211','10020503208','10011359874','10011047408','10005687725','10025225046','10015042006','10010202160','10025243952','10025303929','10022397115','10008759314','10025551883','10025407316','10025515826','10025659162','10011318875','10015282285','10022503263','10023976227','10023667527','10024547682','10025980417','10026067452','10021224546','10024934633','10026038499','10016652746','10023427255','10026110737','10026275824','10010042285','10014740601','10014357227','10008069172','10026167404','10010471459','10024171087','10025044293','10023427516','10014649563','10011264259','10015081070','10023714890','10005631422','10026046481','10023533534','10025930215','10011336332','10009394056','10023888183','10011751074','10012722951','10023674264','10025393209','10023761644','10002077587','10023668720','10023984480','10022440850','10011438695','10025608533','10023888319','10023680460','10025151903','10023697422','10023689852','10024088617','10024027937','10010808289','10023672980','10010139332','10023755624','10023640697','10008072672','10023924544','10014042333','10022024267','10026052440','10023618681','10023829654','10011545399','10023832007','10023663766','10023790922','10025934717','10023837842','10024309402','10022209004','10020455371','10011458860','10024077660','10023911386','10023912081','10024233500','10023798190','10025931527','10009325708','10023595527','10014590894','10025664409','10024027299','10011026057','10011566920','10025935536','10026221380','10025382564','10014286686','10023981249','10016398724','10019689626','10014492741','10006828219','10024609974','10025271959','10025051761','10015146680','10024314841','10024048226','10024124371','10025810510','10024320131','10024181103','10024239547','10024161456','10012745250','10025053216','10024239583','10024323172','10011009579','10015926693','10024206490','10019060774','10026225817','10024487065','10024255697','10024258766','10025937584','10017467843','10024265776','10015145168','10024811458','10023809894','10026053272','10025697248','10024245535','10024341996','10010702563','10024618189','10025388870','10022037118','10010372647','10024828322','10008488951','10017702739','10024461990','10023677654','10013993860','10024836246','10025267763','10014176213','10019477702','10022425300','10022343796','10024626498','10024511063','10018969730','10009550948','10016830213','10019714628','10024531016','10024529959','10016280004','10023762388','10012710789','10022580085','10011022054','10024541938','10024548913','10024853163','10016921804','10013556510','10009512805','10024658786','10010247152','10024861160','10022138765','10014960684','10024668130','10024674018','10025165025','10024680878','10025393958','10012751427','10024710347','10014686614','10024723608','10025066101','10024726826','10020728065','10026234474','10022062395','10021928335','10025531813','10016763499','10024252020','10024910291','10012930739','10023377183','10024925398','10011992094','10002059951','10009315374','10024934234','10009895501','10024744847','10024956856','10024525756','10018285566','10026058365','10005640020','10026236121','10025284267','10011048026','10026237288','10010107350','10024680609','10009749192','10012537078','10024830786','10012525536','10022315472','10025675136','10019102321','10009809316','10023264452','10025192500','10025195793','10023499337','10008635407','10025205268','10025206980','10010277779','10022423834','10024444620','10025222169','10026061008','10010717155','10025249301','10010469481','10010516206','10025263416','10025306091','10025306998','10025347691','10014138231','10025368147','10013355726','10024581797','10011693869','10025421529','10025430593','10024745388','10021805191','10009828955','10025817847','10025449501','10010696538','10025455006','10015521175','10025476377','10025480201','10025954165','10008428822','10022523475','10025501858','10025503579','10025511781','10025573513','10025579074','10025267210','10025607381','10015712020','10025622032','10025955021','10026244085','10012577712','10010156414','10025652763','10017838381','10010495876','10025704833','10021248099','10015485472','10025713966','10025715595','10025444500','10024572764','10021725900','10025723513','10011332659','10025743133','10009464683','10025749174','10011638384','10025765230','10025773311','10025766264','10014229069','10025779436','10026149129','10012887900','10020794898','10025862031','10025864796','10009630688','10026073389','10025871364','10026244313','10025969791','10025877458','10025887845','10016012634','10011057330','10011271835','10014457331','10025902362','10026077455','10025799846','10011965577','10011597401','10025919484','10026078290','10022088083','10016024181','10025975369','10022356760','10006331952','10009283946','10025976036','10026001699','10017262703','10026007884','10013681459','10014979221','10023357590','10010891107','10026024922','10009771334','10026249752','10021980479','10026250966','10010156232','10016900442','10025597683','10026043403','10023788291','10015483758','10013106146','10015800972','10026086905','10026086332','10026166291','10013321954','10026229557','10026178797','10026174703','10015474267','10013756905','10026092329','10026259266','10021070309','10026027254','10000840243','10026260462','10009543472','10026265005','10026228785','10026098160','10026100646','10022502366','10022323883','10026107393','10025352287','10009885850','10026116825','10026183443','10010142447','10026269961','10026275030','10025402449','10010392111','10011521517','10026088845','10026277853','10026187195','10005859192','10026188742','10026002500','10010713503','10010563317','10026203647','10026201645','10025649894','10005765129','10026289317','10015416505','10026257856','10025623942','10009830612','10022056887','10023564676','10022024147','10023563608','10011005237','10022337931','10011439063','10022300188','10023516255','10018220423','10022034913','10025376308','10012126586','10009377299','10016334932','10023624703','10025265954','10005635904','10023667582','10011384696','10024224680','10023527653','10023658408','10012590827','10010815723','10023705773','10023687701','10023663881','10022297804','10009968098','10008784437','10017527703','10023679670','10009308044','10016669183','10020746859','10014489054','10023989708','10023773850','10009139246','10010865751','10021119074','10023824166','10021208423','10023780936','10023445650','10013400478','10016796396','10015248126','10023754524','10023752862','10021469457','10024029622','10023835355','10024259003','10011290174','10023837341','10023879979','10023838236','10014551360','10023885520','10025930466','10025269133','10018776986','10023913368','10023915944','10024076735','10024029693','10023918712','10012386878','10015157651','10024076421','10010810109','10014280588','10002172266','10023426709','10023715062','10010701325','10010831953','10023975419','10009158663','10016077604','10001134570','10023673410','10020541294','10008163092','10024086794','10000811696','10011596281','10024317220','10013928080','10010552259','10025272695','10021994181','10022198106','10023699672','10013113430','10010761507','10024238926','10013440294','10024239116','10014319190','10024202288','10024208710','10013145764','10024825459','10019759551','10024219669','10015728307','10009926913','10024260111','10024822995','10021955835','10016300237','10011060147','10025276702','10017209218','10012279812','10013505164','10005846666','10024535096','10024371298','10024374685','10011353610','10016459987','10011580641','10016011478','10018607842','10024459372','10017201522','10012890609','10020877077','10024615720','10024413013','10014186972','10024488221','10012838872','10025162274','10009675650','10010359488','10024529858','10024272872','10024534749','10024635474','10001795090','10024532946','10024555708','10025943629','10024648573','10024653329','10024644281','10009887230','10024220960','10022411317','10009897186','10024687951','10025278985','10024706622','10021169515','10020058762','10025057333','10024748955','10024886333','10009322413','10025074073','10024876899','10025073866','10025078481','10022382946','10013325120','10024874653','10025080289','10025080787','10022260046','10010074928','10023339913','10022023111','10022232308','10010735462','10026055683','10024917198','10024917596','10024922806','10024916063','10009702894','10023433223','10021474468','10024721449','10014353867','10024962644','10006127720','10016450709','10025094509','10025284631','10021329826','10025035592','10025035971','10024947121','10021979573','10012957894','10022322641','10011035763','10012217419','10012415894','10005839728','10013438618','10025129463','10025135969','10012923691','10017224370','10026057983','10023312890','10013444339','10025049728','10025189231','10022118756','10025191574','10025199709','10025210628','10010828835','10025293063','10010820553','10025537907','10025225201','10005852194','10013832624','10025230461','10025230727','10025231984','10025234874','10025233920','10025241191','10023479814','10011569080','10014232005','10024751685','10009874426','10020628994','10025302085','10025302986','10013946166','10025307391','10025308564','10025538312','10025539749','10025949285','10025348371','10025342804','10025344206','10023778706','10020833623','10018733562','10025366967','10011600985','10026181534','10011339396','10025421098','10009228803','10013052190','10011487355','10025806365','10012082703','10010782669','10025437593','10025435577','10015752656','10023680647','10025950990','10026236883','10025457247','10021635255','10017819059','10025498883','10025566740','10025574097','10025576172','10010288109','10025681158','10025597330','10025598884','10015778609','10025617863','10013445065','10025622432','10025629471','10025633910','10012192290','10005951793','10020524516','10025651399','10016762749','10025598054','10009517894','10025655691','10025957261','10016088110','10023385464','10025715170','10020090991','10025720028','10026241991','10017355690','10025735323','10010480731','10012181689','10006650664','10025761818','10019164039','10016757868','10025391363','10014387797','10008125471','10025783375','10010824157','10012626290','10012915904','10011159406','10017025402','10010190460','10020917517','10013105873','10025863880','10025867955','10015652281','10023504983','10018716379','10011287672','10016216448','10025889668','10009401805','10025888470','10010410439','10025911839','10009102452','10025911916','10016268246','10025919179','10008469952','10025925012','10025924269','10026070633','10015549494','10017063841','10026085132','10021466076','10013614169','10026015289','10015221689','10026028312','10026031221','10025871774','10009931152','10019979256','10026157334','10010118370','10023769481','10009285038','10011639090','10026256061','10026166814','10026167018','10017749657','10015919317','10024368612','10012961842','10026022857','10026247252','10023670954','10016260718','10015631728','10010861682','10011014184','10026095540','10025716084','10026098860','10019285152','10026101938','10026100213','10026104787','10018999794','10021972119','10021996330','10010993627','10026273515','10010334104','10026266653','10026281900','10026187747','10010929623','10025508059','10026197640','10026198741','10010845522','10026286776','10002090692','10012283792','10026204311','10011268153','10026203573','10026202033','10026191218','10026218294','10015052445','10026302328','10024824889','10019207145','10025033193','10025755086','10013778492','10023493899','10024215924','10002054295','10008929594','10023708212','10015689791','10008005388','10017568442','10016629267','10024269928','10024133114','10023224652','10011228140','10022270605','10024365835','10021808498','10023929545','10008165647','10011686611','10026242643','10024413993','10017609489','10025544483','10006602248','10009046338','10023690159','10026063505','10025334826','10012216155','10025957559','10000827823','10005890455','10010456767','10023602496','10023540478','10010796837','10023789881','10023576016','10008151980','10023772583','10011874129','10008856101','10022494581','10021683844','10001768186','10025040922','10010113034','10008180278','10023642149','10009137627','10005834169','10005478784','10015616854','10008290984','10023757447','10000830382','10009142764','10001216881','10006657762','10002068598','10021661363','10017272449','10023221216','10001319727','10021953358','10023803171','10009301099','10005666780','10022343755','10014630842','10014992149','10009748038','10009365911','10000849878','10000838230','10023796913','10014874666','10012132873','10010586182','10008721457','10005657737','10015118338','10015270894','10009522768','10005642481','10023988797','10012141899','10008105545','10001246743','10001764724','10016165035','10014058752','10015177619','10006125765','10005935641','10005823099','10010584642','10020171517','10009118450','10013222702','10024094961','10023494328','10008332193','10007530871','10009895573','10005751407','10008092135','10000700180','10002051011','10008346035','10001589657','10024220159','10022241435','10021590749','10008176183','10013182717','10024338989','10012069303','10025276664','10016188321','10023747352','10006100652','10000794603','10000790149','10001805370','10009585148','10024819457','10013239467','10024541014','10017831873','10005898668','10012873982','10024755864','10025939507','10024862693','10001700397','10023576058','10021686222','10012982595','10020994768','10015146322','10025022231','10022365694','10015544653','10010371276','10009106841','10000981741','10012352170','10000193355','10025188248','10021955627','10008071399','10008452149','10017339683','10025686346','10024988140','10012760142','10021876273','10025762724','10020602505','10007523349','10010190916','10001079920','10005934840','10010068982','10006604687','10008060901','10026002880','10026005602','10017522135','10018090911','10026012549','10025370206','10009628757','10008030577','10000052644','10006728367','10009820506','10011242328','10005966756','10008015639','10026214738','10012901938','10019865901','10009564710','10023592623','10023599881','10023694631','10000947583','10014748970','10009429897','10001028008','10009198655','10010621537','10012621240','10008104376','10010574605','10005654001','10010216636','10011100043','10014009954','10016462230','10023798707','10005634066','10008115476','10021724439','10001747834','10005860266','10010804322','10023600135','10012863142','10022348388','10026052543','10019372539','10025322428','10008895829','10024090473','10020602586','10024113291','10008325244','10025821977','10011029297','10012190386','10009801025','10009852170','10018448775','10015545585','10008866038','10010882326','10012209721','10023957407','10014752213','10010977099','10014621028','10010129028','10009511018','10000996379','10010824476','10009492747','10016429291','10023732264','10021309689','10008020571','10022089799','10009379755','10023739887','10009078977','10012175832','10023800367','10012112671','10022470048','10009246429','10012926846','10022437531','10017690280','10002135485','10025725780','10012529096','10026224498','10001189311','10000114346','10005927915','10017874368','10000143815','10016626158','10001730744','10024131018','10006711942','10013213145','10013844501','10024188981','10024217200','10024321409','10014334409','10024139634','10024383896','10025318779','10002127855','10018304633','10024432122','10015009876','10025039449','10005818816','10024473659','10009969698','10024080452','10023615204','10006722387','10012409718','10014063917','10025784471','10024776653','10022020263','10008855487','10022132477','10025040730','10025056956','10001752420','10025157013','10000732583','10008350913','10024240086','10025538064','10024803834','10014157217','10025264943','10013587090','10025315772','10016710375','10013574473','10025540232','10024838406','10025363954','10024296788','10024273444','10016175130','10022139275','10025505741','10025506292','10025512317','10017520777','10013000862','10017588534','10025378477','10000732818','10006101725','10025617202','10025495583','10025747904','10025640093','10006469730','10026072440','10025258108','10025815800','10014221418','10001302479','10025874394','10008955027','10025876140','10014605326','10010127102','10025927428','10017648306','10026005640','10021378833','10023964131','10025642607','10009986030','10024826798','10026164934','10008084595','10010492990','10002173947','10006418805','10026259726','10020243752','10009116788','10001609843','10013364840','10011952865','10013899015','10024819280','10020925411','10009698767','10011061222','10026196670','10023302663','10025764076','10026271326','10026279940','10019002663','10006476554','10013095329','10012064324','10006805146','10026002788','10026001769','10026007897','10009876896','10023776565','10001831156','10005471760','10016904866','10023483225','10012462269','10000884164','10009329750','10024097174','10024213600','10016988205','10024219469','10023268550','10013545567','10014143010','10010175356','10001830690','10008440415','10025454633','10025483027','10018061395','10010412910','10026252258','10026273700','10024038367','10013554329','10012573723','10014233769','10005660056','10023593185','10008327427','10014642409','10000979651','10018030094','10023660762','10015741623','10023641089','10023754317','10023772635','10021598562','10023719254','10014114989','10023779072','10023670206','10023769090','10023774540','10014326306','10010100099','10013787979','10005650007','10023795925','10014366490','10012223256','10010389905','10005913457','10010785587','10005813208','10014288700','10013205854','10023706843','10025808011','10001289959','10001748477','10021668356','10011212639','10008048778','10024089570','10000014995','10024084812','10024090559','10008548026','10024073867','10018487922','10009407663','10024143961','10024150279','10009170552','10024151742','10008053487','10014383262','10014461518','10006110436','10015031841','10014164643','10024497466','10005643502','10023756032','10021959581','10024816984','10022367871','10025039722','10025040748','10025762213','10010981760','10009320311','10009498809','10011055808','10019402440','10009649756','10009738370','10025572232','10024172477','10025632525','10010115937','10001075662','10013752078','10022338610','10010762608','10006113695','10017661654','10026119407','10001075733','10017107843','10008157321','10026313971','10015118980','10006894541','10012193345','10023677822','10023581275','10010733108','10023833642','10012061899','10010691213','10009988204','10001051521','10010737463','10012370028','10024487906','10001062134','10010264641','10022000791','10006548953','10012101053','10023770987','10023543909','10024023432','10012200943','10012256365','10010072303','10021988060','10012171413','10019261156','10013112730','10025970284','10006797160','10023693003','10023881135','10012052637','10023882102','10012069108','10016679668','10023696779','10022501343','10022087619','10009333589','10022473918','10012473061','10022004112','10011013975','10013352516','10012968020','10011841810','10012073818','10023709291','10023949071','10012901627','10022220728','10010066123','10009033715','10008824328','10013359456','10023673653','10023822947','10023777726','10009033054','10025532093','10010980849','10021393882','10014608792','10009087410','10023955766','10023583106','10021922496','10001159864','10023768711','10023593689','10023888260','10009554186','10001023031','10012062631','10023619332','10010582399','10023753364','10012212709','10012188729','10023568353','10022022422','10023654235','10005899078','10022215347','10009414120','10023689230','10012258490','10022422967','10023881289','10009958600','10016484713','10023894330','10009081175','10023891056','10023823820','10023777403','10012094688','10023823972','10023834294','10023783138','10010203084','10023767852','10023516449','10023786903','10022070458','10023834753','10023801981','10023811343','10023812965','10023329300','10009066369','10023838334','10023310196','10019469964','10021840167','10023879925','10023879756','10023832990','10023835852','10023884298','10023311288','10001055177','10009941052','10010190436','10023833986','10023882653','10014243564','10010114795','10023997200','10023741280','10022355522','10023935097','10023309546','10021758254','10012009011','10024020586','10024021810','10023917322','10024032253','10024032337','10022157124','10012179473','10000958689','10000830117','10024808964','10022247096','10010746436','10024182549','10011912366','10021631047','10011252752','10024199020','10011242170','10010838921','10023800407','10009835872','10009786597','10024400395','10024035211','10021913664','10021981847','10010745264','10022170384','10023942358','10024233153','10010701098','10000034890','10010337219','10010748542','10010518831','10009313276','10022268057','10023835837','10025055449','10009951484','10018385848','10001111778','10023805828','10023314284','10024294884','10017059110','10008039783','10024500905','10024441372','10008344241','10009719423','10024616086','10010011184','10006812564','10021900704','10024476813','10009235536','10024970606','10013318279','10015196624','10022542120','10022256528','10009410643','10024626036','10013088746','10010081405','10006699465','10023342936','10023329851','10024654077','10024667606','10025056219','10024712993','10009088204','10022008507','10024735439','10024690516','10023647290','10023937264','10012426106','10011445125','10010595924','10011501179','10025091277','10006704436','10024971077','10006349454','10013418182','10025089671','10024736285','10025104712','10013625558','10023752357','10016564798','10023733892','10000908731','10009475343','10025219570','10011479414','10025219954','10025237526','10008317021','10009139338','10013640987','10012798384','10025315402','10009479724','10012247698','10023523144','10010232576','10012252947','10016926887','10009407207','10024914791','10025578768','10024913839','10025614091','10000964718','10021809758','10006700066','10020901434','10013811124','10015600249','10007988615','10023462387','10006888005','10017311534','10005665617','10025952665','10010146406','10025966068','10010325172','10025909403','10025898890','10015175165','10009129457','10008206199','10013965124','10011608933','10010428499','10024436468','10017273496','10015054113','10025979513','10024550360','10014060257','10013597484','10026110082','10024158357','10011337187','10008138797','10023240067','10022351440','10024380733','10011394072','10026073432','10010810094','10024923994','10009125980','10000697399','10023882093','10021855135','10014335421','10023886863','10023886762','10023575825','10021908100','10024490880','10013155237','10020521676','10001621171','10025922341','10008894439','10016951275','10009061387','10017559349','10009160129','10023683133','10023683749','10021978534','10015445045','10012089280','10024732249','10023747515','10009160894','10022322675','10000709704','10010020899','10023757586','10023479862','10023764394','10023826456','10009503158','10023779319','10023777573','10023985911','10022137037','10023581543','10023991620','10023881063','10023754785','10024232867','10010122913','10013555975','10024079396','10023960197','10010034045','10023837532','10010078668','10012435535','10024035245','10005936259','10000113190','10023370548','10012156594','10009852804','10023314728','10024182532','10024611708','10024180607','10021065721','10018451574','10025264928','10024207242','10018523463','10024218539','10024219542','10024398856','10000139089','10021924224','10025055201','10024347639','10011381153','10024354644','10024355567','10024349823','10025160335','10013128721','10021957157','10024444964','10022087625','10013408550','10024471117','10009140970','10024476214','10023772528','10024478776','10022464401','10024482619','10024480968','10018668355','10011657755','10010834448','10022375630','10016347990','10018478919','10015603575','10021710381','10025059834','10015970753','10025060406','10024857839','10024201863','10023800575','10024735238','10010158560','10024731918','10024889204','10024794590','10013590692','10024784305','10024993065','10010859806','10024774503','10009918926','10023399388','10012476818','10016904474','10025118474','10023636200','10013533132','10025133832','10025145896','10015172793','10025209658','10016165292','10025230995','10025184932','10012765544','10022197774','10015039252','10016761953','10018668486','10023493048','10025163217','10024512763','10023660456','10012101710','10025578080','10025578025','10011443682','10025330075','10025162295','10025665642','10024868225','10009622194','10025908660','10025912518','10008641486','10026037952','10011091043','10023802560','10001077859','10010055445','10023537079','10010823079','10025848927','10009785187','10015463632','10022568980','10001063795','10023585307','10009961658','10011267990','10024389708','10013619040','10023827317','10009927544','10022432860','10012292376','10023833581','10023425688','10023818727','10023801345','10023884331','10024027083','10023883741','10023837310','10014427864','10023832917','10010028048','10023833310','10023833407','10023833397','10023883368','10023879510','10023491327','10022069509','10023835096','10023884357','10012022384','10022430361','10012150239','10022051546','10024387456','10012074655','10023935775','10023882580','10023998656','10025156402','10000899290','10024015151','10023920429','10023739223','10010128135','10014268084','10022421431','10009931599','10010136880','10024385741','10010008403','10024075393','10024014899','10001022288','10024143297','10024112175','10024890076','10022213133','10014724206','10011142272','10011838311','10025941789','10024610810','10019166931','10010952080','10023367063','10023570301','10024219941','10024223089','10024218978','10023899503','10022263307','10024257794','10024473897','10012054805','10010312046','10006691791','10012024318','10024612373','10009980692','10009677959','10010126716','10010384645','10010105685','10024199373','10012921627','10022291233','10000951060','10023802000','10010235031','10024102438','10008170583','10014007315','10009253456','10024349981','10000932086','10012188480','10008487057','10014741506','10012108046','10010559235','10012513077','10024383335','10022216239','10001647390','10009368101','10013464992','10024146753','10024427948','10024447326','10000677341','10024463438','10024232570','10008584366','10024463964','10021912417','10011499984','10021924773','10012040617','10010079724','10009270914','10024535123','10024528078','10023390396','10023398333','10024641137','10024860012','10015313988','10023367779','10022002108','10009169123','10009067800','10024569929','10024585817','10011597744','10010195384','10010013795','10024657406','10009283778','10008756268','10023794841','10012758471','10012797616','10024740107','10020797559','10009251677','10024773605','10024775432','10024786359','10017928757','10011446054','10025163296','10023336318','10005792414','10025088744','10009462251','10017858886','10023349505','10009135752','10012383170','10025013380','10019415940','10025943777','10000185773','10023637679','10012405800','10025101538','10025105065','10025102707','10025105689','10019603205','10025104353','10025115149','10014365878','10023494105','10010728111','10011354376','10011107464','10006348989','10025204097','10023420646','10016057966','10024869186','10025401019','10025212584','10009481190','10009794433','10025222298','10023608615','10025140939','10023796469','10023756435','10025253055','10009272125','10025397367','10025205981','10023510801','10024413165','10021894891','10012197606','10025335494','10025319650','10008030642','10022031263','10010625713','10011095950','10024751910','10024919982','10025361540','10009549610','10022321472','10009417541','10016694750','10009517333','10009824654','10021848436','10008235382','10016038754','10022151176','10011090076','10026063619','10005883952','10025251022','10026063488','10025276103','10024427932','10011413020','10024915897','10012214807','10001771261','10025590743','10024745720','10025613018','10016399745','10025620216','10006602025','10014987828','10025649035','10025651303','10025579314','10024524038','10023645148','10011374642','10025956563','10025321814','10009847134','10024569137','10015412920','10021721008','10010813929','10025765855','10023400488','10024781800','10024985328','10011476987','10025961973','10025960545','10024987529','10024570572','10023791592','10006581789','10010219454','10005703999','10015925317','10025857885','10017825355','10025868274','10025747600','10026146619','10025889371','10025890863','10025897282','10025890851','10022209420','10025900182','10025958526','10025904779','10025901345','10010627460','10025911619','10024461757','10024162440','10025923798','10025921264','10025923710','10025971521','10023811041','10024630264','10010745388','10010569553','10012602486','10026004869','10024919870','10024475744','10025898490','10024701125','10013250667','10013799890','10013827929','10016181558','10024438420','10006701045','10024474289','10025924342','10009177031','10026070967','10014827278','10024547753','10023737193','10026108401','10026062205','10010621945','10024547703','10025543486','10012155280','10024830614','10024447008','10023255106','10017018203','10001003105','10023816754','10011336970','10022058170','10023987214','10009322392','10023527708','10024023551','10023782380','10023271197','10023887504','10009193360','10023885634','10012112145','10023878866','10023832705','10023557273','10009167657','10023603112','10009642821','10021854966','10005667886','10024421949','10009095440','10023331749','10009250250','10023392930','10025231567','10020706343','10024735886','10024746489','10012341145','10024878339','10021856891','10025328586','10025426459','10026058109','10017396258','10021727308','10025927920','10006111019','10010447097','10026270554','10024563775','10011191473','10024510181','10021779073','10021945445','10023540995','10013323099','10015661952','10023557020','10012825718','10023817963','10018500146','10023661564','10023317767','10009931642','10023251575','10000972846','10009972397','10011519998','10025660464','10006887436','10023582104','10000827629','10022061070','10012005472','10023583759','10012467806','10012488757','10012884105','10023981551','10023432211','10023512667','10013233240','10022325280','10023888326','10023888420','10023583804','10023804020','10023715240','10010800388','10010758373','10025651163','10013564927','10024026688','10000153362','10023793946','10023880985','10023800540','10008589885','10023722355','10009070498','10023824199','10024539323','10008865587','10023769697','10008906302','10023441181','10023767912','10023683203','10023489923','10023821185','10021985607','10017577210','10023770073','10023784790','10023452053','10011317581','10023785046','10015594163','10023318411','10023774025','10023258154','10023832605','10023308585','10023313195','10023702312','10023235884','10023827913','10023833421','10023892968','10023893302','10022388472','10021962162','10023800954','10023835721','10022141500','10023808985','10023397428','10023810932','10023890152','10023387157','10022572372','10023397467','10010611439','10021936930','10023808433','10023834140','10022543197','10023291819','10023816082','10023808753','10022439758','10022044708','10023836368','10001102553','10023832722','10023892999','10023770323','10023741553','10023881245','10023883591','10022141104','10023888878','10009061958','10016314159','10024029927','10024031667','10019663922','10015453450','10023906529','10024016387','10010425173','10023826612','10014931670','10000827991','10022041050','10000825183','10024033684','10021893326','10023813339','10009076458','10021850726','10024019787','10024032524','10001067182','10021975129','10023575188','10024036592','10022545290','10024035473','10021961448','10022345720','10022230308','10024041687','10021925602','10022063367','10023577101','10023248832','10023526343','10022082032','10023741531','10023955427','10024035932','10023649136','10001637871','10024032159','10023812808','10023662512','10022012863','10012996765','10023838022','10025658085','10012208993','10024966997','10020963147','10012759459','10009970491','10023671236','10012624867','10011370683','10012047370','10010441934','10024196581','10013153575','10022209563','10012691259','10010414982','10024212742','10024217811','10024220471','10024250730','10010186224','10021961830','10009846213','10010180071','10024270961','10009921003','10024274355','10024330024','10010359016','10009829220','10010968814','10022347895','10010467930','10022259259','10006122062','10010484021','10009489227','10009900142','10010840798','10010870378','10023830837','10010075354','10010874949','10024327004','10006725347','10024077608','10009224516','10022173658','10024432942','10021041052','10023296624','10024386271','10013434120','10010407734','10024141200','10022465380','10024483931','10023887937','10006122058','10023265017','10024624904','10009679469','10024541181','10024542791','10008812126','10008417425','10008936763','10023780838','10008627331','10019446188','10024579008','10025670601','10026056288','10005658273','10011116643','10008140444','10024694250','10024692246','10022182430','10024735639','10023774410','10025074167','10002065171','10025076988','10025167443','10010067344','10010025279','10023263136','10024891215','10024725876','10024830537','10025086775','10014942055','10000027760','10011439681','10012477357','10022188837','10005774102','10024723311','10025947698','10017065434','10023616174','10013878124','10024904660','10019240026','10011700416','10025673616','10025211085','10025216578','10014728608','10013985621','10024603752','10025405625','10016866766','10025250338','10025406640','10024934204','10011238077','10010373976','10022499216','10010956896','10021872649','10006718819','10025507214','10025577720','10014978886','10025955212','10025618325','10025620521','10025620029','10019982419','10025624072','10025630265','10011024674','10009856334','10017153814','10025106044','10017072769','10024083504','10024152495','10001220690','10025654016','10024954404','10012127561','10025750624','10005794979','10022437360','10006720092','10015318303','10024982175','10024997541','10025955229','10010819851','10023770466','10015775037','10025750241','10025967248','10025598400','10009292132','10025905349','10025964908','10023890557','10024023768','10025922631','10010753515','10022440567','10009701201','10023683037','10009102519','10025613734','10023748380','10022483336','10014563187','10000987435','10023885591','10006637270','10016340752','10021837971','10022044835','10010823501','10010444248','10026284711','10025578108','10016610989','10013541702');

--------updates eduquity----


update mothertable_satishsir_latest 
set exam_date='2025-11-15',
shift='1' 
where reg_id in ('10026173938','10000764582','10011858889','10001502781');

update mothertable_satishsir_latest 
set exam_date='2025-11-15',
shift='1' 
where city_code='4001' and exam_date='2025-11-12' and shift='3';---23 updates





WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='1004'
    AND exam_date = '2025-11-12'
    AND shift = '2'
  ORDER BY reg_id
  LIMIT 187
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '3',
city_code='1010',
exam_date='2025-11-12'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='2201'
    AND exam_date = '2025-11-25'
    AND shift = '1'
	and cbe_medium like '%Hindi%'
  ORDER BY reg_id
  LIMIT 3197
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '3',
city_code='2201',
exam_date='2025-11-25'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-12'
    AND shift = '2'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 573
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '1',
city_code='4205',
exam_date='2025-11-30'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-12'
    AND shift = '2'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 572
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '2',
city_code='4205',
exam_date='2025-11-30'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

update mothertable_satishsir_latest 
set city_code='6006'
where city_code='6016' and exam_date='2025-11-12' and shift='3';

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-17'
    AND shift = '1'
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '2',
city_code='4205',
exam_date='2025-11-29'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-17'
    AND shift = '2'
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '2',
city_code='4205',
exam_date='2025-11-29'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-17'
    AND shift = '3'
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '2',
city_code='4205',
exam_date='2025-11-29'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-18'
    AND shift = '1'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '1',
city_code='4205',
exam_date='2025-11-29'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-18'
    AND shift = '2'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '1',
city_code='4205',
exam_date='2025-11-29'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-18'
    AND shift = '3'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '1',
city_code='4205',
exam_date='2025-11-29'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-19'
    AND shift = '3'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '3',
city_code='4205',
exam_date='2025-11-29'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-20'
    AND shift = '1'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '3',
city_code='4205',
exam_date='2025-11-28'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-21'
    AND shift = '1'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '3',
city_code='4205',
exam_date='2025-11-30'
WHERE t.reg_id IN (SELECT reg_id FROM pick);


WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-22'
    AND shift = '1'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '2',
city_code='4205',
exam_date='2025-11-28'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-22'
    AND shift = '3'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 100
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '3',
city_code='4205',
exam_date='2025-11-28'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

update mothertable_satishsir_latest 
set city_code='6006'
where city_code='6016' and exam_date='2025-11-12' and shift='3';


WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4205'
    AND exam_date = '2025-11-24'
    AND shift = '1'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 100
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '2',
city_code='4205',
exam_date='2025-11-29'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='8201'
    AND exam_date = '2025-11-15'
    AND shift = '1'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 200
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '1',
city_code='8201',
exam_date='2025-11-20'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='8201'
    AND exam_date = '2025-11-15'
    AND shift = '1'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 50
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '3',
city_code='8201',
exam_date='2025-11-19'
WHERE t.reg_id IN (SELECT reg_id FROM pick);

WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='8201'
    AND exam_date = '2025-11-15'
    AND shift = '1'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 50
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '2',
city_code='8201',
exam_date='2025-11-20'
WHERE t.reg_id IN (SELECT reg_id FROM pick);


WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='2405'
    AND exam_date = '2025-11-13'
    AND shift = '3'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 500
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '3',
city_code='2405',
exam_date='2025-11-12'
WHERE t.reg_id IN (SELECT reg_id FROM pick);


WITH pick AS (
  SELECT reg_id
  FROM mothertable_satishsir_latest
  WHERE
	city_code='4602'
    AND exam_date = '2025-11-12'
    AND shift = '2'
	and (cbe_medium like '%English%' or cbe_medium like '%Hindi%')
  ORDER BY reg_id
  LIMIT 250
)
UPDATE mothertable_satishsir_latest t
SET 
shift = '2',
city_code='4602',
exam_date='2025-11-17'
WHERE t.reg_id IN (SELECT reg_id FROM pick);







update mothertable_satishsir_latest 
set city_code='2201'
where city_code='2001' ;


select * from mothertable_satishsir_latest_final limit 10;

select count(*) from mothertable_satishsir_latest_final limit 10;-----3063952

select count(*) from chsl_2025_tier1_admit_card limit 10;---3063953

select * from chsl_2025_tier1_admit_card limit 10;

select a.* from chsl_2025_tier1_admit_card a,
mothertable_satishsir_latest_final b 
where a.reg_number=b.reg_id 
and a.examdate<>b.exam_date;---no records

select a.* from chsl_2025_tier1_admit_card a,
mothertable_satishsir_latest_final b 
where a.reg_number=b.reg_id 
and a.shift<>b.shift;---no records

select a.* from chsl_2025_tier1_admit_card a,
mothertable_satishsir_latest_final b 
where a.reg_number=b.reg_id 
and a.venue_city<>b.city_name;

select * from chsl_2025_tier1_venues limit 10;

select count(*) from mothertable_satishsir_latest_final where exam_date='2025-11-12' and shift='1';---8
select * from mothertable_satishsir_latest_final where exam_date='2025-11-12' and shift='1';---8


alter table mothertable_satishsir_latest_final add column category_updated character varying;
alter table mothertable_satishsir_latest_final add column comp_time character varying;

-----------------category updated-----------------------------

update mothertable_satishsir_latest_final set category_updated=
case 
when category='0' then 'EWS'
when category='1' then 'SC'
when category='2' then 'ST'
when category='6' then 'OBC'
when category='9' then 'UR'
end;


select distinct category,category_updated,count(*) from mothertable_satishsir_latest_final
group by category,category_updated;

update mothertable_satishsir_latest_final set category_updated=category_updated ||
case 
when ph_code='4' then '+OH'
when ph_code='5' then '+HH'
when ph_code='7' then '+VH'
when ph_code='8' then '+Others'
end where ph='Yes';

select * from mothertable_satishsir_latest_final where is_pwbd_blindness='Yes' and ph_code<>'7';---1063

update mothertable_satishsir_latest_final set category_updated= category_updated || '+VH' where 
is_pwbd_blindness='Yes' and ph_code<>'7';---1063

select * from mothertable_satishsir_latest_final where suffer_cerebralpalsy='Yes';---8632

update mothertable_satishsir_latest_final set category_updated= category_updated || '+CP/BA' where 
suffer_cerebralpalsy='Yes';---8632

select * from mothertable_satishsir_latest_final where locomotor='Yes';---3214

update mothertable_satishsir_latest_final set category_updated= category_updated || '+LW' where 
locomotor='Yes';---3214

select * from mothertable_satishsir_latest_final where locomotor='Yes' and ph='No';---939

update mothertable_satishsir_latest_final set category_updated= category_updated || '+PwD(Below 40%)' where 
locomotor='Yes' and ph='No';---939

select distinct ex_serviceman,count(*) from mothertable_satishsir_latest_final group by ex_serviceman;---18074

update mothertable_satishsir_latest_final set category_field=category_field || '+ESM' 
where ex_serviceman='Yes';---18074

select * from mothertable_satishsir_latest_final where ex_serviceman='Yes' and exs_res_availed='Yes';

update mothertable_satishsir_latest_final set category_field=replace(category_field,'+ESM','+ESM*')
where ex_serviceman='Yes' 
and exs_res_availed='Yes';---195

------------comp time----------------------------------

select * from mothertable_satishsir_latest_final where (ph_code='7' or is_pwbd_blindness='Yes' or suffer_cerebralpalsy='Yes') and ph='Yes';----17471

update mothertable_satishsir_latest_final set comp_time='Yes'
where (ph_code='7' or is_pwbd_blindness='Yes' or suffer_cerebralpalsy='Yes') and ph='Yes';---17471

--------scribe field updates------------------------
select * from mothertable_satishsir_latest_final where scribe_required='Yes' and ph='Yes' and comp_time ='Yes';---4857

UPDATE mothertable_satishsir_latest_final
SET scribe_field = CONCAT(
    CASE WHEN scribe_required = 'Yes' THEN 'Y' ELSE '' END,
    CASE 
        WHEN own_scribe = 'Yes' THEN '[O]'
        WHEN own_scribe = 'No' THEN '[S]'
        ELSE '' 
    END,
    CASE 
        WHEN scribe_medium = 'English' THEN '[E]'
        WHEN scribe_medium = 'Hindi' THEN '[H]'
        ELSE '' 
    END
)
WHERE scribe_required = 'Yes' 
  AND ph = 'Yes' 
  AND comp_time = 'Yes';------4857


select * from mothertable_satishsir_latest_final where scribe_required='Yes' and ph='Yes' and comp_time is null;---1051

UPDATE mothertable_satishsir_latest_final
SET scribe_field = CONCAT(
    CASE WHEN scribe_required = 'Yes' THEN 'Y' ELSE '' END,
    CASE 
        WHEN own_scribe = 'Yes' THEN '[O]'
        WHEN own_scribe = 'No' THEN '[S]'
        ELSE '' 
    END,
    CASE 
        WHEN scribe_medium = 'English' THEN '[English]'
        WHEN scribe_medium = 'Hindi' THEN '[Hindi]'
        ELSE '' 
    END,
	'Cert Req'
)
WHERE scribe_required = 'Yes' 
  AND ph = 'Yes' 
  AND comp_time is null;---1051

select * from mothertable_satishsir_latest_final where scribe_required='Yes' and ph='No' ;---195

UPDATE mothertable_satishsir_latest_final
SET scribe_field = CONCAT(
    CASE WHEN scribe_required = 'Yes' THEN 'Y' ELSE '' END,
    CASE 
        WHEN own_scribe = 'Yes' THEN '[O]'
        WHEN own_scribe = 'No' THEN '[S]'
        ELSE '' 
    END,
    CASE 
        WHEN scribe_medium = 'English' THEN '[English]'
        WHEN scribe_medium = 'Hindi' THEN '[Hindi]'
        ELSE '' 
    END,
	'Cert-1A Req'
)
WHERE scribe_required = 'Yes' 
  AND ph = 'No';---195

-------time updates------------------------

update mothertable_final
set 
gateclose=
case when shift='1' then '09:30 AM'
when shift='2' then '01:00 PM'
when shift='3' then '04:30 PM'
end,
examtime=
case when shift='1' then '10:00 AM To 11:00 AM'
when shift='2' then '01:30 PM To 02:30 PM'
when shift='3' then '05:00 PM To 06:00 PM'
end,
repotime=
case when shift='1' then '08:30 AM'
when shift='2' then '12:00 PM'
when shift='3' then '03:30 PM'
end
;

update mothertable_final
set examtime=
case when shift='1' then '10:00 AM To 11:20 AM'
when shift='2' then '01:30 PM To 02:50 PM'
when shift='3' then '05:00 PM To 06:20 PM'
end
where comp_time='Yes';

update mothertable_final
set password_for_examination= replace(to_char(dob,'dd/mm/yyyy'),'/','');

update mothertable_final
set examdate1= to_char(exam_date,'dd/mm/yyyy');
---------------------------------------------------------------------

Select * into chsl2025_9149 from mothertable_satishsir_latest_final where 1=0;

update mothertable_satishsir_latest_final_satishsir a
set a.category_field=b.category_field,
a.comp_time=b.comp_time,
a.scribe_field=b.scribe_field
from mothertable_satishsir_latest_final b
where a.reg_id=b.reg_id;



update mothertable_satishsir_latest_final_satishsir a
set a.category_field=b.category_field,
a.comp_time=b.comp_time,
a.scribe_field=b.scribe_field
from chsl2025_9149 b
where a.reg_id=b.reg_id;



update mothertable_final
set 
gateclose=
case when shift='1' then '09:30 AM'
when shift='2' then '01:00 PM'
when shift='3' then '04:30 PM'
end,
examtime=
case when shift='1' then '10:00 AM To 11:00 AM'
when shift='2' then '01:30 PM To 02:30 PM'
when shift='3' then '05:00 PM To 06:00 PM'
end,
repotime=
case when shift='1' then '08:30 AM'
when shift='2' then '12:00 PM'
when shift='3' then '03:30 PM'
end
;

update mothertable_final
set examtime=
case when shift='1' then '10:00 AM To 11:20 AM'
when shift='2' then '01:30 PM To 02:50 PM'
when shift='3' then '05:00 PM To 06:20 PM'
end
where comp_time='Yes';

update mothertable_final a
set a.city_name=b.city_name
from chsle_2025_city_master b
where a.city_code=b.city_code;

select * from chsle_2025_city_master where city_code='1010';

select city_code,count(distinct city_name) from chsle_2025_city_master
group by city_code having count(distinct city_name)>1;----JAMMU,SAMBA

update mothertable_final
set password_for_examination= replace(to_char(dob,'dd/mm/yyyy'),'/','');

update mothertable_final
set examdate1= to_char(exam_date,'dd/mm/yyyy');

alter table mothertable_final add column examdate1 character varying;
alter table mothertable_final add column is_active boolean;
alter table mothertable_final add column remarks character varying;

update mothertable_final a
set 
a.is_active=b.is_active,
a.remarks=b.remarks
from chsl_2025_tier1_admit_card b
where a.reg_id=b.reg_number;

alter table mothertable_final add column dob2 character varying;

update mothertable_final set dob2=dob;

update mothertable_final set dob=to_char(dob2,'dd/mm/yyyy');


do
$$
begin

alter table mothertable_final add column cand_ne_name character varying;
alter table mothertable_final add column father_name character varying;
alter table mothertable_final add column mother_name character varying;
alter table mothertable_final add column identification_mark character varying;
alter table mothertable_final add column present_address character varying;
alter table mothertable_final add column present_district character varying;
alter table mothertable_final add column present_state character varying;
alter table mothertable_final add column present_pincode character varying;
alter table mothertable_final add column mobile character varying;
alter table mothertable_final add column email character varying;
alter table mothertable_final add column additional_kyc character varying;
alter table mothertable_final add column downloaded boolean;
alter table mothertable_final add column number_of_downloads character varying;

end
$$


update mothertable_final a
set
a.cand_ne_name =b."newName",
a.father_name =b."fathersName",
a.mother_name =b."mothersName",
a.identification_mark =b."markOfIdentification",
a.present_address =b."presentAddress",
a.present_district =b."presentDistrictName",
a.present_state =b."presentStateName",
a.present_pincode =b."presentPincode",
a.mobile =b."phoneNo",
a.email =b."emailId",
a.additional_kyc=b."isAdditionalKycDone"
from "chsl2025Applications_12_08_2025_final" b
where a.reg_id=b."registrationNo";

alter table mothertable_final rename column reg_id to reg_number;
alter table mothertable_final rename column cand_ne_name to cand_new_name;

do
$$
begin

alter table mothertable_final add column roll_number character varying;
alter table mothertable_final add column reject_reason character varying;
alter table mothertable_final add column vh_cp_lw character varying;
alter table mothertable_final add column batch character varying;
alter table mothertable_final add column venue_name character varying;
alter table mothertable_final add column venue_address character varying;
alter table mothertable_final add column venue_district character varying;
alter table mothertable_final add column venue_city character varying;
alter table mothertable_final add column venue_state character varying;
alter table mothertable_final add column venue_pincode character varying;


end
$$

with cte as
(select a."registrationNo",b.id as "additionalDetailsId"  from "chsl2025Applications_12_08_2025_final" a,
"additionalDetails" b where a."registrationNo"=b."registrationNo"
and a."registrationNo" in ('10021725421','10000898229','10021565747','10023969021','10026126159','10005959149','10023883430','10025784558','10022463995','10023301003','10024672877','10025478733','10023559621','10025169724','10022014488','10017922049','10025719672','10025822756','10025653262','10012600565','10025368933','10025900354','10024618239','10008011373','10025242129','10022365105','10010943314','10023620147','10000968151','10019499646','10025143229','10026066814','10024605611','10024231586','10017324647','10023812244','10026078828','10022537791','10025384004','10022581907','10022022807','10019639278','10021939932','10021659971','10023798123','10021940865','10011890752','10024518226','10009891824','10023746273','10026201746','10010165817','10012872270','10021686958','10009185370','10025975814','10024465095','10024147938','10023895192','10026045988','10023818806','10000756057','10024234078','10025307668','10022537870','10022274273','10002090406','10023552254','10002107684','10009183170','10008060767','10023579968','10023720929','10024172193','10024162818','10025487733','10023553969','10025719359','10023289993','10025235837','10010921884','10006695306','10025855111','10022057671','10016044953','10025424756','10016407323','10023420544','10024514258','10023480270','10022138880','10021749239','10025245440','10025538330','10025249531','10022033257','10011716335','10023592505','10023901183','10024211628','10012347030','10024048415','10025420989','10022438337','10015437333','10023827341','10025107377','10026026495','10024528957','10011823694','10021768046','10015534938','10021514679','10008378244','10023614480','10022231119','10026122242','10011337960','10018001114','10021739676','10021785266','10025755344','10012314746','10026187782','10025924209','10008540005','10026007883','10025440046','10022578194','10017426726','10025559159','10016463908','10025836317','10022056222','10023946479','10026238104','10025326744','10012115508','10026102272','10016089813','10011050158','10021676959','10013485611','10006681736','10009706619','10021922374','10022177912','10000696124','10023904688','10010707338','10024961552','10023991409','10025084318','10023701393','10024705475','10000676282','10024681830','10025764239','10022201885','10023562466','10023956132','10025720668','10025835528','10010215198','10025197602','10025774474','10001816713','10026131279','10024042991','10022574507','10023919725','10001606028','10022229404','10023658980','10024448583','10023919165','10023455611','10023989465','10014023193','10021873536','10009143923','10008304314','10013536588','10025107357','10025232326','10022244059','10023421211','10024221319','10025180342','10025436227','10024541270','10023499398','10025798702','10012759294','10012551093','10017770161','10025754103','10025827808','10026148242','10023437770','10025487550','10025275346','10021698249','10024583160','10025798636','10025918768','10021752185','10025954649','10014775925','10022512419','10024557843','10025527401','10021943479','10024440867','10025377749','10025925359','10026118202','10012271801','10000660687','10023464775','10023780605','10023318675','10022520161','10025837608','10006622040','10021979254','10023456771','10025716027','10015489372','10024672542','10013122313','10023390272','10011718222','10025578184','10014567172','10024670732','10017378012','10013517044','10023314119','10021984720','10012950805','10023961514','10009252107','10016937751','10001055106','10025073411','10009440824','10023631673','10023605303','10025447564','10010355988','10022491691','10024211908','10006585330','10009536826','10013632140','10016804389','10026064647','10010420863','10021792713','10017616729','10023734728','10024178493','10020829002','10001089083','10022049718','10021705430','10012538561','10025914973','10024023604','10024210776','10017307571','10023500534','10022566248','10010149371','10008528318','10025408783','10025565546','10018634595','10024912697','10015678457','10009361168','10012034826','10022363191','10022374757','10023726511','10022480653','10017455082','10025070429','10026077359','10024320939','10022574664','10024282317','10021991388','10025450160','10014410978','10025850905','10026253921','10010888964','10008462985','10023304263','10024052967','10014427990','10025226987','10025959601','10025843654','10018724415','10026270810','10013224499','10026168065','10025345077','10008694605','10008948710','10025108201','10023955774','10021792664','10023664131','10021501913','10009094523','10023692074','10001201678','10012068531','10022334060','10023945475','10026249680','10020659415','10017146946','10012932790','10025649606','10021818722','10021706880','10023797067','10025833630','10024437569','10012015779','10020081905','10025920313','10023737956','10014450002','10013973262','10024375909','10024488233','10024044688','10018487475','10024418358','10016457079','10025716765','10009364458','10026168994','10023636034','10022339067','10012761972','10025516891','10016194633','10023776573','10024029147','10001764271','10001001275','10023572012','10024135501','10024394177','10021613369','10026106355','10022095249','10010792870','10024422197','10017788882','10025881886','10025108071','10025236209','10024999039','10024355326','10011481937','10021640883','10001144860','10017297530','10025062347','10023402736','10022074266','10025796637','10023469556','10013587485','10025941485','10025197746','10015476444','10025233983','10011734876','10025909807','10023983376','10024814260','10024570925','10022176591','10023787910','10026223214','10025273481','10024377104','10001638824','10024181314','10022111343','10023597957','10025185963','10022377336','10026097355','10012003061','10024562496','10026287926','10012549660','10025184022','10026184462','10022245450','10023816953','10024064972','10025037252','10025241805','10022405144','10024494531','10022315785','10024776053','10025826555','10009809596','10023916501','10021696955','10023441781','10023469259','10005636457','10025375615','10013214334','10012560140','10024313970','10022558716','10010845227','10026280616','10009623902','10001706314','10019810553','10025253224','10025416921','10009755816','10022152431','10024473541','10008488044','10014762640','10011502176','10017171168','10023695945','10001169129','10022077756','10024272031','10010201387','10008343082','10012357340','10023280916','10025039997','10001615787','10008900145','10008492254','10025065893','10012205976','10021750277','10026157865','10023931044','10025084809','10025785608','10024410533','10023547423','10015267534','10022412034','10023827999','10024496781','10023509960','10024627172','10014290524','10023501764','10024576523','10025219248','10025964934','10023816034','10023889340','10024125704','10024263428','10013007889','10024496643','10023811089','10013604548','10026056569','10011898593','10021956062','10023894523','10021903345','10009955002','10024029329','10024091998','10011528991','10025088012','10024440778','10008387103','10024223211','10023555495','10018141664','10001630347','10017308364','10024750808','10023627827','10025178232','10024197528','10022223258','10022010912','10024595539','10021991855','10025901658','10005697676','10009503923','10021683517','10022524102','10025556552','10010524628','10022267845','10011465417','10023499001','10025032634','10013624230','10025504682','10026130789','10022233546','10016276267','10021653014','10000070473','10001819794','10023912234','10022353066','10001786960','10025329647','10024820587','10025829504','10023456949','10023626106','10023994057','10023761479','10021629040','10022230157','10013521622','10025094154','10025335175','10021940156','10024768624','10020571439','10023759387','10025836361','10025897373','10021820480','10024274804','10023565855','10023711426','10025317233','10025897071','10023811327','10017873512','10025100998','10001661440','10025427476','10022302337','10009578780','10022306151','10024660168','10024068960','10016779446','10024642686','10025189715','10016492723','10023629110','10018205069','10021620020','10023374818','10024061260','10024603282','10012943762','10024000472','10025746238','10022379089','10022525497','10009068442','10025869086','10025592373','10022296668','10012494157','10023559510','10012443186','10024681949','10025110305','10009907245','10025614937','10000902644','10009128066','10025501263','10014552426','10025140990','10023589414','10024270960','10025493562','10010201381','10021733779','10025401804','10025831617','10021675915','10022160543','10025372858','10026236258','10025135642','10022178126','10008942238','10024559324','10013212439','10026081792','10005775685','10021930090','10024169287','10023726178','10025725816','10025878173','10011038760','10010558002','10025110339','10024310365','10000077847','10023671812','10006484405','10017568455','10023709957','10026101163','10026123357','10022061199','10011975638','10008179230','10022038619','10026166452','10016051191','10009079468','10024226762','10000864024','10025324336','10025751697','10018507262','10026100428','10024963144','10008316899','10012615608','10021935742','10022330552','10023948596','10011260101','10009817460','10014050261','10023999721','10023954996','10024938517','10008306479','10014412958','10018660339','10025485332','10023658924','10011603004','10010576169','10016103032','10023748678','10024597325','10005772661','10012327178','10021971823','10024127692','10015662817','10012568193','10021981754','10010199181','10005938596','10010725353','10010247126','10025841975','10023820140','10010354099','10008785255','10009478388','10022496233','10014007634','10020305970','10025411237','10026088795','10024747212','10024328166','10009037836','10025569530','10016174733','10022060387','10025251988','10025862352','10021966483','10023557791','10023637267','10025881802','10009310410','10025055940','10024647336','10021690135','10025996657','10025713753','10024554487','10022187397','10020081753','10026158274','10010762202','10023321688','10017495340','10009617656','10024047499','10024609636','10024400184','10025332245','10025688869','10025398945','10024343385','10013248937','10025631815','10024405755','10025325270','10023643900','10024415601','10024497226','10025390532','10026096135','10026019812','10025153025','10023260130','10023502029','10008093201','10021963897','10012441741','10025127877','10013094931','10023296184','10025343729','10014081103','10022205010','10023686454','10023931691','10024154603','10016591657','10022317108','10024417790','10009984589','10024274968','10015694507','10015383685','10023713891','10023648609','10022491972','10000975622','10021991868','10025637755','10022457315','10001647355','10017043874','10012004964','10024147795','10008502378','10005743567','10024036321','10001228559','10021931072','10025300641','10012774650','10013109088','10024218772','10024607666','10023489998','10026205893','10022048188','10025473476','10024427271','10023962496','10025851135','10025185252','10009470748','10025221319','10009821450','10011880745','10025393675','10022041729','10021670333','10025577740','10026219628','10016369118','10021912517','10023734279','10022150191','10024031801','10023912062','10025701250','10020850867','10025357758','10022177062','10023830547','10024615864','10024903905','10026011522','10025741514','10026169502','10026256823','10024290182','10002146255','10023826218','10023270367','10023284980','10020517955','10021007506','10010514845','10022425736','10023691123','10024338745','10022356471','10010554905','10026009356','10018873550','10024968680','10026236468','10025033977','10024368455','10022099425','10025010284','10024785336','10024392566','10025376532','10026282802','10022003716','10025044783','10009531335','10025473365','10025209606','10022217094','10016558159','10022071295','10023764412','10013763653','10025616196','10026079721','10022332562','10025763361','10025510435','10005673586','10026311676','10011318123','10023614728','10024335937','10014369546','10025378567','10023621824','10017202278','10023570101','10022428665','10024229995','10023286151','10024033682','10024755068','10021737975','10023764137','10024350382','10023591821','10025807771','10017481022','10022481561','10021906113','10025171743','10023737897','10022034453','10016105153','10023796251','10026291175','10011128248','10009314808','10025212115','10025298196','10023397904','10025768686','10017410220','10022492151')
)

select cte.*,c.* from 
addresses c,cte
where cte."additionalDetailsId"=c."additionalDetailId";


update mothertable_final set venue_city=city_name;




'10002051319','10009931072','10001001477','10001796195','10000874491','10009747865','10011845934','10006509473','10000780901','10001005916','10001361075','10001279405'




'10017511308','10024342400','10024644235','10020714502','10023258135','10025878583','10024927398','10017702386','10026196977','10017673222','10021852384','10012216155','10009137627','10008030577','10014009954','10008048778','10010115937','10001051521','10010072303','10012171413','10023881135','10010066123','10010582399','10012212709','10022215347','10009475343','10010028048','10023884357','10022213133','10012054805','10009270914','10023367779','10023510801','10024191139','10021899881','10017590895','10026247071','10024869786','10025191251','10017669007','10017740981','10021197930','10025137112','10024115682','10014992149','10000849878','10010586182','10001589657','10000794603','10010492990','10012101053','10024550360','10011499984','10023637679','10023494105','10009417541','10024915897','10024438420','10024386271','10005658273','10013183202','10025538294','10002051319','10000149495','10024115469','10025586109','10020964897','10025117994','10025732246','10024669125','10025360335','10025511669','10023274478','10024669141','10025510406','10000830382','10005913457','10022087619','10023523144','10012074655','10021924773','10009462251','10025104353','10024919870','10023737193','10020963147','10009931072','10023606607','10001001477','10017875603','10001022110','10018787503','10025951865','10017046760','10025884602','10026179411','10025937290','10020507181','10021993121','10024829763','10021132898','10018532504','10024241807','10020414817','10010456767','10000700180','10000790149','10000908731','10010122913','10001063795','10023832917','10024473897','10025105065','10023420646','10023796469','10023756435','10024569137','10009856334','10024696543','10025166424','10020104810','10019911666','10026190322','10024404343','10021009453','10026250512','10021940004','10024820965','10026077556','10022301315','10010129028','10008548026','10008053487','10010733108','10012094688','10000830117','10023752357','10023801345','10012797616','10024474289','10023832705','10009250250','10023317767','10012467806','10023832605','10023607914','10021082398','10017342488','10025164071','10024643634','10021235032','10017557046','10024466973','10025294113','10021330660','10024261904','10020389174','10006657762','10009365911','10000838230','10014874666','10015177619','10002051011','10009585148','10008104376','10008115476','10009379755','10015741623','10005650007','10006113695','10021988060','10023879925','10023884298','10012798384','10024914791','10010034045','10024389708','10024387456','10010008403','10010079724','10023390396','10009251677','10001796195','10019783976','10025185210','10017383046','10024958490','10021832373','10025452409','10021208608','10025434990','10023782744','10024260364','10017301110','10015616854','10015270894','10009895573','10012409718','10014288700','10011055808','10001062134','10012200943','10023879756','10010190436','10010114795','10009479724','10024913839','10012156594','10021924224','10021957157','10023399388','10001077859','10009927544','10023883741','10023833310','10023878866','10024563775','10022061070','10012005472','10000874491','10026092274','10022118399','10018999582','10026043492','10020172714','10023362762','10022556146','10026020975','10025855004','10025600266','10025623645','10026078978','10024257694','10024254577','10000827823','10005478784','10011212639','10012052637','10023882102','10023834294','10023834753','10023882653','10012009011','10023314284','10023342936','10010595924','10025104712','10016564798','10012101710','10023349505','10009847134','10024547703','10023331749','10021893326','10012127561','10009747865','10010048356','10024381128','10025676209','10022183141','10021211808','10020759737','10026020291','10026065559','10025653002','10025622959','10025622468','10025198657','10025510350','10010113034','10001216881','10005927915','10012061899','10012073818','10021913664','10023647290','10023733892','10010055445','10023882580','10001022288','10009481190','10017149024','10026162346','10017018026','10011845934','10006509473','10025359043','10019591894','10025195824','10025994178','10025078553','10026254351','10025203028','10025199902','10008151980','10008180278','10009522768','10005751407','10008452149','10009429897','10013574473','10005813208','10014164643','10023833642','10012370028','10011501179','10023882093','10000139089','10024385741','10023336318','10025101538','10023608615','10024919982','10012155280','10022058170','10000972846','10000780901','10024458849','10019987295','10025295537','10020378846','10025288510','10025820586','10018983839','10019049817','10017692448','10018292250','10021159115','10011029297','10014621028','10012926846','10001289959','10010691213','10001111778','10010078668','10023883368','10012022384','10000932086','10001730696','10025358191','10025597730','10024382076','10021859379','10020011916','10017154938','10025488815','10026206421','10025620441','10025511006','10008721457','10001831156','10012256365','10012473061','10022022422','10012179473','10023800407','10009931599','10010136880','10023398333','10022002108','10001005916','10001361075','10024631749','10023489811','10024666880','10020249280','10025211837','10025275938','10025695972','10020680636','10022414934','10024261536','10024673165','10009142764','10001319727','10014630842','10012141899','10008105545','10000981741','10012193345','10023636200','10023493048','10023802560','10023837310','10023833397','10012150239','10010128135','10010195384','10024447008','10021854966','10023392930','10024904358','10024896686','10017706966','10025677398','10001768186','10005642481','10008176183','10001028008','10023770987','10001023031','10010203084','10023801981','10021631047','10023329851','10012765544','10023879510','10021912417','10009824654','10024017522','10024625952','10017698718','10020908648','10026170861','10026111284','10025397488','10017324904','10017737944','10024259187','10022564822','10001246743','10005935641','10010824476','10000884164','10013787979','10009988204','10022004112','10022220728','10012188729','10000034890','10023835837','10009785187','10023835096','10022051546','10023802000','10025102707','10022082032','10022172953','10001279405','10024045360','10025847009','10020685044','10024387198','10022478900','10025998859','10026292686','10002068598','10000052644','10014748970','10012529096','10001730744','10000732583','10010100099','10006110436','10008157321','10010737463','10022000791','10012069108','10012062631','10009941052','10021900704','10009407207','10024436468','10009283778','10024547753','10012112145','10005667886','10000093984'





select * from chsl_2025_tier1_admit_card where reg_number in
('10017511308','10024342400','10024644235','10020714502','10023258135','10025878583','10024927398','10017702386','10026196977','10017673222','10021852384','10012216155','10009137627','10008030577','10014009954','10008048778','10010115937','10001051521','10010072303','10012171413','10023881135','10010066123','10010582399','10012212709','10022215347','10009475343','10010028048','10023884357','10022213133','10012054805','10009270914','10023367779','10023510801','10024191139','10021899881','10017590895','10026247071','10024869786','10025191251','10017669007','10017740981','10021197930','10025137112','10024115682','10014992149','10000849878','10010586182','10001589657','10000794603','10010492990','10012101053','10024550360','10011499984','10023637679','10023494105','10009417541','10024915897','10024438420','10024386271','10005658273','10013183202','10025538294','10002051319','10000149495','10024115469','10025586109','10020964897','10025117994','10025732246','10024669125','10025360335','10025511669','10023274478','10024669141','10025510406','10000830382','10005913457','10022087619','10023523144','10012074655','10021924773','10009462251','10025104353','10024919870','10023737193','10020963147','10009931072','10023606607','10001001477','10017875603','10001022110','10018787503','10025951865','10017046760','10025884602','10026179411','10025937290','10020507181','10021993121','10024829763','10021132898','10018532504','10024241807','10020414817','10010456767','10000700180','10000790149','10000908731','10010122913','10001063795','10023832917','10024473897','10025105065','10023420646','10023796469','10023756435','10024569137','10009856334','10024696543','10025166424','10020104810','10019911666','10026190322','10024404343','10021009453','10026250512','10021940004','10024820965','10026077556','10022301315','10010129028','10008548026','10008053487','10010733108','10012094688','10000830117','10023752357','10023801345','10012797616','10024474289','10023832705','10009250250','10023317767','10012467806','10023832605','10023607914','10021082398','10017342488','10025164071','10024643634','10021235032','10017557046','10024466973','10025294113','10021330660','10024261904','10020389174','10006657762','10009365911','10000838230','10014874666','10015177619','10002051011','10009585148','10008104376','10008115476','10009379755','10015741623','10005650007','10006113695','10021988060','10023879925','10023884298','10012798384','10024914791','10010034045','10024389708','10024387456','10010008403','10010079724','10023390396','10009251677','10001796195','10019783976','10025185210','10017383046','10024958490','10021832373','10025452409','10021208608','10025434990','10023782744','10024260364','10017301110','10015616854','10015270894','10009895573','10012409718','10014288700','10011055808','10001062134','10012200943','10023879756','10010190436','10010114795','10009479724','10024913839','10012156594','10021924224','10021957157','10023399388','10001077859','10009927544','10023883741','10023833310','10023878866','10024563775','10022061070','10012005472','10000874491','10026092274','10022118399','10018999582','10026043492','10020172714','10023362762','10022556146','10026020975','10025855004','10025600266','10025623645','10026078978','10024257694','10024254577','10000827823','10005478784','10011212639','10012052637','10023882102','10023834294','10023834753','10023882653','10012009011','10023314284','10023342936','10010595924','10025104712','10016564798','10012101710','10023349505','10009847134','10024547703','10023331749','10021893326','10012127561','10009747865','10010048356','10024381128','10025676209','10022183141','10021211808','10020759737','10026020291','10026065559','10025653002','10025622959','10025622468','10025198657','10025510350','10010113034','10001216881','10005927915','10012061899','10012073818','10021913664','10023647290','10023733892','10010055445','10023882580','10001022288','10009481190','10017149024','10026162346','10017018026','10011845934','10006509473','10025359043','10019591894','10025195824','10025994178','10025078553','10026254351','10025203028','10025199902','10008151980','10008180278','10009522768','10005751407','10008452149','10009429897','10013574473','10005813208','10014164643','10023833642','10012370028','10011501179','10023882093','10000139089','10024385741','10023336318','10025101538','10023608615','10024919982','10012155280','10022058170','10000972846','10000780901','10024458849','10019987295','10025295537','10020378846','10025288510','10025820586','10018983839','10019049817','10017692448','10018292250','10021159115','10011029297','10014621028','10012926846','10001289959','10010691213','10001111778','10010078668','10023883368','10012022384','10000932086','10001730696','10025358191','10025597730','10024382076','10021859379','10020011916','10017154938','10025488815','10026206421','10025620441','10025511006','10008721457','10001831156','10012256365','10012473061','10022022422','10012179473','10023800407','10009931599','10010136880','10023398333','10022002108','10001005916','10001361075','10024631749','10023489811','10024666880','10020249280','10025211837','10025275938','10025695972','10020680636','10022414934','10024261536','10024673165','10009142764','10001319727','10014630842','10012141899','10008105545','10000981741','10012193345','10023636200','10023493048','10023802560','10023837310','10023833397','10012150239','10010128135','10010195384','10024447008','10021854966','10023392930','10024904358','10024896686','10017706966','10025677398','10001768186','10005642481','10008176183','10001028008','10023770987','10001023031','10010203084','10023801981','10021631047','10023329851','10012765544','10023879510','10021912417','10009824654','10024017522','10024625952','10017698718','10020908648','10026170861','10026111284','10025397488','10017324904','10017737944','10024259187','10022564822','10001246743','10005935641','10010824476','10000884164','10013787979','10009988204','10022004112','10022220728','10012188729','10000034890','10023835837','10009785187','10023835096','10022051546','10023802000','10025102707','10022082032','10022172953','10001279405','10024045360','10025847009','10020685044','10024387198','10022478900','10025998859','10026292686','10002068598','10000052644','10014748970','10012529096','10001730744','10000732583','10010100099','10006110436','10008157321','10010737463','10022000791','10012069108','10012062631','10009941052','10021900704','10009407207','10024436468','10009283778','10024547753','10012112145','10005667886','10000093984');

select * into chsl_2025_tier1_admit_card_bkp_7nov from chsl_2025_tier1_admit_card;

update chsl_2025_tier1_admit_card
set venue_city='SAMBA' where reg_number in
('10017511308','10024342400','10024644235','10020714502','10023258135','10025878583','10024927398','10017702386','10026196977','10017673222','10021852384','10012216155','10009137627','10008030577','10014009954','10008048778','10010115937','10001051521','10010072303','10012171413','10023881135','10010066123','10010582399','10012212709','10022215347','10009475343','10010028048','10023884357','10022213133','10012054805','10009270914','10023367779','10023510801','10024191139','10021899881','10017590895','10026247071','10024869786','10025191251','10017669007','10017740981','10021197930','10025137112','10024115682','10014992149','10000849878','10010586182','10001589657','10000794603','10010492990','10012101053','10024550360','10011499984','10023637679','10023494105','10009417541','10024915897','10024438420','10024386271','10005658273','10013183202','10025538294','10002051319','10000149495','10024115469','10025586109','10020964897','10025117994','10025732246','10024669125','10025360335','10025511669','10023274478','10024669141','10025510406','10000830382','10005913457','10022087619','10023523144','10012074655','10021924773','10009462251','10025104353','10024919870','10023737193','10020963147','10009931072','10023606607','10001001477','10017875603','10001022110','10018787503','10025951865','10017046760','10025884602','10026179411','10025937290','10020507181','10021993121','10024829763','10021132898','10018532504','10024241807','10020414817','10010456767','10000700180','10000790149','10000908731','10010122913','10001063795','10023832917','10024473897','10025105065','10023420646','10023796469','10023756435','10024569137','10009856334','10024696543','10025166424','10020104810','10019911666','10026190322','10024404343','10021009453','10026250512','10021940004','10024820965','10026077556','10022301315','10010129028','10008548026','10008053487','10010733108','10012094688','10000830117','10023752357','10023801345','10012797616','10024474289','10023832705','10009250250','10023317767','10012467806','10023832605','10023607914','10021082398','10017342488','10025164071','10024643634','10021235032','10017557046','10024466973','10025294113','10021330660','10024261904','10020389174','10006657762','10009365911','10000838230','10014874666','10015177619','10002051011','10009585148','10008104376','10008115476','10009379755','10015741623','10005650007','10006113695','10021988060','10023879925','10023884298','10012798384','10024914791','10010034045','10024389708','10024387456','10010008403','10010079724','10023390396','10009251677','10001796195','10019783976','10025185210','10017383046','10024958490','10021832373','10025452409','10021208608','10025434990','10023782744','10024260364','10017301110','10015616854','10015270894','10009895573','10012409718','10014288700','10011055808','10001062134','10012200943','10023879756','10010190436','10010114795','10009479724','10024913839','10012156594','10021924224','10021957157','10023399388','10001077859','10009927544','10023883741','10023833310','10023878866','10024563775','10022061070','10012005472','10000874491','10026092274','10022118399','10018999582','10026043492','10020172714','10023362762','10022556146','10026020975','10025855004','10025600266','10025623645','10026078978','10024257694','10024254577','10000827823','10005478784','10011212639','10012052637','10023882102','10023834294','10023834753','10023882653','10012009011','10023314284','10023342936','10010595924','10025104712','10016564798','10012101710','10023349505','10009847134','10024547703','10023331749','10021893326','10012127561','10009747865','10010048356','10024381128','10025676209','10022183141','10021211808','10020759737','10026020291','10026065559','10025653002','10025622959','10025622468','10025198657','10025510350','10010113034','10001216881','10005927915','10012061899','10012073818','10021913664','10023647290','10023733892','10010055445','10023882580','10001022288','10009481190','10017149024','10026162346','10017018026','10011845934','10006509473','10025359043','10019591894','10025195824','10025994178','10025078553','10026254351','10025203028','10025199902','10008151980','10008180278','10009522768','10005751407','10008452149','10009429897','10013574473','10005813208','10014164643','10023833642','10012370028','10011501179','10023882093','10000139089','10024385741','10023336318','10025101538','10023608615','10024919982','10012155280','10022058170','10000972846','10000780901','10024458849','10019987295','10025295537','10020378846','10025288510','10025820586','10018983839','10019049817','10017692448','10018292250','10021159115','10011029297','10014621028','10012926846','10001289959','10010691213','10001111778','10010078668','10023883368','10012022384','10000932086','10001730696','10025358191','10025597730','10024382076','10021859379','10020011916','10017154938','10025488815','10026206421','10025620441','10025511006','10008721457','10001831156','10012256365','10012473061','10022022422','10012179473','10023800407','10009931599','10010136880','10023398333','10022002108','10001005916','10001361075','10024631749','10023489811','10024666880','10020249280','10025211837','10025275938','10025695972','10020680636','10022414934','10024261536','10024673165','10009142764','10001319727','10014630842','10012141899','10008105545','10000981741','10012193345','10023636200','10023493048','10023802560','10023837310','10023833397','10012150239','10010128135','10010195384','10024447008','10021854966','10023392930','10024904358','10024896686','10017706966','10025677398','10001768186','10005642481','10008176183','10001028008','10023770987','10001023031','10010203084','10023801981','10021631047','10023329851','10012765544','10023879510','10021912417','10009824654','10024017522','10024625952','10017698718','10020908648','10026170861','10026111284','10025397488','10017324904','10017737944','10024259187','10022564822','10001246743','10005935641','10010824476','10000884164','10013787979','10009988204','10022004112','10022220728','10012188729','10000034890','10023835837','10009785187','10023835096','10022051546','10023802000','10025102707','10022082032','10022172953','10001279405','10024045360','10025847009','10020685044','10024387198','10022478900','10025998859','10026292686','10002068598','10000052644','10014748970','10012529096','10001730744','10000732583','10010100099','10006110436','10008157321','10010737463','10022000791','10012069108','10012062631','10009941052','10021900704','10009407207','10024436468','10009283778','10024547753','10012112145','10005667886','10000093984');

update mothertable_final
set city_code='2405',
city_name='JAIPUR',
--examdate='2025-11-20',
--examdate1='20/11/2025',
--shift='',
where reg_number in ('10025318779','10009698767');

update mothertable_final
set city_code='7001',
city_name='AHMEDABAD'
--examdate='2025-11-20',
--examdate1='20/11/2025',
--shift='',
where reg_number in ('10008866038');


-----------------------region update-----------------------------------

UPDATE mothertable_final
Set region='NWR' where city_code in ('1004','1005','1007','1010','1202','1203','1401','1402','1403','1404','1601');

UPDATE mothertable_final
Set region='NR' where city_code in ('2002','2003','2006','2201','2404','2405','2406','2411');

UPDATE mothertable_final
Set region='CR' where city_code in ('3001','3003','3005','3007','3008','3009','3010','3011','3013','3201','3203','3205','3206');

UPDATE mothertable_final
Set region='ER' where city_code in ('4001','4205','4206','4207','4404','4410','4415','4417','4426','4601','4602','4604','4605','4609','4610','4802','9999');

UPDATE mothertable_final
Set region='NER' where city_code in ('5001','5102','5105','5107','5112','5301','5302','5401','5501','5502','5601','5701');

UPDATE mothertable_final
Set region='MPR' where city_code in ('6001','6005','6006','6007','6014','6015','6202','6204','6205');

UPDATE mothertable_final
Set region='WR' where city_code in ('7001','7002','7006','7007','7011','7012','7201','7202','7203','7204','7205','7206','7207','7208','7214','7801');

UPDATE mothertable_final
Set region='SR' where city_code in ('8001','8003','8004','8006','8007','8008','8009','8010','8016','8201','8202','8204','8205','8206','8207','8208','8209','8601','8603','8604');

UPDATE mothertable_final
Set region='KKR' where city_code in ('9001','9002','9005','9008','9009','9010','9011','9012','9202','9205','9206','9210','9211','9212','9213','9401');



------------------------------------------------------------------------------------

update mothertable_final a
set a.present_address=b.present_address,
a.present_state=b.present_state,
a.present_district=b.present_district,
a.present_pincode=b.present_pincode
from present_address_833 b
where a.reg_number=b.reg_number;


alter table mothertable_final add column old_center_code character varying;
alter table mothertable_final add column region character varying;

--------center_code of admit_card_table is city_code in mother_table-----------




UPDATE mothertable_final
Set region='01' where city_code in ('1004','1005','1007','1010','1202','1203','1401','1402','1403','1404','1601');

UPDATE mothertable_final
Set region='02' where city_code in ('2002','2003','2006','2201','2404','2405','2406','2411');

UPDATE mothertable_final
Set region='03' where city_code in ('3001','3003','3005','3007','3008','3009','3010','3011','3013','3201','3203','3205','3206');

UPDATE mothertable_final
Set region='04' where city_code in ('4001','4205','4206','4207','4404','4410','4415','4417','4426','4601','4602','4604','4605','4609','4610','4802','9999');

UPDATE mothertable_final
Set region='05' where city_code in ('5001','5102','5105','5107','5112','5301','5302','5401','5501','5502','5601','5701');

UPDATE mothertable_final
Set region='06' where city_code in ('6001','6005','6006','6007','6014','6015','6202','6204','6205');

UPDATE mothertable_final
Set region='07' where city_code in ('7001','7002','7006','7007','7011','7012','7201','7202','7203','7204','7205','7206','7207','7208','7214','7801');

UPDATE mothertable_final
Set region='08' where city_code in ('8001','8003','8004','8006','8007','8008','8009','8010','8016','8201','8202','8204','8205','8206','8207','8208','8209','8601','8603','8604');

UPDATE mothertable_final
Set region='09' where city_code in ('9001','9002','9005','9008','9009','9010','9011','9012','9202','9205','9206','9210','9211','9212','9213','9401');









-----------------------------------------7 nov night updates----------------------------------------

create table chsl_2025_venues
(sr_no integer,
 EDU_CODE character varying,
 REGION character varying,
 STATE character varying,
 CENTRE_CODE character varying,
 ADVERTISED_CITY character varying,
 TC_CODE character varying,
 VENUE_NAME character varying,
 VENUE_ADDRESS character varying,
 PINCODE character varying,
 ACTUAL_CITY character varying,
 ACTUAL_STATE character varying
);


update mother_table_satishsir_7nov a
set 
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_city=b.actual_city,
a.venue_state=b.actual_state,
a.venue_pincode=b.pincode
from chsl_2025_venues b
where a.venue_code=b.tc_code;


"30103"	5481
"40101"	5743
"40203"	8141
"40204"	7091
"40205"	1110
"40303"	12283

update mother_table_satishsir_7nov
set venue_code='030103',
venue_name='HIMALAYAN UNIVERSITY',
venue_address='JULLANG VILLAGE, NEAR CENTRAL JAIL, ITANAGAR, DIST. PAPUMPARE, ARUNACHAL PRADESH-791111',
venue_city='ITANAGAR',
venue_state='ARUNACHAL PRADESH',
venue_pincode='791111'
where venue_code='30103';---5481

update mother_table_satishsir_7nov
set venue_code='040101',
venue_name='DIGITAL LOUNGE DIBRUGARH UNIVERSITY',
venue_address='DIGITAL LOUNGE, DIBRUGARH,ASSAM-786004',
venue_city='DIBRUGARH',
venue_state='ASSAM',
venue_pincode='786004'
where venue_code='40101';---5743

update mother_table_satishsir_7nov
set venue_code='040203',
venue_name='BINAPANI ONLINE CENTER',
venue_address='GANAK MIKIR PATH, OPPOSITE PAIGGIO SHOWROOM , HENGRABARI , GUWAHATI ,ASSAM - 781036',
venue_city='GUWAHATI',
venue_state='ASSAM',
venue_pincode='781036'
where venue_code='40203';---8141

update mother_table_satishsir_7nov
set venue_code='040204',
venue_name='COMPUTER PRO',
venue_address='NEAR MODERN ENGLISH SCHOOL SURUJ NAGAR PATH, KAHILIPARA, GUWAHATI - 781019',
venue_city='GUWAHATI',
venue_state='ASSAM',
venue_pincode='781019'
where venue_code='40204';---7091

update mother_table_satishsir_7nov
set venue_code='040205',
venue_name='FUTURE TECH EDUCATION',
venue_address='HOUSE NO. 27, FIRST FLOOR, ODALBAKRA MAIN ROAD, KAHILIPARA, NEAR SABITRI BHARALI SCHOOL. GUWAHATI, ASSAM - 781034',
venue_city='GUWAHATI',
venue_state='ASSAM',
venue_pincode='781034'
where venue_code='40205';---1110

update mother_table_satishsir_7nov
set venue_code='040303',
venue_name='NORTHEAST INFOSYS',
venue_address='A.T. ROAD, AJANTA HALL, BY PASS RD, TINIALI, JORHAT, ASSAM - 785006',
venue_city='JORHAT',
venue_state='ASSAM',
venue_pincode='785006'
where venue_code='40303';---12283

update mothertable_final a
set a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_city=b.venue_city,
a.venue_address=b.venue_address,
a.venue_state=b.venue_state,
a.venue_pincode=b.venue_pincode
from mother_table_satishsir_7nov b
where a.reg_number=b.reg_id;----3073101

update mothertable_final a
set a.roll_number=b.roll_number,
a.region=b.region
from mother_table_satishsir_7nov b
where a.reg_number=b.reg_id;---3073101


select distinct venue_code ,count(*) from mothertable_final where venue_pincode is null
group by venue_code;---no records

select distinct venue_code ,count(*) from mothertable_final where venue_city is null
group by venue_code;---no records

select distinct venue_code ,count(*) from mothertable_final where venue_state is null
group by venue_code;---no records

select distinct venue_code ,count(*) from mothertable_final where venue_name is null
group by venue_code;---no records

select distinct venue_code ,count(*) from mothertable_final where venue_address is null
group by venue_code;---no records

---------------------------------feedback-------------------------------------------

create table chsl_2025_feedback_529
(
	reg_number character varying,
	NewexamDate date,
	NewexamDate1 character varying,
	NewShift character varying,
	venue_code character varying,
	venue_name character varying,
	venue_address character varying,
	venue_city character varying,
	venue_state character varying,
	venue_pincode character varying
);

update chsl_2025_tier1_admit_card a
set
a.venue_city=b.venue_city,
a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_pincode=b.venue_pincode,
a.venue_state=b.venue_state,
a.examdate=b.newexamdate,
a.examdate1=b.newexamdate1,
a.shift=b.newshift
from chsl_2025_feedback_529 b
where a.reg_number=b.reg_number;---529

update chsl_2025_tier1_admit_card
set examdate1=replace(examdate1,'-','/')
where remarks='feedabck 528';



update chsl_2025_tier1_admit_card
set 
gateclose=
case when shift='1' then '09:30 AM'
when shift='2' then '01:00 PM'
when shift='3' then '04:30 PM'
end,
examtime=
case when shift='1' then '10:00 AM To 11:00 AM'
when shift='2' then '01:30 PM To 02:30 PM'
when shift='3' then '05:00 PM To 06:00 PM'
end,
repotime=
case when shift='1' then '08:30 AM'
when shift='2' then '12:00 PM'
when shift='3' then '03:30 PM'
end
where remarks='feedabck 528';

update chsl_2025_tier1_admit_card
set examtime=
case when shift='1' then '10:00 AM To 11:20 AM'
when shift='2' then '01:30 PM To 02:50 PM'
when shift='3' then '05:00 PM To 06:20 PM'
end
where comp_time='Yes'
and remarks='feedabck 528' ;

update chsl_2025_tier1_admit_card
set examdate1=replace(examdate1,'-','/')
where remarks='feedabck 528';


WITH pick AS (
  SELECT reg_number
  FROM chsl_2025_tier1_admit_card
  WHERE
	--venue_name = 'MOHAMED SATHAK COLLEGE OF ARTS & SCIENCE'
     venue_code = '170207'
    AND examdate   = '2025-11-15'
    AND shift = '1'
  ORDER BY reg_number
  LIMIT 420
)
UPDATE chsl_2025_tier1_admit_card t
SET 
shift = '1',
venue_code='170205',
venue_name ='E-TALENT',
venue_address ='NO. 3, BELMAR ESTATE, NEAR CHRIST UNIVERSITY YESHWANTHPUR CAMPUS,NAGASANDRA CROSS, NAGASANDRA MAIN ROAD, AMARAVATHI LAYOUT, NALAGADDERANAHALLI, PEENYA, BENGALURU, KARNATAKA-560073',
venue_pincode='560073',
remarks_new='BENGALURU from 170207 to  170205'
WHERE t.reg_number IN (SELECT reg_number FROM pick);----420 updates for shift 1,2,3


WITH pick AS (
  SELECT reg_number
  FROM chsl_2025_tier1_admit_card
  WHERE
	--venue_name = 'MOHAMED SATHAK COLLEGE OF ARTS & SCIENCE'
     venue_code = '170207'
    AND examdate   = '2025-11-15'
    AND shift = '3'
  ORDER BY reg_number
  LIMIT 40
)
UPDATE chsl_2025_tier1_admit_card t
SET 
shift = '3',
venue_code='170202',
venue_name ='CAMBRIDGE INSTITUTE OF TECHNOLOGY',
venue_address ='T C PALYA SIGNAL, K R PURAM, BASAVANAPURA MAIN ROAD, GAYATHRI LAYOUT, KRISHNARAJAPURAM, BENGALURU, KARNATAKA - 560036',
venue_pincode='560036',
remarks_new='BENGALURU from 170207 to  170202'
WHERE t.reg_number IN (SELECT reg_number FROM pick);---40 updates for shift 3,2,1


WITH pick AS (
  SELECT reg_number
  FROM chsl_2025_tier1_admit_card
  WHERE
	--venue_name = 'MOHAMED SATHAK COLLEGE OF ARTS & SCIENCE'
     venue_code = '170207'
    AND examdate   = '2025-11-15'
    AND shift = '1'
  ORDER BY reg_number
  
)
UPDATE chsl_2025_tier1_admit_card t
SET 
shift = '1',
venue_code='170204',
venue_name ='DIGIMETRICS',
venue_address ='FLOOR 2, 3 & 4, SITE NO.2, NISARGA HITECH LAYOUT, OPP BHARAT PETROLEUM,  MALUR ROAD, HOSKOTE, BENGALURU, KARNATAKA-562114',
venue_pincode='562114',
remarks_new='BENGALURU from 170207 to  170204'
WHERE t.reg_number IN (SELECT reg_number FROM pick);---22,13,10

WITH pick AS (
  SELECT reg_number
  FROM chsl_2025_tier1_admit_card
  WHERE
	--venue_name = 'MOHAMED SATHAK COLLEGE OF ARTS & SCIENCE'
     venue_code = '170212'
    AND examdate   = '2025-11-15'
    AND shift = '1'
  ORDER BY reg_number
	LIMIT 25
  
)
UPDATE chsl_2025_tier1_admit_card t
SET 
shift = '1',
venue_code='170204',
venue_name ='DIGIMETRICS',
venue_address ='FLOOR 2, 3 & 4, SITE NO.2, NISARGA HITECH LAYOUT, OPP BHARAT PETROLEUM,  MALUR ROAD, HOSKOTE, BENGALURU, KARNATAKA-562114',
venue_pincode='562114',
remarks_new='BENGALURU from 170212 to  170204'
WHERE t.reg_number IN (SELECT reg_number FROM pick);---25,25,30 updated-----------------------------

WITH pick AS (
  SELECT reg_number
  FROM chsl_2025_tier1_admit_card
  WHERE
	--venue_name = 'MOHAMED SATHAK COLLEGE OF ARTS & SCIENCE'
     venue_code = '170212'
    AND examdate   = '2025-11-29'
    AND shift = '2'
  ORDER BY reg_number
  
)
UPDATE chsl_2025_tier1_admit_card t
SET 
shift = '2',
venue_code='170207',
venue_name ='RAIN CLOUD TECHNOLOGY',
venue_address ='NO47/1, BALAJI NAGAR, 12TH CROSS, THIGALARAPALYA MAIN ROAD, PEENYA 2ND STAGE, BENGALURU. KARNATAKA 560058',
venue_pincode='560058',
remarks_new='BENGALURU from 170212 to  170207'
WHERE t.reg_number IN (SELECT reg_number FROM pick);----401 updated

WITH pick AS (
  SELECT reg_number
  FROM chsl_2025_tier1_admit_card
  WHERE
	--venue_name = 'MOHAMED SATHAK COLLEGE OF ARTS & SCIENCE'
     venue_code = '170202'
    AND examdate   = '2025-11-29'
    AND shift = '2'
  ORDER BY reg_number
	LIMIT 200
  
)
UPDATE chsl_2025_tier1_admit_card t
SET 
shift = '2',
venue_code='170207',
venue_name ='RAIN CLOUD TECHNOLOGY',
venue_address ='NO47/1, BALAJI NAGAR, 12TH CROSS, THIGALARAPALYA MAIN ROAD, PEENYA 2ND STAGE, BENGALURU. KARNATAKA 560058',
venue_pincode='560058',
remarks_new='BENGALURU from 170202 to  170207'
WHERE t.reg_number IN (SELECT reg_number FROM pick);----200 updates




update chsl_2025_tier1_admit_card set remarks='Rejected- Contact Regional Offices'
where is_active=false;


WITH pick AS (
  SELECT reg_number
  FROM chsl_2025_tier1_admit_card
  WHERE
	--venue_name = 'MOHAMED SATHAK COLLEGE OF ARTS & SCIENCE'
     venue_code = '170202'
    AND examdate   = '2025-11-17'
    AND shift = '3'
  ORDER BY reg_number
	LIMIT 75
  
)
UPDATE chsl_2025_tier1_admit_card t
SET 
shift = '3',
venue_code='170207',
venue_name ='RAIN CLOUD TECHNOLOGY',
venue_address ='NO47/1, BALAJI NAGAR, 12TH CROSS, THIGALARAPALYA MAIN ROAD, PEENYA 2ND STAGE, BENGALURU. KARNATAKA 560058',
venue_pincode='560058',
remarks_new='BENGALURU from 170202 to  170207'
WHERE t.reg_number IN (SELECT reg_number FROM pick);----75 updates

WITH pick AS (
  SELECT reg_number
  FROM chsl_2025_tier1_admit_card
  WHERE
	--venue_name = 'MOHAMED SATHAK COLLEGE OF ARTS & SCIENCE'
     venue_code = '170204'
    AND examdate   = '2025-11-19'
    AND shift = '3'
  ORDER BY reg_number
	LIMIT 75
  
)
UPDATE chsl_2025_tier1_admit_card t
SET 
shift = '3',
venue_code='170207',
venue_name ='RAIN CLOUD TECHNOLOGY',
venue_address ='NO47/1, BALAJI NAGAR, 12TH CROSS, THIGALARAPALYA MAIN ROAD, PEENYA 2ND STAGE, BENGALURU. KARNATAKA 560058',
venue_pincode='560058',
remarks_new='BENGALURU from 170204 to  170207'
WHERE t.reg_number IN (SELECT reg_number FROM pick);----75 updates


'10001766034','10005788504','10000027283','10000987673','10000708505','10011770532','10011811737','10005900868','10012976338','10013153987','10011848240','10013896118','10014627941','10012880753','10016752773','10016777586','10017012523','10001705635','10002060599','10011905233','10012132524','10013046910','10013330684','10014512025','10015907814'






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































