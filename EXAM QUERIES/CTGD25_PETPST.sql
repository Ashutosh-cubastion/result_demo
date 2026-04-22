psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_ctgd2025_allocation_petpst

alter table vacancy_table add column min_marks numeric;
alter table vacancy_table add column min_marks_parta numeric;
alter table vacancy_table add column min_marks_partb numeric;
alter table vacancy_table add column min_marks_cand_dob date;

do
$$
begin

    
alter table candidates add column pst_attendence character varying(255) COLLATE pg_catalog."default";
alter table candidates add column pst_photo_status character varying(255) COLLATE pg_catalog."default";
alter table candidates add column "pst_LTI_biometric" character varying(255) COLLATE pg_catalog."default";
alter table candidates add column "isFromNaxalDistrict_petpst" boolean;
alter table candidates add column "isFromBorderDistrict_petpst" boolean;
alter table candidates add column "isEsm_petpst" boolean;
alter table candidates add column pst_center_name character varying(255) COLLATE pg_catalog."default";
alter table candidates add column pst_center_code character varying(255) COLLATE pg_catalog."default";
alter table candidates add column pet_pst_center_address character varying(500) COLLATE pg_catalog."default";
alter table candidates add column pst_actual_date date;
alter table candidates add column pst_scheduled_date date;
alter table candidates add column race_male_5km_24min character varying(255) COLLATE pg_catalog."default";
alter table candidates add column race_male_1_6km_7min character varying(255) COLLATE pg_catalog."default";
alter table candidates add column race_female_1_6km_8min30sec character varying(255) COLLATE pg_catalog."default";
alter table candidates add column race_female_800m_5min character varying(255) COLLATE pg_catalog."default";
alter table candidates add column pet_status character varying(255) COLLATE pg_catalog."default";
alter table candidates add column pst_height double precision;
alter table candidates add column pst_is_height_relaxation_availed character varying(255) COLLATE pg_catalog."default";
alter table candidates add column pst_height_relaxation_code character varying(2000) COLLATE pg_catalog."default";
alter table candidates add column pst_chest_not_expanded double precision;
alter table candidates add column pst_chest_expanded double precision;
alter table candidates add column pst_is_chest_relaxation_availed character varying(255) COLLATE pg_catalog."default";
alter table candidates add column pst_chest_relaxation_code character varying(500) COLLATE pg_catalog."default";
alter table candidates add column pst_weight double precision;
alter table candidates add column pst_status character varying(255) COLLATE pg_catalog."default";
alter table candidates add column final_pet_pst_status character varying(255) COLLATE pg_catalog."default";
alter table candidates add column final_remarks character varying(255) COLLATE pg_catalog."default";
alter table candidates add column "isSuspectedCandidate" boolean;
alter table candidates add column "isHeightQualified" boolean;
alter table candidates add column "isChestQualified" boolean;
alter table candidates add column "createdAt_petpst" timestamp with time zone ;
alter table candidates add column "updatedAt_petpst" timestamp with time zone ;
    
end
$$


update candidates a
set
a.pst_attendence=b.pst_attendence,
a.pst_photo_status =b.pst_photo_status,
a."pst_LTI_biometric"=b."pst_LTI_biometric",
a."isFromNaxalDistrict_petpst" =b."isFromNaxalDistrict",
a."isFromBorderDistrict_petpst"=b."isFromBorderDistrict",
a."isEsm_petpst" =b."isEsm",
a.pst_center_name=b.pst_center_name,
a.pst_center_code =b.pst_center_code,
a.pet_pst_center_address =b.pet_pst_center_address,
a.pst_actual_date =b.pst_actual_date,
a.pst_scheduled_date =b.pst_scheduled_date,
a.race_male_5km_24min=b.race_male_5km_24min,
a.race_male_1_6km_7min=b.race_male_1_6km_7min,
a.race_female_1_6km_8min30sec =b.race_female_1_6km_8min30sec,
a.race_female_800m_5min =b.race_female_800m_5min,
a.pet_status =b.pet_status,
a.pst_height =b.pst_height,
a.pst_is_height_relaxation_availed=b.pst_is_height_relaxation_availed,
a.pst_height_relaxation_code=b.pst_height_relaxation_code,
a.pst_chest_not_expanded=b.pst_chest_not_expanded,
a.pst_chest_expanded =b.pst_chest_expanded,
a.pst_is_chest_relaxation_availed =b.pst_is_chest_relaxation_availed,
a.pst_chest_relaxation_code=b.pst_chest_relaxation_code,
a.pst_weight =b.pst_weight,
a.pst_status =b.pst_status,
a.final_pet_pst_status=b.final_pet_pst_status,
a.final_remarks =b.final_remarks,
a."isSuspectedCandidate" =b."isSuspectedCandidate",
a."isHeightQualified"=b."isHeightQualified",
a."isChestQualified"=b."isChestQualified",
a."createdAt_petpst" =b."createdAt",
a."updatedAt_petpst" =b."updatedAt"

