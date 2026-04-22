SELECT * FROM public.je_2025_city_live where dob is not null
SELECT dob,password_for_examination,dob2 FROM public.je_2025_city_live where dob is not null

select "statusId", count(*) from public."je2025Applications_12_08_2025_final"
GROUP BY "statusId";

select column_name from information_schema.columns
where table_name = 'je_2025_city_live'


alter table public.je_2025_tier1_admit_card
add column "can_new_name"  character varying,
add column "category" character varying,
add column "additional_kyc" character varying,
add column "dob2" character varying,
add column "email" character varying,
add column "ex_serviceman" character varying,
add column "identification_mark" character varying,
add column "is_pwbd_blindness" character varying,
add column "locomotor" character varying,
add column "mobile" character varying,
add column "mother_name" character varying,
add column "own_scribe" character varying,
add column "ph_code" character varying ,
add column "present_address" character varying,
add column "present_district" character varying,
add column "present_state" character varying,
add column "present_pincode" character varying,
add column "reject" character varying,
add column "reject_reason" character varying,
add column "scribe_medium" character varying,
add column "suffer_cerebralpalsy" character varying,
ADD COLUMN dob character varying,
ADD COLUMN scribe_required character varying,
ADD COLUMN roll_number character varying,
--ADD COLUMN is_active boolean,
ADD COLUMN old_center_code character varying,
ADD COLUMN exs_res_availed character varying,
ADD COLUMN center_code character varying,
ADD COLUMN center_name character varying,
ADD COLUMN old_center_name character varying,
--ADD COLUMN examdate date,
ADD COLUMN gateclose character varying,
ADD COLUMN examtime character varying,
ADD COLUMN repotime character varying,
ADD COLUMN barcode character varying,
ADD COLUMN shift character varying,
ADD COLUMN comp_time character varying,
ADD COLUMN category_field character varying,
ADD COLUMN scribe_field character varying,
ADD COLUMN venue_code character varying,
ADD COLUMN vh_cp_lw character varying,
ADD COLUMN batch character varying,
ADD COLUMN is_shifted boolean,
ADD COLUMN venue_name character varying,
ADD COLUMN venue_address character varying,
ADD COLUMN venue_district character varying,
ADD COLUMN venue_state character varying,
ADD COLUMN venue_pincode character varying,
ADD COLUMN downloaded boolean default false,
ADD COLUMN number_of_downloads bigint default 0,
ADD COLUMN password_for_examination character varying,
--ADD COLUMN remarks_new character varying,
ADD COLUMN self_checkin character varying,
ADD COLUMN cbe_medium character varying,
--ADD COLUMN advertised_center_code character varying;



