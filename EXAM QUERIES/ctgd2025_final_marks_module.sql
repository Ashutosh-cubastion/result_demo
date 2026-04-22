
CREATE TABLE IF NOT EXISTS public."ctgd2025Tier2Marks"

(
    "registrationNo" character varying(11) COLLATE pg_catalog."default" NOT NULL,
    "rollNo" character varying COLLATE pg_catalog."default",
    name character varying COLLATE pg_catalog."default",
    "fatherName" character varying(50) COLLATE pg_catalog."default",
    "motherName" character varying(50) COLLATE pg_catalog."default",
    dob date,
    gender character varying(16) COLLATE pg_catalog."default",
	cat1_app character varying COLLATE pg_catalog."default",
    cat2_app character varying COLLATE pg_catalog."default",
    cat1 character varying COLLATE pg_catalog."default",
    cat2 character varying COLLATE pg_catalog."default",
    cat3 character varying COLLATE pg_catalog."default",
    c1_state text COLLATE pg_catalog."default",
    c1_district text COLLATE pg_catalog."default",
	c1_state_code text COLLATE pg_catalog."default",
    c1_district_code text COLLATE pg_catalog."default",
	c1_naxal_district text COLLATE pg_catalog."default",
    c1_border_district text COLLATE pg_catalog."default", 
	p1_post_preference text COLLATE pg_catalog."default",
    p1_allocated_post text COLLATE pg_catalog."default",
    p1_allocated_state_code text COLLATE pg_catalog."default",
    allocated_state text COLLATE pg_catalog."default",
    p1_allocated_category text COLLATE pg_catalog."default",
    p1_allocated_area text COLLATE pg_catalog."default",
	n_c_c_type_App character varying COLLATE pg_catalog."default",
    p2_n_c_c_certificate_holder character varying COLLATE pg_catalog."default",
    p2_type_of_n_c_c_certificate character varying COLLATE pg_catalog."default",
    "p2_part-a_(general_intelligence_&_reasoning)" character varying COLLATE pg_catalog."default",
    "p2_part-b_(general_knowledge_and_general_awareness)" character varying COLLATE pg_catalog."default",
    "p2_part-c_(elementary_mathematics)" character varying COLLATE pg_catalog."default",
    "p2_part-d_(english/hindi)" character varying COLLATE pg_catalog."default",
    p2_raw_score character varying COLLATE pg_catalog."default",
    p2_normalized_score character varying COLLATE pg_catalog."default",
	n_c_c_marks_app character varying COLLATE pg_catalog."default",
    p2_n_c_c_bonus_score character varying COLLATE pg_catalog."default",
	final_score_app character varying COLLATE pg_catalog."default",
    p2_final_score character varying COLLATE pg_catalog."default",
	rejection_provision character varying COLLATE pg_catalog."default",
    p3_height_relaxation text COLLATE pg_catalog."default",
    p3_chest_relaxation text COLLATE pg_catalog."default",
    p3_status text COLLATE pg_catalog."default",
    P4_d_v_status text COLLATE pg_catalog."default",
    P4_d_m_e text COLLATE pg_catalog."default",
    P4_r_m_e text COLLATE pg_catalog."default",
    P4_final_medical_status text COLLATE pg_catalog."default",
	to_be_considered text COLLATE pg_catalog."default"
    
);

alter table  "ctgd2025Tier2Marks"  add constraint "pk_regNo" primary key ("registrationNo");

select distinct c1_naxal_district,count(*) from "ctgd2025Tier2Marks" group by c1_naxal_district;

update  "ctgd2025Tier2Marks" set c1_naxal_district='Yes' where c1_naxal_district='t';---27061
update  "ctgd2025Tier2Marks" set c1_naxal_district='No' where c1_naxal_district='f';---66034
update  "ctgd2025Tier2Marks" set c1_naxal_district='-' where c1_naxal_district is null;---2668

select distinct c1_border_district,count(*) from "ctgd2025Tier2Marks" group by c1_border_district;

update  "ctgd2025Tier2Marks" set c1_border_district='Yes' where c1_border_district='t';---30337
update  "ctgd2025Tier2Marks" set c1_border_district='No' where c1_border_district='f';---62758
update  "ctgd2025Tier2Marks" set c1_border_district='-' where c1_border_district is null;---2668

