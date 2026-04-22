create table chsl_2025_final_allocation_1_1_mapiing_final
(
city_code character varying,
region character varying,
city character varying,
display_name character varying,
exam_date	character varying,
shift character varying,
cap_m_ews integer,
cap_f_ews integer,
cap_m_obc integer,
cap_f_obc integer,
cap_m_sc integer,
cap_f_sc integer,
cap_m_st integer,
cap_f_st integer,
cap_m_ur integer,
cap_f_ur integer,
cap_ph	integer,
cap_total	integer,
lang_english character varying,
lang_hindi	character varying,
lang_assamese character varying,
lang_bengali character varying,
lang_gujarati character varying,
lang_konkani character varying,
lang_manipuri character varying,
lang_marathi character varying,
lang_odia character varying,
lang_punjabi character varying,
lang_tamil	character varying,
lang_telugu	 character varying,
lang_kannada character varying,
lang_malayalam character varying,
lang_urdu character varying
)

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='Y',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='Y',
lang_manipuri 	='Y',
lang_marathi 	='Y',
lang_odia		='Y',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='Y',
lang_kannada	='Y',
lang_malayalam  ='Y',
lang_urdu 		='Y'
where 
exam_date='2025-11-12' and
shift='2';--130 updates

select * from chsl_2025_final_allocation_1_1_mapiing_final where city='IMPHAL' and exam_date='2025-11-15' 
and shift in ('1','2');

update chsl_2025_final_allocation_1_1_mapiing_final set lang_manipuri 	='Y' where city='IMPHAL' and exam_date='2025-11-15' 
and shift in ('1','2');---2 updates

UPDATE chsl_2025_final_allocation_1_1_mapiing_final SET CITY='SIKAR/ALWAR' where CITY_CODE='2411';---51 updatesupdate chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-12' where examdate_bkp='12-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-13' where examdate_bkp='13-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-14' where examdate_bkp='14-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-15' where examdate_bkp='15-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-16' where examdate_bkp='16-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-17' where examdate_bkp='17-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-18' where examdate_bkp='18-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-19' where examdate_bkp='19-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-20' where examdate_bkp='20-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-21' where examdate_bkp='21-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-22' where examdate_bkp='22-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-23' where examdate_bkp='23-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-24' where examdate_bkp='24-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-25' where examdate_bkp='25-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-26' where examdate_bkp='26-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-27' where examdate_bkp='27-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-28' where examdate_bkp='28-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-29' where examdate_bkp='29-11-2025';
update chsl_2025_final_allocation_1_1_mapiing_final set exam_date='2025-11-30' where examdate_bkp='30-11-2025';


update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='N',
lang_gujarati	='N',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='N',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date='2025-11-12' and
shift='2';---130 updates

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='Y',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='Y',
lang_manipuri 	='Y',
lang_marathi 	='Y',
lang_odia		='Y',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='Y',
lang_kannada	='Y',
lang_malayalam  ='Y',
lang_urdu 		='Y'
where 
exam_date='2025-11-15' and
shift IN ('1','2','3');---390 UPDATES

update chsl_2025_final_allocation_1_1_mapiing_final set lang_english	='N',lang_hindi		='N'
where exam_date='2025-11-15' and city ='ERNAKULAM';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N',
lang_assamese	='N',
lang_bengali 	='N',
lang_gujarati	='N',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='N',
lang_malayalam  ='Y',
lang_urdu 		='N'
where 
exam_date='2025-11-18' 
and city ='ERNAKULAM';---3 updates

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N',
lang_assamese	='N',
lang_bengali 	='N',
lang_gujarati	='N',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='N',
lang_malayalam  ='Y',
lang_urdu 		='N'
where 
exam_date IN ('2025-11-15', '2025-11-17','2025-11-18','2025-11-19')
and city ='KANNUR';---12 updates

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='Y',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='Y',
lang_manipuri 	='Y',
lang_marathi 	='Y',
lang_odia		='Y',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='Y',
lang_kannada	='Y',
lang_malayalam  ='Y',
lang_urdu 		='Y'
where 
exam_date IN ('2025-11-20', '2025-11-17','2025-11-18','2025-11-19');---1560 updates

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N',
lang_assamese	='Y',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='Y',
lang_manipuri 	='Y',
lang_marathi 	='Y',
lang_odia		='Y',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='Y',
lang_kannada	='Y',
lang_malayalam  ='Y',
lang_urdu 		='Y'
where 
exam_date IN ('2025-11-20', '2025-11-17','2025-11-18','2025-11-19','2025-11-15')
And city in ('ERNAKULAM','KANNUR','KOLLAM','KOTTAYAM','KOZHIKODE','THIRUVANANTHAPURAM','THRISSUR');--105 updates