UPDATE public.je_2025_tier1_admit_card a
SET 
    can_new_name            = b."newName",
    category                = case 
								when b."category" = 'SC' then '1'
								when b."category" = 'ST' then '2'
								when b."category" = 'OBC' then '6'
								when b."category" = 'UR' then '9'
								when b."category" = 'EWS' then '0'
								else NULL
							end,
	additional_kyc = b."isAdditionalKycDone",
    -- additional_kyc          = CASE 
    --                             WHEN b."isAdditionalKycDone" = TRUE THEN 'Yes'
    --                             WHEN b."isAdditionalKycDone" = FALSE THEN 'No'
    --                             ELSE NULL
    --                           END,
    dob2                    = b."dob",
    email                   = b."emailId",
    ex_serviceman           = CASE 
                                WHEN b."isEsm" = TRUE THEN 'Yes'
                                WHEN b."isEsm" = FALSE THEN 'No'
                                ELSE NULL
                              END,
    identification_mark     = b."markOfIdentification",
    is_pwbd_blindness       = CASE 
                                WHEN b."isBenchmarkDisabilityVh" = TRUE THEN 'Yes'
                                WHEN b."isBenchmarkDisabilityVh" = FALSE THEN 'No'
                                ELSE NULL
                              END,
    locomotor               = CASE 
                                WHEN b."isBenchmarkDisabilityOh" = TRUE THEN 'Yes'
                                WHEN b."isBenchmarkDisabilityOh" = FALSE THEN 'No'
                                ELSE NULL
                              END,
    mobile                  = b."phoneNo",
    mother_name             = b."mothersName",
    own_scribe              = CASE 
                                WHEN b."isOwnScribe" = TRUE THEN 'Yes'
                                WHEN b."isOwnScribe" = FALSE THEN 'No'
                                ELSE NULL
                              END,
    ph_code                 = case 
								when b."typeOfPwbd" = 'HH' then '5'
								when b."typeOfPwbd" = 'VH' then '7'
								when b."typeOfPwbd" = 'Others' then '8'
								when b."typeOfPwbd" = 'OH' then '4'
								else NULL
							end,
    present_address         = b."presentAddress",
    present_district        = b."presentDistrictName",
    present_state           = b."presentStateName",
    present_pincode         = b."presentPincode",
    reject                  = CASE 
                                WHEN b."isRejected" = TRUE THEN 'Yes'
                                WHEN b."isRejected" = FALSE THEN 'No'
                                ELSE NULL
                              END,
    reject_reason           = b."description",
    scribe_medium           = b."scribeMedium",
	scribe_required = 		CASE 
                                WHEN b."isScribe" = TRUE THEN 'Yes'
                                WHEN b."isScribe" = FALSE THEN 'No'
                                ELSE NULL
                              END,
    suffer_cerebralpalsy    = CASE 
                                WHEN b."isSufferingCerebralPalsy" = TRUE THEN 'Yes'
                                WHEN b."isSufferingCerebralPalsy" = FALSE THEN 'No'
                                ELSE NULL
                              END,
	dob = TO_CHAR(b."dob", 'DD/MM/YYYY'),
	password_for_examination = replace(TO_CHAR(b."dob", 'DD/MM/YYYY'),'/',''),
	ph 						= CASE 
                                WHEN b."isPwbd" = TRUE THEN 'Yes'
                                WHEN b."isPwbd" = FALSE THEN 'No'
                                ELSE NULL
                              END
FROM public."je2025Applications_12_08_2025_final" b
WHERE a.reg_no = b."registrationNo";


JE 2025 Self-Slotted Candidate details

Dear Sir/Madam,
​
Please find attached the data of self-slotted candidates for JE-2025.
Once we receive the venue details, we will share the updated data with roll numbers and venue information.

update je_2025_tier1_admit_card a
set a.form_completion_date=b."createdAt"::date,
a.form_completion_time=to_char(b."createdAt", 'HH24:MI:SS')::time
from "je2025Applications_12_08_2025_final" b
where a.reg_number=b."registrationNo";

update je_2025_tier1_admit_card
set region_code=
case when region='NWR' then 1
when region='NR' then 2
when region='CR' then 3
when region='ER' then 4
when region='NER' then 5
when region='MPR' then 6
when region='WR' then 7
when region='SR' then 8
when region='KKR' then 9
END;


alter table je_2025_tier1_admit_card add column counter text;

UPDATE je_2025_tier1_admit_card
SET counter=sub.rn,
roll_number = region_code||'25'||'14'||sub.rn
FROM (
	
  SELECT reg_number, LPAD(ROW_NUMBER() OVER (partition by region ORDER BY form_completion_date,form_completion_time::time)::TEXT,7,'0') AS rn
  FROM je_2025_tier1_admit_card 

) AS sub
WHERE je_2025_tier1_admit_card.reg_number = sub.reg_number;


select distinct region,max(counter),max(roll_number) from je_2025_tier1_admit_card group by region;

"CR"	"0077563"	"325140077563"
"ER"	"0019824"	"425140019824"
"KKR"	"0018261"	"925140018261"
"MPR"	"0016852"	"625140016852"
"NER"	"0003326"	"525140003326"
"NR"	"0014225"	"225140014225"
"NWR"	"0007344"	"125140007344"
"SR"	"0026647"	"825140026647"
"WR"	"0017198"	"725140017198"


-----------------------category_field--------------------------

update je2025_reference set exs_res_availed=
case when "isCivilPost"=true then 'Yes'
when "isCivilPost"=false then 'No'
else null
end
where "isEsm"=true;

update je2025_reference set category_field=category;

select distinct category,ph_code,category_field,count(*) from je2025_reference
group by category,ph_code,category_field;

select distinct ph,ph_code,count(*) from je2025_reference
group by  ph,ph_code;

update je2025_reference set category_field=category_field ||
case 
when ph_code='4' then '+OH'
when ph_code='5' then '+HH'
when ph_code='7' then '+VH'
when ph_code='8' then '+Others'
end where ph='Yes';

