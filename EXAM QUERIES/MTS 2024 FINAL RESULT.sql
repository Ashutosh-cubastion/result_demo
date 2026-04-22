CREATE TABLE IF NOT EXISTS public.t_mts2024_petpst
(
    id character varying(16) COLLATE pg_catalog."default" NOT NULL,
    rollno text COLLATE pg_catalog."default",
    "registrationNo" text COLLATE pg_catalog."default",
    name text COLLATE pg_catalog."default",
    "fathersName" text COLLATE pg_catalog."default",
    "mothersName" text COLLATE pg_catalog."default",
    dob text COLLATE pg_catalog."default",
    gender text COLLATE pg_catalog."default",
    category text COLLATE pg_catalog."default",
    pst_attendence text COLLATE pg_catalog."default",
    pst_photo_status text COLLATE pg_catalog."default",
    pst_center_name text COLLATE pg_catalog."default",
    pst_center_code text COLLATE pg_catalog."default",
    pst_scheduled_date date,
    pst_actual_date date,
    pst_height double precision,
    pst_is_height_relaxation_availed text COLLATE pg_catalog."default",
    pst_height_relaxation_code text COLLATE pg_catalog."default",
    pst_chest_not_expanded double precision,
    pst_chest_expanded double precision,
    pst_status text COLLATE pg_catalog."default",
    pst_weight double precision,
    walk_male_1600m_15min text COLLATE pg_catalog."default",
    walk_female_1km_20min text COLLATE pg_catalog."default",
    final_pet_pst_status text COLLATE pg_catalog."default",
    final_remarks text COLLATE pg_catalog."default",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    pet_status text COLLATE pg_catalog."default",
    "isWeightQualified" boolean,
    pst_weight_relaxation_availed text COLLATE pg_catalog."default",
    pst_weight_relaxation_code text COLLATE pg_catalog."default",
    is_pwbd boolean,
    pwbd_type text COLLATE pg_catalog."default",
    "isHeightQualified" boolean,
    pst_is_attended boolean,
    "isChestQualified" boolean,
    CONSTRAINT t_mts2024_petpst_pkey PRIMARY KEY (rollno)
)

TABLESPACE pg_default;


psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_mts2024_t2_allocation

\copy t_mts2024_petpst from 'C:\Users\SalauddinKhan\Desktop\t_mts2024_petpst_03032025.csv' csv header;
COPY 27005

pg_dump -U postgres -h 10.246.126.173 -p 5432 -t candidates -F c -f C:\Users\Public\candidates.dump alloc_mts2024_tier1_allocation
pg_restore -U postgres -h 10.246.126.165 -p 5432 -d ssc2 -t t_cedpexam_2023_tier1_marks C:\Users\Public\t_cedpexam_2023_tier1_marks.dump


select count(*) from candidates limit 10;----5744713
select count(*) from candidates where marks_available='Yes' limit 10;----2250749


select distinct pst_attendence,final_pet_pst_status ,count(*) from t_mts2024_petpst group by  pst_attendence,final_pet_pst_status;

"Absent"	"Not Qualified"	5246
"Present"	"Not Qualified"	787
"Present"	"Qualified"	20957
"Present"	"With Held"	2
						13

select * from t_mts2024_petpst where final_pet_pst_status='With Held';---2


do
$$
begin

alter table candidates add column pst_attendence character varying;
alter table candidates add column pst_photo_status character varying;
alter table candidates add column pst_center_name character varying;
alter table candidates add column pst_center_code character varying;
alter table candidates add column pst_scheduled_date date;
alter table candidates add column pst_actual_date date;
alter table candidates add column pst_height double precision;
alter table candidates add column pst_is_height_relaxation_availed character varying;
alter table candidates add column pst_height_relaxation_code text;
alter table candidates add column pst_chest_not_expanded double precision ;
alter table candidates add column pst_chest_expanded double precision;
alter table candidates add column pst_status text ;
alter table candidates add column pst_weight double precision;
alter table candidates add column walk_male_1600m_15min text;
alter table candidates add column walk_female_1km_20min text ;
alter table candidates add column final_pet_pst_status text ;
alter table candidates add column final_remarks text ;

end
$$

-----------------rollno absent in petpst-----------------

update t_mts2024_petpst set 
pst_attendence='Absent',
final_pet_pst_status='Not Qualfied'
where rollno in 
('4410056470','3009090035','3009193840','3009133491','4206027739','4205064110','9205001653','5105016411','8003015477','8007011894','8204030057','8206007686','8207002468');


'4410056470',
'3009090035',
'3009193840',
'3009133491',
'4206027739',
'4205064110',
'9205001653',
'5105016411',
'8003015477',
'8007011894',
'8204030057',
'8206007686',
'8207002468'


select * from t_mts2024_petpst where rollno='4410077942';----qualified
select * from t_mts2024_petpst where rollno='4410079587';----qualified
select * from t_mts2024_petpst where rollno='9001021208';----Temporary Unfit