update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N',
lang_assamese	='N',
lang_bengali 	='N',
lang_gujarati	='N',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='N',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date IN ('2025-11-20', '2025-11-17','2025-11-18','2025-11-19');---1560 updates

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='Y',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='Y',
lang_odia		='Y',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='Y',
lang_kannada	='Y',
lang_malayalam  ='Y',
lang_urdu 		='N'
where 
exam_date ='2025-11-17';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='Y',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='Y',
lang_odia		='Y',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='Y',
lang_kannada	='Y',
lang_malayalam  ='Y',
lang_urdu 		='N'
where 
exam_date ='2025-11-18';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='Y',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='Y',
lang_odia		='Y',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='Y',
lang_kannada	='Y',
lang_malayalam  ='Y',
lang_urdu 		='N'
where 
exam_date ='2025-11-19';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='Y',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='Y',
lang_odia		='Y',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='Y',
lang_kannada	='Y',
lang_malayalam  ='Y',
lang_urdu 		='N'
where 
exam_date ='2025-11-20';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='Y',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='Y',
lang_odia		='Y',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='Y',
lang_kannada	='Y',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-21';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='Y',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='Y',
lang_odia		='Y',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='Y',
lang_kannada	='Y',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-22';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='Y',
lang_odia		='N',
lang_punjabi	='Y',
lang_tamil		='Y',
lang_telugu	 	='N',
lang_kannada	='Y',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-24';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='Y',
lang_odia		='N',
lang_punjabi	='Y',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='Y',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-25';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='Y',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-26';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='Y',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-27';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='N',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-28';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='N',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-29';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='Y',
lang_gujarati	='Y',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='N',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-30';

update chsl_2025_final_allocation_1_1_mapiing_final set lang_telugu='N' where exam_date='2025-11-22';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='N',
lang_gujarati	='N',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='N',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-12';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='N',
lang_gujarati	='N',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='N',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-13';

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='Y',
lang_hindi		='Y',
lang_assamese	='N',
lang_bengali 	='N',
lang_gujarati	='N',
lang_konkani	='N',
lang_manipuri 	='N',
lang_marathi 	='N',
lang_odia		='N',
lang_punjabi	='N',
lang_tamil		='N',
lang_telugu	 	='N',
lang_kannada	='N',
lang_malayalam  ='N',
lang_urdu 		='N'
where 
exam_date ='2025-11-14';


----malayalam-------
update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where 
exam_date in ('2025-11-15', '2025-11-17','2025-11-18','2025-11-19','2025-11-20')
And city in ('ERNAKULAM','KANNUR','KOLLAM','KOTTAYAM','KOZHIKODE','THIRUVANANTHAPURAM','THRISSUR');

-----assamese-----
update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where 
exam_date in ('2025-11-15', '2025-11-17','2025-11-18','2025-11-19')
And city in ('DIBRUGARH','GUWAHATI','JORHAT','TEZPUR','ITANAGAR');

------odia------
update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='BHUBANESWAR' and exam_date in ('2025-11-15', '2025-11-17','2025-11-18');

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='BALASORE' and exam_date in ('2025-11-15', '2025-11-17','2025-11-18','2025-11-19','2025-11-20');

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='CUTTACK' and exam_date in ( '2025-11-17','2025-11-18');