from t_ctgd2025_pet_pst b where a."registrationNo"=b."registrationNo"
and a.rollno=b."rollNo";----394121 updates


select distinct cat2,"isEsm_petpst" from candidates;---ok

select distinct naxal_district,"isFromNaxalDistrict_petpst",count(*) from candidates group by naxal_district,"isFromNaxalDistrict_petpst" ;---19 mismatch

select distinct border_district,"isFromBorderDistrict_petpst",count(*) from candidates group by border_district,"isFromBorderDistrict_petpst" ;--22 mismatch


select distinct gender,"isHeightQualified","isChestQualified",final_pet_pst_status from candidates order by gender;

select distinct pst_chest_relaxation_code,count(*) from t_ctgd2025_pet_pst group by pst_chest_relaxation_code;

"All candidates belonging to Scheduled Tribes"	5140
"Candidates falling in the categories of Garhwalis, Kumaonis, Dogras, Marathas and candidates belonging to the States/ UTs of Assam, Himachal Pradesh, Jammu & Kashmir and Ladakh"	2617
"Candidates hailing from North-Eastern Sates of Arunachal Pradesh, Manipur,Meghalaya, Mizoram, Nagaland, Sikkim,Tripura and Gorkha Territorial Administration (GTA)"	283

update candidates set chst_rlx_code='5' where pst_chest_relaxation_code='All candidates belonging to Scheduled Tribes';---5140
update candidates set chst_rlx_code='9' where pst_chest_relaxation_code='Candidates hailing from North-Eastern Sates of Arunachal Pradesh, Manipur,Meghalaya, Mizoram, Nagaland, Sikkim,Tripura and Gorkha Territorial Administration (GTA)';---283
update candidates set chst_rlx_code='10' where pst_chest_relaxation_code='Candidates falling in the categories of Garhwalis, Kumaonis, Dogras, Marathas and candidates belonging to the States/ UTs of Assam, Himachal Pradesh, Jammu & Kashmir and Ladakh';---2617

"All candidates belonging to Scheduled Tribes"	9109
"All Scheduled Tribe candidates of Left Wing Extremism affected districts"	772
"All Scheduled Tribe candidates of North Eastern States (NE States)"	6463
"Candidates falling in the categories of Garhwalis, Kumaonis, Dogras, Marathas and candidates belonging to the States/ UTs of Assam, Himachal Pradesh, Jammu & Kashmir and Ladakh"	9003
"Candidates hailing from Gorkha Territorial Administration (GTA) comprising of the three Sub-Divisions of Darjeeling District namely Darjeeling, Kalimpong and Kurseong and includes the following ''Mouzas'' Sub-Division of 
these Districts :
(1)Lohagarh Tea Garden (2) Lohagarh Forest 
(3) Rangmohan (4) Barachenga (5) Panighata 
(6) ChotaAdalpur (7) Paharu (8) Sukna Forest 
(9) Sukna Part-I (10) Pantapati Forest-I (11) 
Mahanadi Forest (12) Champasari Forest (13) 
SalbariChhatpart-II (14) Sitong Forest (15) 
Sivoke Hill Forest (16) Sivoke Forest (17) 
ChhotaChenga (18) Nipania"	39
"Candidates hailing from North Eastern States of Arunachal Pradesh, Manipur, Meghalaya, Mizoram,Nagaland, Sikkim and Tripura"	1144
	