'9001000676','9001038903','9001039697','9001020834','9002011439','9002029637','9001026064','9001032158','9001034316','8204003456','2201215963','2201235464','2201278025','2201287938','2201304835','2201305420','2201328635','2201356137','2201287896','2201438982','2201381775','2201387861','2201406838','2201407351','2201413675','2201432648','2201188133','2201362620','2201457905','2201481129','2201482920','2201143869','2201170971','2201169244','2201169122','2201143416','2201094018','2201126313','2201117848','2201153376','2201152167','2201092696','2201254736','2201388144','2201254629','2201252765','2201252514','2201196876','2201216068','2201245880','2201235334','2201243851','2201277742','2201278137','2201303214','2201328791','2201329025','2201337152','2201337312','2201338517','2201339328','2201345382','2201313400','2201338807','2201311579','2201387968','2201440850','2201362289','2201362573','2201364769','2201455894','2201481331','2201483554','2201516395','2201197043','2201235707','2201196529','2201207875','2201438601','2201364167','2201236955','8601013391','8601044249','8601044534','2404003634','2404011363','2405000825','2405004119','2405029480','2405037426','2405067715','2405084050','2405097560','2405119140','2405133652','2405133739','2405144983','2405153226','2406046225','4410177625','4410094726','4410159393','2002000502','2002001573','2002042127','3003013105','3003089685','3010214724','3010224186','3007005076','3013085124','3013085257','3013088486','3013161615','3013190293','3013203207','3001000392','3001010948','3001019732','3001019847','3001083026','3008022552','3009076371','3008007521','3008009576','3008013287','3009069676','3001072573','7203011723','7208028712','7208020604','7208029506','7208034868','3206023192','3206389065','3209013807','9205001905','9213001521','9213014875','7001009689','8201018152','9206019076','9211018111','4417007659','4417009208','7204014698','7204027655','7204037795','8001002670','8004004813','8007076999','8008006552','2201000462','2201000812','2201001096','2201002456','2201002479','2201002662','2201011110','2201011238','2201019501','2201025889','2201025909','2201025944','2201027635','2201027654','2201027913','2201027954','2201033739','2201033941','2201034183','2201034226','2201035345','2201041587','2201043239','2201043605','2201043812','2201043905','2201048049','2201049982','2201050508','2201051722','2201052005','2201055750','2201059038','2201067653','2201067667','2201068952','2201069237','2201069251','2201075542','2201075784','2201077312','2201077613','2201106390','2201445247','3203018037','1401025121'

update candidates a
set a.pst_attendence=b.pst_attendence,
a.pst_photo_status =b.pst_photo_status,
a.pst_center_name =b.pst_center_name,
a.pst_center_code =b.pst_center_code,
a.pst_scheduled_date =b.pst_scheduled_date,
a.pst_actual_date =b.pst_actual_date,
a.pst_height =b.pst_height,
a.pst_is_height_relaxation_availed=b.pst_is_height_relaxation_availed,
a.pst_height_relaxation_code=b.pst_height_relaxation_code,
a.pst_chest_not_expanded=b.pst_chest_not_expanded,
a.pst_chest_expanded =b.pst_chest_expanded ,
a.pst_status =b.pst_status,
a.pst_weight =b.pst_weight,
a.walk_male_1600m_15min =b.walk_male_1600m_15min,
a.walk_female_1km_20min =b.walk_female_1km_20min,
a.final_pet_pst_status =b.final_pet_pst_status,
a.final_remarks =b.final_remarks 
from t_mts2024_petpst b where a.regno=b."registrationNo" and 
a.rollno=b.rollno;---27005 updated

update candidates set pt_finalstatus=final_pet_pst_status;

update candidates set pt_finalstatus='Not Qualified' where rollno in ('9001000676','9001038903','9001039697','9001020834','9002011439','9002029637','9001026064','9001032158','9001034316','8204003456','2201215963','2201235464','2201278025','2201287938','2201304835','2201305420','2201328635','2201356137','2201287896','2201438982','2201381775','2201387861','2201406838','2201407351','2201413675','2201432648','2201188133','2201362620','2201457905','2201481129','2201482920','2201143869','2201170971','2201169244','2201169122','2201143416','2201094018','2201126313','2201117848','2201153376','2201152167','2201092696','2201254736','2201388144','2201254629','2201252765','2201252514','2201196876','2201216068','2201245880','2201235334','2201243851','2201277742','2201278137','2201303214','2201328791','2201329025','2201337152','2201337312','2201338517','2201339328','2201345382','2201313400','2201338807','2201311579','2201387968','2201440850','2201362289','2201362573','2201364769','2201455894','2201481331','2201483554','2201516395','2201197043','2201235707','2201196529','2201207875','2201438601','2201364167','2201236955','8601013391','8601044249','8601044534','2404003634','2404011363','2405000825','2405004119','2405029480','2405037426','2405067715','2405084050','2405097560','2405119140','2405133652','2405133739','2405144983','2405153226','2406046225','4410177625','4410094726','4410159393','2002000502','2002001573','2002042127','3003013105','3003089685','3010214724','3010224186','3007005076','3013085124','3013085257','3013088486','3013161615','3013190293','3013203207','3001000392','3001010948','3001019732','3001019847','3001083026','3008022552','3009076371','3008007521','3008009576','3008013287','3009069676','3001072573','7203011723','7208028712','7208020604','7208029506','7208034868','3206023192','3206389065','3209013807','9205001905','9213001521','9213014875','7001009689','8201018152','9206019076','9211018111','4417007659','4417009208','7204014698','7204027655','7204037795','8001002670','8004004813','8007076999','8008006552','2201000462','2201000812','2201001096','2201002456','2201002479','2201002662','2201011110','2201011238','2201019501','2201025889','2201025909','2201025944','2201027635','2201027654','2201027913','2201027954','2201033739','2201033941','2201034183','2201034226','2201035345','2201041587','2201043239','2201043605','2201043812','2201043905','2201048049','2201049982','2201050508','2201051722','2201052005','2201055750','2201059038','2201067653','2201067667','2201068952','2201069237','2201069251','2201075542','2201075784','2201077312','2201077613','2201106390','2201445247','3203018037','1401025121'
) ;