select distinct ph_code, is_pwbd_blindness from je2025_reference;

select * from je2025_reference where is_pwbd_blindness='Yes' and ph_code<>'7';---0

update je2025_reference set category_field= category_field || '+VH' where 
is_pwbd_blindness='Yes' and ph_code<>'7';---0

select distinct ph,ph_code, is_pwbd_blindness,suffer_cerebralpalsy,locomotor from je2025_reference;
select * from je2025_reference where suffer_cerebralpalsy='Yes';---0

select distinct "isSufferingCerebralPalsy" from je2025_reference;

update je2025_reference set category_field= category_field || '+CP/BA' where 
suffer_cerebralpalsy='Yes';---0

select distinct "isBenchmarkDisabilityOh",count(*) from je2025_reference group by "isBenchmarkDisabilityOh";
select * from je2025_reference where locomotor='Yes';---1713

update je2025_reference set category_field= category_field || '+LW' where 
locomotor='Yes';---1713

select * from je2025_reference where locomotor='Yes' and ph='No';---0

update je2025_reference set category_field= category_field || '+PwD(Below 40%)' where 
locomotor='Yes' and ph='No';---0

select distinct ex_serviceman,count(*) from je2025_reference group by ex_serviceman;---1424

update je2025_reference set category_field=category_field || '+ESM' 
where ex_serviceman='Yes';---1424

select distinct exs_res_availed from je2025_reference;

select * from je2025_reference where "isEsm"=true;
select distinct "isCivilPost",count(*) from je2025_reference where "isEsm"=true group by "isCivilPost";

update je2025_reference set exs_res_availed=
case when "isCivilPost"=true then 'Yes'
when "isCivilPost"=false then 'No'
else null
end
where "isEsm"=true;

select * from je2025_reference where ex_serviceman='Yes' and exs_res_availed='Yes';--23

update je2025_reference set category_field=replace(category_field,'+ESM','+ESM*')
where ex_serviceman='Yes' 
and exs_res_availed='Yes';---23

select distinct category,ph,ph_code, is_pwbd_blindness,suffer_cerebralpalsy,locomotor,ex_serviceman,exs_res_availed,category_field from je2025_reference;


select distinct category,ph,ph_code, is_pwbd_blindness,suffer_cerebralpalsy,locomotor,ex_serviceman,exs_res_availed,category_field,count(*) from je2025_reference
group by category,ph,ph_code, is_pwbd_blindness,suffer_cerebralpalsy,locomotor,ex_serviceman,exs_res_availed,category_field;

select * from je2025_reference where (ph_code='7' or is_pwbd_blindness='Yes' or suffer_cerebralpalsy='Yes') and ph='Yes';----3

-------------comp_time-------------------

update je2025_reference set comp_time='Yes'
where (ph_code='7' or is_pwbd_blindness='Yes' or suffer_cerebralpalsy='Yes') and ph='Yes';---3



---------------------scribe_field-----------------------
select * from je2025_reference where scribe_required='Yes' and ph='Yes' and comp_time ='Yes';---3


select distinct ph,comp_time,scribe_required,own_scribe,scribe_medium,count(*) from je2025_reference
group by ph,comp_time,scribe_required,own_scribe,scribe_medium;

UPDATE je2025_reference
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
  AND comp_time = 'Yes';------3


select * from je2025_reference where scribe_required='Yes' and ph='Yes' and comp_time is null;---175

UPDATE je2025_reference
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
  AND comp_time is null;---175

select * from je2025_reference where scribe_required='Yes' and ph='No' ;---17

UPDATE je2025_reference
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
  AND ph = 'No';---17
  
------------------------------------------------------------------------------------------

update je_2025_tier1_admit_card a
set a.password_for_examination=b.password_for_examination,
a.exs_res_availed=b.exs_res_availed,
a.category_field=b.category_field,
a.scribe_field=b.scribe_field,
a.comp_time=b.comp_time
from je2025_reference b
where a.reg_number=b."registrationNo";-----201239 updates  

update je_2025_tier1_admit_card a
set
a.center_code=b.city_code,
a.venue_code=b.tccode,
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_state=b.state,
a.venue_pincode=b.pincode,
a.shift=b.shift
from je2025_venue_details b
where a.candidate_id=b.candidate_id;----201240 updates