update candidates set ht_rlx_code='1' where 
pst_height_relaxation_code='All candidates belonging to Scheduled Tribes';---9109

update candidates set ht_rlx_code='6' where 
pst_height_relaxation_code='All Scheduled Tribe candidates of North Eastern States (NE States)';---6463

update candidates set ht_rlx_code='8' where 
pst_height_relaxation_code='Candidates hailing from Gorkha Territorial Administration (GTA) comprising of the three Sub-Divisions of Darjeeling District namely Darjeeling, Kalimpong and Kurseong and includes the following ''''Mouzas'''' Sub-Division of 
these Districts :
(1)Lohagarh Tea Garden (2) Lohagarh Forest 
(3) Rangmohan (4) Barachenga (5) Panighata 
(6) ChotaAdalpur (7) Paharu (8) Sukna Forest 
(9) Sukna Part-I (10) Pantapati Forest-I (11) 
Mahanadi Forest (12) Champasari Forest (13) 
SalbariChhatpart-II (14) Sitong Forest (15) 
Sivoke Hill Forest (16) Sivoke Forest (17) 
ChhotaChenga (18) Nipania';---39

update candidates set ht_rlx_code='4' where 
pst_height_relaxation_code='Candidates hailing from North Eastern States of Arunachal Pradesh, Manipur, Meghalaya, Mizoram,Nagaland, Sikkim and Tripura';--1144


update candidates set ht_rlx_code='3' where 
pst_height_relaxation_code='Candidates falling in the categories of Garhwalis, Kumaonis, Dogras, Marathas and candidates belonging to the States/ UTs of Assam, Himachal Pradesh, Jammu & Kashmir and Ladakh';---9003

update candidates set ht_rlx_code='7' where 
pst_height_relaxation_code='All Scheduled Tribe candidates of Left Wing Extremism affected districts';---772

select distinct pst_chest_relaxation_code,chst_rlx_code,count(*) from candidates group by pst_chest_relaxation_code,chst_rlx_code;

select distinct pst_height_relaxation_code,ht_rlx_code,count(*) from candidates group by pst_height_relaxation_code,ht_rlx_code;


select distinct final_pet_pst_status from candidates;

"Temporary Unfit"
"Rejected"
"Qualified"
"Not Qualified"
"With Held"

alter table candidates add column rejection_provision character varying;

alter table candidates add column height_relax character varying;
alter table candidates add column chest_relax character varying;
alter table candidates add column height_chest_relax character varying;

update candidates set rejection_provision='R' where final_pet_pst_status='Rejected';---134762
update candidates set rejection_provision='Q' where final_pet_pst_status='Qualified';---126381
update candidates set rejection_provision='NQ' where final_pet_pst_status='Not Qualified';---132581
update candidates set rejection_provision='TU' where final_pet_pst_status='Temporary Unfit';---45
update candidates set rejection_provision='W' where final_pet_pst_status='With Held';---352

select distinct ht_rlx_code,count(*) from candidates where genderid='2' and pst_height<'170' and
final_pet_pst_status in ('Temporary Unfit','Qualified','With Held') group by ht_rlx_code ;

select * from candidates where final_pet_pst_status in ('Temporary Unfit','Qualified','With Held') and  genderid='2' and pst_height<'170' and ht_rlx_code is null ;--112 all esm


select distinct ht_rlx_code,count(*) from candidates where genderid='1' and pst_height<'157' and
final_pet_pst_status in ('Temporary Unfit','Qualified','With Held') group by ht_rlx_code ;--okay

select distinct chst_rlx_code,count(*) from candidates where genderid='2' and (pst_chest_not_expanded<'80' or pst_chest_expanded<'85') and
final_pet_pst_status in ('Temporary Unfit','Qualified','With Held') group by chst_rlx_code ;---ok


