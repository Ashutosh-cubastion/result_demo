alter table eduquity_block2_partb add column reg_number character varying;
alter table eduquity_block2_parta add column reg_number character varying;

select * from eduquity_block2_partb where reg_number is null limit 10;
select * from eduquity_block2_parta where reg_number is null limit 10;

update eduquity_block2_partb a
set a.reg_number=b.reg_number
from mts2025_reference b
where a.dummy_id=b.dummy_id;

select a.* from mts_2025_tier1_admit_card a,
eduquity_block2_parta b where a.reg_number=b.reg_number;

select a.* from mts_2025_tier1_admit_card a,
eduquity_block2_partb b where a.reg_number=b.reg_number;


create table temp_block2_partb as
select a.reg_number,null as roll_number,a.dummy_id as candidate_id,false as is_active,a.cbe_medium,
b.actual_region,null as region_code,b.cent_code as venue_code,null as venue_name,b.exam_city as venue_city,
b.exam_state as venue_state, null as venue_address, null as venue_pincode, b.exam_date as examdate,null as examdate1,
b.shift as shift, a.comp_time,null as examtime,null as gateclose, null as repotime, a.password_for_examination,
null as barcode,'No' as self_checkin,null as self_slot,null as slot_key,null as city_code,null as city_name,
null as bucket,a.name,a.can_new_name,a.father_name,a.mother_name,a.email,a.mobile,a.category,a.gender,a.additional_kyc,
a.dob2,a.dob,a.ex_serviceman,a.exs_res_availed,a.identification_mark,a.ph,a.ph_code,a.category_field,a.scribe_required,
a.own_scribe,a.scribe_medium,a.scribe_field,a.is_pwbd_blindness,a.suffer_cerebralpalsy,a.locomotor,a.vh_cp_lw,
a.present_address,a.present_district,a.present_state,a.present_pincode,null as old_center_code,null as center_code,null as center_name,null as old_center_name,null as batch,
null as is_shifted,null as reject,null as reject_reason,a.form_completion_date,a.form_completion_time,false as downloaded,
0 as number_of_downloads,null as counter,'20LAC' as remarks,'BLOCK2-partA' as remarks_new, null as remarks_final,null as remarks_latest,null as to_be_scheduled,
'No' as city_feedback, a.cbe_medium as language,
null as ey_rejection_remarks,false as on_hold,TRUE as is_hidden
from mts2025_reference a,
eduquity_block2_partb b where a.reg_number=b.reg_number ;


insert into mts_2025_tier1_admit_card
select a.reg_number,null as roll_number,a.dummy_id as candidate_id,false as is_active,a.cbe_medium,
b.actual_region,null as region_code,b.cent_code as venue_code,null as venue_name,b.exam_city as venue_city,
b.exam_state as venue_state, null as venue_address, null as venue_pincode, b.exam_date as examdate,null as examdate1,
b.shift as shift, a.comp_time,null as examtime,null as gateclose, null as repotime, a.password_for_examination,
null as barcode,'No' as self_checkin,null as self_slot,null as slot_key,null as city_code,null as city_name,
null as bucket,a.name,a.can_new_name,a.father_name,a.mother_name,a.email,a.mobile,a.category,a.gender,a.additional_kyc,
a.dob2,a.dob,a.ex_serviceman,a.exs_res_availed,a.identification_mark,a.ph,a.ph_code,a.category_field,a.scribe_required,
a.own_scribe,a.scribe_medium,a.scribe_field,a.is_pwbd_blindness,a.suffer_cerebralpalsy,a.locomotor,a.vh_cp_lw,
a.present_address,a.present_district,a.present_state,a.present_pincode,null as old_center_code,null as center_code,null as center_name,null as old_center_name,null as batch,
null as is_shifted,null as reject,null as reject_reason,a.form_completion_date,a.form_completion_time,false as downloaded,
0 as number_of_downloads,null as counter,'20LAC' as remarks,'BLOCK2-partB' as remarks_new, null as remarks_final,null as remarks_latest,null as to_be_scheduled,
'No' as city_feedback, a.cbe_medium as language,
null as ey_rejection_remarks,false as on_hold,TRUE as is_hidden
from mts2025_reference a,
eduquity_block2_partb b where a.reg_number=b.reg_number ;

select count(*) from mts_2025_tier1_admit_card limit 10;----1530292

select 2130292-1530292;---600000

select 2752604-2130292;---622312

update eduquity_block3_partb a
set a.reg_number=b.reg_number
from mts2025_reference b
where a.dummy_id=b.dummy_id;

select a.* from mts_2025_tier1_admit_card a,
eduquity_block3_parta b where a.reg_number=b.reg_number;

select a.* from mts_2025_tier1_admit_card a,
eduquity_block3_partb b where a.reg_number=b.reg_number;

insert into mts_2025_tier1_admit_card
select a.reg_number,null as roll_number,a.dummy_id as candidate_id,false as is_active,a.cbe_medium,
b.actual_region,null as region_code,b.cent_code as venue_code,null as venue_name,b.exam_city as venue_city,
b.exam_state as venue_state, null as venue_address, null as venue_pincode, b.exam_date as examdate,null as examdate1,
b.shift as shift, a.comp_time,null as examtime,null as gateclose, null as repotime, a.password_for_examination,
null as barcode,'No' as self_checkin,null as self_slot,null as slot_key,null as city_code,null as city_name,
null as bucket,a.name,a.can_new_name,a.father_name,a.mother_name,a.email,a.mobile,a.category,a.gender,a.additional_kyc,
a.dob2,a.dob,a.ex_serviceman,a.exs_res_availed,a.identification_mark,a.ph,a.ph_code,a.category_field,a.scribe_required,
a.own_scribe,a.scribe_medium,a.scribe_field,a.is_pwbd_blindness,a.suffer_cerebralpalsy,a.locomotor,a.vh_cp_lw,
a.present_address,a.present_district,a.present_state,a.present_pincode,null as old_center_code,null as center_code,null as center_name,null as old_center_name,null as batch,
null as is_shifted,null as reject,null as reject_reason,a.form_completion_date,a.form_completion_time,false as downloaded,
0 as number_of_downloads,null as counter,'20LAC' as remarks,'BLOCK3-partB' as remarks_new, null as remarks_final,null as remarks_latest,null as to_be_scheduled,
'No' as city_feedback, a.cbe_medium as language,
null as ey_rejection_remarks,false as on_hold,TRUE as is_hidden
from mts2025_reference a,
eduquity_block3_partb b where a.reg_number=b.reg_number ;


select count(*) from mts_2025_tier1_admit_card limit 10;----2752604

select 3352604-2752604;---600000

select 3619834-3352604;---267230

select count(*) from mts_2025_tier1_admit_card where remarks_new='BLOCK2-partA' limit 10;---600000
select count(*) from mts_2025_tier1_admit_card where remarks_new='BLOCK2-partB' limit 10;----622312
select count(*) from mts_2025_tier1_admit_card where remarks_new='BLOCK3-partA' limit 10;---600000
select count(*) from mts_2025_tier1_admit_card where remarks_new='BLOCK3-partB' limit 10;----267230

update mts_2025_tier1_admit_card
set examdate1='09/02/2026' where examdate='2026-02-09' and examdate1 is null;---248197

update mts_2025_tier1_admit_card
set examdate1='10/02/2026' where examdate='2026-02-10' and examdate1 is null;---240639

update mts_2025_tier1_admit_card
set examdate1='11/02/2026' where examdate='2026-02-11' and examdate1 is null;---232873

update mts_2025_tier1_admit_card
set examdate1='12/02/2026' where examdate='2026-02-12' and examdate1 is null;---245135

update mts_2025_tier1_admit_card
set examdate1='13/02/2026' where examdate='2026-02-13' and examdate1 is null;---255468

update mts_2025_tier1_admit_card
set examdate1='16/02/2026' where examdate='2026-02-16' and examdate1 is null;---209165

update mts_2025_tier1_admit_card
set examdate1='17/02/2026' where examdate='2026-02-17' and examdate1 is null;---213291

update mts_2025_tier1_admit_card
set examdate1='18/02/2026' where examdate='2026-02-18' and examdate1 is null;---218291

update mts_2025_tier1_admit_card
set examdate1='19/02/2026' where examdate='2026-02-19' and examdate1 is null;---226483

---------------13th feb data updates-------------------------

select a.candidate_id,a.is_active,a.reg_number,a.examdate,a.examdate1,b.exam_date,a.shift,b.shift,b.actual_shift,a.city_code,b.city_code,a.city_name,b.venue_city,a.on_hold
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id
and a.examdate<>b.exam_date;---12000

select distinct a.examdate,b.exam_date,a.on_hold,count(*)
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id
and a.examdate<>b.exam_date
group by a.examdate,b.exam_date,a.on_hold;--

"2026-02-10"	"2026-02-13"	true	450
"2026-02-11"	"2026-02-13"	true	750

select a.candidate_id,a.is_active,a.reg_number,a.examdate,a.examdate1,b.exam_date,a.shift,b.shift,b.actual_shift,a.city_code,b.city_code,a.city_name,b.venue_city,a.on_hold
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id
and a.examdate<>b.exam_date;---12000

select distinct a.examdate,b.exam_date,a.venue_code,b.venue_Code,a.venue_City,b.venue_city,a.on_hold,count(*)
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id
and a.examdate<>b.exam_date
group by a.examdate,b.exam_date,a.venue_code,b.venue_Code,a.venue_City,b.venue_city,a.on_hold;

select a.candidate_id,a.is_active,a.reg_number,a.roll_number,a.examdate,a.examdate1,b.exam_date,a.shift,b.shift,b.actual_shift,a.city_code,b.city_code,a.city_name,b.venue_city,a.on_hold
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id
and a.shift<>b.actual_shift;---412---10021936277

select distinct a.venue_city,b.venue_city,count(*)
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id
and a.venue_city<>b.venue_city
group by a.venue_city,b.venue_city;

select  distinct a.region,b.region,count(*)
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id
group by a.region,b.region;

update mts_2025_tier1_admit_card
set examdate1='13/02/2026' where examdate='2026-02-13' and examdate1 in ('10/02/2026','11/02/2026');---450+750

update mts_2025_tier1_admit_card
set examdate='2026-02-13',
examdate1='13/02/2026' where examdate is null and examdate1 in ('05/02/2026');---103

select a.*
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id
and a.is_active=false;----86 cancelled candidature by EY candidates

update mts_2025_tier1_admit_card a
set a.on_hold=true
from mts_13_eduquity b where a.candidate_id=b.dummy_id
and a.is_active=true and b.remarks_new='Need to be Hold';---1002

select a.*
from  mts_2025_tier1_admit_card a,
mts_13_eduquity b  where a.candidate_id=b.dummy_id
and a.is_active=true and a.region='CR' and a.region_code='2';----2999

select distinct a.roll_number
from  mts_2025_tier1_admit_card a,
mts_13_eduquity b  where a.candidate_id=b.dummy_id
and a.is_active=true and a.region='CR' and a.region_code='2';----null

update mts_2025_tier1_admit_card a
set region_code='3' from
mts_13_eduquity b  where a.candidate_id=b.dummy_id
and a.is_active=true and a.region='CR' and a.region_code='2';----2999

select a.*
from  mts_2025_tier1_admit_card a,
mts_13_eduquity b  where a.candidate_id=b.dummy_id
and a.is_active=true and a.region='ER' and a.region_code='3';----2999

select distinct a.roll_number
from  mts_2025_tier1_admit_card a,
mts_13_eduquity b  where a.candidate_id=b.dummy_id
and a.is_active=true and a.region='ER' and a.region_code='3';----null

update mts_2025_tier1_admit_card a
set region_code='4' from
mts_13_eduquity b  where a.candidate_id=b.dummy_id
and a.is_active=true and a.region='ER' and a.region_code='3';----2999

select a.region_code,substring(roll_number,1,1)
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id
and a.is_active=true and a.roll_number is not null;---roll number already exsists on correct region

select a.region_code,substring(roll_number,1,1)
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id
and a.is_active=true and a.roll_number is not null
and a.region_code<>substring(roll_number,1,1);---0

----------------ON HOLD venues--------------------------
select * into mts_2025_admit_card_bkp_sallu from mts_2025_tier1_admit_card;

select distinct a.venue_code
from  mts_2025_tier1_admit_card a,
mts_13_eduquity b  where a.candidate_id=b.dummy_id and a.venue_code in ('350605','351514','210307','300411','291001','300201','351503','351509');

WITH max_per_region AS (
    SELECT
        region,
        COALESCE(MAX(counter::int), 0) AS last_cnt
    FROM mts_2025_tier1_admit_card
    GROUP BY region
),
new_rows AS (
    SELECT
        t.reg_number,
        t.region,
        m.last_cnt +
            ROW_NUMBER() OVER (
                PARTITION BY t.region
                ORDER BY t.form_completion_date, t.form_completion_time::time
            ) AS new_cnt,
        case
            when substring(roll_number, 1, 1) <> region_code then true
            else false
        end as is_roll_no_change
    FROM mts_2025_tier1_admit_card t
    JOIN max_per_region m ON t.region = m.region
	join mts_13_eduquity s
	on t.candidate_id = s.dummy_id
    where (t.roll_number is null
    or substring(t.roll_number, 1, 1) <> t.region_code)
	--and s.remarks is null 
	and t.is_active = true
)
-- select count(*) from new_rows;----120891
UPDATE mts_2025_tier1_admit_card AS t
SET
    remarks_latest = case
                        when new_rows.is_roll_no_change then case
                                                                when remarks_latest is not null then concat(remarks_latest, ',::: Earlier Roll Number: ', roll_number)
                                                                else concat('Earlier Roll Number: ', roll_number)
                                                            end
                        else remarks_latest
                    end,
    counter = LPAD(new_rows.new_cnt::text, 7, '0'),
    roll_number = t.region_code || '25' || '27' || LPAD(new_rows.new_cnt::text, 7, '0')
FROM new_rows
WHERE t.reg_number = new_rows.reg_number;----93802 updates-------------------------



select distinct roll_number,count(*)
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id and a.is_active=true
group by roll_number having count(*)>1;----0

select a.*
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id and a.is_active=true
and  a.roll_number is null;----0

select distinct a.is_active,a.on_hold,count(*)
from mts_2025_tier1_admit_card a,
mts_13_eduquity b where a.candidate_id=b.dummy_id and a.is_active=true
group by a.is_active,a.on_hold;


update mts_2025_tier1_admit_card a
set a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_city=b.venue_city,
a.venue_address=b.venue_address,
a.venue_state=b.venue_state,
a.venue_pincode=b.venue_pincode,
a.examdate=b.examdate,
a.examdate1=b.exam_date,
a.shift=b.shift,
a.remarks_final='585 from jhansi city rescheduled'
from mts_2025_reexam_jhansi_585 b
where a.reg_number=b.reg_number;

update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_reexam_jhansi_585 s
WHERE t.reg_number= s.reg_number;



'10011678501','10008814962','10016048852','10012033364','10001711685','10015299986','10019193898','10005962474','10025558012','10011520557','10013324264','10014316499','10013425295','10021982504','10015411128','10011566401'



'MTS250838416','MTS253043530','MTS253318865','MTS251601475','MTS251004638','MTS250847192','MTS253451561','MTS250435453','MTS253543933','MTS253608258','MTS251128424','MTS253519451','MTS252559968','MTS251370990','MTS250331721','MTS253051894','MTS251789133','MTS253072049','MTS252203534','MTS251256556','MTS250370502','MTS250394713','MTS251816698','MTS250851160','MTS250531308'

select * from mts_2025_13_non_slotted where dummy_id in ('MTS250838416','MTS253043530','MTS253318865','MTS251601475','MTS251004638','MTS250847192','MTS253451561','MTS250435453','MTS253543933','MTS253608258','MTS251128424','MTS253519451','MTS252559968','MTS251370990','MTS250331721','MTS253051894','MTS251789133','MTS253072049','MTS252203534','MTS251256556','MTS250370502','MTS250394713','MTS251816698','MTS250851160','MTS250531308');
delete from mts_2025_13_non_slotted where dummy_id in ('MTS250838416','MTS253043530','MTS253318865','MTS251601475','MTS251004638','MTS250847192','MTS253451561','MTS250435453','MTS253543933','MTS253608258','MTS251128424','MTS253519451','MTS252559968','MTS251370990','MTS250331721','MTS253051894','MTS251789133','MTS253072049','MTS252203534','MTS251256556','MTS250370502','MTS250394713','MTS251816698','MTS250851160','MTS250531308');


update mts_2025_tier1_admit_card a
set a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_city=b.venue_city,
a.venue_address=b.venue_address,
a.venue_state=b.venue_state,
a.venue_pincode=b.venue_pincode,
a.examdate='2026-02-13',
a.examdate1='13/02/2026',
a.shift=b.new_shift,
a.remarks_final='13 feb non slotted candidates',
a.region=b.venue_region
from mts_2025_13_non_slotted b
where a.candidate_id=b.dummy_id;---18265 updates

update mts_2025_tier1_admit_card a
set a.region_code=case
when a.region='NWR' then '1'
when a.region='NR' then '2'
when a.region='CR' then '3'
when a.region='ER' then '4'
when a.region='NER' then '5'
when a.region='MPR' then '6'
when a.region='WR' then '7'
when a.region='SR' then '8'
when a.region='KKR' then '9'
END
from mts_2025_13_non_slotted b
where a.candidate_id=b.dummy_id;---18265 updates