update je_2025_tier1_admit_card
set shift=
case when shift='Afternoon' then '2'
when shift='Morning' then '1'
end;


---------------time update----------------------------------

update je_2025_tier1_admit_card
set 
gateclose=
case when shift='1' then '09:30 AM'
when shift='2' then '02:30 PM'
end,
examtime=
case when shift='1' then '10:00 AM To 12:00 PM'
when shift='2' then '03:00 PM To 05:00 PM'
end,
repotime=
case when shift='1' then '08:30 AM'
when shift='2' then '01:30 PM'
end
;

update je_2025_tier1_admit_card
set examtime=
case when shift='1' then '10:00 AM To 12:40 PM'
when shift='2' then '03:00 PM To 05:40 PM'
end
where comp_time='Yes';


select distinct shift,repotime,gateclose,comp_time,examtime from je_2025_tier1_admit_card;


update je_2025_tier1_admit_card a
set 
a.category_field=b.category_field,
a.comp_time=b.comp_time,
a.scribe_field=b.scribe_field
from je2025_reference b
where a.reg_number=b."registrationNo";---201239

--------------------------------------incremental----------------------------------------------------

create table je2025_feedback
(candidate_id character varying,
 city_code character varying,
 city	character varying,
 remarks character varying,
 createdAt character varying,
 Subject character varying,
 Venue_Code character varying,
 Exam_City character varying,
 Exam_Date date,
 Shift character varying,
 Region character varying
);

select * from je2025_feedback limit 10;--34241

alter table je2025_feedback add column reg_number character varying;

update je2025_feedback a
set a.reg_number=b.reg_number
from je_2025_tier1_dummy_id b
where a.candidate_id=b.candidate_id;---34241

select count(*) from je_2025_tier1_admit_card;----201240

insert into je_2025_tier1_admit_card (candidate_id,city_code,city_name,subject,venue_code,venue_city,examdate,shift,region,reg_number)
select candidate_id,city_code,city,subject,venue_code,exam_city,exam_date,shift,region,reg_number from je2025_feedback;----34241

select count(*) from je_2025_tier1_admit_card;----235481

select 235481-201240;---34241

select * from je_2025_tier1_admit_card limit 10;

select distinct self_checkin,count(*) from je_2025_tier1_admit_card group by self_checkin;

update je_2025_tier1_admit_card
set self_checkin='feedback1' where self_checkin is null;---34241


update je_2025_tier1_admit_card
set region_code=
case when region='NWR' then 1
when region='NR' then 2
when region='CR' then 3
when region='ER' then 4
when region='NER' then 5
when region='MPR' then 6
when region='WR' then 7
when region='SR' then 8
when region='KKR' then 9
END
where self_checkin='feedback1';


select * from je_2025_tier1_admit_card where self_checkin='Yes' limit 10;
select * from je2025_reference limit 10;

update je_2025_tier1_admit_card a
set a.gender=b.gender,
a.name=b.name,
a.father_name=b."fathersName",
a.can_new_name=b."newName",
a.category=b.category,
a.additional_kyc=b."isAdditionalKycDone",
a.email=b."emailId",
a.ex_serviceman=b.ex_serviceman,
a.identification_mark=b."markOfIdentification",
a.is_pwbd_blindness=b.is_pwbd_blindness,
a.locomotor=b.locomotor,
a.mobile=b."phoneNo",
a.mother_name=b."mothersName",
a.own_scribe=b.own_scribe,
a.ph_code=b.ph_code,
a.present_address=b."presentAddress",
a.present_district=b."presentDistrictName",
a.present_state=b."presentStateName",
a.present_pincode=b."presentPincode",
a.scribe_medium=b.scribe_medium,
a.suffer_cerebralpalsy=b.suffer_cerebralpalsy,
a.dob2=b.dob,
a.scribe_required=b.scribe_required,
a.exs_res_availed=b.exs_res_availed,
a.comp_time=b.comp_time,
a.category_field=b.category_field,
a.scribe_field=b.scribe_field,
a.password_for_examination=b.password_for_examination
from je2025_reference b
where a.reg_number=b."registrationNo"
and a.self_checkin='feedback1';---34241

select * from je_2025_tier1_admit_card limit 10;