update candidates set height_relax='Yes' where rejection_provision in ('Q','W','TU') and genderid='2' and pst_height<'170' and cat2 is null;---23573
update candidates set height_relax='Yes' where rejection_provision in ('Q','W','TU') and genderid='1' and pst_height<'157' and cat2 is null;---2318

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded
from candidates where rejection_provision in ('Q','W','TU') and genderid='2' and pst_height<'170' and ht_rlx_code='' and cat2 is null;---no such candidates

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded
from candidates where rejection_provision in ('Q','W','TU') and genderid='1' and pst_height<'157' and ht_rlx_code='' and cat2 is null;---no such candidates

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded
from candidates where rejection_provision in ('Q','W','TU') and genderid='2' and (pst_chest_not_expanded<'80' or pst_chest_expanded<'85') and chst_rlx_code='' and cat2 is null;---no such candidates

----------------Handling of Height Relaxation for Male candidates:---------------

--- Number of qualified non-ESM male candidates having height <170 cm=23573. HT_RELAX value was assigned ‘T’ to all these candidates.

update candidates set height_relax='Yes' where rejection_provision in ('Q','W','TU') and genderid='2' and pst_height<'170' and cat2 is null;---23573


--Number of qualified male candidates who had availed ‘Hill Area’ Height Relaxation=. Height of all these candidates was <170 cm but >=165 cm. HT_RELAX value of these candidates was changed to ‘F’ as this height relaxation is available to candidates of all categories.

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='2'
and pst_height>='165' and ht_rlx_code='3' and cat2 is null;---8134

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='2'
and pst_height>='165' and ht_rlx_code='3' and cat2 is null;---8134 updates

--	There were male candidates who had qualified in PET/ PST and had Height Relaxation allowed for Gorkha Territorial Administration (GTA) i.e. PHTR_CODE=’8’. HT_RELAX value of these candidates was changed to ‘F’ as this height relaxation is available of candidates of all categories.

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='2'
and pst_height>='157' and ht_rlx_code='8' and cat2 is null;---36

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='2'
and pst_height>='157' and ht_rlx_code='8' and cat2 is null;---36 updates

---	There were male candidates who had qualified in PET/ PST and had availed Height Relaxation benefit allowed for the candidates of the seven NE States. HT_RELAX value of these candidates was changed to ‘F’ as this height relaxation is available of candidates of all categories.

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='2'
and pst_height>='162.5' and ht_rlx_code='4' and cat2 is null;---986

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='2'
and pst_height>='162.5' and ht_rlx_code='4' and cat2 is null;---986 updates

--	Non-ESM, qualified ST male candidates having height >=165 cm and <170 cm, who have availed height relaxation of ‘ST’ category and belongs to JK (14), Ladakh (18), HP (13), Assam (4) and Uttarakhand (35) should be treated as having not availed height relaxation as 165 cm is the height requirement for all candidates of these States. State-wise count of such candidates is:

a.	Assam (4): 9
b.	HP (14): 20
c.	JK (15): 399
d.	Ladakh (37): 13
e.	Uttarakhand (35): 28
f.	Maharashtra (21): 273

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='2' and statecode_considered in ('4','14','15','37','35','21')
and pst_height>='165' and ht_rlx_code='1' and cat2 is null;---742

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='2' and statecode_considered in ('4','14','15','37','35','21')
and pst_height>='165' and ht_rlx_code='1' and cat2 is null;---742 updates

---	Non-ESM, qualified ST male candidates having height >=162.5 cm and <170 cm, who have availed height relaxation of ‘ST’ category and belongs to  Arunachal Pradesh (3), Manipur (22), Meghalaya (23), Mizoram (24), Nagaland (25), Sikkim (30) and Tripura (33) should be treated as having not availed height relaxation as 162.5 cm is the height requirement for all candidates of these States. State-wise count of such candidates is:

1	Arunachal Pradesh (3)	: 8
2	Manipur (22)	: 55
3	Meghalaya (23)	: 3
4	Mizoram (24)	: 6
5	Nagaland (25)	: 18
6	Sikkim (30)	: 1
7	Tripura (33) : 6

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='2' and statecode_considered in ('3','22','23','24','25','30','33')
and pst_height>='162.5' and ht_rlx_code='1' and cat2 is null;---97

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='2' and statecode_considered in ('3','22','23','24','25','30','33')
and pst_height>='162.5' and ht_rlx_code='1' and cat2 is null;---97 updates