update "ctgd2025Tier2Marks"
set cat1=cat1_app
where p4_d_v_status='ABSENT';---3460

update "ctgd2025Tier2Marks"
set cat2=cat2_app
where p4_d_v_status='ABSENT';---3460

update "ctgd2025Tier2Marks"
set cat1=cat1_app
where p4_final_medical_status='with held result' and cat1 is null;--16

Whose exam is to be rescheduled from CR to be shared


update "ctgd2025Tier2Marks"
set 
p4_d_v_status='-',
p4_d_m_e='-',
p4_r_m_e='-',
p4_final_medical_status='with held result'
where p4_d_v_status= 'S (SUSPECTED)';---128

update "ctgd2025Tier2Marks"
set 
	c1_state ='-',
    c1_district='-',
    c1_state_code ='-',
    c1_district_code='-',
    c1_naxal_district ='-',
    c1_border_district='-',
	p1_post_preference ='-'
    p1_allocated_post='-',
    p1_allocated_state_code='-',
    allocated_state='-',
    p1_allocated_category='-',
    p1_allocated_area='-',
    n_c_c_type_app='-',
    p2_n_c_c_certificate_holder='-',
    p2_type_of_n_c_c_certificate='-',
    "p2_part-a_(general_intelligence_&_reasoning)" ='-',
    "p2_part-b_(general_knowledge_and_general_awareness)" ='-',
    "p2_part-c_(elementary_mathematics)"='-',
    "p2_part-d_(english/hindi)" ='-',
    p2_raw_score ='-',
    p2_normalized_score ='-',
    n_c_c_marks_app='-',
    p2_n_c_c_bonus_score ='-',
    final_score_app ='-',
    p2_final_score ='-',
    rejection_provision ='-',
	p3_status='-',
    p3_height_relaxation ='-',
    p3_chest_relaxation ='-'
where p4_final_medical_status='with held result'	;
	
	
'3009162480','5107009339','4610003605','5112005259','7205035121','2406015225','2404018169','1806011646','4205003978','1004007331','6204012398'	

update "ctgd2025Tier2Marks"
set p4_final_medical_status='Temporary Unfit'
where "rollNo" in
('3009162480','5107009339','4610003605','5112005259','7205035121','2406015225','2404018169','1806011646','4205003978','1004007331','6204012398'	);

select * from "ctgd2025Tier2Marks" limit 10;
select count(*) from "ctgd2025Tier2Marks" limit 10;

select distinct p4_final_medical_status,count(*) from "ctgd2025Tier2Marks" group by p4_final_medical_status;

select * from "ctgd2025Tier2Marks" limit 10;

select distinct p4_d_v_status from "ctgd2025Tier2Marks";

select * from "ctgd2025Tier2Marks" where p4_d_v_status= 'S (SUSPECTED)';---128

update "ctgd2025Tier2Marks"
set 
p4_d_v_status='-',
p4_d_m_e='-',
p4_r_m_e='-',
p4_final_medical_status='with held result'
where p4_d_v_status= 'S (SUSPECTED)';---128

select * from "ctgd2025Tier2Marks" where "rollNo" in
('3009162480','5107009339','4610003605','5112005259','7205035121','2406015225','2404018169','1806011646','4205003978','1004007331','6204012398'	);

update "ctgd2025Tier2Marks"
set p4_final_medical_status='Temporary Unfit'
where "rollNo" in
('3009162480','5107009339','4610003605','5112005259','7205035121','2406015225','2404018169','1806011646','4205003978','1004007331','6204012398'	);

select distinct p3_status,count(*) from "ctgd2025Tier2Marks" group by p3_status;
select distinct p4_d_v_status,count(*) from "ctgd2025Tier2Marks" group by p4_d_v_status;
select distinct p4_d_m_e,count(*) from "ctgd2025Tier2Marks" group by p4_d_m_e;
select * from "ctgd2025Tier2Marks" where p4_d_m_e is null;----4754
select distinct p4_d_v_status from "ctgd2025Tier2Marks" where p4_d_m_e is null;---"NQ (Not Qualified)", "ABSENT"