WITH max_per_region AS (
    SELECT
        region,
        COALESCE(MAX(counter::int), 0) AS last_cnt
    FROM mts_2025_tier1_admit_card
    GROUP BY region
),
new_rows AS (
    SELECT
        t.reg_number,
        t.region,
        m.last_cnt +
            ROW_NUMBER() OVER (
                PARTITION BY t.region
                ORDER BY t.form_completion_date, t.form_completion_time::time
            ) AS new_cnt,
        case
            when substring(roll_number, 1, 1) <> region_code then true
            else false
        end as is_roll_no_change
    FROM mts_2025_tier1_admit_card t
    JOIN max_per_region m ON t.region = m.region
	join mts_2025_13_non_slotted s
	on t.candidate_id = s.dummy_id
    where (t.roll_number is null
    or substring(t.roll_number, 1, 1) <> t.region_code)
	--and s.remarks is null 
	and t.is_active = true
)
-- select count(*) from new_rows;----120891
UPDATE mts_2025_tier1_admit_card AS t
SET
    remarks_latest = case
                        when new_rows.is_roll_no_change then case
                                                                when remarks_latest is not null then concat(remarks_latest, ',::: Earlier Roll Number: ', roll_number)
                                                                else concat('Earlier Roll Number: ', roll_number)
                                                            end
                        else remarks_latest
                    end,
    counter = LPAD(new_rows.new_cnt::text, 7, '0'),
    roll_number = t.region_code || '25' || '27' || LPAD(new_rows.new_cnt::text, 7, '0')
FROM new_rows
WHERE t.reg_number = new_rows.reg_number;----18265 updates-------------------------


update mts_2025_tier1_admit_card
set examdate='2026-02-17',
examdate1='17/02/2026',
remarks_final='rescheduled as per RD-NER request',
is_rescheduled=true
where roll_number in ('525270025505','525270025923','525270026047','525270026274','525270026304','525270023717','525270023731','525270023830','525270023875','525270023929','525270023964','525270024915','525270025349','525270025396','525270030123','525270023153','525270023162','525270023197','525270023247','525270023365','525270023375','525270023646','525270023916','525270023933','525270023956','525270024048','525270024541','525270024543','525270024760','525270024816','525270025131','525270025540','525270025573','525270025585','525270025595','525270025606','525270025734','525270025898','525270026003','525270026158','525270026228','525270026270','525270026295','525270030073','525270030108','525270030116','525270025394','525270025578','525270025726','525270026161','525270026183','525270026233','525270026268','525270023122','525270023172','525270023256','525270023293','525270023669','525270023860','525270024093','525270024144','525270024223','525270024227','525270024254','525270024577','525270024819','525270025200','525270025271');


select * from mts_2025_tier1_admit_card where venue_code='360202' and examdate='2026-02-16' and is_active=true and roll_number is not null;---749

update mts_2025_tier1_admit_card 
set 
on_hold=true,
remarks_latest='ON hold by RD-NR dicussed in VC'
where venue_code='360202' and examdate='2026-02-16' and is_active=true and roll_number is not null;---749


update mts_2025_tier1_Admit_card
set venue_code='270603' 
where venue_code='270602' and is_active=true and examdate>='2026-02-17' ;---1940

update mts_2025_tier1_Admit_card
set 
venue_name='SEENET CONSULTANCY SERVICES PVT LTD',
venue_address='STPI COMPLEX SECTOR-5 ROURKELA SUNDARGARH -769002',
venue_city='ROURKELA',
venue_state='ODISHA',
venue_pincode='769002'
where venue_code='270603' and examdate>='2026-02-17' and is_active=true and venue_name is not null;--1081

update mts_2025_tier1_Admit_card
set on_hold=true ,
remarks_latest='On Hold venue by RD-NR'
where is_active=true and examdate='2026-02-16' and venue_code='300202' and venue_name is not null;---639

select distinct on_hold from mts_2025_tier1_Admit_card where is_active=true and examdate='2026-02-16' and venue_code='360104';
select * from mts_2025_tier1_Admit_card where is_active=true and examdate='2026-02-16' and venue_code='360104' and downloaded=true;---149
select * from mts_2025_tier1_Admit_card where is_active=true and examdate='2026-02-16' and venue_code='360104' and venue_name is not null;---558
select * from mts_2025_tier1_Admit_card where is_active=true and examdate='2026-02-16' and venue_code='360104' and roll_number is not null;---558

update mts_2025_tier1_Admit_card
set on_hold=true ,
remarks_latest='On Hold venue by RD-NR'
where is_active=true and examdate='2026-02-16' and venue_code='360104' and venue_name is not null;---558

create table mts_2025_tier1_16feb
( reg_number character varying,
 region character varying,
 region_code character varying,
 venue_code	character varying,
 venue_name	character varying,
 venue_city character varying,
 venue_state character varying,
 venue_address character varying,
 venue_pincode	character varying																																																					
);

select * into mts_2025_tier1_admit_card_bkp_13022026 from mts_2025_tier1_admit_card;----3619834

update mts_2025_tier1_admit_card a
set a.venue_city=b.venue_city
from mts_2025_tier1_16feb b
where a.reg_number=b.reg_number and
a.venue_city is null;---119741

select reg_number,candidate_id,region,venue_code,venue_name,venue_city,venue_address,venue_state,venue_pincode from mts_2025_tier1_admit_card where is_active=true and examdate='2026-02-16' and roll_number is not null and is_hidden=false
and (self_checkin='Yes' or city_feedback='Yes');----158121

select distinct region from mts_2025_tier1_admit_card WHERE venue_code='50501' and examdate>='2026-02-16' and is_hidden=false;---CR
select * from mts_2025_tier1_admit_card WHERE venue_code='50501' and examdate>='2026-02-16' and is_hidden=false;---slotted 6788
select * from mts_2025_tier1_admit_card WHERE venue_code='50501' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 6788

select distinct region,region_code,venue_state,rem_edu from mts_2025_tier1_admit_card WHERE venue_code='50501' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 6788
select distinct rem_edu from mts_2025_tier1_admit_card WHERE venue_code='50501' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---null

update mts_2025_tier1_admit_card
set
region='ER',
region_code='4',
rem_edu='CR -> ER',
venue_state='BIHAR'
WHERE venue_code='50501'
and examdate >= '2026-02-16'
and is_hidden=false;---6788 updates

select distinct region from mts_2025_tier1_admit_card WHERE venue_code='50405' and examdate>='2026-02-16' and is_hidden=false;---CR
select * from mts_2025_tier1_admit_card WHERE venue_code='50405' and examdate>='2026-02-16' and is_hidden=false;---slotted 3267
select * from mts_2025_tier1_admit_card WHERE venue_code='50405' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 3267

select distinct region,region_code,venue_state,rem_edu from mts_2025_tier1_admit_card WHERE venue_code='50405' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 3267

update mts_2025_tier1_admit_card
set
region='ER',
region_code='4',
rem_edu='CR -> ER',
venue_state='BIHAR'
WHERE venue_code='50405'
and examdate >= '2026-02-16'
and is_hidden=false;---3267 updates

select distinct region from mts_2025_tier1_admit_card WHERE venue_code='50404' and examdate>='2026-02-16' and is_hidden=false;---CR
select * from mts_2025_tier1_admit_card WHERE venue_code='50404' and examdate>='2026-02-16' and is_hidden=false;---slotted 2340
select * from mts_2025_tier1_admit_card WHERE venue_code='50404' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 2340

select distinct region,region_code,venue_state,rem_edu from mts_2025_tier1_admit_card WHERE venue_code='50404' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 2340

update mts_2025_tier1_admit_card
set
region='ER',
region_code='4',
rem_edu='CR -> ER',
venue_state='BIHAR'
WHERE venue_code='50404'
and examdate >= '2026-02-16'
and is_hidden=false;---2340 updates

select distinct region from mts_2025_tier1_admit_card WHERE venue_code='50409' and examdate>='2026-02-16' and is_hidden=false;---CR
select * from mts_2025_tier1_admit_card WHERE venue_code='50409' and examdate>='2026-02-16' and is_hidden=false;---slotted 2029
select * from mts_2025_tier1_admit_card WHERE venue_code='50409' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 2029

select distinct region,region_code,venue_state,rem_edu from mts_2025_tier1_admit_card WHERE venue_code='50409' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 2029

update mts_2025_tier1_admit_card
set
region='ER',
region_code='4',
rem_edu='CR -> ER',
venue_state='BIHAR'
WHERE venue_code='50409'
and examdate >= '2026-02-16'
and is_hidden=false;---2029 updates

select distinct region from mts_2025_tier1_admit_card WHERE venue_code='50801' and examdate>='2026-02-16' and is_hidden=false;---CR
select * from mts_2025_tier1_admit_card WHERE venue_code='50801' and examdate>='2026-02-16' and is_hidden=false;---slotted 6000
select * from mts_2025_tier1_admit_card WHERE venue_code='50801' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 6000

select distinct region,region_code,venue_state,rem_edu from mts_2025_tier1_admit_card WHERE venue_code='50801' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 2029

update mts_2025_tier1_admit_card
set
region='ER',
region_code='4',
rem_edu='CR -> ER',
venue_state='BIHAR'
WHERE venue_code='50801'
and examdate >= '2026-02-16'
and is_hidden=false;---6000 updates

select distinct region from mts_2025_tier1_admit_card WHERE venue_code='351603_1' and examdate>='2026-02-16' and is_hidden=false;---NR
select * from mts_2025_tier1_admit_card WHERE venue_code='351603_1' and examdate>='2026-02-16' and is_hidden=false;---slotted 14186 
select * from mts_2025_tier1_admit_card WHERE venue_code='351603_1' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 14186

select distinct region,region_code,venue_state,rem_edu from mts_2025_tier1_admit_card WHERE venue_code='351603_1' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 14186

update mts_2025_tier1_admit_card
set
region='CR',
region_code='3',
rem_edu='NR -> CR',
--venue_state='BIHAR'
WHERE venue_code='351603_1'
and examdate >= '2026-02-16'
and is_hidden=false;---14186 updates

select distinct region,region_code,venue_state,rem_edu,COUNT(*) from mts_2025_tier1_admit_card WHERE venue_code='140101' and
examdate>='2026-02-16' and is_hidden=false and roll_number is not null GROUP BY region,region_code,venue_state,rem_edu;---slotted 8163

"NWR"	"1"	"HARYANA"		3
"NWR"	"1"	"PUNJAB"		8160

select distinct venue_code,venue_name,venue_address,venue_state,count(*) from mts_2025_tier1_admit_card where venue_code='140101' and examdate<'2026-02-16'
group by venue_code,venue_name,venue_address,venue_state;

update mts_2025_tier1_admit_card
set
rem_edu='PUNJAB -> HARYANA',
venue_state='HARYANA'
WHERE venue_code='140101'
and examdate >= '2026-02-16'
and is_hidden=false;---8163 updates

select distinct region,region_code,venue_state,rem_edu,COUNT(*) from mts_2025_tier1_admit_card WHERE venue_code='130601' and
examdate>='2026-02-16' and is_hidden=false and roll_number is not null GROUP BY region,region_code,venue_state,rem_edu;---slotted 8163

"NWR"	"1"	"PUNJAB"		2569

select distinct venue_code,venue_name,venue_address,venue_state,count(*) from mts_2025_tier1_admit_card where venue_code='130601' and examdate<'2026-02-16'
group by venue_code,venue_name,venue_address,venue_state;

update mts_2025_tier1_admit_card
set
rem_edu='PUNJAB -> HIMACHAL PRADESH',
venue_state='HIMACHAL PRADESH'
WHERE venue_code='130601'
and examdate >= '2026-02-16'
and is_hidden=false;---2569 updates

select distinct region from mts_2025_tier1_admit_card WHERE venue_code='270103' and examdate>='2026-02-16' and is_hidden=false;---ER
select * from mts_2025_tier1_admit_card WHERE venue_code='270103' and examdate>='2026-02-16' and is_hidden=false;---slotted 2400
select * from mts_2025_tier1_admit_card WHERE venue_code='270103' and examdate>='2026-02-16' and is_hidden=false and roll_number is not null;---slotted 2400

select distinct region,region_code,venue_state,rem_edu,COUNT(*) from mts_2025_tier1_admit_card WHERE venue_code='270103' and
examdate>='2026-02-16' and is_hidden=false and roll_number is not null GROUP BY region,region_code,venue_state,rem_edu;---slotted 8163

"ER"	"4"	"WEST BENGAL"		2400

select distinct venue_code,venue_name,venue_address,venue_state,count(*) from mts_2025_tier1_admit_card where venue_code='270103' and examdate<'2026-02-16'
group by venue_code,venue_name,venue_address,venue_state;

update mts_2025_tier1_admit_card
set
rem_edu='WEST BENGAL -> ODISHA',
venue_state='ODISHA'
WHERE venue_code='270103'
and examdate >= '2026-02-16'
and is_hidden=false;---2400 updates


select distinct venue_city from mts_2025_tier1_admit_card where is_active=true and examdate='2026-02-16' and roll_number is not null and is_hidden=false
and (self_checkin='Yes' or city_feedback='Yes');----158121


select distinct venue_city,count(*) from mts_2025_tier1_admit_card_bkp_13022026 where is_active=true and examdate>'2026-02-16' and roll_number is not null and is_hidden=false
and (self_checkin='Yes' or city_feedback='Yes') group by venue_city;----354647 null city

select distinct region_code,substring(roll_number,1,1),count(*) from mts_2025_tier1_admit_card where examdate>='2026-02-16' and roll_number is not null
group by region_code,substring(roll_number,1,1);

"9"	"9"	31608
"5"	"5"	14474
"6"	"6"	41715
"7"	"7"	27008
"3"	"2"	14186 ----gadbad
"4"	"3"	20424 ----gadbad
"3"	"3"	182935
"1"	"1"	38154
"8"	"8"	41909
"2"	"2"	144573
"4"	"4"	74719

select * from mts_2025_tier1_admit_card where examdate>='2026-02-16' and roll_number is not null
and region_code='3' and substring(roll_number,1,1)='2';---null

select distinct remarks_latest from mts_2025_tier1_admit_card where examdate>='2026-02-16' and roll_number is not null
and region_code='3' and substring(roll_number,1,1)='2';---14186 null

update mts_2025_tier1_admit_card
set remarks_latest='Old RollNo: '||roll_number
where examdate>='2026-02-16' and roll_number is not null
and region_code='3' and substring(roll_number,1,1)='2';---14186

update mts_2025_tier1_admit_card
set roll_number=null,
counter=null
where examdate>='2026-02-16' and roll_number is not null
and region_code='3' and substring(roll_number,1,1)='2';---14186

select distinct roll_number,counter from mts_2025_tier1_admit_card where remarks_latest like 'Old RollNo:%';---null,null

select * from mts_2025_tier1_admit_card where examdate>='2026-02-16' and roll_number is not null
and region_code='4' and substring(roll_number,1,1)='3';---20424

select distinct remarks_latest from mts_2025_tier1_admit_card where examdate>='2026-02-16' and roll_number is not null
and region_code='4' and substring(roll_number,1,1)='3';---20424 null

update mts_2025_tier1_admit_card
set remarks_latest='Old RollNo: '||roll_number
where examdate>='2026-02-16' and roll_number is not null
and region_code='4' and substring(roll_number,1,1)='3';---20424

update mts_2025_tier1_admit_card
set roll_number=null,
counter=null
where examdate>='2026-02-16' and roll_number is not null
and region_code='4' and substring(roll_number,1,1)='3';---20424

select distinct roll_number,counter from mts_2025_tier1_admit_card where remarks_latest like 'Old RollNo:%';---null,null

select * from mts_2025_tier1_admit_card where examdate>='2026-02-16'
and is_hidden=false and (self_checkin='Yes' or city_feedback='Yes') 
and roll_number is null and remarks_latest like 'Old RollNo:%';---34610

select * from mts_2025_tier1_admit_card where examdate>='2026-02-16'
and is_hidden=false and (self_checkin='Yes' or city_feedback='Yes') and roll_number is null and remarks_latest is null;---5701


select * into mts_2025_tier1_admit_card_14feb2026 from mts_2025_tier1_admit_card;


"CR"	672364
"CR/NR"	0
"ER"	278036
"ER/CR"	0
"KKR"	129480
"MPR"	315094
"NER"	47893
"NR"	477713
"NWR"	129102
"SR"	161270
"WR"	101181

WITH max_per_region AS (
    SELECT 
        region,
        COALESCE(MAX(counter::int), 0) AS last_cnt
    FROM mts_2025_tier1_admit_card
    GROUP BY region
),
new_rows AS (
    SELECT 
        t.reg_number,
        t.region,
        m.last_cnt +
            ROW_NUMBER() OVER (
                PARTITION BY t.region 
                ORDER BY t.form_completion_date, t.form_completion_time::time
            ) AS new_cnt
    FROM mts_2025_tier1_admit_card t
    JOIN max_per_region m ON t.region = m.region
    WHERE t.examdate>='2026-02-16' and t.is_hidden=false and 
	(t.self_checkin='Yes' or t.city_feedback='Yes') and t.roll_number is null and t.remarks_latest like 'Old RollNo:%'
)