-- non-ESM, qualified ST male candidates having height >=162.5 cm and <170 cm, who have availed height relaxation of ‘ST’ of NE States (PHTR_CODE=’6’) should be treated as having not availed height relaxation as 162.5 cm is the height requirement for all candidates of these States. HT_RELAX value of all these candidates was changed to ‘F’. 

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='2' 
and pst_height>='162.5' and ht_rlx_code='6' and cat2 is null;---4110

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='2' 
and pst_height>='162.5' and ht_rlx_code='6' and cat2 is null;---4110 updates


-----------------Handling of Height Relaxation for Female candidates:----------------------------------------

update candidates set height_relax='Yes' where rejection_provision in ('Q','W','TU') and genderid='1' and pst_height<'157' and cat2 is null;---2318


--Number of qualified female candidates who had availed ‘Hill Area’ Height Relaxation=. Height of all these candidates was <170 cm but >=165 cm. HT_RELAX value of these candidates was changed to ‘F’ as this height relaxation is available to candidates of all categories.

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='1' 
and pst_height>='155' and ht_rlx_code='3' and cat2 is null;---632

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='1' 
and pst_height>='155' and ht_rlx_code='3' and cat2 is null;---632 updates

--	There were female candidates who had qualified in PET/ PST and had Height Relaxation allowed for Gorkha Territorial Administration (GTA) i.e. PHTR_CODE=’8’. HT_RELAX value of these candidates was changed to ‘F’ as this height relaxation is available of candidates of all categories.

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='1' 
and pst_height>='152.5' and ht_rlx_code='8' and cat2 is null;---3

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='1' 
and pst_height>='152.5' and ht_rlx_code='8' and cat2 is null;---3 updates

---	There were male candidates who had qualified in PET/ PST and had availed Height Relaxation benefit allowed for the candidates of the seven NE States. HT_RELAX value of these candidates was changed to ‘F’ as this height relaxation is available of candidates of all categories.

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='1' 
and pst_height>='152.5' and ht_rlx_code='4' and cat2 is null;---99

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='1' 
and pst_height>='152.5' and ht_rlx_code='4' and cat2 is null;---99 updates

--	Non-ESM, qualified ST female candidates having height >=155 cm and <157 cm, who have availed height relaxation of ‘ST’ category and belongs to JK (14), Ladakh (18), HP (13), Assam (4) and Uttarakhand (35) should be treated as having not availed height relaxation as 165 cm is the height requirement for all candidates of these States. State-wise count of such candidates is:

a.	Assam (4): 0
b.	HP (14): 0
c.	JK (15): 10
d.	Ladakh (37): 4
e.	Uttarakhand (35): 1
f.	Maharashtra (21): 12

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='1' and statecode_considered in ('4','14','15','37','35','21')
and pst_height>='155' and ht_rlx_code='1' and cat2 is null;---27

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='1' and statecode_considered in ('4','14','15','37','35','21')
and pst_height>='155' and ht_rlx_code='1' and cat2 is null;---27 updates

-- Qualified ST female candidates having height >=152.5 cm and <157 cm, who have availed height relaxation of ‘ST’ category and belongs to  Arunachal Pradesh (3), Manipur (22), Meghalaya (23), Mizoram (24), Nagaland (25), Sikkim (30) and Tripura (33) should be treated as having not availed height relaxation as 152.5 cm is the height requirement for all candidates of these States. State-wise count of such candidates is:

Arunachal Pradesh (3)	: 0
Manipur (22)	: 6
Meghalaya (23)	: 0
Mizoram (24)	: 0
Nagaland (25)	: 0
Sikkim (30)	: 0
Tripura (33) : 0

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='1' and statecode_considered in('3','22','23','24','25','30','33')
and pst_height>='152.5' and ht_rlx_code='1' and cat2 is null;---6

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='1' and statecode_considered in ('3','22','23','24','25','30','33')
and pst_height>='152.5' and ht_rlx_code='1' and cat2 is null;---6 updates

