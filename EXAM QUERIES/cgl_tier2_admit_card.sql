create table cgl_2025_tier2_all_regions_data
(reg_id character varying,
 cand_name character varying,
 gender character varying,
 category character varying,
 ph	 character varying,
 ph_code character varying,
 center_name character varying,
 center_code character varying,
 old_center_code character varying,
 ex_serviceman character varying,
 exs_res_availed character varying,
 suffer_cerebralpalsy character varying,
 locomotor character varying,
 is_pwbd_blindness character varying,
 scribe_required character varying,
 scribe_medium character varying,
 own_scribe character varying,
 roll_number character varying,
 dob character varying,
 category_field character varying,
 scribe_field character varying,
 comp_time character varying,
 examdate_cbe character varying,
 gateclose_cbe character varying,
 examtime_cbe character varying,
 repotime_cbe character varying,
 ticket_no_cbe character varying,
 batch_cbe character varying,
 shift_cbe	character varying,
 venue_code_cbe character varying,
 venue_name_cbe	character varying,
 venue_address_cbe character varying,
 venue_district_cbe	character varying,
 venue_city_cbe	 character varying,
 venue_state_cbe character varying,
 venue_pincode_cbe character varying,
 examdate_skill character varying,
 gateclose_skill character varying,
 examtime_skill character varying,
 repotime_skill character varying,
 ticket_no_skill character varying,
 batch_skill character varying,
 shift_skill character varying,
 venue_code_skill character varying,
 venue_name_skill character varying,
 venue_address_skill character varying,
 venue_district_skill character varying,
 venue_city_skill character varying,
 venue_state_skill character varying,
 venue_pincode_skill character varying,
 examdate_stat character varying,
 gateclose_stat character varying,
 examtime_stat character varying,
 repotime_stat character varying,
 ticket_no_stat	character varying,
 batch_stat	character varying,
 shift_stat	character varying,
 venue_code_stat character varying,
 venue_name_stat character varying,
 venue_address_stat	character varying,
 venue_district_stat character varying,
 venue_city_stat character varying,
 venue_state_stat character varying,
 venue_pincode_stat character varying,
 region character varying
);	

psql -U sscpgadmin -h 10.192.97.43 -p 5432 -d ssc_db_candidate_portal
PrdSSC202502

\copy cgl_2025_tier2_all_regions_data from 'C:\Users\SalauddinKhan\Desktop\CGL 2025 TIER 2\WR\cgle2025t2_WR_paper1cbe.csv' csv header;

select distinct suffer_cerebralpalsy,count(*) from cgl_2025_tier2_all_regions_data group by suffer_cerebralpalsy;
select distinct locomotor,count(*) from cgl_2025_tier2_all_regions_data group by locomotor;
select distinct is_pwbd_blindness,count(*) from cgl_2025_tier2_all_regions_data group by is_pwbd_blindness;

select distinct comp_time,count(*) from cgl_2025_tier2_all_regions_data group by comp_time;

select distinct examdate_cbe,count(*) from cgl_2025_tier2_all_regions_data group by examdate_cbe;
select distinct examdate_skill,count(*) from cgl_2025_tier2_all_regions_data group by examdate_skill;
select distinct examdate_stat,count(*) from cgl_2025_tier2_all_regions_data group by examdate_stat;


select distinct examtime_cbe,count(*) from cgl_2025_tier2_all_regions_data group by examtime_cbe;
select distinct examtime_skill,count(*) from cgl_2025_tier2_all_regions_data group by examtime_skill;
select distinct examtime_stat,count(*) from cgl_2025_tier2_all_regions_data group by examtime_stat;

select distinct gateclose_cbe,count(*) from cgl_2025_tier2_all_regions_data group by gateclose_cbe;
select distinct gateclose_skill,count(*) from cgl_2025_tier2_all_regions_data group by gateclose_skill;
select distinct gateclose_stat,count(*) from cgl_2025_tier2_all_regions_data group by gateclose_stat;

select distinct repotime_cbe,count(*) from cgl_2025_tier2_all_regions_data group by repotime_cbe;
select distinct repotime_skill,count(*) from cgl_2025_tier2_all_regions_data group by repotime_skill;
select distinct repotime_stat,count(*) from cgl_2025_tier2_all_regions_data group by repotime_stat;

select distinct batch_cbe,count(*) from cgl_2025_tier2_all_regions_data group by batch_cbe;
select distinct batch_skill,count(*) from cgl_2025_tier2_all_regions_data group by batch_skill;
select distinct batch_stat,count(*) from cgl_2025_tier2_all_regions_data group by batch_stat;

select distinct shift_cbe,count(*) from cgl_2025_tier2_all_regions_data group by shift_cbe;
select distinct shift_skill,count(*) from cgl_2025_tier2_all_regions_data group by shift_skill;
select distinct shift_stat,count(*) from cgl_2025_tier2_all_regions_data group by shift_stat;



Update cgl_2025_tier2_all_regions_data set comp_time='Yes' where comp_time='YES';----129


select distinct shift_cbe,examtime_cbe,comp_time,count(*) from cgl_2025_tier2_all_regions_data group by shift_cbe,examtime_cbe,comp_time;

update cgl_2025_tier2_all_regions_data set
examtime_cbe='11:00 AM To 02:00 PM'
where examtime_cbe='10:00 AM To 01:00 PM' and comp_time='Yes';----1434

