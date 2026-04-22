
"10018515823"	2
"10031021305"	3
"10005669686"	2
"10021051746"	2
"10020862034"	2
"10017893918"	2
"10001115198"	2
"10027547058"	2
"10021511208"	2
"10010320715"	2
"10002046035"	2
"10021507475"	2
"10017418372"	2
"10031126076"	2
"10029524899"	2
"10026057607"	2
"10013236202"	2
"10029843842"	2
"10027617739"	2
"10008671863"	2
"10013978327"	2
"10023947067"	2
"10007988015"	2
"10030512276"	2

'10018515823','10031021305','10005669686','10021051746','10020862034','10017893918','10001115198','10027547058','10021511208','10010320715','10002046035','10021507475','10017418372','10031126076','10029524899','10026057607','10013236202','10029843842','10027617739','10008671863','10013978327','10023947067','10007988015','10030512276'



SELECT   ap."registrationNo" as reg_number,   ap.name,   ap."newName",   ap."fathersName",   ap."mothersName",   ap.gender,   ap.category,   ap.dob,   ap."centreName1" as centerPrefernce1, NULLIF(regexp_replace(ap."centreName1", '.*\((\d+)\)\s*$', '\1'), ap."centreName1")::int AS "centerPrefernceCode1",   ap."centreName2" as centerPrefernce2,NULLIF(regexp_replace(ap."centreName2", '.*\((\d+)\)\s*$', '\1'), ap."centreName2")::int AS "centerPrefernceCode2",   ap."centreName3" as centerPrefernce3,   NULLIF(regexp_replace(ap."centreName3", '.*\((\d+)\)\s*$', '\1'), ap."centreName3")::int AS "centerPrefernceCode3",   ap."region1", ap."region2", ap."region3",   ap."presentAddress",   ap."presentDistrictName",   ap."presentStateName",   ap."presentPincode",   ap."permanentAddress",   ap."permanentDistrictName",   ap."permanentStateName",   ap."permanentPincode",   ap."emailId" as email,   ap."phoneNo" as phone, ap."cbeMedium",  (ap."createdAt"::timestamp)::date AS form_completion_date,   to_char(ap."createdAt"::timestamp, 'HH24:MI:SS') AS form_completion_time,   slot.preference1,   slot.preference2,   slot.preference3,   slot.preference4 FROM public."ctgd2026Applications_27_01_2026" ap LEFT JOIN public.ctgd_2026_tier1_candidate_checkins slot   ON ap."registrationNo" = slot.reg_number WHERE ap."statusId" = '01' and ap.region1='NWR'



SELECT   ap."registrationNo" as reg_number,  ap.name,   ap."newName",   case when ap.gender='Male' then '2'   when ap.gender='Female' then '1'   end as gender,   case when ap.category='UR' then '9'   when ap.category='SC' then '1'   when ap.category='ST' then '2'   when ap.category='OBC' then '6'   when ap.category='EWS' then '0'   end as category,   case when ap."isEsm"=true then 'Yes'   when ap."isEsm"=false then 'No'   end as ex_serviceman,   case when ap."isCivilPost"=true then 'Yes'   when ap."isCivilPost"=false then 'No'   end as exs_res_availed,  to_char(ap.dob,'dd-mm-yyyy'),  ap."centreName1" as center_name_Pref1,   NULLIF(regexp_replace(ap."centreName1", '.*\((\d+)\)\s*$', '\1'), ap."centreName1")::int AS center_code_pref1,   ap."centreName2" as center_name_Pref_2,   NULLIF(regexp_replace(ap."centreName2", '.*\((\d+)\)\s*$', '\1'), ap."centreName2")::int AS "center_code_pref2",   ap."centreName3" as center_name_Pref_3,  NULLIF(regexp_replace(ap."centreName3", '.*\((\d+)\)\s*$', '\1'), ap."centreName3")::int AS "center_code_pref3",  ap."region1" as region,   ap."region2",  ap."region3",  ap."cbeMedium",  (ap."createdAt"::timestamp)::date AS form_completion_date,  to_char(ap."createdAt"::timestamp, 'HH24:MI:SS') AS form_completion_time,  COALESCE(replace(slot.preference1,'week',''),'0') as opt_week,  COALESCE(replace(slot.preference2,'week',''),'0') as opt_week2,  COALESCE(replace(slot.preference3,'week',''),'0') as opt_week3,  COALESCE(replace(slot.preference4,'week',''),'0') as opt_week4 FROM public."ctgd2026Applications_27_01_2026" ap left join ctgd_2026_tier1_candidate_checkins slot on ap."registrationNo" =slot.reg_number where ap."statusId" = '01' and ap.region1='NWR' 



'B03','B21','B16','B18','B45','B06','B04','B11','B12','B17','B20','B19','B22','B32','B26','B39','B43','B44','B41','B42','B24','B31','D01','D02','D03','D04','D21','D15','D16','D10','D12','D08','D05','D06','D07','D09','D11','D13','D17'



'100128','120103','170101','170102','170202','170204','170205','170212','170214','180505','20701','20901','20902','220201','220503','220513','220609','220802','320206','40208"'


'10030597632','10029478555','10020388107','10029357239','10018882821','10025869173','10020123560','10025362930','10029082555','10030548247','10031130552','10029496761','10013644473','10009256648','10030633580','10026678866','10025091773','10026174008','10029437100','10017678578','10013558132','10010080639','10027383266','10026693964','10011497486','10029078419','10025921662','10020706525','10030474330','10029734060','10029018514','10026174043','10024821231','10029138676'