--select * from new_rows;

UPDATE mts_2025_tier1_admit_card AS t
SET 
    counter = LPAD(new_rows.new_cnt::text, 7, '0'),
    roll_number = t.region_code || '25' || '27' || LPAD(new_rows.new_cnt::text, 7, '0')
FROM new_rows
WHERE t.reg_number = new_rows.reg_number;----34610

-----ON HOLD venues--------------------------

select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='350605';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='300411';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='351516';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='351511';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='351514';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='351503';---no
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='351509';---no
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='351515';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='210307';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='300201';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='60101';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='60103';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='291001';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='290406';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='290407';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='290401';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='110102';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='360202';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='300202';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='360104';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='160509';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='370903';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='270602';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='170205';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='210902';
select distinct venue_code,venue_name,venue_city,venue_state,venue_address,venue_pincode from mts_2025_tier1_admit_card where venue_code='210902';

351601

create table mts_2025_queens_public_movement
(dummy_id character varying,
 CENT_CODE	 character varying,
 Venue  character varying,
 Addresss  character varying,
 Pincode  character varying,
 City  character varying,
 state  character varying,
 New_Shift  character varying,
 exam_Date date,
 Remarks  character varying,
 CITY_CODE  character varying,
 EXAM_STATE  character varying,
 EXAM_CITY  character varying,
 ACTUAL_REGION	 character varying,
 Remarks_13thFeb  character varying
);

select * from mts_2025_queens_public_movement limit 10;
select distinct state from mts_2025_queens_public_movement limit 10;



select distinct a.remarks_latest from mts_2025_tier1_admit_card a, mts_2025_queens_public_movement b where a.candidate_id=b.dummy_id;
select * from mts_2025_tier1_admit_card a, mts_2025_queens_public_movement b where a.candidate_id=b.dummy_id and roll_number is not null;

update mts_2025_tier1_admit_card a
set
a.examdate=b.exam_date,
a.examdate1=b.exam_date1,
a.venue_code=b.cent_code,
a.venue_name=b.venue,
a.venue_address=b.addresss,
a.venue_city=b.city,
a.venue_state=b.state,
a.venue_pincode=b.pincode,
a.shift=b.new_shift,
a.remarks_latest=b.remarks_13thfeb
from mts_2025_queens_public_movement b
where a.candidate_id=b.dummy_id;

alter table mts_2025_SD_ALWAR_MAHADEV_movement add column examdate1 character varying;

select distinct examdate,examdate1,count(*) from mts_2025_SD_ALWAR_MAHADEV_movement group by examdate,examdate1;

update mts_2025_SD_ALWAR_MAHADEV_movement set examdate1='17/02/2026' where examdate='2026-02-17';
update mts_2025_SD_ALWAR_MAHADEV_movement set examdate1='18/02/2026' where examdate='2026-02-18';
update mts_2025_SD_ALWAR_MAHADEV_movement set examdate1='19/02/2026' where examdate='2026-02-19';

update mts_2025_tier1_admit_card a
set
a.examdate=b.examdate,
a.examdate1=b.examdate1,
a.venue_code=b.cent_code,
a.venue_name=b.venue,
a.venue_address=b.addresss,
a.venue_city=b.city,
a.venue_state=b.state,
a.venue_pincode=b.pincode,
a.shift=b.new_shift,
a.remarks_latest=b.remarks_9thfeb
from mts_2025_SD_ALWAR_MAHADEV_movement b
where a.candidate_id=b.dummy_id;---4800

update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_SD_ALWAR_MAHADEV_movement s
WHERE t.candidate_id= s.dummy_id;

select distinct shift,repotime,gateclose,comp_time,examtime,count(*) from
mts_2025_tier1_admit_card where examdate>='2026-02-16' and is_active=true and roll_number is not null
group by shift,repotime,gateclose,comp_time,examtime;---all ok

update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_SIDDIPET_16_cancelled s
WHERE t.candidate_id= s.candidate_id;





update mts_2025_tier1_admit_card a
set
a.examdate='2026-02-16',
a.examdate1='16/02/2026',
a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_address=b.addresss,
a.venue_city=b.city,
a.venue_state=b.state,
a.venue_pincode=b.pincode,
a.shift=b.new_shift,
a.remarks_latest='eduquity shared data on 14th feb'
from mts_2025_nwr_on_hold_self_slot b
where a.candidate_id=b.dummy_id;---4807

WITH max_per_region AS (
    SELECT
        region,
        COALESCE(MAX(counter::int), 0) AS last_cnt
    FROM mts_2025_tier1_admit_card
    GROUP BY region
),
new_rows AS (
    SELECT
        t.reg_number,
        t.region,
        m.last_cnt +
            ROW_NUMBER() OVER (
                PARTITION BY t.region
                ORDER BY t.form_completion_date, t.form_completion_time::time
            ) AS new_cnt,
        case
            when substring(roll_number, 1, 1) <> region_code then true
            else false
        end as is_roll_no_change
    FROM mts_2025_tier1_admit_card t
    JOIN max_per_region m ON t.region = m.region
	join mts_2025_nwr_on_hold_self_slot s
	on t.candidate_id = s.dummy_id
    where (t.roll_number is null)
    --or substring(t.roll_number, 1, 1) <> t.region_code)
	--and s.remarks is null 
	and t.is_active = true
)
--select * from new_rows;

-- select count(*) from new_rows;----120891
UPDATE mts_2025_tier1_admit_card AS t
SET
   -- remarks_latest = case
                      --  when new_rows.is_roll_no_change then case
                                                              --  when remarks_latest is not null then concat(remarks_latest, ',::: Earlier Roll Number: ', roll_number)
                                                               -- else concat('Earlier Roll Number: ', roll_number)
                                                            --end
                       -- else remarks_latest
                   -- end,
    counter = LPAD(new_rows.new_cnt::text, 7, '0'),
    roll_number = t.region_code || '25' || '27' || LPAD(new_rows.new_cnt::text, 7, '0')
FROM new_rows
WHERE t.reg_number = new_rows.reg_number;----1423 updates-------------------------

select distinct t.venue_code,count(*) from mts_2025_tier1_admit_card t,mts_2025_nwr_on_hold_self_slot s where t.candidate_id = s.dummy_id
group by t.venue_code;---413 null


select distinct self_checkin,city_feedback,is_hidden,req_admit_card,release_admit_card,count(*)
from mts_2025_tier1_admit_card where examdate='2026-02-16' and is_active=true and roll_number is not null and on_hold=true
group by self_checkin,city_feedback,is_hidden,req_admit_card,release_admit_card;


update mts_2025_tier1_admit_card
set
on_hold=false
where examdate='2026-02-16' and is_active=true and roll_number is not null and on_hold=true and remarks_latest='eduquity shared data on 14th feb';---4803

--------413 on hold NWR by EDUQUITY-----------

update mts_2025_tier1_admit_card
set on_hold=true, 
remarks_latest=remarks_latest||' on hold 413 candidates by eduquity'
where
reg_number in ('10025480954','10017137308','10025694814','10000771380','10010865258','10024642098','10026965007','10010277946','10024356098','10026838200','10014947216','10012284108','10001216213','10001108347','10016812520','10020401395','10020716785','10026600206','10025080953','10001605807','10025968831','10005787668','10015858512','10012228724','10024428588','10025617280','10023978280','10024528772','10014879997','10008025751','10025248192','10026931887','10010063303','10019442167','10023455945','10024328958','10021131236','10015439939','10001647705','10000812990','10026825993','10000677256','10012209213','10025121336','10018864178','10015052780','10014565432','10025769027','10006670132','10025864588','10025853964','10013344004','10024701396','10013994047','10000810575','10014084824','10017736069','10025567670','10019036998','10026262089','10026740205','10022507683','10008631943','10010880323','10000069746','10009436854','10009449584','10016260046','10012691453','10005839518','10011700949','10000723182','10025786871','10018460795','10019809007','10011142625','10001694920','10013107815','10008794815','10026049155','10008597086','10024570684','10025223654','10012524527','10026740218','10017108979','10015529147','10025836454','10006537294','10008026128','10000049435','10010181446','10009627909','10026275052','10001227080','10013250864','10014300838','10020675284','10025765514','10010965048','10016026789','10009463955','10000046031','10019337649','10026067686','10001598267','10023969498','10008297806','10012383499','10024418461','10012629709','10011068419','10014051855','10010239630','10000838875','10026379595','10026203654','10015082393','10001065390','10014888168','10009043934','10000804965','10022503610','10017458244','10013705949','10022482312','10015499472','10000095820','10009617438','10014581547','10010229999','10010348284','10021230091','10016317856','10019076950','10010919406','10021792552','10009327976','10010868057','10014430417','10021638162','10022416319','10025122965','10026839306','10021373349','10023773360','10009720137','10008756727','10026405288','10021695370','10012862994','10015232637','10013062942','10022116129','10020591244','10025785163','10025965385','10009367359','10001593296','10009549996','10016196155','10019163018','10015235446','10010392761','10020255007','10011576677','10001232696','10024368078','10008583041','10010397006','10013587716','10009305678','10026015613','10006496103','10021055908','10011396026','10008172267','10012296629','10018921477','10000074491','10026010693','10002131634','10013008527','10026083878','10009917583','10021778064','10026400119','10025395581','10009928188','10016364900','10027029021','10023232487','10016195270','10026989311','10024247092','10001770747','10010940006','10023673081','10025387716','10026732143','10001715386','10023837632','10025936725','10027003040','10001287258','10010301899','10024527870','10001281282','10024946775','10023910352','10024043676','10026767770','10026440867','10012764797','10016895702','10001277869','10016666914','10015084862','10026635327','10025413452','10011080619','10001807872','10026667880','10020436109','10014446013','10011035605','10026459367','10001114083','10011710448','10008498088','10014027290','10010147548','10018794845','10024060766','10025200923','10027011596','10009461536','10019604247','10012904558','10020571330','10006169202','10026277232','10024609241','10025161458','10009372477','10010478284','10025324792','10012679940','10026114516','10014244530','10025147298','10008928161','10006550564','10008948533','10017732929','10009890548','10002172326','10005731045','10008885151','10010957865','10008570792','10005715783','10001642791','10013938814','10014151607','10009153442','10009257990','10025282507','10010613676','10014048655','10010926685','10010475773','10008943958','10025981779','10025529834','10001581155','10023484091','10012810171','10022550507','10005771722','10017327754','10013904900','10017313724','10012800400','10002150366','10009668735','10008085850','10008041494','10000741999','10012439282','10000997674','10000796746','10005779686','10001678544','10013577653','10025619958','10014614160','10012859531','10012186279','10025101040','10025766823','10014354215','10010383827','10026700261','10025884794','10013307011','10009504745','10020312120','10011338595','10015749375','10025864978','10019875625','10026347262','10000127573','10026105107','10009416131','10026645266','10017508668','10025019660','10000024167','10024274760','10018686119','10011594737','10024752556','10012219214','10010330879','10009835151','10015245062','10026364053','10013255856','10023695441','10010802735','10005924478','10025960718','10021821323','10026672040','10011013690','10006128563','10001050587','10026886319','10012440751','10014779215','10021243368','10006453248','10008339399','10008533986','10010443400','10014051618','10008433478','10025396274','10013420221','10008067276','10021947932','10014639532','10001783782','10016603704','10010616149','10015033009','10024478218','10026925742','10011200472','10024267515','10026413519','10026673302','10000049050','10001663236','10005710098','10011435797','10025475681','10017075705','10010995291','10026323491','10001420037','10026615162','10013609382','10016092551','10001160746','10025796930','10024724895','10021848189','10025152829','10011715968','10024531573','10016821304','10006713337','10025379882','10011173847','10013385720','10026921125','10016424793','10009874194','10022032828','10011247171','10008910495','10009302481','10008008160','10008864663','10021832906','10023218678','10000704610','10012930847','10014587702','10001788061','10021182544','10025871880','10023815797','10008697249','10025536532','10011349229','10016433271','10014315162','10016656740','10009575959');

--------89 candidates 16th feb moved from mahadev digital to RK didgital2 on 19th

update mts_2025_tier1_admit_card
set
examdate='2026-02-19',
examdate1='19/02/2026',
venue_code='100128',
venue_name='R K DIGITAL COMPUTER- CENTRE 2',
venue_address='GATE NO.2, SHAKTI NAGAR, ADJACENT TO LILAWATI VIDYA MANDIR SCHOOL, NEW DELHI, DELHI-110007',
venue_city='NEW DELHI',
venue_state='DELHI',
venue_pincode='110007',
on_hold=false,
release_admit_card=true,
is_rescheduled=true,
rem_edu='89 MAHADEV DIGITAL 16th feb Candidate Moved to RK Digital'
where venue_code='360104'
and is_active=true and roll_number is not null and examdate='2026-02-16';----89 updates

------------4 SD GROUP 16th feb candidates moved to RK digital2 on 19th 

update mts_2025_tier1_admit_card
set
examdate='2026-02-19',
examdate1='19/02/2026',
venue_code='100128',
venue_name='R K DIGITAL COMPUTER- CENTRE 2',
venue_address='GATE NO.2, SHAKTI NAGAR, ADJACENT TO LILAWATI VIDYA MANDIR SCHOOL, NEW DELHI, DELHI-110007',
venue_city='NEW DELHI',
venue_state='DELHI',
venue_pincode='110007',
on_hold=false,
release_admit_card=true,
is_rescheduled=true,
rem_edu='4 S D GROUP 16th feb Candidate Moved to RK Digital'
where venue_code='300202'
and is_active=true and roll_number is not null and examdate='2026-02-16';---4 updates

select a.* from mts_2025_tier1_admit_card a,mts_2025_RS_MEMORIAL_10_11 b
where a.candidate_id=b.dummy_id;---2701

select distinct a.examdate,b.examdate,b.new_date,count(*) from mts_2025_tier1_admit_card a,mts_2025_RS_MEMORIAL_10_11 b
where a.candidate_id=b.dummy_id and a.is_active=true and a.roll_number is not null group by a.examdate,b.examdate,b.new_date;---2701

select a.* from mts_2025_tier1_admit_card a,mts_2025_RS_MEMORIAL_10_11 b
where a.candidate_id=b.dummy_id and a.examdate='2026-02-11' and b.new_date='18-02-2026';

select distinct a.venue_code,b.venue_code,count(*) from mts_2025_tier1_admit_card a,mts_2025_RS_MEMORIAL_10_11 b
where a.candidate_id=b.dummy_id and a.is_active=true and a.roll_number is not null group by a.venue_code,b.venue_code;---2701

select a.* from mts_2025_tier1_admit_card a,mts_2025_RS_MEMORIAL_10_11 b
where a.candidate_id=b.dummy_id and a.venue_code='300404' and b.venue_code='300410';---3

select a.* from mts_2025_tier1_admit_card a,mts_2025_RS_MEMORIAL_10_11 b
where a.candidate_id=b.dummy_id and a.venue_code='300414' and b.venue_code='300409';---6

select a.* from mts_2025_tier1_admit_card a,mts_2025_RS_MEMORIAL_10_11 b
where a.candidate_id=b.dummy_id and a.venue_code='300415' and b.venue_code='300404';---1

-----55 ON hold candidates moved from R S MEMORIAL to MM QUEENS

update mts_2025_tier1_admit_card
set
examdate='2026-02-19',
examdate1='19/02/2026',
venue_code='300409',
venue_name='MM QUEENS COLLEGE JAIPUR',
venue_address='NEAR IIS SCHOOL, SHIPRA PATH, MANSAROVAR, JAIPUR, RAJASTHAN-302020',
venue_city='JAIPUR',
venue_state='RAJASTHAN',
venue_pincode='302020',
on_hold=false,
--release_admit_card=true,
is_rescheduled=true,
rem_edu='55 Hold Candidates moved from R S MEMORIAL to MM QUEENS'
where candidate_id in ('MTS250821692','MTS252256813','MTS252366807','MTS253470353','MTS252815458','MTS251914246','MTS251750303','MTS250136822','MTS252137946','MTS252008936','MTS253030083','MTS251147523','MTS251220803','MTS250494871','MTS251076136','MTS253180983','MTS251911792','MTS252145135','MTS251161022','MTS253296611','MTS251962390','MTS252968126','MTS252147416','MTS252283602','MTS250787805','MTS252302324','MTS252111893','MTS250489653','MTS253482783','MTS253455846','MTS252099265','MTS250589622','MTS253003161','MTS250911464','MTS253475466','MTS252288762','MTS251126104','MTS253201541','MTS253525472','MTS251004457','MTS252547253','MTS253426095','MTS251716252','MTS251402724','MTS251876397','MTS251782115','MTS251786487','MTS250494870','MTS252559523','MTS253184171','MTS250306970','MTS252737590','MTS251502710','MTS250702172','MTS253004816');----55 updates

-------173 SIDDIPET 16TH feb cancelled candidates rescheduled on 19th ------