update je_2025_tier1_admit_card 
set examdate1=to_char(examdate,'dd/mm/yyyy')
where self_checkin='feedback1';

select * from je_2025_tier1_admit_card where self_checkin='feedback1' limit 10;

select dob2,to_char(to_date(dob2,'yyyy-mm-dd'),'dd/mm/yyyy') from je_2025_tier1_admit_card where self_checkin='feedback1' 
limit 10;

update je_2025_tier1_admit_card
set dob=to_char(to_date(dob2,'yyyy-mm-dd'),'dd/mm/yyyy')
where self_checkin='feedback1';

update je_2025_tier1_admit_card a
set a.form_completion_date=b."createdAt"::date,
a.form_completion_time=to_char(b."createdAt", 'HH24:MI:SS')::time
from "je2025_reference" b
where a.reg_number=b."registrationNo"
and a.self_checkin='feedback1';---34241

select distinct venue_code from je_2025_tier1_admit_card where self_checkin='feedback1';

select distinct venue_code ,venue_name,venue_address,venue_state,venue_pincode from je_2025_tier1_admit_card
where venue_code in ('010202','020101','020202','020301','020402','020501','020701','020901','021003','021101','030103','040101','040209','040303','040501','050105','050405','050605','050719','050742','070104','110102','120103','120301','120501','120603','1207021','130201','130402','140101','150102','150108','150205','160201','160401','1605101','1605102','170101','170212','170402','170502','170602','170701','170801','180201','180505','180705','190101','200202','210202','210206','210303','210402','210503','210506','210803','210902','21104','220102','220201','220302','220503','220512','220604','220609','220802','220901','220904','230101','230203','240101','250101','260101','260202','270104','270203','270313','270407','270501','270703','290103','290304','300303','300404','300413','300704','310102','320106','320203','320401','320502','320601','320702','320902','321001','330104','330107','330112','330113','330202','330501','340104','350107','350301','350507','350508','350511','350601','350703','350705','350906','351504','351601','360104','360106','360206','360302','370201','370304','370612','371001','60103','70202')
order by venue_code;

create table je2025_venue_master as
(select distinct venue_code ,venue_name,venue_city,venue_address,venue_state,venue_pincode from je_2025_tier1_admit_card where venue_name is not null);

select * from je2025_venue_master;

update je_2025_tier1_admit_card a
set 
a.venue_name=b.venue_name,
a.venue_address=b.venue_address,
a.venue_state=b.venue_state,
a.venue_pincode=b.venue_pincode
from je2025_venue_master b
where a.venue_code=b.venue_code
and a.self_checkin='feedback1';---32035

select 33240-32035;

select distinct venue_code from je_2025_tier1_admit_card where venue_name is null;
"1207021"
"1605101"
"1605102"

select distinct venue_code ,venue_name,venue_city,venue_address,venue_state,venue_pincode from je_2025_tier1_admit_card where venue_code like '%1207021%';
select distinct venue_code ,venue_name,venue_city,venue_address,venue_state,venue_pincode from je_2025_tier1_admit_card where venue_code like '%1605101%';
select distinct venue_code ,venue_name,venue_city,venue_address,venue_state,venue_pincode from je_2025_tier1_admit_card where venue_code like '%1605102%';

select distinct venue_code ,venue_name,venue_city,venue_address,venue_state,venue_pincode from je_2025_tier1_admit_card where venue_code like '%21104%';
update je_2025_tier1_admit_card set venue_code='021104' where venue_code='21104';---894

select distinct venue_code ,venue_name,venue_city,venue_address,venue_state,venue_pincode from je_2025_tier1_admit_card where venue_code like '%60103%';
update je_2025_tier1_admit_card set venue_code='060103' where venue_code='60103';---251

select distinct venue_code ,venue_name,venue_city,venue_address,venue_state,venue_pincode from je_2025_tier1_admit_card where venue_code like '%70202%';
update je_2025_tier1_admit_card set venue_code='070202' where venue_code='70202';---60


WITH max_per_region AS (
    SELECT 
        region,
        COALESCE(MAX(counter::int), 0) AS last_cnt
    FROM je_2025_tier1_admit_card
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
    FROM je_2025_tier1_admit_card t
    JOIN max_per_region m ON t.region = m.region
    WHERE t.counter IS NULL   --  only generate for NEW rows
)