update cgl_2025_tier2_all_regions_data set
examtime_cbe='11:00 AM To 01:15 PM'
where examtime_cbe='10:00 AM To 12:15 PM' and comp_time='No';----60297

update cgl_2025_tier2_all_regions_data set
examtime_cbe='11:00 AM To 02:00 PM'
where examtime_cbe='11:00 AM To 2:00 PM' and comp_time='Yes';----92

update cgl_2025_tier2_all_regions_data set
examtime_cbe='11:00 AM To 01:15 PM'
where examtime_cbe='11:00 AM To 1:15 PM' and comp_time='No';----4934

select distinct shift_cbe,repotime_cbe,count(*) from cgl_2025_tier2_all_regions_data group by shift_cbe,repotime_cbe;

update cgl_2025_tier2_all_regions_data set
repotime_cbe='08:30 AM' where repotime_cbe in('7.30 AM','8.30 AM');

select distinct shift_cbe,gateclose_cbe,count(*) from cgl_2025_tier2_all_regions_data group by shift_cbe,gateclose_cbe;

update cgl_2025_tier2_all_regions_data set
gateclose_cbe='10:30 AM' where gateclose_cbe is not null;

select distinct shift_skill,examtime_skill,comp_time,count(*) from cgl_2025_tier2_all_regions_data group by shift_skill,examtime_skill,comp_time;

update cgl_2025_tier2_all_regions_data set
examtime_skill='02:00 PM To 02:38 PM'
where examtime_skill='2:00 PM To 2:38 PM' and shift_skill='2' and comp_time='No';----21207

update cgl_2025_tier2_all_regions_data set
examtime_skill='02:00 PM To 02:43 PM'
where examtime_skill='2:00 PM To 2:43 PM' and shift_skill='2' and comp_time='Yes';----555

update cgl_2025_tier2_all_regions_data set
examtime_skill='06:00 PM To 06:38 PM'
where examtime_skill='6:00 PM To 6:38 PM' and shift_skill='3' and comp_time='No';----20040

update cgl_2025_tier2_all_regions_data set
examtime_skill='06:00 PM To 06:43 PM'
where examtime_skill='6:00 PM To 6:43 PM' and shift_skill='3' and comp_time='Yes';----359

select distinct shift_skill,repotime_skill,count(*) from cgl_2025_tier2_all_regions_data group by shift_skill,repotime_skill;

update cgl_2025_tier2_all_regions_data set
repotime_skill='07:30 AM' where shift_skill='1' and repotime_skill in('7.30 AM');----47637

update cgl_2025_tier2_all_regions_data set
repotime_skill='03:30 PM' where shift_skill='3' and repotime_skill in('3:30 PM');----18397

select distinct shift_skill,gateclose_skill,count(*) from cgl_2025_tier2_all_regions_data group by shift_skill,gateclose_skill;

update cgl_2025_tier2_all_regions_data set
gateclose_skill='09:30 AM' where shift_skill='1' and gateclose_skill in ('9:30 AM');---25657

update cgl_2025_tier2_all_regions_data set
gateclose_skill='01:30 PM' where shift_skill='2' and gateclose_skill in ('1:30 PM');---19840

update cgl_2025_tier2_all_regions_data set
gateclose_skill='05:30 PM' where shift_skill='3' and gateclose_skill in ('5:30 PM');---18397

select distinct shift_stat,examtime_stat,comp_time,count(*) from cgl_2025_tier2_all_regions_data group by shift_stat,examtime_stat,comp_time;

update cgl_2025_tier2_all_regions_data set
examtime_stat='04:30 PM To 06:30 PM'
where examtime_stat='4:30 PM To 6:30 PM' and shift_stat='2' and comp_time='No';----3512

update cgl_2025_tier2_all_regions_data set
examtime_stat='04:30 PM To 07:10 PM'
where examtime_stat='4:30 PM To 7:10 PM' and shift_stat='2' and comp_time='Yes';----58

select distinct shift_stat,repotime_stat,count(*) from cgl_2025_tier2_all_regions_data group by shift_stat,repotime_stat;

update cgl_2025_tier2_all_regions_data set
repotime_stat='02:30 PM' where shift_stat='2';---7065

select distinct shift_stat,gateclose_stat,count(*) from cgl_2025_tier2_all_regions_data group by shift_stat,gateclose_stat;

update cgl_2025_tier2_all_regions_data set
gateclose_stat='04:00 PM' where shift_stat='2';---7065

select reg_number,is_active from cgl_2025_tier2_admit_card where reg_number='10024150204';---mpr KKR candidate moved to MPR
select reg_number,is_active from cgl_2025_tier2_admit_card where reg_number='10001227871';---mpr KKR candidate moved to MPR

select reg_number,is_active from cgl_2025_tier2_admit_card where reg_number='10001455735';---er KKR candidate moved to ER

select reg_number,is_active from cgl_2025_tier2_admit_card where reg_number='10005845597';---nr KKR candidate moved to NR

select reg_number,is_active from cgl_2025_tier2_admit_card where reg_number='10000028269';---nr KKR candidate moved to NR

select reg_number,is_active from cgl_2025_tier2_admit_card where reg_number='10005794930';---nr KKR candidate moved to NR

select reg_number,is_active from cgl_2025_tier2_admit_card where reg_number='10002158192';---NR

select * from cgl_2025_tier2_admit_card where roll_number='9001011170';---CR KKR candidate moved to NR