update mts_2025_tier1_admit_card a
set
a.examdate='2026-02-19',
a.examdate1='19/02/2026',
a.venue_code='330202',
a.venue_name='VERITAS & VIRTUS ENGINEERING SERVICES PVT. LTD.',
a.venue_address='15-4-90/2, HANUMAN NAGAR, BESIDE RAO PUBLIC SCHOOL,KARIMNAGAR ROAD,SIDDIPET, TELANGANA-502103',
a.venue_city='SIDDIPET',
a.venue_state='TELANGANA',
a.venue_pincode='502103',
a.shift=b.new_shift,
a.is_rescheduled=true,
a.rem_edu='173 SIDDIPET 16th feb cancelled candidates rescheduled on 19th'

from mts_2025_SIDDIPET_16_cancelled b
where a.candidate_id=b.candidate_id;---173 updates


---------------3 DEBARRMENT REMOVED BY NR ------
delete from mts_2025_rejected_applications where reg_number in ('10008716837','10012983490','10012969549') ;
select * from mts_2025_tier1_admit_card where reg_number in ('10008716837','10012983490','10012969549') order by form_completion_date,form_completion_time;


select * from mts_2025_tier1_admit_card where reg_number in ('10012062603');----9 feb not downloaded
select * from mts_2025_tier1_admit_card where reg_number in ('10001806671');----18 feb rollno not generated
select * from mts_2025_tier1_admit_card where reg_number in ('10008466223');----17 feb downloaded
select * from mts_2025_tier1_admit_card where reg_number in ('10013055363');----17 feb downloaded
select * from mts_2025_tier1_admit_card where reg_number in ('1000856485');----
select * from mts_2025_tier1_admit_card where reg_number in ('10026829538');----16 rollno not generated
select * from mts_2025_tier1_admit_card where reg_number in ('10008762164');----17 downloaded
select * from mts_2025_tier1_admit_card where reg_number in ('10025214695');----16 rollno not generated
select * from mts_2025_tier1_admit_card where reg_number in ('10011268322');----17 downloaded



---------- 3394 SATNA CANDIDATES RESCHEDULED -----------

create table mts_2025_satna_rescheduled
(
	reg_number character varying,
	candidate_id character varying,
	TC_CODE character varying,
	VENUE_NAME character varying,
	VENUE_ADDRESS character varying,
	PINCODE character varying,
	ACTUAL_REGION character varying,
	ACTUAL_CITY	 character varying,
	ACTUAL_STATE character varying,
	examDate	date,
	Shift character varying
);

select * from mts_2025_satna_rescheduled;
alter table mts_2025_satna_rescheduled add column region_code character varying;
alter table mts_2025_satna_rescheduled add column examdate1 character varying;

select distinct examdate from mts_2025_satna_rescheduled;

update mts_2025_satna_rescheduled set examdate1='20/02/2026' where examdate='2026-02-20';
update mts_2025_satna_rescheduled set examdate1='19/02/2026' where examdate='2026-02-19';
update mts_2025_satna_rescheduled set examdate1='18/02/2026' where examdate='2026-02-18';

select distinct actual_region,region_code from mts_2025_satna_rescheduled;
update mts_2025_satna_rescheduled set region_code='3' where actual_region='CR';
update mts_2025_satna_rescheduled set region_code='6' where actual_region='MPR';
update mts_2025_satna_rescheduled set region_code='2' where actual_region='NR';


update mts_2025_tier1_admit_card a
set
a.examdate=b.examdate,
a.examdate1=b.examdate1,
a.region=b.actual_region,
a.region_code=b.region_code,
a.shift=b.shift,
a.venue_code=b.tc_code,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_city=b.actual_city,
a.venue_state=b.actual_state,
a.venue_pincode=b.pincode,
a.on_hold=false,
a.is_rescheduled=true,
a.rem_edu='SATNA RESCHEDULED'

from mts_2025_satna_rescheduled b
where a.reg_number=b.reg_number;---3394 updates


WITH max_per_region AS (
    SELECT
        region,
        COALESCE(MAX(counter::int), 0) AS last_cnt
    FROM mts_2025_tier1_admit_card
    GROUP BY region
),
new_rows AS (
    SELECT
        t.reg_number,
        t.region,
        m.last_cnt +
            ROW_NUMBER() OVER (
                PARTITION BY t.region
                ORDER BY t.form_completion_date, t.form_completion_time::time
            ) AS new_cnt,
        case
            when substring(t.roll_number, 1, 1) <> t.region_code then true
            else false
        end as is_roll_no_change
    FROM mts_2025_tier1_admit_card t
    JOIN max_per_region m ON t.region = m.region
	join mts_2025_satna_rescheduled s
	on t.candidate_id = s.candidate_id
    where ((t.roll_number is null)
    or substring(t.roll_number, 1, 1) <> t.region_code)
	--and s.remarks is null 
	and t.is_active = true
)
--select * from new_rows;

-- select count(*) from new_rows;----120891
UPDATE mts_2025_tier1_admit_card AS t
SET
   remarks_latest = case
                       when new_rows.is_roll_no_change then case
                                                                when remarks_latest is not null then concat(remarks_latest, ',::: Earlier Roll Number: ', roll_number)
                                                               else concat('Earlier Roll Number: ', roll_number)
                                                            end
                        else remarks_latest
                    end,
    counter = LPAD(new_rows.new_cnt::text, 7, '0'),
    roll_number = t.region_code || '25' || '27' || LPAD(new_rows.new_cnt::text, 7, '0')
FROM new_rows
WHERE t.reg_number = new_rows.reg_number;----492 updates-------------------------

update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_satna_rescheduled s
WHERE t.candidate_id= s.candidate_id;---3394 updates


update mts_2025_tier1_admit_card a
set
a.examdate='2026-02-20',
a.examdate1='20/02/2026',
--a.region=b.actual_region,
--a.region_code=b.region_code,
a.shift=b.new_shift,
a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_address=b.address,
a.venue_city=b.city,
a.venue_state=b.state,
a.venue_pincode=b.pincode,
--a.on_hold=false,
a.is_rescheduled=true,
a.rem_edu='1227 NWR on Hold candidates rescheduled'
from mts_2025_nwr_20th b
where a.candidate_id=b.dummy_id;--1227 updates


WITH max_per_region AS (
    SELECT
        region,
        COALESCE(MAX(counter::int), 0) AS last_cnt
    FROM mts_2025_tier1_admit_card
    GROUP BY region
),
new_rows AS (
    SELECT
        t.reg_number,
        t.region,
        m.last_cnt +
            ROW_NUMBER() OVER (
                PARTITION BY t.region
                ORDER BY t.form_completion_date, t.form_completion_time::time
            ) AS new_cnt,
        case
            when substring(t.roll_number, 1, 1) <> t.region_code then true
            else false
        end as is_roll_no_change
    FROM mts_2025_tier1_admit_card t
    JOIN max_per_region m ON t.region = m.region
	join mts_2025_nwr_20th s
	on t.candidate_id = s.dummy_id
    where ((t.roll_number is null)
    or substring(t.roll_number, 1, 1) <> t.region_code)
	--and s.remarks is null 
	and t.is_active = true
)
--select * from new_rows;

-- select count(*) from new_rows;----120891
UPDATE mts_2025_tier1_admit_card AS t
SET
   remarks_latest = case
                       when new_rows.is_roll_no_change then case
                                                                when remarks_latest is not null then concat(remarks_latest, ',::: Earlier Roll Number: ', roll_number)
                                                               else concat('Earlier Roll Number: ', roll_number)
                                                            end
                        else remarks_latest
                    end,
    counter = LPAD(new_rows.new_cnt::text, 7, '0'),
    roll_number = t.region_code || '25' || '27' || LPAD(new_rows.new_cnt::text, 7, '0')
FROM new_rows
WHERE t.reg_number = new_rows.reg_number;----236 updates-------------------------


update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_nwr_20th s
WHERE t.candidate_id= s.dummy_id;---1227 updates

update mts_2025_tier1_admit_card
set on_hold=false where rem_edu='1227 NWR on Hold candidates rescheduled';--1227 updates


select distinct a.is_active, a.rem_edu,a.on_hold,a.is_hidden,a.req_admit_card,a.release_Admit_card from mts_2025_tier1_admit_card a,
mts_2025_nwr_20th b where a.candidate_id=b.dummy_id;


---------7491 varanasi on Hold candidates rescheduled--------

update mts_2025_tier1_admit_card a
set
a.examdate='2026-02-20',
a.examdate1='20/02/2026',
--a.region=b.actual_region,
--a.region_code=b.region_code,
a.shift=b.shift,
a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_city=b.actual_city,
a.venue_state=b.actual_state,
a.venue_pincode=b.venue_pincode,
--a.on_hold=false,
a.is_rescheduled=true,
a.rem_edu='7491 varanasi on Hold candidates rescheduled'
from mts_2025_varanasi_hold_candidates b
where a.candidate_id=b.candidate_id;---7491 updates

update mts_2025_tier1_admit_card
set on_hold=false where rem_edu= '7491 varanasi on Hold candidates rescheduled';----7491 updates

-----------Shifa 222 16th Shift 3 cancelled candidates moved to 20th shift2---------------

update mts_2025_tier1_admit_card a
set
examdate='2026-02-20',
examdate1='20/02/2026',
shift='2',
examtime='01:00 PM To 02:30 PM',
repotime='11:30 AM',
gateclose='12:30 PM',
is_rescheduled=true,
rem_edu='Shifa 222 16th Shift 3 cancelled candidates moved to 20th shift2'
where candidate_id in ('MTS250863377','MTS250016497','MTS251161017','MTS252172576','MTS251946828','MTS252234197','MTS252691887','MTS250819147','MTS252896376','MTS251701836','MTS250294657','MTS252928388','MTS253074278','MTS252022057','MTS252426206','MTS251306116','MTS253104416','MTS250168416','MTS252755516','MTS250764716','MTS250628126','MTS250238726','MTS252279136','MTS252554766','MTS252752146','MTS252155146','MTS250262546','MTS253305546','MTS251056646','MTS250455756','MTS250753366','MTS252096566','MTS253320966','MTS252998966','MTS250019476','MTS251657096','MTS252796207','MTS250130907','MTS250750217','MTS252040917','MTS251819237','MTS252641847','MTS252854357','MTS250323006','MTS252405216','MTS252765216','MTS252354816','MTS253322126','MTS251388126','MTS252053326','MTS251873626','MTS250885336','MTS252365836','MTS250160046','MTS253519656','MTS253177266','MTS251991766','MTS250461966','MTS251107576','MTS250927576','MTS250999676','MTS253402876','MTS252285886','MTS252587296','MTS251973896','MTS250849207','MTS250775307','MTS250895307','MTS252077607','MTS250828707','MTS250050317','MTS250860717','MTS253182027','MTS250447437','MTS251830537','MTS250882837','MTS252894047','MTS251300447','MTS251970447','MTS252155457','MTS251571557','MTS251753657','MTS252934657','MTS253008346','MTS252605566','MTS250877847','MTS251655457','MTS253383957','MTS250136995','MTS251276006','MTS250486006','MTS251984806','MTS253176906','MTS251553116','MTS251960316','MTS252240616','MTS252871526','MTS252395526','MTS250653536','MTS250205736','MTS252949736','MTS250372046','MTS250754546','MTS252017646','MTS250201746','MTS253186846','MTS251907846','MTS251722946','MTS250015056','MTS250097356','MTS250342066','MTS253081866','MTS252187476','MTS251280876','MTS252190286','MTS250118386','MTS253126486','MTS250995886','MTS252959096','MTS252655196','MTS251048196','MTS250333107','MTS253233407','MTS251826907','MTS250648217','MTS252679217','MTS252748317','MTS251070717','MTS253490027','MTS252321327','MTS253594327','MTS250273427','MTS252079427','MTS250640727','MTS251185237','MTS252154537','MTS252602637','MTS250674637','MTS250108837','MTS250418047','MTS250620347','MTS251311547','MTS251465547','MTS251733157','MTS251489257','MTS253341357','MTS250862557','MTS250011845','MTS250195356','MTS251238186','MTS250126276','MTS253336926','MTS251040845','MTS251828626','MTS250023236','MTS250610707','MTS250655496','MTS251583927','MTS250631817','MTS251520737','MTS252179396','MTS253349196','MTS250156437','MTS251157508','MTS253606455','MTS250273717','MTS251775666','MTS252575746','MTS250547347','MTS250845845','MTS250862637','MTS251143456','MTS252099995','MTS252147576','MTS252427936','MTS253391717','MTS253612686','MTS250158366','MTS251705996','MTS251954656','MTS251640607','MTS250041086','MTS253150055','MTS252943736','MTS253319776','MTS253336387','MTS252993176','MTS251401445','MTS250121445','MTS252763445','MTS252016445','MTS250926445','MTS252678445','MTS250302545','MTS251339545','MTS252157645','MTS250108645','MTS253579645','MTS253589645','MTS253451745','MTS253581745','MTS253404745','MTS253078745','MTS250289745','MTS250620845','MTS253404845','MTS250095845','MTS252787845','MTS252740945','MTS250783945','MTS252887055','MTS252780155','MTS252983155','MTS251857155','MTS253262255','MTS251645255','MTS251916255','MTS251451355','MTS253588455','MTS252780555','MTS252972555','MTS252630655');


------- 24316 11th on HOLD candidates rescheduled------

update mts_2025_tier1_admit_card a
set
a.examdate='2026-02-20',
a.examdate1='20/02/2026',
--a.region=b.actual_region,
--a.region_code=b.region_code,
a.shift=b.shift,
a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_city=b.actual_city,
a.venue_state=b.actual_state,
a.venue_pincode=b.venue_pincode,
--a.on_hold=false,
a.is_rescheduled=true,
a.rem_edu='24316 11th on hold candidates rescheduled'
from mts_2025_11_hold_candidates b
where a.candidate_id=b.candidate_id;---24316 updates

update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_11_hold_candidates s
WHERE t.candidate_id= s.candidate_id;---24316 updates

------275 RCRD KANYA MAHAVIDYALAY 16th candidates rescheduled on 20th shift1------

update mts_2025_tier1_admit_card a
set
examdate='2026-02-20',
examdate1='20/02/2026',
shift='1',
examtime='09:00 AM To 10:30 AM',
repotime='07:30 AM',
gateclose='08:30 AM',
is_rescheduled=true,
rem_edu='RCRD KANYA MAHAVIDYALAY 16th 275 candidates moved to 20th shift1'
where roll_number in ('325270471478','325270472672','325270473462','325270475224','325270475798','325270476388','325270476833','325270477936','325270478271','325270480124','325270480492','325270481094','325270481388','325270482623','325270483090','325270483655','325270485462','325270485512','325270485715','325270486417','325270486524','325270486988','325270487583','325270487915','325270488038','325270488223','325270488868','325270489257','325270490992','325270491510','325270491663','325270492151','325270492208','325270492623','325270493371','325270493594','325270493933','325270493989','325270494129','325270494259','325270495537','325270496194','325270497332','325270497474','325270497488','325270497682','325270497801','325270499484','325270502316','325270502640','325270503115','325270503966','325270504202','325270504562','325270505774','325270507543','325270507663','325270508202','325270508837','325270509768','325270510877','325270510946','325270511612','325270513175','325270514672','325270514887','325270514946','325270515719','325270516613','325270517303','325270518614','325270518658','325270519579','325270521426','325270521649','325270522046','325270522605','325270523430','325270526102','325270526773','325270528308','325270529415','325270529681','325270530127','325270530693','325270530844','325270531283','325270532263','325270533937','325270534851','325270534926','325270535048','325270535601','325270535666','325270535987','325270536176','325270536395','325270536631','325270536950','325270537268','325270537489','325270538723','325270539682','325270540117','325270540426','325270540505','325270540523','325270540931','325270541854','325270542731','325270543351','325270543500','325270544193','325270547501','325270548359','325270548441','325270548893','325270549191','325270549299','325270549523','325270550594','325270550793','325270550842','325270550993','325270551767','325270552061','325270552241','325270552599','325270552697','325270552935','325270553303','325270554980','325270555983','325270557015','325270557259','325270557275','325270558331','325270558453','325270558848','325270559871','325270562885','325270562905','325270564372','325270564636','325270565428','325270565822','325270565995','325270566379','325270566586','325270567496','325270567655','325270567853','325270568450','325270569222','325270569584','325270571739','325270571800','325270572065','325270572948','325270573290','325270574603','325270575353','325270576157','325270576220','325270576541','325270577154','325270577304','325270577427','325270577561','325270578461','325270579881','325270580069','325270581018','325270581956','325270582688','325270583411','325270585364','325270585679','325270586266','325270587680','325270588504','325270589151','325270589216','325270589345','325270591602','325270592036','325270593695','325270593754','325270594432','325270594870','325270594883','325270598774','325270599016','325270599112','325270599898','325270600862','325270602188','325270603202','325270603422','325270604230','325270605569','325270607514','325270608172','325270608347','325270609233','325270611508','325270611537','325270612397','325270613411','325270615490','325270617981','325270618189','325270621011','325270621251','325270621757','325270623336','325270623847','325270624323','325270625567','325270627139','325270627925','325270630235','325270630759','325270631996','325270632475','325270633020','325270633484','325270634139','325270641938','325270642235','325270642481','325270645596','325270649009','325270651484','325270651729','325270652740','325270653255','325270654224','325270655304','325270656751','325270657680','325270657747','325270659494','325270660698','325270661582','325270661704','325270662252','325270663481','325270664601','325270664689','325270664910','325270665013','325270667163','325270668187','325270669113','325270669608','325270669949','325270670188','325270670604','325270671108','325270671769','325270671969','325270672001','325270672338','325270687344','325270687532','325270688375','325270689179','325270689502','325270689530','325270689703','325270689867','325270690260','325270690287','325270690594');