update chsl_2025_final_allocation_1_1_mapiing_final set lang_english	='Y',lang_hindi		='Y' where city='CUTTACK' and exam_date='2025-11-19' and shift='3';


update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='SAMBALPUR' and exam_date in ( '2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20','2025-11-21','2025-11-22');

-------tamil----
update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='CHENNAI' and exam_date in ( '2025-11-15','2025-11-17');

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='COIMBATORE' and exam_date in ( '2025-11-15','2025-11-17','2025-11-18');

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='MADURAI' and exam_date in ( '2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20');

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='SALEM' and exam_date in ( '2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20');

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='TIRUCHIRAPALLI' and exam_date in ( '2025-11-15','2025-11-17','2025-11-18');

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='VELLORE' and exam_date in ( '2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20');

-------punjabi--------
update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city='PATIALA' and exam_date in ( '2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20');

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city in ('AMRITSAR','BATHINDA','JALANDHAR') and exam_date in ( '2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20');

------kannada--------
update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city in ('BELAGAVI','HUBBALLI','SHIVAMOGGA','KALABURAGI') and exam_date in ( '2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20','2025-11-21');

--------marathi--------
update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city in ('NANDED')and exam_date in ( '2025-11-15','2025-11-17','2025-11-18','2025-11-19');

--------gujrati---------

update chsl_2025_final_allocation_1_1_mapiing_final
set
lang_english	='N',
lang_hindi		='N'
where
city in ('AHMEDABA','SURAT','VADODARA') and exam_date in ( '2025-11-15','2025-11-17','2025-11-18','2025-11-19','2025-11-20','2025-11-21','2025-11-22');



update exam_slots a
set 
a.cap_m_ews=b.cap_m_ews::int,
a.cap_f_ews=b.cap_f_ews::int,
a.cap_m_obc=b.cap_m_obc::int,
a.cap_f_obc=b.cap_f_obc::int,
a.cap_m_sc =b.cap_m_sc::int,
a.cap_f_sc =b.cap_f_sc::int,
a.cap_m_st =b.cap_m_st::int,
a.cap_f_st =b.cap_f_st::int,
a.cap_m_ur =b.cap_m_ur::int,
a.cap_f_ur =b.cap_f_ur::int,
a.cap_ph	=b.cap_ph::int,
a.cap_total=b.cap_total::int
from chsl_2025_final_allocation_special_cases b 
where a.city_code='8011' and b.city_code='8011' and
a.exam_date=b.examdate and
a.shift::character varying=b.shift;

update exam_slots a
set 
a.cap_m_ews=b.cap_m_ews::int,
a.cap_f_ews=b.cap_f_ews::int,
a.cap_m_obc=b.cap_m_obc::int,
a.cap_f_obc=b.cap_f_obc::int,
a.cap_m_sc =b.cap_m_sc::int,
a.cap_f_sc =b.cap_f_sc::int,
a.cap_m_st =b.cap_m_st::int,
a.cap_f_st =b.cap_f_st::int,
a.cap_m_ur =b.cap_m_ur::int,
a.cap_f_ur =b.cap_f_ur::int,
a.cap_ph	=b.cap_ph::int,
a.cap_total=b.cap_total::int
from chsl_2025_final_allocation_special_cases b 
where a.city_code='8001' and b.city_code='8001' and
a.exam_date=b.examdate and
a.shift::character varying=b.shift;