update "ctgd2025Tier2Marks"
set p4_d_m_e='-'
where p4_d_m_e is null;---4754

select distinct p4_r_m_e,count(*) from "ctgd2025Tier2Marks" group by p4_r_m_e;
select * from "ctgd2025Tier2Marks" where p4_r_m_e is null;---62168
select distinct p4_d_m_e from "ctgd2025Tier2Marks" where p4_r_m_e is null;---62168

update "ctgd2025Tier2Marks"
set p4_r_m_e='-'
where p4_r_m_e is null;---62168

select distinct p4_final_medical_status,count(*) from "ctgd2025Tier2Marks" group by p4_final_medical_status;

update "ctgd2025Tier2Marks"
set p4_final_medical_status='-'
where p4_final_medical_status is null;---92956

select distinct to_be_considered,rejection_provision,p4_d_v_status,p4_d_m_e,p4_r_m_e,p4_final_medical_status,count(*) from "ctgd2025Tier2Marks" 
--where p4_final_medical_status is null
group by to_be_considered,rejection_provision,p4_d_v_status,p4_d_m_e,p4_r_m_e,p4_final_medical_status;

select * from  "ctgd2025Tier2Marks" where to_be_considered='Yes' and rejection_provision='Q' and p4_d_m_e='Fit' and p4_r_m_e='-';----52940

update "ctgd2025Tier2Marks"
set 
p4_final_medical_status='Qualified'
where to_be_considered='Yes' and rejection_provision='Q' and p4_d_m_e='Fit' and p4_r_m_e='-';----52940


select * from  "ctgd2025Tier2Marks" where to_be_considered='Yes' and rejection_provision='Q' and p4_d_m_e='Unfit' and p4_r_m_e='Fit';----17991

update "ctgd2025Tier2Marks"
set 
p4_final_medical_status='Qualified'
where to_be_considered='Yes' and rejection_provision='Q' and p4_d_m_e='Unfit' and p4_r_m_e='Fit';----17991

select * from  "ctgd2025Tier2Marks" where to_be_considered='No' and rejection_provision='NQ' and p4_d_m_e='-' and p4_r_m_e='-';----4754

update "ctgd2025Tier2Marks"
set 
p4_final_medical_status='Not Qualified'
where to_be_considered='No' and rejection_provision='NQ' and p4_d_m_e='-' and p4_r_m_e='-';----4754

select * from  "ctgd2025Tier2Marks" where to_be_considered='No' and rejection_provision='NQ' and p4_d_m_e='Absent' and p4_r_m_e='-';----776

update "ctgd2025Tier2Marks"
set 
p4_final_medical_status='Not Qualified'
where to_be_considered='No' and rejection_provision='NQ' and p4_d_m_e='Absent' and p4_r_m_e='-';----776

select * from  "ctgd2025Tier2Marks" where to_be_considered='No' and rejection_provision='NQ' and p4_d_m_e='Unfit' and p4_r_m_e='-';----3675

update "ctgd2025Tier2Marks"
set 
p4_final_medical_status='Not Qualified'
where to_be_considered='No' and rejection_provision='NQ' and p4_d_m_e='Unfit' and p4_r_m_e='-';----3675

select * from  "ctgd2025Tier2Marks" where to_be_considered='No' and rejection_provision='NQ' and p4_d_m_e='Unfit' and p4_r_m_e='Unfit';----12806

update "ctgd2025Tier2Marks"
set 
p4_final_medical_status='Not Qualified'
where to_be_considered='No' and rejection_provision='NQ' and p4_d_m_e='Unfit' and p4_r_m_e='Unfit';----12806

select * from "ctgd2025Tier2Marks" where to_be_considered='No' and rejection_provision='NQ' and p4_d_m_e='Unfit' and p4_r_m_e='Fit';---2
select * from "ctgd2025Tier2Marks" where to_be_considered='No' and rejection_provision='NQ' and p4_d_m_e='Fit' and p4_r_m_e='-';---12

select * from "ctgd2025Tier2Marks" where p4_final_medical_status='with held result' and rejection_provision='NQ';

select distinct p3_height_relaxation,count(*) from "ctgd2025Tier2Marks" group by p3_height_relaxation;

update "ctgd2025Tier2Marks"
set p3_height_relaxation='No'
where p3_height_relaxation is null;----87216