---qualified ST female candidates having height >=152.5 cm and <157 cm, who have availed height relaxation of ‘ST’ of NE States (PHTR_CODE=’6’) should be treated as having not availed height relaxation as 152.5 cm is the height requirement for all candidates of these States. HT_RELAX value of all these candidates was changed to ‘F’. 

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='1' 
and pst_height>='152.5' and ht_rlx_code='6' and cat2 is null;---407

update candidates set height_relax=null where rejection_provision in ('Q','W','TU') and genderid='1' 
and pst_height>='152.5' and ht_rlx_code='6' and cat2 is null;---407 updates


---------------Handling of Chest Relaxation for Male candidates:-------------------------

---Number of qualified non-ESM male candidates having non-expanded chest <80 cm OR expanded chest<85 cm=. CH_RELAX value was assigned ‘T’ to all these candidates.

update candidates set chest_relax='Yes' where rejection_provision in ('Q','W','TU') and genderid='2' and (pst_chest_not_expanded<'80' or pst_chest_expanded<'85') and cat2 is null;---7868

--Out of the qualified non-ESM male candidates who had availed Chest Relaxation, number of candidates who had their non-exp chest>=80 cm and exp chest>=85 were 16.

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='2' 
and (pst_chest_not_expanded>='78' and pst_chest_expanded>='83') and chst_rlx_code='10' and cat2 is null;---2583

update candidates set chest_relax=null where rejection_provision in ('Q','W','TU') and genderid='2' 
and (pst_chest_not_expanded>='78' and pst_chest_expanded>='83') and chst_rlx_code='10' and cat2 is null;---2583 updates

---There were non-ESM male candidates who had qualified in PET/ PST and had availed Chest Relaxation allowed for Gorkha Territorial Administration (GTA) i.e. PCHR_CODE=’9’. CH_RELAX value of these candidates was changed to ‘F’ as this chest relaxation is available of candidates of all categories.

select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='2' 
and (pst_chest_not_expanded>='77' and pst_chest_expanded>='82') and chst_rlx_code='9' and cat2 is null;---268

update candidates set chest_relax=null where rejection_provision in ('Q','W','TU') and genderid='2' 
and (pst_chest_not_expanded>='77' and pst_chest_expanded>='82') and chst_rlx_code='9' and cat2 is null;---268 updates


---	Non-ESM, qualified ST male candidates having non-exp chest >=78 cm and exp-chest >=83 cm, who have availed chest relaxation of ‘ST’ category and belongs to JK (14), Ladakh (18), HP (13) and Assam (4) should be treated as having not availed chest relaxation as 78-83 cm is the chest requirement for all candidates of these States. State-wise count of such candidates is:

a.	Assam (4): 543
b.	HP (14): 9
c.	JK (15): 117
d.	Ladakh (37): 1
e.	Uttarakhand (35): 4
f.	Maharashtra (21): 113


select rollno,genderid,cat1,cat2,statename_considered,pst_height,ht_rlx_code,chst_rlx_code,pst_chest_expanded,pst_chest_not_expanded,catsel,remarks,height_relax
from candidates where rejection_provision in ('Q','W','TU') and genderid='2' and statecode_considered in ('4','14','15','35','37','21')
and (pst_chest_not_expanded>='78' and pst_chest_expanded>='83') and chst_rlx_code='5' and cat2 is null;---787

update candidates set chest_relax=null where rejection_provision in ('Q','W','TU') and genderid='2' and statecode_considered in ('4','14','15','35','37','21') 
and (pst_chest_not_expanded>='78' and pst_chest_expanded>='83') and chst_rlx_code='5' and cat2 is null;---787 updates

---------------------------------------------------------------------------------------------------------------------------------------------

update candidates set height_chest_relax='Yes' where (height_relax='Yes' or chest_relax='Yes');---12175

--------------DEBARRED CHECKING----------------------------