update exam_slots a
set 
a.cap_m_ews=b.cap_m_ews::int,
a.cap_f_ews=b.cap_f_ews::int,
a.cap_m_obc=b.cap_m_obc::int,
a.cap_f_obc=b.cap_f_obc::int,
a.cap_m_sc =b.cap_m_sc::int,
a.cap_f_sc =b.cap_f_sc::int,
a.cap_m_st =b.cap_m_st::int,
a.cap_f_st =b.cap_f_st::int,
a.cap_m_ur =b.cap_m_ur::int,
a.cap_f_ur =b.cap_f_ur::int,
a.cap_ph	=b.cap_ph::int,
a.cap_total=b.cap_total::int
from chsl_2025_final_allocation_special_cases b 
where a.city_code='8604' and b.city_code='8604' and
a.exam_date=b.examdate and
a.shift::character varying=b.shift;

update exam_slots a
set 
a.cap_m_ews=b.cap_m_ews::int,
a.cap_f_ews=b.cap_f_ews::int,
a.cap_m_obc=b.cap_m_obc::int,
a.cap_f_obc=b.cap_f_obc::int,
a.cap_m_sc =b.cap_m_sc::int,
a.cap_f_sc =b.cap_f_sc::int,
a.cap_m_st =b.cap_m_st::int,
a.cap_f_st =b.cap_f_st::int,
a.cap_m_ur =b.cap_m_ur::int,
a.cap_f_ur =b.cap_f_ur::int,
a.cap_ph	=b.cap_ph::int,
a.cap_total=b.cap_total::int
from madurai_case b 
where a.city_code='8204' and b.city_code='8204' and
a.exam_date=b.examdate and
a.shift::character varying=b.shift;

update exam_slots a
set 
a.cap_m_ews=b.cap_m_ews::int,
a.cap_f_ews=b.cap_f_ews::int,
a.cap_m_obc=b.cap_m_obc::int,
a.cap_f_obc=b.cap_f_obc::int,
a.cap_m_sc =b.cap_m_sc::int,
a.cap_f_sc =b.cap_f_sc::int,
a.cap_m_st =b.cap_m_st::int,
a.cap_f_st =b.cap_f_st::int,
a.cap_m_ur =b.cap_m_ur::int,
a.cap_f_ur =b.cap_f_ur::int,
a.cap_ph	=b.cap_ph::int,
a.cap_total=b.cap_total::int
from TIRUNELVELI_CASE_new b 
where a.city_code='8207' and b.city_code='8207' and
a.exam_date=b.examdate and
a.shift::character varying=b.shift;

update exam_slots a
set 
a.cap_m_ews=b.cap_m_ews::int,
a.cap_f_ews=b.cap_f_ews::int,
a.cap_m_obc=b.cap_m_obc::int,
a.cap_f_obc=b.cap_f_obc::int,
a.cap_m_sc =b.cap_m_sc::int,
a.cap_f_sc =b.cap_f_sc::int,
a.cap_m_st =b.cap_m_st::int,
a.cap_f_st =b.cap_f_st::int,
a.cap_m_ur =b.cap_m_ur::int,
a.cap_f_ur =b.cap_f_ur::int,
a.cap_ph	=b.cap_ph::int,
a.cap_total=b.cap_total::int
from chsl_2025_final_allocation_special_cases b 
where a.city_code='8012' and b.city_code='8012' and
a.exam_date=b.examdate and
a.shift::character varying=b.shift;

update exam_slots a
set 
a.cap_m_ews=b.cap_m_ews::int,
a.cap_f_ews=b.cap_f_ews::int,
a.cap_m_obc=b.cap_m_obc::int,
a.cap_f_obc=b.cap_f_obc::int,
a.cap_m_sc =b.cap_m_sc::int,
a.cap_f_sc =b.cap_f_sc::int,
a.cap_m_st =b.cap_m_st::int,
a.cap_f_st =b.cap_f_st::int,
a.cap_m_ur =b.cap_m_ur::int,
a.cap_f_ur =b.cap_f_ur::int,
a.cap_ph	=b.cap_ph::int,
a.cap_total=b.cap_total::int
from chsl_2025_final_allocation_special_cases b 
where a.city_code='8007' and b.city_code='8007' and
a.exam_date=b.examdate and
a.shift::character varying=b.shift;