---------debarred checking----------------------


select a.debarred,a.regno,a.rollno,a.name,b.d_name,a.father_name,b.d_fathername ,a.mother_name,b.d_mothername ,a.dob,b.d_dob ,a.gender,a.cat1,
b.debarredfrom,b.debarredupto,b.reason,b.otherreason
from candidates a,debbared b where 
a.marks_available='Yes' and
b.debarredupto1 >'2024-01-01' and
replace((UPPER(a.name)||UPPER(a.father_name)||UPPER(a.mother_name)),' ','') = replace((UPPER(b.d_name)||UPPER(b.d_fathername)||UPPER(b.d_mothername)),' ','')
and a.dob=b.d_dob;
 
--replace ((UPPER(b.d_name)||UPPER(b.d_mothername)),' ','') = replace ((UPPER(a.name)||UPPER(a.mother_name)),' ','') and a.dob = b.d_ddob;
 
replace ((UPPER(b.d_name)||UPPER(b.d_fathername)),' ','') = replace ((UPPER(a.name)||UPPER(a.father_name)),' ','') and a.dob = b.d_dob

and replace(upper(a.mother_name),' ','')<>replace(upper(b.mothername),' ','');



update candidates set debarred='Yes'where rollno in ('2201093999','2002030909','2201489670','2201067489','2201019179','2405112027','3206407726','2201254691','9009017842','9009017842','2201515112','2405003870','2201255122','9001005535','2401024034','3011033975','7201019473','2201254607','9005000347','2201185019','2401016642','2201025926','1401037882','2201303799','3011038749','7201026600','2405106851','4609013048','4609020792','3013086000','2201001320','3206076700','2201515479'
);

'2201093999','2002030909','2201489670','2201067489','2201019179','2405112027','3206407726','2201254691','9009017842','9009017842','2201515112','2405003870','2201255122','9001005535','2401024034','3011033975','7201019473','2201254607','9005000347','2201185019','2401016642','2201025926','1401037882','2201303799','3011038749','7201026600','2405106851','4609013048','4609020792','3013086000','2201001320','3206076700','2201515479'


select * from vacancy_table order by state_code,age_limit,category_code;


alter table vacancy_table add column initial_vacancy integer;
alter table vacancy_table add column current integer;
alter table vacancy_table add column allocated	integer;
alter table vacancy_table add column left_vacancy integer;
alter table vacancy_table add column key character varying;
alter table vacancy_table add column lowestmarks_session2 numeric;
alter table vacancy_table add column minmarks_ga numeric;
alter table vacancy_table add column lowestmarks_session1 numeric;
alter table vacancy_table add column min_marks_cand_dob date;


select sum(original_vacancy) from vacancy_table where post_code<>'MTS';---3859
select sum(original_vacancy) from vacancy_table where post_code='MTS';---9096
select sum(original_vacancy) from vacancy_table where post_code='MTS' and category_code in ('1','9','0','6','2');---8079

select age_limit,sum(original_vacancy) from vacancy_table where post_code='MTS' and category_code in ('1','9','0','6','2')group by age_limit;
"18-27"	1193
"18-25"	6886

alter table candidates_new add column cutoff_flag character varying;
	alter table candidates_new add column catsel_18_25 character varying;
	alter table candidates_new add column catsel_18_27 character varying;
	alter table candidates_new add column dob_flag_18_27 character varying;
	alter table candidates_new add column catsel_dob_18_27 character varying;
	alter table candidates_new add column dob_flag_18_25 character varying;
	alter table candidates_new add column catsel_dob_18_25 character varying;
	alter table candidates_new add column merit character varying;
	alter table candidates_new add column exsm_yrs character varying;
	alter table candidates_new add column exsm_months character varying;
	alter table candidates_new add column exsm_days character varying;
	alter table candidates_new add column age_limit character varying;
	alter table candidates_new add column allocated_category character varying;
	alter table candidates_new add column allocated_state character varying;
	alter table candidates_new add column allocated_against_ur character varying;


alter table vacancy_table add column lowestmarks_session2 numeric;
 alter table vacancy_table add column minmarks_ga numeric;
alter table vacancy_table add column lowestmarks_session1 numeric;
alter table vacancy_table add column min_marks_cand_dob date;