CREATE TABLE IF NOT EXISTS public.debarreds
(
    id character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "regionId" character varying(255) COLLATE pg_catalog."default",
    "registrationNumber" character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "fatherName" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "motherName" character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    dob date NOT NULL,
    "genderId" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "categoryId" character varying(255) COLLATE pg_catalog."default",
    "educationBoardId" character varying(255) COLLATE pg_catalog."default",
    "matriculationRollNumber" character varying(255) COLLATE pg_catalog."default",
    "matriculationPassYear" character varying(255) COLLATE pg_catalog."default",
    "examId" character varying(255) COLLATE pg_catalog."default",
    "examYear" character varying(255) COLLATE pg_catalog."default",
    "rollNumber" character varying(255) COLLATE pg_catalog."default",
    "debarredFrom" date NOT NULL,
    "debarredUpto" date NOT NULL,
    reason character varying(100) COLLATE pg_catalog."default",
    "otherReason" character varying(500) COLLATE pg_catalog."default",
    "externalCandidate" character varying(255) COLLATE pg_catalog."default" DEFAULT 'No'::character varying,
    "remarksForExternal" character varying(500) COLLATE pg_catalog."default" DEFAULT ''::character varying,
    "externalInstitutionId" character varying(16) COLLATE pg_catalog."default",
    "letterNumber" character varying(50) COLLATE pg_catalog."default",
    "letterDate" date,
    "ipAddress" character varying(100) COLLATE pg_catalog."default",
    "createdById" character varying(16) COLLATE pg_catalog."default",
    "updatedById" character varying(16) COLLATE pg_catalog."default",
    "isActive" boolean DEFAULT true,
    "createdAt" timestamp with time zone ,
    "updatedAt" timestamp with time zone ,
    CONSTRAINT debarreds_pkey PRIMARY KEY (id)
)


'10021321573','10021436306','10016115637','10014631862','10008591762','10000878426','10019359582','10008463109','10012027904','10018994376','10020834096','10015427294','10019443466','10020450081','10018401463','10019022733','10020809638','10020480917','10002103653','10017331656','10020167901','10018938148','10019543797','10020096689','10012568191','10005956197','10020297623','10020748050','10006631483','10020238506','10020733573','10017937482','10020934097','10020919684','10020021111','10020805421','10013407850','10015461939','10020133921','10001128923','10020311562','10001835101','10021480152','10020612029','10019049468','10019326171','10019527921','10000776608','10019435401','10018775611','10019927518','10020225684','10000097804','10018894851','10021298671','10020662495','10020985534','10020565323','10021470461','10020446451','10019978015','10013896118','10013896118','10017845852','10021453854'


update candidates set debarred='Yes' where "registrationNo" in ('10021321573','10021436306','10016115637','10014631862','10008591762','10000878426','10019359582','10008463109','10012027904','10018994376','10020834096','10015427294','10019443466','10020450081','10018401463','10019022733','10020809638','10020480917','10002103653','10017331656','10020167901','10018938148','10019543797','10020096689','10012568191','10005956197','10020297623','10020748050','10006631483','10020238506','10020733573','10017937482','10020934097','10020919684','10020021111','10020805421','10013407850','10015461939','10020133921','10001128923','10020311562','10001835101','10021480152','10020612029','10019049468','10019326171','10019527921','10000776608','10019435401','10018775611','10019927518','10020225684','10000097804','10018894851','10021298671','10020662495','10020985534','10020565323','10021470461','10020446451','10019978015','10013896118','10013896118','10017845852','10021453854');
update candidates set debarred='Yes' where "registrationNo" in('10020105345','10012526928','10009698958','10013336040');

select * from candidates where debarred='Yes';
select distinct rejection_provision,count(*) from candidates where debarred='Yes' group by rejection_provision;

select a.debarred,a."registrationNo",a.rollno,a.name,b.name as d_name,a."fathersName",b."fatherName" as d_father_name,a."mothersName",b."motherName" as d_mother_name,a.dob,b.dob as d_dob,a.gender,a.cat1,
b."regionId",b."examId",b."examYear",b."rollNumber",b."debarredFrom",b."debarredUpto",b.reason,b."otherReason",b."createdAt",b."updatedAt"
from candidates a,debarreds b where 
b."debarredUpto" >'2025-01-01' and
b."isActive"=true and

--replace((UPPER(a.name)||UPPER(a."fathersName")||UPPER(a."mothersName")),' ','') = replace((UPPER(b.name)||UPPER(b."fatherName")||UPPER(b."motherName")),' ','')
--and a.dob=b.dob;
 