update ctgd_2026_tier1_admit_card
set 
examdate='2026-05-05',
examdate_bkp='05-05-2026',
examdate1='05/05/2026',
shift='1',
batch='14',
repotime='8:30 AM',
gateclose='9:30 AM',
examtime='10:00 AM To 11:00 AM'
where batch::int>3 and lang_code in ('10','13','23') 
and venue_code<>'20901';---109 updates

'10026844030','10011984774','10018386125','10030487190','10018154601','10030797139','10014039239','10021860662','10005669613','10020907081','10030487190','10030093650','10021219232','10001277986','10027464335','10030666907','10024327363','10029579284','10001191061','10009468235','10010856976','10012588824','10012588824','10030483511','10012197740','10030675212','10030130374','10018783771','10013152329','10019282168','10008146448','10030460451','10008111344','10029800218','10025936369','10026936201'


WITH ranked AS (
    SELECT 
        reg_number,
        examdate,
		examdate1,
		examdate_bkp,
        shift,
		batch,
		repotime,
		gateclose,
		examtime
        ROW_NUMBER() OVER (
            PARTITION BY examdate, shift 
            ORDER BY reg_number
        ) AS rn
    FROM ctgd_2026_tier1_admit_card
    WHERE venue_code = '50737'
)
UPDATE ctgd_2026_tier1_admit_card c
SET 
    c.venue_code = '50701',
	c.Venue_name='AADARSH PARIKSHA KENDRA SHASTRI NAGAR PATNA',
	c.Venue_address='BIHAR SCHOOL EXAMINATION BOARD, REGIONAL OFFICE, NEAR GOVT. BOYS SENIOR SECONDARY SCHOOL, SHASTRI NAGAR, PATNA, BIHAR-800023',
	c.venue_pincode='800023',
    c.examdate = r.examdate,
	c.examdate1=r.examdate1,
	c.examdate_bkp=r.examdate_bkp,
    c.shift = r.shift ,
	c.repotime=r.repotime,
	c.gateclose=r.gateclose,
	c.examtime=r.examtime
FROM ranked r
WHERE c.reg_number = r.reg_number
  AND r.rn <= 1250;
  
update ctgd_2026_tier1_admit_card
set is_active=true,
remarks=remarks||' ,email received from NR to issue admit card'
where 
reg_number in ('10026844030','10011984774','10018386125','10030487190','10018154601','10030797139','10014039239','10021860662','10005669613','10020907081','10030487190','10030093650','10021219232','10001277986','10027464335','10030666907','10024327363','10029579284','10001191061','10009468235','10010856976','10012588824','10012588824','10030483511','10012197740','10030675212','10030130374','10018783771','10013152329','10019282168','10008146448','10030460451','10008111344','10029800218','10025936369','10026936201');
 
---ey 106 city live stop siddharth mail 
 
'10020270744','10029239819','10020963630','10030854671','10011961668','10029349035','10016023290','10028283382','10029221287','10018019532','10027372875','10020096653','10030407878','10029608040','10021884977','10000047369','10030933331','10031081143','10028407888','10029449511','10016734415','10025046513','10029925333','10019848177','10029470806','10029699681','10006268917','10030973061','10024644170','10021382813','10029933775','10026975081','10001168633','10019336185','10030853381','10028814284','10029845155','10021225826','10000881981','10027338912','10030962079','10009421540','10001091564','10019090222','10024196197','10022227616','10029062494','10028817797','10021858889','10020450735','10018946344','10024296137','10029425328','10020771328','10019714225','10018210984','10030617220','10028719950','10022491616','10029092264','10027612774','10031064337','10020877762','10027135635','10028772708','10030338191','10020044327','10018924797','10025621076','10029527916','10027447349','10017912974','10015185593','10018642931','10019060456','10027825574','10030667098','10017859141','10029565179','10020046071','10025555520','10024982421','10030523194','10030651655','10020689268','10027500071','10024813726','10000126762','10021712429','10020531756','10012041761','10021329807','10025115833','10030536774','10029637415','10020284803','10020642371','10018071752','10021447575','10015653857','10000771157','10027288790','10030286717','10027440313','10028822729','10029851070'

update ctgd_2026_tier1_admit_card
set is_active=false,
remarks='ey stopped city live'
where 
reg_number in ('10020270744','10029239819','10020963630','10030854671','10011961668','10029349035','10016023290','10028283382','10029221287','10018019532','10027372875','10020096653','10030407878','10029608040','10021884977','10000047369','10030933331','10031081143','10028407888','10029449511','10016734415','10025046513','10029925333','10019848177','10029470806','10029699681','10006268917','10030973061','10024644170','10021382813','10029933775','10026975081','10001168633','10019336185','10030853381','10028814284','10029845155','10021225826','10000881981','10027338912','10030962079','10009421540','10001091564','10019090222','10024196197','10022227616','10029062494','10028817797','10021858889','10020450735','10018946344','10024296137','10029425328','10020771328','10019714225','10018210984','10030617220','10028719950','10022491616','10029092264','10027612774','10031064337','10020877762','10027135635','10028772708','10030338191','10020044327','10018924797','10025621076','10029527916','10027447349','10017912974','10015185593','10018642931','10019060456','10027825574','10030667098','10017859141','10029565179','10020046071','10025555520','10024982421','10030523194','10030651655','10020689268','10027500071','10024813726','10000126762','10021712429','10020531756','10012041761','10021329807','10025115833','10030536774','10029637415','10020284803','10020642371','10018071752','10021447575','10015653857','10000771157','10027288790','10030286717','10027440313','10028822729','10029851070');
---NER 13 candidates not present in our database, so 93 updates