select distinct p3_chest_relaxation,count(*) from "ctgd2025Tier2Marks" group by p3_chest_relaxation;

update "ctgd2025Tier2Marks"
set p3_chest_relaxation='No'
where p3_chest_relaxation is null;----91119

update "ctgd2025Tier2Marks"
set p3_chest_relaxation='-'
where gender='Female';

select distinct p1_allocated_post,count(*) from "ctgd2025Tier2Marks" group by p1_allocated_post;
update "ctgd2025Tier2Marks"
set p1_allocated_post='-'
where p1_allocated_post is null;----44850

select distinct p1_allocated_state_code,count(*) from "ctgd2025Tier2Marks" group by p1_allocated_state_code;
update "ctgd2025Tier2Marks"
set p1_allocated_state_code='-'
where p1_allocated_state_code is null;----44850

select distinct allocated_state,count(*) from "ctgd2025Tier2Marks" group by allocated_state;
update "ctgd2025Tier2Marks"
set allocated_state='-'
where allocated_state is null;----44850

select distinct p1_allocated_category,count(*) from "ctgd2025Tier2Marks" group by p1_allocated_category;
update "ctgd2025Tier2Marks"
set p1_allocated_category='-'
where p1_allocated_category is null;----44850

select distinct p1_allocated_area,count(*) from "ctgd2025Tier2Marks" group by p1_allocated_area;
update "ctgd2025Tier2Marks"
set p1_allocated_area='-'
where p1_allocated_area is null;----44850

select distinct p2_n_c_c_certificate_holder,count(*) from "ctgd2025Tier2Marks" group by p2_n_c_c_certificate_holder;

update "ctgd2025Tier2Marks"
set p2_n_c_c_certificate_holder=FALSE
where p2_n_c_c_certificate_holder is null;----3457

update "ctgd2025Tier2Marks"
set p2_n_c_c_certificate_holder='Yes'
where p2_n_c_c_certificate_holder ='TRUE';----8949

update "ctgd2025Tier2Marks"
set p2_n_c_c_certificate_holder='No'
where p2_n_c_c_certificate_holder in ('FALSE','false');---80561+3457

select 80561+3457;---84018

select distinct p2_type_of_n_c_c_certificate,count(*) from "ctgd2025Tier2Marks" group by p2_type_of_n_c_c_certificate;
update "ctgd2025Tier2Marks"
set p2_type_of_n_c_c_certificate='-'
where p2_type_of_n_c_c_certificate is null;----84018

select distinct p2_n_c_c_certificate_holder,p2_type_of_n_c_c_certificate,p2_n_c_c_bonus_score,count(*) from "ctgd2025Tier2Marks" group by p2_n_c_c_certificate_holder,p2_type_of_n_c_c_certificate,p2_n_c_c_bonus_score;

select distinct cat1,count(*) from "ctgd2025Tier2Marks" group by cat1;

update "ctgd2025Tier2Marks"
set cat1= case
when cat1='0' then 'EWS'
when cat1='1' then 'SC'
when cat1='2' then 'ST'
when cat1='6' then 'OBC'
when cat1='9' then 'UR'
END;


"0"	11488
"1"	18649
"2"	13853
"6"	40091
"9"	11682

select distinct cat2,count(*) from "ctgd2025Tier2Marks" group by cat2;

update "ctgd2025Tier2Marks" set cat2='EXS' where cat2='3';----755

update "ctgd2025Tier2Marks" set "isActive"=false, "excludedNotice"='No';

update "ctgd2025Tier2Marks" set p4_final_medical_status='RESULT WITHHELD' WHERE p4_final_medical_status='with held result';


"10000001999"	"2002049616" ----allocated --- 10000000001
"10000000647"	"2003030183" ----rme UNFIT ----10000000001
"10018044620"	"5105040418"---DV not qualified ---10000000001
"10000859370"	"2405119874"----witheld-----10000000001
"10011524752"	"1806011646"----temporary unfit---10000000001
"10000004659"	"3010186038"---NCC C TYPE---10000000001
"10000025337"	"4410149522"----NCC B TYPE ----10000000001
"10000009076"	"5102013260"---NCC A TYPE ---10000000001