--replace ((UPPER(b.name)||UPPER(b."motherName")),' ','') = replace ((UPPER(a.name)||UPPER(a."mothersName")),' ','') and a.dob = b.dob;
 
replace ((UPPER(b.name)||UPPER(b."fatherName")),' ','') = replace ((UPPER(a.name)||UPPER(a."fathersName")),' ','') and a.dob = b.dob;

update candidates set rejection_provision='D' where debarred='Yes';

----------------------vacancy table----------------------------------------------------------------------------

update vacancy_table 
set initial=vacancies*2,
current=vacancies*2
where post_code in ('A','B','C','D','E','F');

update vacancy_table 
set initial=vacancies*4,
current=vacancies*4
where post_code in ('G','H');

alter table candidates add column catsel_tier1 character varying;
update candidates set catsel_tier1=catsel;

select distinct height_chest_relax,count(*) from candidates group by height_chest_relax;
"Yes"	12175
		381946
		
update candidates set catsel=replace(catsel,'9','') where height_chest_relax='Yes';---12175 updates
	
select distinct catsel_tier1,catsel from candidates where height_chest_relax='Yes';
"1"		"1"
"2"		"2"
"9"	
"91"	"1"
"92"	"2"	

select "registrationNo",genderid,cat1,ht_rlx_code,chst_rlx_code,catsel_tier1,catsel,rejection_provision from candidates where height_chest_relax='Yes' and (ht_rlx_code in ('1','6','7') or chst_rlx_code='5') order by genderid;


-----debarred by EDP----

'10020480917','10019527921','10020928627','10020612029','10020543780','10021436306','10020021111','10020133921','10020748050','10020450081','10020809638','10021321573','10017937482','10018938148','10018401463','10020919684','10019927518','10019326171','10020108618','10018117907','10020934097','10021004645','10019310488','10020109611','10021137159','10021296492','10020554755','10018834992','10019824681','10020811411','10019978015','10020238506','10021453854','10012568191','10020446451','10020834096','10001617939','10018766223','10002119052','10016547108','10006280616','10000668029','10013959453','10013338743','10020225684','10020985534','10000776608','10020805421','10018168621','10019443466','10014522678','10020297623','10020662495','10021298671','10020565323','10019773283','10018894851','10021400643','10020733573','10006631483','10014631862','10019435401','10021470461','10016115637'

'6015001180','6204051261','6005056548','6005057060','6016013831','6016014599','6016016082','6016016182','6007042421','6007043530','6007042999','6007043352','6007045498','6007047147','6007047455','6007053565','6007043966','6007050213','6007050688','6007050500','6007049938','6007049544','6007051002','6007050869','6005050171','6005007667','6001019545','6016011506','6204062792','6014013752','6005023941','6001038299','6005043130','6005026853','6005045493','6007026879','6007041349','6007013959','6007044701','6006020272','6016004072','6016008303','6005012471','6006029450','6005058137','6005007084','6016001842','6204074336','6005033883','6001040838','6005038302','6007002583','6001008690','6005002302','6001030177','6204047968','6005004474','6005054617','6005039896','6001049716','6005057088','6005040399','6005027789','6005040542'

alter table candidates add column allocated_state character varying;
alter table candidates add column allocated_post character varying;
alter table candidates add column allocated_area character varying;
alter table candidates add column allocated_category character varying;
alter table candidates add column allocated_against_ur character varying;

				if normalised_score > min_norm_9:
                    return True
                elif normalised_score == min_norm_9:
                    if partA > min_partA_9:
                        return True
                    elif partA == min_partA_9:
                        if partB > min_partB_9:
                            return True
                        elif partB == min_partB_9:
                            return dob <= min_dob_9
                return False
				
				

select "registrationNo" as regno,rollno,cand_name,dob,cat1,cat2,cat3,genderid as gender,statecode_considered,naxal_district,border_district,parta_gi,partb_ga,total_marks,merit,catsel,rejection_provision,post_preference from candidates where rejection_provision in ('Q','TU','W') order by merit;

	