-------------------'TISSA TECHNOLOGY 16th 145 candidates rescheduled on 20th shift1'------------------

update mts_2025_tier1_admit_card a
set
examdate='2026-02-20',
examdate1='20/02/2026',
shift='1',
examtime='09:00 AM To 10:30 AM',
repotime='07:30 AM',
gateclose='08:30 AM',
is_rescheduled=true,
rem_edu='TISSA TECHNOLOGY 16th 145 candidates rescheduled on 20th shift1'
where roll_number in
('425270203622','425270203994','425270204015','425270205050','425270206532','425270208869','425270210742','425270212092','425270214491','425270214619','425270216240','425270218207','425270218222','425270219961','425270219993','425270220348','425270220582','425270220850','425270221312','425270221945','425270222323','425270224349','425270225026','425270226533','425270227698','425270227854','425270227868','425270229118','425270229284','425270229824','425270229864','425270230100','425270230303','425270232334','425270233739','425270233799','425270235500','425270235927','425270236367','425270236527','425270237018','425270237344','425270238099','425270238137','425270238360','425270238390','425270238488','425270239548','425270240546','425270241278','425270241388','425270241466','425270241549','425270242100','425270242589','425270243392','425270243682','425270244145','425270244315','425270244998','425270245336','425270245401','425270246190','425270246195','425270247270','425270248993','425270249561','425270250576','425270251568','425270252096','425270252692','425270252744','425270252779','425270252867','425270252937','425270252973','425270253128','425270253686','425270254522','425270254884','425270255973','425270256183','425270256497','425270257866','425270258233','425270258515','425270258611','425270258690','425270258904','425270258914','425270259166','425270259549','425270260627','425270261070','425270261107','425270261577','425270262824','425270262850','425270262998','425270263051','425270263226','425270263947','425270264249','425270266244','425270266275','425270266279','425270266477','425270266481','425270266542','425270267209','425270267349','425270268620','425270269196','425270269733','425270269924','425270270097','425270271236','425270271301','425270272095','425270272922','425270273437','425270273454','425270274705','425270275018','425270275370','425270275458','425270275710','425270276492','425270276543','425270277022','425270277157','425270277181','425270298822','425270299664','425270300071','425270300261','425270300358','425270300449','425270300865','425270301246','425270301507','425270301720','425270301771','425270301819','425270302184');


-------------------1275 Re-scheduled 19th Candidate to 20th Feb 2026 in Siliguri------------

update mts_2025_tier1_admit_card a
set
a.examdate='2026-02-20',
a.examdate1='20/02/2026',
--a.region=b.actual_region,
--a.region_code=b.region_code,
a.shift=b.shift,
a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_city=b.city,
a.venue_state=b.venue_state,
a.venue_pincode=b.venue_pincode,
--a.on_hold=false,
a.is_rescheduled=true,
a.rem_edu='1275 Re-scheduled 19th Candidate to 20th Feb 2026 in Siliguri'
from mts_2025_siliguri_candidates b
where a.candidate_id=b.candidate_id;---1275 updates

update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_siliguri_candidates s
WHERE t.candidate_id= s.candidate_id;---1275 updates

update mts_2025_tier1_admit_card
set on_hold=false where rem_edu='1275 Re-scheduled 19th Candidate to 20th Feb 2026 in Siliguri';---1275 updates

------------------- MAHARAJA AGARSEN 16th 25 candidates rescheduled on 20th shift1--------------

update mts_2025_tier1_admit_card a
set
examdate='2026-02-20',
examdate1='20/02/2026',
shift='1',
examtime='09:00 AM To 10:30 AM',
repotime='07:30 AM',
gateclose='08:30 AM',
venue_code='140101',
venue_name='EXAM GENIUS ASSOCIATES',
venue_city='PANCHKULA',
venue_address='VASUNDHRA GARDEN,NH-7,VILLAGE MAULI, DISTT PANCHKULA,HARYANA-134118',
venue_pincode='134118',
venue_state='HARYANA',
is_rescheduled=true,
rem_edu='MAHARAJA AGARSEN 16th 25 candidates rescheduled on 20th shift1'
where roll_number in 
('125270130303','125270129924','125270129925','125270130232','125270130022','125270130324','125270130332','125270130101','125270130137','125270130340','125270129975','125270130272','125270130377','125270130376','125270129796','125270130430','125270130274','125270130330','125270129851','125270129861','125270130064','125270130229','125270130317','125270130278','125270129958');


--------8 SR updates-------------------------

update mts_2025_tier1_admit_card a
set
a.examdate='2026-02-19',
a.examdate1='19/02/2026',
a.region='SR',
a.region_code='8',
a.shift='1',
a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_city=b.city,
a.venue_state=b.venue_state,
a.venue_pincode=b.venue_pincode,
--a.on_hold=false,
a.is_rescheduled=true,
a.rem_edu='SR 8 candidates rescheduled on 19th'
from mts_2025_8_sr b
where a.candidate_id=b.candidate_id;---8 updates


update mts_2025_tier1_admit_card
set 
shift='1',
examtime='09:00 AM To 11:00 AM',
repotime='07:30 AM',
gateclose='08:30 AM'
where examdate='2026-02-20' and roll_number is not null and shift='2' and comp_time='Yes';---73

---------SR 155 11th candidates rescheduled on 19th------------

update mts_2025_tier1_admit_card a
set
a.examdate='2026-02-19',
a.examdate1='19/02/2026',
--a.region='SR',
--a.region_code='8',
a.shift=b.shift,
--a.venue_code=b.venue_code,
--a.venue_name=b.venue_name,
--a.venue_address=b.venue_address,
--a.venue_city=b.city,
--a.venue_state=b.venue_state,
--a.venue_pincode=b.venue_pincode,
--a.on_hold=false,
a.is_rescheduled=true,
a.rem_edu='SR 155 11th candidates rescheduled on 19th'
from mts_2025_155_SR b
where a.reg_number=b.reg_number;---155 updates

update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_155_SR s
WHERE t.reg_number= s.reg_number;---155 updates

select distinct a.shift,a.repotime,a.gateclose,a.comp_time,a.examtime,count(*) 
from mts_2025_tier1_admit_card a,
mts_2025_155_SR b
where a.reg_number=b.reg_number
group by a.shift,a.repotime,a.gateclose,a.comp_time,a.examtime;

---------- ER 155 19th siliguri candidates rescheduled on 20th----------

update mts_2025_tier1_admit_card a
set
a.examdate='2026-02-20',
a.examdate1='20/02/2026',
a.shift=b.shift,
a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_city=b.city,
a.venue_state=b.state,
a.venue_pincode=b.pincode,
a.on_hold=false,
a.is_rescheduled=true,
a.rem_edu='ER 155 19th siliguri candidates rescheduled on 20th'
from mts_2025_siliguri_155 b
where a.candidate_id=b.candidate_id;---155 updates

update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_siliguri_155 s
WHERE t.candidate_id= s.candidate_id;---155 updates

update mts_2025_tier1_admit_card
set release_admit_card=true
where rem_edu='ER 155 19th siliguri candidates rescheduled on 20th';--155 updates


update mts_2025_tier1_admit_card
set examdate='2026-02-20',
examdate1='20/02/2026',
shift='1',
venue_code='50737',
venue_name='BAPU PARIKSHA PARISAR BLOCK-C',
venue_address='GATE NO.6, BAPU PARIKSHA PARISAR-BLOCK C, MAURYA VIHAR COLONY, KUMHRAR, PATNA, BIHAR -800026',
venue_city='PATNA',
venue_state='BIHAR',
venue_pincode='800026',
rem_edu='303 CR 16th VARANASI candidates rescheduled on 20th',
is_rescheduled=true,
on_hold=false
where reg_number in ('10006512600','10023888783','10023826418','10009382948','10000909797','10020002258','10018486352','10006735540','10009576945','10001274324','10012282286','10012228997','10023711703','10001249303','10023408422','10023553165','10011054449','10000980779','10020734452','10002126634','10024307767','10018561693','10000705352','10001117656','10022060025','10015262545','10019075055','10017516578','10024522582','10013121519','10016645365','10026432629','10024619688','10024629054','10024349154','10017490282','10009486777','10024667946','10018694228','10011004116','10025056665','10019076204','10005733176','10024809899','10009214935','10024903516','10026871629','10024911387','10008043836','10009116673','10008699306','10001814453','10006698486','10005725783','10016661947','10025132237','10022544573','10025092826','10019897579','10025076615','10015313254','10001342054','10025193307','10025044017','10015311383','10021757565','10024811772','10025249422','10025302775','10020797927','10025311779','10025444428','10020902355','10025315353','10022246387','10025395562','10011493842','10025417409','10018769346','10012236940','10001658633','10025493667','10024317910','10025540528','10020889967','10025582930','10000167705','10025454790','10023533501','10005896663','10014535582','10020913253','10010258416','10015235529','10025728710','10025714130','10025756738','10017223112','10015430116','10013175397','10009432353','10015748975','10025885913','10001256556','10017087715','10009125792','10025940834','10017012422','10026438173','10008805916','10025529226','10015012840','10006543314','10023475514','10024286670','10025348410','10018833888','10016412167','10020410350','10025773527','10013395823','10005959925','10001063749','10026042262','10014428813','10012511471','10021874908','10026168998','10022224381','10025655255','10013193123','10026288534','10025141035','10018846944','10020042132','10025654624','10013803573','10023451723','10026369213','10026212813','10012694469','10026410108','10011285644','10011211299','10014368870','10014334057','10019166532','10014644256','10026642355','10001156284','10014974560','10001579994','10026674058','10000155584','10013660463','10026424722','10013664092','10008995377','10026959392','10026945603','10025946079','10026691880','10026965788','10023409658','10010518096','10010255108','10023324174','10011122229','10026703692','10026709601','10016706421','10026728714','10026734241','10009081931','10026734001','10012561132','10022373622','10026562135','10026765693','10026775698','10026792821','10021748356','10026806629','10010486012','10026453821','10016782677','10014283700','10008396325','10026837143','10016856530','10016691550','10013057115','10020795630','10026577893','10016495853','10017713561','10015086381','10016255009','10026677399','10001004558','10026891164','10017223703','10008216359','10014574291','10026885607','10013421262','10018114193','10026911140','10012911026','10026936540','10008667455','10026978868','10026959428','10001771727','10023438362','10017034229','10009659330','10008444402','10017764112','10008085607','10009151739','10024515488','10008446800','10011315291','10008581268','10020393975','10012890505','10001473251','10016691106','10014161458','10022378409','10018057994','10012430878','10009647191','10011523899','10024910699','10020260176','10025509773','10017811428','10015903843','10024610276','10011858058','10026838351','10000024453','10009116454','10025296672','10005857112','10026218855','10023245163','10011879674','10024599164','10025862343','10026331433','10010571683','10010763947','10000898534','10010307667','10001077687','10013202807','10024676465','10016029481','10026955857','10018132800','10010283922','10026462294','10016889790','10014193224','10023334578','10021854328','10023968229','10001041032','10023358013','10001674817','10026058399','10017603271','10026897229','10005841196','10014946588','10021263932','10010861506','10006347530','10026447130','10013437065','10026914431','10026961866','10008556128','10025052969','10025609133','10025954356','10026823441','10000698359','10026914168','10020663698','10012993023','10019630005','10011723711','10000034693','10015446755','10025363887','10010736997','10013524246','10012694769','10001806740');


update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
where t.reg_number in ('10006512600','10023888783','10023826418','10009382948','10000909797','10020002258','10018486352','10006735540','10009576945','10001274324','10012282286','10012228997','10023711703','10001249303','10023408422','10023553165','10011054449','10000980779','10020734452','10002126634','10024307767','10018561693','10000705352','10001117656','10022060025','10015262545','10019075055','10017516578','10024522582','10013121519','10016645365','10026432629','10024619688','10024629054','10024349154','10017490282','10009486777','10024667946','10018694228','10011004116','10025056665','10019076204','10005733176','10024809899','10009214935','10024903516','10026871629','10024911387','10008043836','10009116673','10008699306','10001814453','10006698486','10005725783','10016661947','10025132237','10022544573','10025092826','10019897579','10025076615','10015313254','10001342054','10025193307','10025044017','10015311383','10021757565','10024811772','10025249422','10025302775','10020797927','10025311779','10025444428','10020902355','10025315353','10022246387','10025395562','10011493842','10025417409','10018769346','10012236940','10001658633','10025493667','10024317910','10025540528','10020889967','10025582930','10000167705','10025454790','10023533501','10005896663','10014535582','10020913253','10010258416','10015235529','10025728710','10025714130','10025756738','10017223112','10015430116','10013175397','10009432353','10015748975','10025885913','10001256556','10017087715','10009125792','10025940834','10017012422','10026438173','10008805916','10025529226','10015012840','10006543314','10023475514','10024286670','10025348410','10018833888','10016412167','10020410350','10025773527','10013395823','10005959925','10001063749','10026042262','10014428813','10012511471','10021874908','10026168998','10022224381','10025655255','10013193123','10026288534','10025141035','10018846944','10020042132','10025654624','10013803573','10023451723','10026369213','10026212813','10012694469','10026410108','10011285644','10011211299','10014368870','10014334057','10019166532','10014644256','10026642355','10001156284','10014974560','10001579994','10026674058','10000155584','10013660463','10026424722','10013664092','10008995377','10026959392','10026945603','10025946079','10026691880','10026965788','10023409658','10010518096','10010255108','10023324174','10011122229','10026703692','10026709601','10016706421','10026728714','10026734241','10009081931','10026734001','10012561132','10022373622','10026562135','10026765693','10026775698','10026792821','10021748356','10026806629','10010486012','10026453821','10016782677','10014283700','10008396325','10026837143','10016856530','10016691550','10013057115','10020795630','10026577893','10016495853','10017713561','10015086381','10016255009','10026677399','10001004558','10026891164','10017223703','10008216359','10014574291','10026885607','10013421262','10018114193','10026911140','10012911026','10026936540','10008667455','10026978868','10026959428','10001771727','10023438362','10017034229','10009659330','10008444402','10017764112','10008085607','10009151739','10024515488','10008446800','10011315291','10008581268','10020393975','10012890505','10001473251','10016691106','10014161458','10022378409','10018057994','10012430878','10009647191','10011523899','10024910699','10020260176','10025509773','10017811428','10015903843','10024610276','10011858058','10026838351','10000024453','10009116454','10025296672','10005857112','10026218855','10023245163','10011879674','10024599164','10025862343','10026331433','10010571683','10010763947','10000898534','10010307667','10001077687','10013202807','10024676465','10016029481','10026955857','10018132800','10010283922','10026462294','10016889790','10014193224','10023334578','10021854328','10023968229','10001041032','10023358013','10001674817','10026058399','10017603271','10026897229','10005841196','10014946588','10021263932','10010861506','10006347530','10026447130','10013437065','10026914431','10026961866','10008556128','10025052969','10025609133','10025954356','10026823441','10000698359','10026914168','10020663698','10012993023','10019630005','10011723711','10000034693','10015446755','10025363887','10010736997','10013524246','10012694769','10001806740');