UPDATE je_2025_tier1_admit_card AS t
SET 
    counter = LPAD(new_rows.new_cnt::text, 7, '0'),
    roll_number = t.region_code || '25' || '14' || LPAD(new_rows.new_cnt::text, 7, '0')
FROM new_rows
WHERE t.reg_number = new_rows.reg_number;

select region,count(*) from je_2025_tier1_admit_card where self_checkin='feedback1' group by region;

update je_2025_tier1_admit_card
set 
gateclose=
case when shift='1' then '09:30 AM'
when shift='2' then '02:30 PM'
end,
examtime=
case when shift='1' then '10:00 AM To 12:00 PM'
when shift='2' then '03:00 PM To 05:00 PM'
end,
repotime=
case when shift='1' then '08:30 AM'
when shift='2' then '01:30 PM'
end
;----235481

update je_2025_tier1_admit_card
set examtime=
case when shift='1' then '10:00 AM To 12:40 PM'
when shift='2' then '03:00 PM To 05:40 PM'
end
where comp_time='Yes';---776

select distinct venue_code from je_2025_tier1_admit_card where venue_name is null;
1207021,1605101,1605102

select * from je_2025_tier1_admit_card where venue_code='1207021';---589

update je_2025_tier1_admit_card a
set 
a.venue_name='BINARY BIT TECHNOLOGY',
a.venue_address='3RD FLOOR, ANANTA TRENDZ, NARAYAN GARDEN RD, LAXMIPURA, GOTRI, VADODARA, GUJARAT-390021',
a.venue_state='GUJARAT',
a.venue_pincode='390021'
where a.venue_code='1207021';---589



update je_2025_tier1_admit_card a
set 
a.venue_name='SDZ INFOTECH - 1',
a.venue_address='RAMPUR, GANRKE, JHARKHAND 834010',
a.venue_state='JHARKHAND',
a.venue_pincode='834010'
where a.venue_code='1605101';---212

select * from je_2025_tier1_admit_card where venue_code='1605102';---200

update je_2025_tier1_admit_card a
set 
a.venue_name='SDZ INFOTECH - 2',
a.venue_address='RAMPUR, GANRKE, JHARKHAND 834010',
a.venue_state='JHARKHAND',
a.venue_pincode='834010'
where a.venue_code='1605102';---200

update je_2025_tier1_admit_card
set 
gateclose=
case when shift='1' then '09:30 AM'
when shift='2' then '02:30 PM'
end,
examtime=
case when shift='1' then '10:00 AM To 12:00 PM'
when shift='2' then '03:00 PM To 05:00 PM'
end,
repotime=
case when shift='1' then '08:30 AM'
when shift='2' then '01:30 PM'
end
where reg_number in ('10009699380','10000753921','10024431672','10000868026','10005738150','10026643155','10008856352','10022304016','10008949529','10024742960','10006488257','10017621365','10018117436','10008860100','10013745286','10006504906','10008887535','10008000426','10008699773','10017166825','10006482637','10009019167','10025686536','10001622062','10008812386','10021808566','10001581204','10024019863','10009551104','10009112391','10009588527','10009385547','10008791839','10009628932','10009756907','10025924472','10009633314','10001346569','10026360870','10008971143','10009870207','10006628849','10026431228','10025710190','10009496700','10009596778','10025908185','10009201277','10008904583','10008975083','10013863245','10024263793','10000738384','10009488035','10005655699','10005671102','10025985118','10001703448','10008336972','10001297716','10001266328','10022528417','10008044543','10008809415','10009000356','10002116060','10008099207','10008876499','10008934344','10000778686','10025891978','10009690329','10009399073','10009692924','10018949479','10025574138','10010165839','10024702842','10008896695','10006457196','10009226562','10008956578','10008860801','10026055339','10021859138','10009091436','10008794986','10008889529','10026417883','10008500513','10006816010','10008218482','10025553213','10009327644','10001159942','10009651412','10008788585','10002156748','10008972058','10020158891','10009706159','10008837303','10010333494','10026567058','10009731131','10008958001','10009430724','10009652435','10024691487','10025826462','10005853224','10026294469','10000863194','10008839671','10022362896','10008922900','10017246020','10009444107','10009749860','10005877024','10008636081','10001630476','10005877834','10025729366','10009550895','10008920481','10026639666','10026415545','10025836249','10000903592','10009183936','10025791161','10001342507','10024180820','10009531995','10024515072','10006498787','10017612585','10008931541','10008866827','10016452654','10000972375','10005683848','10009754334','10008726977','10008953131','10006625308','10009659787','10007520335','10009526029','10001293258','10025054489','10005691831','10008867953','10008903577','10009111472','10026385036','10009347994','10024317729','10009784202','10009568805','10009432982','10008903351','10009018106','10009495226','10008922547','10009251134','10000073458','10026302248','10025490479','10009575911','10009604395','10025912390','10008854763','10008895835','10021818524','10008831717','10009674246','10000902491','10008848343','10008851120','10005658448','10008904748','10008912370','10006599609','10017223555','10008299540','10014917962','10024290163','10025715168','10009036770','10006489352','10008097104','10009449215','10010696551','10008949830','10002151297','10008492139','10021852203','10009033271','10000669839','10025830536','10009741979','10024399365','10000114708','10006457194','10023549571','10009409747','10001148618','10025524656','10025518867','10009650029','10025880226','10008889776','10009361513','10008807490','10001834963','10008830763','10025838497','10026652715','10009630154','10009326273','10008833437','10002152246','10008971946','10020158908','10009705756','10008835198','10017598819','10026628607','10026661898','10011537374','10008995482','10009571135','10008922979','10022012909','10006640387','10026296582','10000861920','10008817916','10022405053','10009146675','10009235423','10009422521','10009761348','10005879392','10026191548','10000160451','10005877804','10026429343','10009863860','10009354173');