update mts_2025_tier1_admit_card
set release_admit_card=true
where reg_number in ('10006512600','10023888783','10023826418','10009382948','10000909797','10020002258','10018486352','10006735540','10009576945','10001274324','10012282286','10012228997','10023711703','10001249303','10023408422','10023553165','10011054449','10000980779','10020734452','10002126634','10024307767','10018561693','10000705352','10001117656','10022060025','10015262545','10019075055','10017516578','10024522582','10013121519','10016645365','10026432629','10024619688','10024629054','10024349154','10017490282','10009486777','10024667946','10018694228','10011004116','10025056665','10019076204','10005733176','10024809899','10009214935','10024903516','10026871629','10024911387','10008043836','10009116673','10008699306','10001814453','10006698486','10005725783','10016661947','10025132237','10022544573','10025092826','10019897579','10025076615','10015313254','10001342054','10025193307','10025044017','10015311383','10021757565','10024811772','10025249422','10025302775','10020797927','10025311779','10025444428','10020902355','10025315353','10022246387','10025395562','10011493842','10025417409','10018769346','10012236940','10001658633','10025493667','10024317910','10025540528','10020889967','10025582930','10000167705','10025454790','10023533501','10005896663','10014535582','10020913253','10010258416','10015235529','10025728710','10025714130','10025756738','10017223112','10015430116','10013175397','10009432353','10015748975','10025885913','10001256556','10017087715','10009125792','10025940834','10017012422','10026438173','10008805916','10025529226','10015012840','10006543314','10023475514','10024286670','10025348410','10018833888','10016412167','10020410350','10025773527','10013395823','10005959925','10001063749','10026042262','10014428813','10012511471','10021874908','10026168998','10022224381','10025655255','10013193123','10026288534','10025141035','10018846944','10020042132','10025654624','10013803573','10023451723','10026369213','10026212813','10012694469','10026410108','10011285644','10011211299','10014368870','10014334057','10019166532','10014644256','10026642355','10001156284','10014974560','10001579994','10026674058','10000155584','10013660463','10026424722','10013664092','10008995377','10026959392','10026945603','10025946079','10026691880','10026965788','10023409658','10010518096','10010255108','10023324174','10011122229','10026703692','10026709601','10016706421','10026728714','10026734241','10009081931','10026734001','10012561132','10022373622','10026562135','10026765693','10026775698','10026792821','10021748356','10026806629','10010486012','10026453821','10016782677','10014283700','10008396325','10026837143','10016856530','10016691550','10013057115','10020795630','10026577893','10016495853','10017713561','10015086381','10016255009','10026677399','10001004558','10026891164','10017223703','10008216359','10014574291','10026885607','10013421262','10018114193','10026911140','10012911026','10026936540','10008667455','10026978868','10026959428','10001771727','10023438362','10017034229','10009659330','10008444402','10017764112','10008085607','10009151739','10024515488','10008446800','10011315291','10008581268','10020393975','10012890505','10001473251','10016691106','10014161458','10022378409','10018057994','10012430878','10009647191','10011523899','10024910699','10020260176','10025509773','10017811428','10015903843','10024610276','10011858058','10026838351','10000024453','10009116454','10025296672','10005857112','10026218855','10023245163','10011879674','10024599164','10025862343','10026331433','10010571683','10010763947','10000898534','10010307667','10001077687','10013202807','10024676465','10016029481','10026955857','10018132800','10010283922','10026462294','10016889790','10014193224','10023334578','10021854328','10023968229','10001041032','10023358013','10001674817','10026058399','10017603271','10026897229','10005841196','10014946588','10021263932','10010861506','10006347530','10026447130','10013437065','10026914431','10026961866','10008556128','10025052969','10025609133','10025954356','10026823441','10000698359','10026914168','10020663698','10012993023','10019630005','10011723711','10000034693','10015446755','10025363887','10010736997','10013524246','10012694769','10001806740');


-----------SATNA 69 16th candidates rescheduled on 20th ---------------

update mts_2025_tier1_admit_card a
set
examdate='2026-02-20',
examdate1='20/02/2026',
shift='1',
examtime='09:00 AM To 10:30 AM',
repotime='07:30 AM',
gateclose='08:30 AM',
venue_code='210503',
venue_name='MEENAAKSHI ACADEMY OF PARAMEDICAL SCIENCE',
venue_city='JABALPUR',
venue_address='SHREEJI INFOTEC PLOT NO F5/F6 IT PARK, BARGI HILLS, TILWARA, JABALPUR,MADHYA PRADESH - 482003',
venue_pincode='482003',
venue_state='MADHYA PRADESH',
is_rescheduled=true,
on_hold=false,
rem_edu='SATNA 16th 69 candidates rescheduled on 20th'
where reg_number in ('10021745790','10012390564','10024833467','10011000482','10006466071','10025032209','10021285989','10012027319','10023951464','10022369041','10023274586','10025410849','10024046033','10017028335','10018517972','10008379731','10023380623','10000049260','10010175938','10021035882','10019874958','10025740585','10009828069','10018750106','10011355183','10016398483','10012804607','10013027860','10019490863','10026588442','10002112161','10026810848','10024719095','10026099499','10020997371');

update mts_2025_tier1_admit_card a
set
examdate='2026-02-20',
examdate1='20/02/2026',
shift='2',
examtime='01:00 PM To 02:30 PM',
repotime='11:30 AM',
gateclose='12:30 PM',
venue_code='210503',
venue_name='MEENAAKSHI ACADEMY OF PARAMEDICAL SCIENCE',
venue_city='JABALPUR',
venue_address='SHREEJI INFOTEC PLOT NO F5/F6 IT PARK, BARGI HILLS, TILWARA, JABALPUR,MADHYA PRADESH - 482003',
venue_pincode='482003',
venue_state='MADHYA PRADESH',
is_rescheduled=true,
on_hold=false,
rem_edu='SATNA 16th 69 candidates rescheduled on 20th'
where reg_number in ('10014005480','10009292633','10013968071','10016198151','10021743486','10000761748','10011701883','10019134112','10024684925','10011190582','10025191446','10024702520','10015128252','10022389489','10018534379','10008172698','10001057262','10014018083','10026674153','10017194226','10025106626','10026351511','10026378550','10026387978','10011718557','10026773799','10008194610','10008342918','10014340110','10021042626','10026690531','10009636609','10026876615','10024554184');


----------69 missed slot candidates scheduled -----------------

update mts_2025_tier1_admit_card a
set
a.examdate=b.examdate,
a.examdate1=b.examdate1,
a.shift=b.new_shift,
a.region=b.region,
a.region_code=b.region_code,
a.venue_code=b.tc_code,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_city=b.actual_city,
a.venue_state=b.actual_state,
a.venue_pincode=b.pincode,
a.on_hold=false,
--a.is_rescheduled=true,
a.rem_edu=' 69 missed slot candidates rescheduled on 20th'
from mts_2025_69_missed_slot b
where a.candidate_id=b.candidate_id;---69 updates


update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_69_missed_slot s
WHERE t.candidate_id= s.candidate_id;---69 updates

select * into mts_2025_tier1_admit_card_final_bkp_18feb from mts_2025_tier1_admit_card;

WITH max_per_region AS (
    SELECT
        region,
        COALESCE(MAX(counter::int), 0) AS last_cnt
    FROM mts_2025_tier1_admit_card
    GROUP BY region
),
new_rows AS (
    SELECT
        t.reg_number,
        t.region,
        m.last_cnt +
            ROW_NUMBER() OVER (
                PARTITION BY t.region
                ORDER BY t.form_completion_date, t.form_completion_time::time
            ) AS new_cnt,
        case
            when substring(t.roll_number, 1, 1) <> t.region_code then true
            else false
        end as is_roll_no_change
    FROM mts_2025_tier1_admit_card t
    JOIN max_per_region m ON t.region = m.region
	join mts_2025_69_missed_slot s
	on t.candidate_id = s.candidate_id
    where ((t.roll_number is null)
    or substring(t.roll_number, 1, 1) <> t.region_code)
	--and s.remarks is null 
	and t.is_active = true
)
--select * from new_rows;

-- select count(*) from new_rows;----120891
UPDATE mts_2025_tier1_admit_card AS t
SET
   remarks_latest = case
                       when new_rows.is_roll_no_change then case
                                                                when remarks_latest is not null then concat(remarks_latest, ',::: Earlier Roll Number: ', roll_number)
                                                               else concat('Earlier Roll Number: ', roll_number)
                                                            end
                        else remarks_latest
                    end,
    counter = LPAD(new_rows.new_cnt::text, 7, '0'),
    roll_number = t.region_code || '25' || '27' || LPAD(new_rows.new_cnt::text, 7, '0')
FROM new_rows
WHERE t.reg_number = new_rows.reg_number;----69 updates-------------------------

update mts_2025_tier1_admit_card
set req_admit_card=true,
release_admit_card=true
where rem_edu=' 69 missed slot candidates rescheduled on 20th';---69 updates

------------4 slot missed candidates---------------

update mts_2025_tier1_admit_card a
set
a.examdate=b.examdate,
a.examdate1=b.examdate1,
a.shift=b.shift,
a.region=b.region,
a.region_code=b.region_code,
a.venue_code=b.venue_code,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_city=b.city,
a.venue_state=b.state,
a.venue_pincode=b.pincode,
--a.on_hold=false,
--a.is_rescheduled=true,
a.rem_edu='4 missed slot candidates rescheduled'
from mts_2025_4_candidates b
where a.candidate_id=b.candidate_id;---4 updates

update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_4_candidates s
WHERE t.candidate_id= s.candidate_id;---4 updates

WITH max_per_region AS (
    SELECT
        region,
        COALESCE(MAX(counter::int), 0) AS last_cnt
    FROM mts_2025_tier1_admit_card
    GROUP BY region
),
new_rows AS (
    SELECT
        t.reg_number,
        t.region,
        m.last_cnt +
            ROW_NUMBER() OVER (
                PARTITION BY t.region
                ORDER BY t.form_completion_date, t.form_completion_time::time
            ) AS new_cnt,
        case
            when substring(t.roll_number, 1, 1) <> t.region_code then true
            else false
        end as is_roll_no_change
    FROM mts_2025_tier1_admit_card t
    JOIN max_per_region m ON t.region = m.region
	join mts_2025_4_candidates s
	on t.candidate_id = s.candidate_id
    where ((t.roll_number is null)
    or substring(t.roll_number, 1, 1) <> t.region_code)
	--and s.remarks is null 
	and t.is_active = true
)
--select * from new_rows;

-- select count(*) from new_rows;----120891
UPDATE mts_2025_tier1_admit_card AS t
SET
   remarks_latest = case
                       when new_rows.is_roll_no_change then case
                                                                when remarks_latest is not null then concat(remarks_latest, ',::: Earlier Roll Number: ', roll_number)
                                                               else concat('Earlier Roll Number: ', roll_number)
                                                            end
                        else remarks_latest
                    end,
    counter = LPAD(new_rows.new_cnt::text, 7, '0'),
    roll_number = t.region_code || '25' || '27' || LPAD(new_rows.new_cnt::text, 7, '0')
FROM new_rows
WHERE t.reg_number = new_rows.reg_number;----4 updates-------------------------

update mts_2025_tier1_admit_card
set req_admit_card=true,
release_admit_card=true
where rem_edu='4 missed slot candidates rescheduled';---4 updates

update mts_2025_tier1_admit_card a
set
a.examdate='2026-02-20',
a.examdate1='20/02/2026',
a.shift='1',
a.region=b.region,
a.region_code=b.region_code,
a.venue_code=b.tc_code,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_city=b.actual_city,
a.venue_state=b.actual_state,
a.venue_pincode=b.pincode,
a.on_hold=false,
a.is_rescheduled=true,
a.rem_edu=' 83 missed slot candidates rescheduled on 20th'
from mts_2025_83_missed_slot b
where a.candidate_id=b.candidate_id;---83 updates

update mts_2025_tier1_admit_card t
set 
gateclose=
case when t.shift='1' then '08:30 AM'
when t.shift='2' then '12:30 PM'
when t.shift='3' then '04:00 PM'
end,
examtime=
case when t.shift='1' 
	then case 
		when t.comp_time = 'Yes' then '09:00 AM To 11:00 AM'
		else '09:00 AM To 10:30 AM'
	end
when t.shift='2' then '01:00 PM To 02:30 PM'
when t.shift='3' then '04:30 PM To 06:00 PM'
end,
repotime=
case when t.shift='1' then '07:30 AM'
when t.shift='2' then '11:30 AM'
when t.shift='3' then '03:00 PM'
end
FROM mts_2025_83_missed_slot s
WHERE t.candidate_id= s.candidate_id;---155 updates



WITH max_per_region AS (
    SELECT
        region,
        COALESCE(MAX(counter::int), 0) AS last_cnt
    FROM mts_2025_tier1_admit_card
    GROUP BY region
),
new_rows AS (
    SELECT
        t.reg_number,
        t.region,
        m.last_cnt +
            ROW_NUMBER() OVER (
                PARTITION BY t.region
                ORDER BY t.form_completion_date, t.form_completion_time::time
            ) AS new_cnt,
        case
            when substring(t.roll_number, 1, 1) <> t.region_code then true
            else false
        end as is_roll_no_change
    FROM mts_2025_tier1_admit_card t
    JOIN max_per_region m ON t.region = m.region
	join mts_2025_83_missed_slot s
	on t.candidate_id = s.candidate_id
    where ((t.roll_number is null)
    or substring(t.roll_number, 1, 1) <> t.region_code)
	--and s.remarks is null 
	and t.is_active = true
)
--select * from new_rows;

-- select count(*) from new_rows;----120891
UPDATE mts_2025_tier1_admit_card AS t
SET
   remarks_latest = case
                       when new_rows.is_roll_no_change then case
                                                                when remarks_latest is not null then concat(remarks_latest, ',::: Earlier Roll Number: ', roll_number)
                                                               else concat('Earlier Roll Number: ', roll_number)
                                                            end
                        else remarks_latest
                    end,
    counter = LPAD(new_rows.new_cnt::text, 7, '0'),
    roll_number = t.region_code || '25' || '27' || LPAD(new_rows.new_cnt::text, 7, '0')
FROM new_rows
WHERE t.reg_number = new_rows.reg_number;----7 updates-------------------------

update mts_2025_tier1_admit_card
set req_admit_card=true,
release_admit_card=true
where rem_edu=' 83 missed slot candidates rescheduled on 20th';---83 updates


------------6 preponed candidates rescheduled-------------------

update mts_2025_tier1_admit_card
set examdate='2026-02-20',
examdate1='20/02/2026',
shift='2',
examtime='01:00 PM To 02:30 PM',
repotime='11:30 AM',
gateclose='12:30 PM',
venue_code='351506',
venue_name='HANSH INSTITUTE',
venue_address='MAHAVEER BAZAR(NEAR BRAMH BABA MANDIR), AZAMGARH ROAD, VARANASI,UTTAR PRADESH-221101',
venue_city='VARANASI',
venue_state='UTTAR PRADESH',
venue_pincode='221101',
rem_edu='6 preponed candidates rescheduled'
where
candidate_id in ('MTS252644524','MTS253027764','MTS252179979','MTS250987709','MTS250421259','MTS250316595');



select b.*,a.reg_number,d.* from 
mts_2025_tier1_admit_card a
join temp_sallu b on a.roll_number=b.ey_rollno
join "mts2025Applications_12_08_2025_final" c
on a.reg_number =c."registrationNo"
join "mts2025EducationalDetails" d
on c.id=d."applicationId"
where c."statusId"='01';