update je_2025_tier1_admit_card
set examtime=
case when shift='1' then '10:00 AM To 12:40 PM'
when shift='2' then '03:00 PM To 05:40 PM'
end
where comp_time='Yes'
and reg_number in ('10009699380','10000753921','10024431672','10000868026','10005738150','10026643155','10008856352','10022304016','10008949529','10024742960','10006488257','10017621365','10018117436','10008860100','10013745286','10006504906','10008887535','10008000426','10008699773','10017166825','10006482637','10009019167','10025686536','10001622062','10008812386','10021808566','10001581204','10024019863','10009551104','10009112391','10009588527','10009385547','10008791839','10009628932','10009756907','10025924472','10009633314','10001346569','10026360870','10008971143','10009870207','10006628849','10026431228','10025710190','10009496700','10009596778','10025908185','10009201277','10008904583','10008975083','10013863245','10024263793','10000738384','10009488035','10005655699','10005671102','10025985118','10001703448','10008336972','10001297716','10001266328','10022528417','10008044543','10008809415','10009000356','10002116060','10008099207','10008876499','10008934344','10000778686','10025891978','10009690329','10009399073','10009692924','10018949479','10025574138','10010165839','10024702842','10008896695','10006457196','10009226562','10008956578','10008860801','10026055339','10021859138','10009091436','10008794986','10008889529','10026417883','10008500513','10006816010','10008218482','10025553213','10009327644','10001159942','10009651412','10008788585','10002156748','10008972058','10020158891','10009706159','10008837303','10010333494','10026567058','10009731131','10008958001','10009430724','10009652435','10024691487','10025826462','10005853224','10026294469','10000863194','10008839671','10022362896','10008922900','10017246020','10009444107','10009749860','10005877024','10008636081','10001630476','10005877834','10025729366','10009550895','10008920481','10026639666','10026415545','10025836249','10000903592','10009183936','10025791161','10001342507','10024180820','10009531995','10024515072','10006498787','10017612585','10008931541','10008866827','10016452654','10000972375','10005683848','10009754334','10008726977','10008953131','10006625308','10009659787','10007520335','10009526029','10001293258','10025054489','10005691831','10008867953','10008903577','10009111472','10026385036','10009347994','10024317729','10009784202','10009568805','10009432982','10008903351','10009018106','10009495226','10008922547','10009251134','10000073458','10026302248','10025490479','10009575911','10009604395','10025912390','10008854763','10008895835','10021818524','10008831717','10009674246','10000902491','10008848343','10008851120','10005658448','10008904748','10008912370','10006599609','10017223555','10008299540','10014917962','10024290163','10025715168','10009036770','10006489352','10008097104','10009449215','10010696551','10008949830','10002151297','10008492139','10021852203','10009033271','10000669839','10025830536','10009741979','10024399365','10000114708','10006457194','10023549571','10009409747','10001148618','10025524656','10025518867','10009650029','10025880226','10008889776','10009361513','10008807490','10001834963','10008830763','10025838497','10026652715','10009630154','10009326273','10008833437','10002152246','10008971946','10020158908','10009705756','10008835198','10017598819','10026628607','10026661898','10011537374','10008995482','10009571135','10008922979','10022012909','10006640387','10026296582','10000861920','10008817916','10022405053','10009146675','10009235423','10009422521','10009761348','10005879392','10026191548','10000160451','10005877804','10026429343','10009863860','10009354173');

WITH pick AS (
  SELECT reg_number
  FROM je_2025_tier1_admit_card
  WHERE
	venue_code='3201071'
    AND examdate = '2025-12-06'
    AND shift = '1'
  ORDER BY reg_number
  LIMIT 51
)
UPDATE je_2025_tier1_admit_card t
SET 
shift = '1',
venue_code='320105',
venue_name='SAVEETHA ENGINEERING COLLEGE ',
venue_address='SAVEETHA NAGAR, KANCHIPURAM - CHENNAI RD, SRIPERUMBADUR, THANDALAM,CHENNAI, TAMIL NADU - 602105',
venue_pincode='602105'
WHERE t.reg_number IN (SELECT reg_number FROM pick);

WITH pick AS (
  SELECT reg_number
  FROM je_2025_tier1_admit_card
  WHERE
	venue_code='3201071'
    AND examdate = '2025-12-06'
    AND shift = '1'
  ORDER BY reg_number
  LIMIT 69
)
UPDATE je_2025_tier1_admit_card t
SET 
shift = '1',
venue_code='320104',
venue_name='MOHAMED SATHAK COLLEGE OF ARTS & SCIENCE',
venue_address='13, MEDAVAKKAM MAIN ROAD, SHOLINGANALLUR, CHENNAI, TAMIL NADU 600119',
venue_pincode='600119'
WHERE t.reg_number IN (SELECT reg_number FROM pick);

WITH pick AS (
  SELECT reg_number
  FROM je_2025_tier1_admit_card
  WHERE
	venue_code='3201071'
    AND examdate = '2025-12-06'
    AND shift = '2'
  ORDER BY reg_number
  LIMIT 110
)
UPDATE je_2025_tier1_admit_card t
SET 
shift = '2',
venue_code='320104',
venue_name='MOHAMED SATHAK COLLEGE OF ARTS & SCIENCE',
venue_address='13, MEDAVAKKAM MAIN ROAD, SHOLINGANALLUR, CHENNAI, TAMIL NADU 600119',
venue_pincode='600119'
WHERE t.reg_number IN (SELECT reg_number FROM pick);

WITH pick AS (
  SELECT reg_number
  FROM je_2025_tier1_admit_card
  WHERE
	venue_code='3201071'
    AND examdate = '2025-12-06'
    AND shift = '2'
  ORDER BY reg_number
  LIMIT 10
)
UPDATE je_2025_tier1_admit_card t
SET 
shift = '2',
venue_code='320105',
venue_name='SAVEETHA ENGINEERING COLLEGE ',
venue_address='SAVEETHA NAGAR, KANCHIPURAM - CHENNAI RD, SRIPERUMBADUR, THANDALAM,CHENNAI, TAMIL NADU - 602105',
venue_pincode='602105'
WHERE t.reg_number IN (SELECT reg_number FROM pick);

WITH pick AS (
  SELECT reg_number
  FROM je_2025_tier1_admit_card
  WHERE
	venue_code='300404'
    AND examdate = '2025-12-04'
    AND shift = '2'
	AND downloaded=false 
  ORDER BY reg_number
  LIMIT 61
)
UPDATE je_2025_tier1_admit_card t
SET 
shift = '2',
venue_code='300415',
venue_name='SHRI BHAWANI NIKETAN INSTITUTE OF TECHNOLOGY AND MANAGEMENT',
venue_address='SIKAR ROAD, NEAR MAHARAO SHEKHA CIRCLE, JAIPUR, RAJASTHAN-302039',
venue_pincode='302039'
WHERE t.reg_number IN (SELECT reg_number FROM pick);