select a.reg_number,a.roll_number,d.* from 
mts_2025_tier1_admit_card a
join "mts2025Applications_12_08_2025_final" c
on a.reg_number =c."registrationNo" and
a.roll_number in ('325270519889','325270656099','325270518646','325270648174','325270599536','325270573403','325270475958','325270499856','325270534724','325270530383','325270597115','325270553958','325270521300','325270473241','325270620662','325270622367','325270655741','325270636937','325270558378','325270598115','325270669805','325270585459','325270617425','325270483297','325270533809','325270531497','325270499274','325270475324','325270542256','325270589263','325270630655','325270614506','325270591691','325270551802','325270568710','325270671686','325270525867','325270590036','325270620313','325270608228','325270640478','325270648093','325270603379','325270616243','325270588041','325270544807','325270562935','325270532921','325270482315','325270489164','325270529851','325270685669','325270622264','325270605714','325270606928','325270616658','325270597446','325270580057','325270684265','325270515550','325270516440','325270580267','325270654485','325270637651','325270644968','325270619451','325270609539','325270605636','325270559070','325270517184','325270529500','325270500005','325270484659','325270484759','325270473542','325270519313','325270527199','325270525226','325270664196','325270545644','325270553131','325270583289','325270629905','325270477036','325270482807','325270471930','325270500646','325270515807','325270680359','325270590352','325270653090','325270616202','325270596144','325270607359','325270631178','325270589710','325270571995','325270567058','325270534236','325270528923','325270515810','325270481408','325270664968','325270562756','325270613165','325270519859','325270575662','325270590337','325270609058','325270605046','325270524725','325270490597','325270484509','325270601817','325270600267','325270523031','325270578311','325270631376','325270485674','325270491624','325270496061','325270630279','325270592788','325270534815','325270525768','325270524245','325270616443','325270525457','325270557033','325270506577','325270481006','325270604265','325270643834','325270503078','325270577742','325270527936','325270477031','325270472710','325270524920','325270684926','325270609735','325270517716','325270584416','325270586755','325270557567','325270649010','325270559031','325270580008','325270529855','325270530603','325270656265','325270585105','325270565125','325270497549','325270524706','325270632509','325270678794','325270482519','325270609545','325270478107','325270615868','325270609829','325270532226','325270685930','325270541063','325270474185','325270495861','325270529981','325270529338','325270612167','325270519111','325270562614','325270574344','325270585211','325270513731','325270525888','325270652678','325270632190','325270515480','325270478453','325270617587','325270534678','325270576205','325270566328','325270570676','325270542390','325270605491','325270587347','325270606059','325270472242','325270521811','325270615622','325270532129','325270567416','325270536246','325270612656','325270503834','325270522534','325270585373','325270546885','325270493604','325270548794','325270528240','325270625524','325270668100','325270667341','325270621045','325270533921','325270507316','325270594821','325270669424','325270545793','325270554995','325270545332','325270597818','325270648641','325270583452','325270537717','325270545898','325270626968','325270644605','325270617096','325270541799','325270509917','325270499879','325270516909','325270080084','325270596943','325270495365','325270549686','325270573546','325270605866','325270603930','325270599859','325270508848','325270640719','325270562826','325270528601','325270609083','325270647652','325270662409','325270590814','325270567545','325270544740','325270684666','325270665408','325270493883','325270495748','325270503980','325270645037','325270632075','325270633168','325270645861','325270500519','325270519052','325270501010','325270611908','325270574083','325270583463','325270524587','325270506607','325270556875','325270657269','325270608684','325270526655','325270552131','325270539913','325270559485','325270555515','325270576650','325270540792','325270617000','325270527523','325270517461','325270538784','325270587249','325270572552','325270628409','325270584734','325270609552','325270656318','325270602763','325270623293','325270549779','325270627441','325270657525','325270591366','325270597427','325270555772','325270558023','325270676523','325270595042','325270481483','325270589563','325270582860','325270649813','325270686058','325270567811','325270522009','325270483423','325270471428','325270568635','325270588360','325270508082','325270556787','325270540195','325270543124','325270575860','325270489593','325270573743','325270607203','325270635854','325270571599','325270546724','325270541541','325270529443','325270483082','325270580903','325270608916','325270630931','325270601783','325270501618','325270603474','325270553104','325270559674','325270653872','325270607385','325270550451','325270521817','325270522582','325270516070','325270481234','325270546902','325270544427','325270586523','325270604712','325270479470','325270507249','325270562497','325270543459','325270562537','325270565290','325270532376','325270551775','325270640935','325270491225','325270669931','325270652606','325270529986','325270566776','325270563199','325270651618','325270488925','325270642211','325270571355','325270537600','325270557018','325270513263','325270613547','325270632732','325270483836','325270618365','325270563603','325270628569','325270556989','325270537134','325270503339','325270641758','325270629166','325270481707','325270524559','325270672011','325270655654','325270614349','325270663796','325270507555','325270551638','325270566287','325270574403','325270555309','325270614685','325270540593','325270475071','325270605980','325270553106','325270546868','325270492070','325270498079','325270491958','325270524929','325270477718','325270602477','325270633984','325270675727','325270602129','325270506149','325270631080','325270618659','325270626810','325270652826','325270512424','325270513471','325270495155','325270537635','325270656981','325270596897','325270594484','325270567947','325270681059','325270490309','325270507091','325270482382','325270481363','325270683348','325270552850','325270589141','325270590128','325270596576','325270649033','325270530223','325270533275','325270531633','325270616475','325270556841','325270549136','325270566934','325270484619','325270531012','325270507335','325270501290','325270621703','325270567592','325270603396','325270649176','325270633004','325270639833','325270595968','325270530348','325270484464','325270477894','325270571668','325270556030','325270616726','325270633655','325270517903','325270530142','325270536113','325270501175','325270489614','325270513619','325270549459','325270598726','325270629134','325270607239','325270684542','325270686331','325270672072','325270482701','325270502218','325270523024','325270555568','325270575330','325270617695','325270595795','325270519134','325270611064','325270503097','325270511616','325270516979','325270677920','325270588980','325270585182','325270659489','325270471674','325270515195','325270503333','325270620960','325270508845','325270676445','325270640263','325270540487','325270536712','325270637856','325270659547','325270607730','325270599937','325270565788','325270510284','325270510791','325270629246','325270497670','325270637777','325270583202','325270568499','325270671585','325270555058','325270652091','325270647760','325270657183','325270579755','325270518160','325270506476','325270675043','325270482810','325270556222','325270568216','325270486223','325270656032','325270559522','325270538832','325270655209','325270548659','325270656016','325270520455','325270617264','325270541786','325270500396','325270521263','325270680534','325270551312','325270520166','325270500287','325270504522','325270627108','325270615264','325270547189','325270546453','325270448322','325270492075','325270592603','325270571128','325270625043','325270545187','325270496897','325270522620','325270558480','325270526650','325270556988','325270567011','325270529563','325270613602','325270623571','325270594552','325270595799','325270600376','325270603296','325270606923','325270511409','325270490775','325270526538','325270515089','325270615673','325270614372','325270550154','325270545707','325270563432','325270613544','325270597513','325270620461','325270553046','325270661167','325270641185','325270481779','325270485852','325270533365','325270615846','325270611021','325270612967','325270534692','325270504623','325270510219','325270525590','325270481879','325270492455','325270557291','325270590233','325270609062','325270496493','325270515780','325270518300','325270507212','325270658804','325270644865','325270554503','325270615020','325270628231','325270530570','325270686334','325270653214','325270589634','325270586562','325270517409','325270566627','325270633100','325270643046','325270676728','325270573364','325270632871','325270616223','325270537922','325270553686','325270563010','325270557706','325270521332','325270566554','325270580055','325270474683','325270524944','325270503641','325270505181','325270518717','325270481945','325270675349','325270554131','325270477002','325270595027','325270606408','325270630896','325270595831','325270473060','325270670481','325270658984','325270663020','325270583675','325270584839','325270521412','325270645819','325270645377','325270657000','325270671772','325270543550','325270664813','325270631123','325270495972','325270496473','325270685161','325270656701','325270667913','325270486697','325270652286','325270565173','325270523053','325270653802','325270606878','325270611701','325270591013','325270611388','325270583809','325270560185','325270542365','325270680340','325270665592','325270522989','325270520054','325270652767','325270607214','325270548944','325270662060','325270615004','325270633824','325270572420','325270576707','325270520380','325270481472','325270558642','325270524947','325270520584','325270500709','325270537734','325270678348','325270680931','325270633005','325270489836','325270536677','325270558146','325270594163','325270628238','325270625289','325270517090','325270499712','325270622518','325270593505','325270590248','325270597755','325270572642','325270546700','325270677810','325270573193','325270582507','325270582002','325270573083','325270566631','325270567544','325270591298','325270617579','325270628287','325270630290','325270636791','325270573473','325270502425','325270489398','325270496612','325270493261','325270487092','325270484391','325270528225','325270610376','325270650246','325270574213','325270526741','325270518198','325270619307','325270622059','325270640534','325270665596','325270680058','325270667093','325270595720','325270485167','325270643621','325270652512','325270536428','325270487972','325270525551','325270652014','325270591586','325270515271','325270504068','325270544699','325270562443','325270584669','325270602025','325270614017','325270655692','325270669654','325270538779','325270660155','325270547716','325270668392','325270477377','325270592609','325270612190','325270677803','325270626887','325270575307','325270565067','325270565986','325270579254','325270612715','325270599895','325270639878','325270678942','325270585381','325270627054','325270618338','325270504423','325270549456','325270496207','325270383870','325270367214','325270367413','325270375350','325270367493','325270391650','325270368338','325270357470','325270374389','325270391181','325270391765','325270377850','325270357951','325270550192','325270364676','325270381760','325270360829','325270589345','325270359134','325270384056','325270590570','325270656674','325270352501','325270352859','325270366770','325270373831','325270384170','325270584199','325270572772','325270357595','325270360760','325270354284','325270355457','325270633350','325270382896','325270655118','325270361446','325270357165','325270531709','325270557093','325270584386','325270516705','325270365058','325270391851','325270384466','325270521397','325270549523','325270532147','325270372796','325270390962','325270376496','325270365285','325270620430','325270378340','325270381850','325270382673','325270391276','325270391328','325270358930','325270375543','325270380667','325270364892','325270365958','325270373141','325270358910','325270657064','325270358828','325270699152','325270700584','325270702583','325270704012','325270712157','325270705617','325270658126','325270713829','325270711414','325270711903','425270262740','425270209745','425270210373','425270236441','425270241516','425270227546','425270262385','425270265204','425270206951','425270248295','425270224490','425270285874','425270255907','425270253577','425270283188','425270212028','425270254273','425270244167','425270217862','425270203544','425270226475','425270250102','425270250794','425270292504','425270260328','425270239014','425270207502','425270268112','425270267485','425270294211','425270287678','425270273676','425270268370','425270276413','425270264426','425270221018','425270276421','425270205674','425270250215','425270229364','425270233806','425270295928','425270289139','425270270689','425270265157','425270294425','425270219951','425270254178','425270264507','425270253382','425270214500','425270253545','425270257956','425270215396','425270256292','425270236468','425270273592','425270273851','425270275792','425270276741','425270276782','425270276805','425270277238','425270275372','425270275374','425270264993','425270262478','425270247417','425270265143','425270276087','425270275105','425270275502','425270263321','425270247560','425270234068','425270250200','425270256367','425270275941','425270266200','425270264783','425270239786','425270247251','425270219868','425270275630','425270252837','425270248575','425270277255','425270221204','425270256341','425270275887','425270266682','425270277037','425270228481','425270261926','425270250701','425270234136','425270275757','425270247000','425270257331','425270276286','425270267300','425270258476','425270276268','425270285659','425270233235','425270216008','425270258806','425270205797','425270242671','425270254041','425270267976','425270268225','425270214828','425270220606','425270206582','425270240715','425270242078','425270247743','425270212000','425270257675','425270230404','425270254546','425270209338','425270240311','425270257049','425270236725','425270242179','425270211096','425270258197','425270207834','425270237851','425270293279','425270238770','425270243461','425270279585','425270242616','425270251168','425270207891','425270211107','425270249152','425270220627','425270224747','425270293651','425270206446','425270257439','425270220311','425270240360','425270228823','425270254002','425270214489','425270256135','425270286723','425270279955','425270243153','425270230366','425270224438','425270215558','425270270798','425270212596','425270261296','425270265855','425270288027','425270283088','425270225804','425270237392','425270250209','425270276024','425270276750','425270276263','425270276389','425270275023','425270275728','425270270155','425270272055','425270273134','425270244402','425270241403','425270260467','425270217230','425270217579','425270212516','425270275396','425270276725','425270221039','425270230537','425270251404','425270242182','425270240832','425270249963','425270213892','425270275665','425270277298','425270262645','425270263996','425270209721','425270233967','425270236780','425270242619','425270239148','425270256797','425270221333','425270235169','425270246550','425270203443','425270239040','425270274986','425270275618','425270267926','425270222834','425270269427','425270230152','425270212769','425270246990','425270277292','425270233571','425270275011','425270247196','425270213536','425270226441','425270266399','425270217188','425270276315','425270250251','425270243904','425270241988','425270252304','425270275660','425270292429','425270239323','425270274743','425270262344','425270238482','425270214790','425270295161','425270226329','425270275787','425270276999','425270235574','425270215919','425270224680','425270268327','425270208481','425270253774','425270262115','425270243105','425270238815','425270252906','425270218234','425270290352','425270227703','425270275578','425270219346','425270205484','425270257419','425270208907','425270250678','425270206387','425270211557','425270218689','425270257816','425270297364','425270262699','425270296981','425270296343','425270274018','425270238760','425270222631','425270208222','425270206000','425270216051','425270235293','425270240682','425270276345','425270275714','425270261247','425270264453','425270275566','425270276177','425270274207','425270245772','425270276723','425270275958','425270283757','425270217182','425270293534','425270252710','425270227798','425270207628','425270254916','425270265572','425270228336','425270232514','425270234963','425270219085','425270292248','425270219965','425270225177','425270222020','425270236046','425270275045','425270274155','425270233324','425270226655','425270212438','425270284460','425270208415','425270226638','425270203773','425270239427','425270287222','425270240610','425270246066','425270261687','425270211066','425270257777','425270243035','425270242626','425270278765','425270270042','425270225783','425270262467','425270252005','425270262012','425270278773','425270237206','425270205606','425270229243','425270259126','425270296219','425270268069','425270238443','425270219606','425270286106','425270272411','425270221202','425270223093','425270240452','425270214769','425270237060','425270254684','425270265930','425270275921','425270232073','425270208579','425270237048','425270210550','425270257723','425270216309','425270267177','425270224575','425270213118','425270238160','425270241567','425270276775','425270276331','425270276432','425270266040','425270271724','425270239823','425270221881','425270240169','425270250118','425270225851','425270250381','425270276420','425270254828','425270252444','425270235289','425270210087','425270223408','425270210324','425270214531','425270237253','425270264960','425270215011','425270257101','425270250904','425270210461','425270223682','425270222943','425270204892','425270206663','425270258033','425270248325','425270260954','425270267355','425270281532','425270248501','425270243430','425270249682','425270229792','425270280250','425270229016','425270219805','425270239393','425270237967','425270217605','425270202840','425270276658','425270293596','425270231357','425270287647','425270288214','425270296376','425270268314','425270220355','425270252830','425270262037','425270250459','425270250776','425270211788','425270226435','425270273087','425270228751','425270233396','425270213647','425270253019','425270251894','425270242636','425270246848','425270227397','425270207713','425270263944','425270250423','425270258304','425270204965','425270244905','425270215397','425270250247','425270215123','425270288035','425270204722','425270223965','425270219423','425270207528','425270209985','425270223954','425270256324','425270229884','425270238542','425270248704','425270236604','425270218203','425270271281','425270216904','425270248585','425270277079','425270241715','425270260719','425270275466','425270253263','425270214405','425270222032','425270234983','425270277050','425270258845','425270263176','425270240660','425270271919','425270213473','425270276186','425270224232','425270202955','425270221086','425270216689','425270257283','425270220927','425270261062','425270261264','425270231581','425270259688','425270202940','425270272849','425270205072','425270210291','425270284603','425270290778','425270207632','425270259727','425270252161','425270287958','425270207985','425270238173','425270224247','425270240362','425270235183','425270259621','425270208104','425270253827','425270218797','425270250502','425270245840','425270253948','425270254151','425270225189','425270241365','425270208083','425270259389','425270267700','425270218055','425270237429','425270289118','425270286017','425270283907','425270204735','425270231236','425270214360','425270265955','425270265992','425270233566','425270257554','425270218753','425270223654','425270231144','425270238785','425270257514','425270216323','425270288853','425270254183','425270238799','425270274826','425270235906','425270225279','425270235418','425270274684','425270259573','425270271541','425270222232','425270295629','425270243237','425270272279','425270240578','425270275633','425270227723','425270244549','425270285043','425270209934','425270278203','425270230303','425270143450','425270145841','425270322066','425270262593','425270154134','425270226533','425270208364','425270155798','425270161325','425270157592','425270229284','425270143298','425270140130','425270143429','425270150407','425270252692','425270151376','425270212092','425270153148','425270153563','425270152824','425270162921','425270146654','425270161949','425270158560','425270153433','425270153246','425270158710','425270160333','425270162295','425270162860','425270162861','425270162786','425270162393','425270162745','425270162806','425270162908','425270163052','425270152287','425270154776','425270155338','425270158748','425270159012','425270159098','425270162940','425270162900','425270154345','425270145096','425270162865','425270162608','425270162333','425270159568','425270151719','425270162752','425270161025','425270156306','425270151474','425270153170','425270162949','425270158910','425270153405','425270153320','425270155671','425270313009','425270309163','425270310690','425270311068','425270313816','425270321502','425270319219','425270320708','425270321263','425270319086','425270318820','925270125854','925270123555','925270107853','925270113152','925270115951','925270119284','925270109942','925270119805','925270104797','925270109826','925270113588','925270112586','925270106891','925270102129','925270120893','925270101661','925270117762','925270102181','925270123707','925270123500','925270114833','925270120107','925270098306','925270122294','925270123188','925270124269','925270119370','925270110729','925270120124','925270120458','925270119028','925270120125','925270126069','925270103376','925270120391','925270113747','925270129149','925270119253','925270106158','925270122054','925270121285','925270108919','925270120092','925270102026','925270109804','925270105702','925270126552','925270126468','925270117542','925270111625','925270110296','925270101701','925270100355','925270112899','925270118104','925270105895','925270112853','925270111876','925270119886','925270110465','925270120127','925270115709','925270099876','925270116028','925270121154','925270124662','925270115152','925270099978','925270113595','925270106131','925270128948','925270100347','925270100093','925270123381','925270116287','925270107653','925270128539','925270106889','925270106099','925270117787','925270101960','925270108353','925270108174','925270109299','925270110789','925270102352','925270118228','925270112873','925270123546','925270123260','925270108180','925270102097','925270105254','925270128901','925270122185','925270126079','925270119821','925270108897','925270117744','925270111080','925270110137','925270127940','925270127130','925270104925','925270124506','925270107019','925270123175','925270116406','925270107744','925270110037','925270126114','925270121381','925270121332','925270102711','925270105975','925270105588','925270116276','925270116128','925270099067','925270123860','925270121090','925270115912','925270108168','925270118304','925270108609','925270114811','925270127155','925270106737','925270109204','925270110361','925270105999','925270119657','925270126146','925270098864','925270119128','925270106515','925270107339','925270105215','925270129274','925270097970','925270109120','925270125968','925270126418','925270122687','925270105104','925270100047','925270128588','925270109862','925270109372','925270126601','925270101326','925270127011','925270105099','925270108292','925270125517','925270098999','925270112566','925270114049','925270098488','925270098924','925270129448','925270124445','925270116893','925270129304','925270123252','925270115995','925270105035','925270107785','925270110254','925270120544','925270113820','925270109646','925270118693','925270111935','925270106374','925270099586','925270103035','925270101600','925270101748','925270108336','925270111800','925270117583','925270107446','925270117693','925270119492','925270114869','925270116157','925270117238','925270107255','925270128710','925270101408','925270108437','925270102143','925270123492','925270112076','925270119661','925270104506','925270105637','925270118703','925270112766','925270122450','925270108024','925270107809','925270099741','925270110216','925270102611','925270106998','925270099464','925270120038','925270105628','925270102248','925270108737','925270114508','925270120297','925270119822','925270103456','925270115368','925270119267','925270118490','925270118171','925270105101','925270126006','925270098770','925270117521','925270118350','925270117411','925270126116','925270125586','925270113108','925270099357','925270105238','925270107318','925270107721','925270101134','925270117592','925270107996','925270104621','925270113325','925270112821','925270129115','925270120676','925270124199','925270114668','925270105970','925270125584','925270129272','925270129417','925270118956','925270128587','925270119791','925270115137','925270101548','925270112978','925270102658','925270117999','925270102158','925270107369','925270099247','925270113246','925270100450','925270125717','925270129743','625270302091','625270278932','625270298037','625270273765','625270303671','625270306985','625270311552','625270304204','625270299693','625270292841','625270290191','625270311430','625270295372','625270277616','625270280153','625270274278','625270306580','625270302394','625270284204','625270295737','625270273779','625270273938','625270276807','625270290050','625270302130','625270314717','625270280529','625270289154','625270295985','625270279838','625270292605','625270301281','625270302103','625270305738','625270298826','625270289168','625270290303','625270299694','625270311825','625270287425','625270281884','625270303283','625270288604','625270290860','625270284820','625270292166','625270303489','625270296446','625270305813','625270296621','625270304641','625270304546','625270293874','625270314136','625270294409','625270307043','625270274589','625270287482','625270285773','625270281411','625270285057','625270285307','625270304085','625270276934','625270295610','625270287659','625270308511','625270283220','625270280670','625270284503','625270292733','625270283193','625270296837','625270283805','625270303155','625270275465','625270303665','625270287699','625270308210','625270282707','625270286195','625270286107','625270281945','625270274554','625270304314','625270287446','625270291316','625270280745','625270285314','625270287841','625270286768','625270290835','625270306232','625270280590','625270284502','625270287345','625270304447','625270292951','625270313228','625270301199','625270290392','625270275130','625270292377','625270309142','625270278279','625270274482','625270295631','625270277871','625270313982','625270302880','625270312070','625270281394','625270290613','625270291797','625270283888','625270283970','625270284016','625270289214','625270311680','625270296713','625270308112','625270311866','625270288205','625270287476','625270288556','625270304902','625270311431','625270283461','625270306429','625270288905','625270280317','625270281553','625270294028','625270291186','625270305409','625270299865','625270294554','625270290280','625270279329','625270277951','625270288756','625270304850','625270307979','625270307066','625270313312','625270290819','625270309416','625270290135','625270299129','625270298869','625270282773','625270306276','625270298607','625270291230','625270306450','625270311387','625270311637','625270282745','625270277351','625270302798','625270279190','625270282155','625270296186','625270311596','625270295674','625270297140','625270298369','625270303154','625270307492','625270296097','625270308559','625270278641','625270303265','625270294295','625270301776','625270289677','525270035801','525270040770','525270036068','525270034155','525270037379','525270044936','525270036619','525270045163','525270037531','525270044533','525270036108','525270041258','525270044472','525270042865','525270034330','525270041051','525270044686','525270039381','525270039745','525270033650','525270047888','525270033711','525270040231','525270040570','525270040869','525270047749','525270044638','525270046825','525270036449','525270042738','225270441135','225270395371','225270461136','225270466780','225270467291','225270326518','225270366379','225270452941','225270434838','225270433418','225270369536','225270351676','225270414930','225270435068','225270348364','225270433214','225270433227','225270435618','225270353599','225270366523','225270380477','225270380236','225270377015','225270353925','225270255817','225270262563','225270436770','225270256271','225270410273','225270419458','225270387357','225270369207','225270429781','225270419665','225270415845','225270410370','225270404459','225270379325','225270340472','225270430837','225270451732','225270348365','225270420592','225270395010','225270396171','225270397070','225270336831','225270441603','225270451440','225270471130','225270368782','225270371040','225270359134','225270353485','225270349557','225270461871','225270436711','225270352978','225270384881','225270392891','225270379357','225270375795','225270358977','225270332823','225270449004','225270440395','225270469489','225270331987','225270367452','225270357075','225270421447','225270398120','225270390772','225270403376','225270448023','225270428014','225270432326','225270322180','225270263782','225270361078','225270383995','225270351616','225270448435','225270426230','225270426258','225270435535','225270465480','225270476147','225270441404','225270411457','225270329417','225270450809','225270475064','225270326889','225270424497','225270376436','225270448819','225270443782','225270389910','225270375487','225270411996','225270426953','225270396819','225270336387','225270337550','225270346871','225270341131','225270402023','225270367582','225270426518','225270474938','225270351541','225270387592','225270378741','225270384173','225270344555','225270476242','225270467572','225270382273','225270351780','225270467628','225270372409','225270433559','225270376282','225270447893','225270434213','225270407747','225270368247','225270449757','225270358139','225270420668','225270437036','225270439680','225270374963','225270430225','225270338385','225270424465','225270389680','225270441020','225270374920','225270365884','225270466440','225270457880','225270386432','225270397980','225270408874','225270427083','225270429321','225270468712','225270377233','225270382795','225270445229','225270410555','225270415899','225270395230','225270361654','225270400681','225270414438','225270455125','225270450565','225270360847','225270354331','225270466687','225270430395','225270403718','225270389869','225270397502','225270331193','225270449087','225270459178','225270447228','225270463455','225270334590','225270398903','225270355600','225270380763','225270378671','225270464045','225270451283','225270421480','225270430818','225270426671','225270441120','225270420069','225270325057','225270430033','225270469552','225270389058','225270391499','225270409771','225270355546','225270379757','225270471171','225270420441','225270426128','225270361370','225270362094','225270349689','225270366619','225270357920','225270427864','225270424618','225270473829','225270450920','225270377305','225270376316','225270370905','225270327703','225270378055','225270388539','225270389687','225270449686','225270468897','225270345590','225270346508','225270414419','225270358554','225270363599','225270473590','225270439955','225270422696','225270395148','225270415568','225270352671','225270426313','225270376232','225270400232','225270335671','225270447053','225270448813','225270327509','225270464871','225270347284','225270362502','225270446396','225270325117','225270426860','225270466516','225270461920','225270350656','225270381186','225270414555','225270474546','225270374723','225270341223','225270437895','225270421175','225270332044','225270426864','225270341641','225270452776','225270365198','225270373017','225270363164','225270339747','225270448184','225270466588','225270424088','225270420175','225270324792','225270335446','225270335570','225270373310','225270417481','225270437138','225270477628','225270380924','225270359403','225270376603','225270425832','225270380509','225270348447','225270436116','225270410957','225270386603','225270371941','225270438560','225270439604','225270450490','225270466947','225270328690','225270404718','225270454766','225270467195','225270392246','225270388079','225270412105','225270450811','225270359797','225270446368','225270468579','225270347848','225270399459','225270425528','225270391435','225270329315','225270429598','225270386615','225270385765','225270391416','225270413356','225270353126','225270449148','225270420433','225270352547','225270345108','225270403472','225270394762','225270338497','225270340321','225270466698','225270462664','225270424356','225270429538','225270347718','225270419350','225270443712','225270385969','225270384088','225270392795','225270444715','225270447527','225270358071','225270366624','225270393856','225270410056','225270411999','225270437423','225270449718','225270354751','225270372786','225270449050','225270435731','225270439308','225270466135','225270448429','225270338538','225270367480','225270430722','225270338189','225270392206','225270385096','225270375273','225270436096','225270389966','225270325794','225270327443','225270385512','225270410948','225270387033','225270323527','225270415748','225270433445','225270435304','225270366480','225270445452','225270428716','225270425492','225270439299','225270358653','225270411719','225270474837','225270450150','225270349320','225270437574','225270334534','225270370553','225270460160','225270440554','225270334573','225270421240','225270404044','225270466618','225270335236','225270401349','225270360477','225270334038','225270379398','225270422027','225270356237','225270421887','225270466051','225270330636','225270373245','225270386519','225270391553','225270467429','225270415640','225270385159','225270467186','225270368501','225270356305','225270329104','225270380614','225270440803','225270423976','225270444473','225270468224','225270405161','225270459244','225270463033','225270447574','225270433976','225270457637','225270405734','225270440095','225270363851','225270329103','225270349051','225270376774','225270381535','225270383984','225270338557','225270356595','225270358820','225270455517','225270339788','225270362854','225270409242','225270393782','225270422611','225270440508','225270333043','225270356057','225270424942','225270403390','225270441175','225270430455','225270348214','225270346536','225270349538','225270350734','225270331539','225270366795','225270447337','225270460203','225270337036','225270322256','225270322294','225270372402','225270462365','225270470189','225270347532','225270364246','225270363318','225270411462','225270346183','225270336607','225270406210','225270402835','225270393686','225270366756','225270452868','225270464453','225270338987','225270350250','225270353696','225270347427','225270390944','225270398849','225270468678','225270365291','225270341117','225270349848','225270333413','225270325423','225270378133','225270322780','225270367156','225270370797','225270400064','225270327100','225270323173','225270340576','225270363808','225270429867','225270391248','225270467406','225270349674','225270352586','225270448597','225270442173','225270376901','225270348611','225270429468','225270475104','225270345201','225270340968','225270394590','225270384698','225270460727','225270338058','225270323364','225270396433','225270324246','225270337781','225270394489','225270472868','225270344846','225270426948','225270363481','225270332034','225270375932','225270362996','225270466603','225270421172','225270357115','225270398438','225270455109','225270461814','225270467252','225270381082','225270368955','225270402470','225270467391','225270436572','225270439074','225270449741','225270387582','225270363799','225270434088','225270445264','225270465933','225270468077','225270467443','225270430802','225270371885','225270411519','225270340064','225270330445','225270387965','225270443301','225270452987','225270384495','225270360970','225270444123','225270433866','225270439654','225270470582','225270403729','225270429366','225270423562','225270405478','225270386224','225270468139','225270433741','225270332088','225270386507','225270361801','225270403766','225270333226','225270324355','225270435476','225270425776','225270400056','225270397120','225270358936','225270368161','225270323807','225270340749','225270335642','225270438123','225270467409','225270340534','225270372964','225270403715','225270397118','225270445170','225270422070','225270388376','225270370537','225270325808','225270374756','225270420727','225270385777','225270340644','225270405006','225270383479','225270388871','225270396914','225270395142','225270376793','225270363368','225270435582','225270359148','225270464270','225270467596','225270460328','225270429825','225270413212','225270337469','225270333461','225270369347','225270404652','225270404214','225270324378','225270395742','225270324407','225270430472','225270359919','225270349033','225270372810','225270460911','225270369559','225270427590','225270333541','225270419366','225270443402','225270413474','225270458889','225270395679','225270394461','225270461487','225270397804','225270414836','225270369621','225270452586','225270453177','225270359353','225270393510','225270391294','225270341256','225270372688','225270324734','225270431179','225270452213','225270467550','225270388004','225270384710','225270392071','225270393695','225270356285','225270330362','225270351026','225270376811','225270413479','225270410809','225270466901','225270466825','225270466674','225270447313','225270360596','225270467437','225270428981','225270335513','225270390510','225270373822','225270370260','225270370787','225270365098','225270352339','225270470974','225270374320','225270387369','225270332583','225270445372','225270425522','225270350968','225270368608','225270365566','225270369552','225270471573','225270391942','225270392170','225270358431','225270341097','225270333532','225270335472','225270326974','225270447866','225270417865','225270470072','225270405497','225270395783','225270390645','225270356882','225270355674','225270323250','225270336704','225270466303','225270427720','225270395696','225270423820','225270462250','225270457128','225270444432','225270389564','225270364410','225270328295','225270384085','225270353208','225270331571','225270350220','225270377874','225270336993','225270446696','225270421086','225270433158','225270453270','225270384598','225270457672','225270471248','225270469214','225270423682','225270342611','225270394718','225270411480','225270393503','225270439957','225270431589','225270452354','225270427561','225270370600','225270322349','225270465457','225270396524','225270328902','225270427756','225270324181','225270356405','225270428508','225270454315','225270374989','225270431874','225270326300','225270423703','225270467795','225270480268','225270480894','225270483038','125270122730','125270111025','125270109369','125270116032','125270135105','125270102854','125270094047','125270109402','125270101575','125270094871','125270110339','125270113696','125270124434','125270107480','125270122120','125270115429','125270091222','125270097980','125270114826','125270115817','125270099355','125270091192','125270135221','125270109075','125270119258','125270091965','125270092026','125270118264','125270111754','125270098886','125270092144','125270109196','125270107478','125270091967','125270100209','125270101107','125270118154','125270093894','125270100116','125270101418','125270124483','125270126801','125270094846','125270122858','125270111466','125270133572','125270095331','125270105896','125270132505','125270098997','125270098866','125270117208','125270134406','125270134145','125270102190','125270108854','125270112171','125270100151','125270095509','125270120228','125270118224','125270123360','125270130137','125270125180','825270164544','825270167197','825270152678','825270131195','825270138271','825270158956','825270152014','825270130412','825270123638','825270155655','825270130790','825270131574','825270132755','825270140981','825270135766','825270155419','825270137803','825270145460','825270132506','825270155062','825270141400','825270120588','825270148395','825270151346','825270144805','825270150368','825270151504','825270149353','825270148386','825270151156','825270152601','825270153464','825270146570','825270124507','825270135735','825270132798','825270130961','825270126024','825270156121','825270139512','825270153874','825270143689','825270143181','825270151858','825270121615','825270152339','825270141656','825270153782','825270154880','825270160418','825270148658','825270152831','825270136580','825270131997','825270124122','825270159602','825270138771','825270147284','825270147595','825270149354','825270135234','825270133904','825270122508','825270153254','825270147282','825270156918','825270142763','825270154070','825270138230','825270141827','825270122659','825270156706','825270129434','825270157610','825270151329','825270140959','825270135855','825270137090','825270128897','825270120998','825270119655','825270134545','825270133716','825270148631','825270127271','825270152165','825270136523','825270144335','825270141854','825270125266','825270126521','825270135840','825270139887','825270135960','825270148954','825270131253','825270126177','825270122625','825270153922','825270160564','825270127160','825270147692','825270147995','825270146996','825270150332','825270132007','825270153091','825270150851','825270123355','825270136211','825270141791','825270156379','825270160554','825270133358','825270148259','825270127586','825270126696','825270144699','825270148667','825270134556','825270136588','825270139111','825270127454','825270129986','825270149473','825270143520','825270155281','825270155841','825270149286','825270142081','825270137452','825270132909','825270127372','825270126077','825270134970','825270156660','825270130000','825270124928','825270151015','825270125879','825270142839','825270149289','825270154291','825270135256','825270149023','825270150371','825270126729','825270147883','825270130846','825270138342','825270155754','825270156253','825270120436','825270127005','825270144718','825270145375','825270131117','825270158131','825270135358','825270136794','825270140305','825270161223','825270160747','825270145631','825270129734','825270121210','825270123550','825270128495','825270149249','825270125727','825270121067','825270154254','825270123409','825270129596','825270135585','825270136486','825270119503','825270144437','825270139669','825270130995','825270133722','825270140230','825270136843','825270120523','825270147235','825270148444','825270139901','825270144088','825270147848','825270146297','825270122278','825270134324','825270151563','825270140065','825270151810','825270138010','825270135816','825270146837','825270121365','825270120785','825270148376','825270148628','825270123751','825270146630','825270139598','825270148266','825270140947','825270160761','825270161055','825270160162','825270128315','825270123232','825270124073','825270127187','825270149309','825270144958','825270135416','825270151320','825270124426','825270148493','825270151837','825270144918','825270140943','825270134013','825270153873','825270136001','825270121799','825270160725','825270138885','825270142658','825270132367','825270132050','825270156090','825270138137','825270152092','825270158227','825270119578','825270125289','825270153685','825270155995','825270151145','725270107397','725270109651','725270110320','725270085525','725270097630','725270100468','725270098959','725270077672','725270078841','725270094063','725270092026','725270076208','725270087775','725270083128','725270080677','725270087062','725270089020','725270082814','725270089655','725270092214','725270084673','725270092495','725270092364','725270085900','725270088840','725270091462','725270081992','725270085882','725270085699','725270084408','725270088858','725270089262','725270078249','725270095009','725270091665','725270084045','725270100260','725270098279','725270077956','725270094125','725270078630','725270087001','725270093456','725270081800','725270087235','725270096833','725270085681','725270100579','725270083375','725270080420','725270084043','725270085978','725270092216','725270093332','725270098674','725270095814','725270094064','725270088740','725270083120','725270092332','725270097363','725270096683','725270075550','725270082362','725270074987','725270081021','725270087205','725270100409','725270075156','725270077808','725270083344','725270081378','725270097403','725270083749','725270093594','725270096274','725270086202','725270085747','725270088546','725270089641','725270085440','725270079174','725270089981','725270084345','725270075227','725270076968','725270074802','725270077110','725270085687','725270089638','725270093020','725270080471','725270098454','725270080560','725270076226','725270092514','725270084394','725270094501','725270080243','725270091460','725270092920','725270074290','725270093678','725270085976','725270094237','725270092955','725270086591','725270076662','725270094008','725270092576','725270083604','725270084153','725270095844','725270085017','725270094239','725270099989','725270057580','725270056416','725270060976','725270053977','725270059914','725270058485','725270059889')
and c."statusId"='01'
join "mts2025EducationalDetails" d
on c.id=d."applicationId";

