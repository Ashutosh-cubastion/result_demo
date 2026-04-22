----- Making PE&MT entries inactive for candidates----- 

update t_appl_dv_ro_candidatedata_ssc
set advcd_isactive='false'
where advcd_notificationid ='74';


update t_appl_dv_ro_candidatedata_ssc
set advcd_isactive='false'
where advcd_notificationid ='74' and
advcd_rollno in ();


----- Making PE&MT MODULE inactive/Freeze----- (null/DV)

update t_notification_ssc
set no_dvflag = null 
where no_id='74';

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------


EDUCATION QULAIFICATION:

select * from t_appl_dv_cedp2023_education_qual_ssc;---888
select distinct aeq_rollno from t_appl_dv_cedp2023_education_qual_ssc;---888
select distinct aeq_eduqual from t_appl_dv_cedp2023_education_qual_ssc ;---12th,Equivalent
select distinct aeq_eduqual,count(*) from t_appl_dv_cedp2023_education_qual_ssc group by aeq_eduqual;
"12th"			879
"Equivalent"	9

------------------------------------------------------------------------------------


select * from t_appl_dv_cedp2023petpst_ssc order by pt_rollno;---1602
select distinct pt_rollno from t_appl_dv_cedp2023petpst_ssc;---1602
select distinct pt_regno from t_appl_dv_cedp2023petpst_ssc;---1602
select distinct pt_isactive from t_appl_dv_cedp2023petpst_ssc;---true
select distinct pt_genderid,count(*) from t_appl_dv_cedp2023petpst_ssc group by pt_genderid;
1	1
2	1601

select pt_rollno,pt_isracequalified,pt_islongjumpqualified,pt_ishighjumpqualified,pt_ispetqualified from
t_appl_dv_cedp2023petpst_ssc;

select distinct pt_ispetqualified,count(*) from t_appl_dv_cedp2023petpst_ssc group by pt_ispetqualified;
false	703
true	899

select pt_rollno,pt_isracequalified,pt_islongjumpqualified,pt_ishighjumpqualified,pt_ispetqualified from
t_appl_dv_cedp2023petpst_ssc where pt_ispetqualified='false';---703

select pt_rollno,pt_isracequalified,pt_islongjumpqualified,pt_ishighjumpqualified,pt_ispetqualified from
t_appl_dv_cedp2023petpst_ssc where pt_ispetqualified='false' and pt_isracequalified='true' ;--44

select pt_rollno,pt_isracequalified,pt_islongjumpqualified,pt_ishighjumpqualified,pt_ispetqualified from
t_appl_dv_cedp2023petpst_ssc where pt_ispetqualified='false' and pt_isracequalified='true' and pt_islongjumpqualified='true';--1

select pt_rollno,pt_isracequalified,pt_islongjumpqualified,pt_ishighjumpqualified,pt_ispetqualified from
t_appl_dv_cedp2023petpst_ssc where pt_ispetqualified='false' and pt_isracequalified='true' and pt_islongjumpqualified='true'
and pt_ishighjumpqualified='true' ;--0

select pt_rollno,pt_isracequalified,pt_islongjumpqualified,pt_ishighjumpqualified,pt_ispetqualified from
t_appl_dv_cedp2023petpst_ssc where pt_ispetqualified='true';---899

select pt_rollno,pt_isracequalified,pt_islongjumpqualified,pt_ishighjumpqualified,pt_ispetqualified from
t_appl_dv_cedp2023petpst_ssc where pt_ispetqualified='true' and (pt_isracequalified='false' or pt_islongjumpqualified='false' or pt_islongjumpqualified='false');--0

select distinct pt_finalstatus,count(*) from t_appl_dv_cedp2023petpst_ssc group by pt_finalstatus;
false	712
true	890

select pt_rollno,pt_genderid,pt_ispetqualified,pt_heightmeasure,pt_isheightrelxavail,pt_heightrelx,pt_heightbar,pt_chestexp,pt_chestnotexp,pt_ischestrelxavail,pt_chestrelx,pt_pemtstatus,pt_finalstatus from
t_appl_dv_cedp2023petpst_ssc where pt_finalstatus ='false' and pt_ispetqualified='true' order by pt_rollno;---9

--regno '1401002612','2201054801','1402035074','1403003962','1403005928','2201303717','1402028183','2201295674','2201330656'

select * from t_appl_dv_cedp2023petpst_ssc where pt_finalstatus ='false' and pt_ispetqualified='true' order by pt_rollno;---9
--for regno 40005490645,20001739963 pt_finalstatus is false but pt_remarks is null

select distinct pt_ispetqualified from t_appl_dv_cedp2023petpst_ssc where pt_finalstatus ='true';---true

select pt_rollno,pt_genderid,pt_ispetqualified,pt_heightmeasure,pt_isheightrelxavail,pt_heightrelx,pt_heightbar,pt_chestexp,pt_chestnotexp,pt_ischestrelxavail,pt_chestrelx,pt_pemtstatus,pt_finalstatus from
t_appl_dv_cedp2023petpst_ssc where pt_finalstatus ='true' and pt_ispetqualified='true' and pt_genderid='2' order by pt_rollno ;---890

select pt_rollno,pt_genderid,pt_ispetqualified,pt_heightmeasure,pt_isheightrelxavail,pt_heightrelx,pt_heightbar,pt_chestexp,pt_chestnotexp,pt_ischestrelxavail,pt_chestrelx,pt_pemtstatus,pt_finalstatus from
t_appl_dv_cedp2023petpst_ssc where pt_finalstatus ='true' and pt_ispetqualified='true' and pt_heightmeasure<'170'; ---9

select pt_rollno,pt_genderid,pt_ispetqualified,pt_heightmeasure,pt_isheightrelxavail,pt_heightrelx,pt_heightbar,pt_chestexp,pt_chestnotexp,pt_ischestrelxavail,pt_chestrelx,pt_pemtstatus,pt_finalstatus from
t_appl_dv_cedp2023petpst_ssc where pt_finalstatus ='true' and pt_ispetqualified='true' and pt_heightmeasure<'170'and pt_isheightrelxavail='true' and pt_heightrelx is null order by pt_rollno ;---0

select pt_rollno,pt_genderid,pt_ispetqualified,pt_heightmeasure,pt_isheightrelxavail,pt_heightrelx,pt_heightbar,pt_chestexp,pt_chestnotexp,pt_ischestrelxavail,pt_chestrelx,pt_pemtstatus,pt_finalstatus from
t_appl_dv_cedp2023petpst_ssc where pt_finalstatus ='true' and pt_ispetqualified='true' and pt_heightmeasure<'170'and pt_isheightrelxavail='true' and pt_heightrelx is null order by pt_rollno ;---0

select pt_rollno,pt_genderid,pt_ispetqualified,pt_heightmeasure,pt_isheightrelxavail,pt_heightrelx,pt_heightbar,pt_chestexp,pt_chestnotexp,pt_ischestrelxavail,pt_chestrelx,pt_pemtstatus,pt_finalstatus from
t_appl_dv_cedp2023petpst_ssc where pt_finalstatus ='true' and pt_ispetqualified='true' and (pt_chestexp<'85' or pt_chestnotexp<'81') ;--2

select pt_rollno,pt_genderid,pt_ispetqualified,pt_heightmeasure,pt_isheightrelxavail,pt_heightrelx,pt_heightbar,pt_chestexp,pt_chestnotexp,pt_ischestrelxavail,pt_chestrelx,pt_pemtstatus,pt_finalstatus from
t_appl_dv_cedp2023petpst_ssc where pt_finalstatus ='true' and pt_ispetqualified='true' and pt_ischestrelxavail='true' and pt_chestrelx is null order by pt_rollno ;---0
----------------------------------------------------------------------------------------------------------------------------

select * from t_appl_dv_cedp2023candidatedetails_ssc where advc_isactive='true';---3882
select * from t_appl_dv_cedp2023candidatedetails_ssc where advc_isactive='true';---3882
select distinct advc_rollno from t_appl_dv_cedp2023candidatedetails_ssc;---3822

select a.advc_rollno ,b.pt_rollno,a.advc_name,a.advc_father_name,a.advc_mother_name,a.advc_genderid,a.advc_categoryid,a.advc_dob,a.advc_isdvcomplete
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'; ---890

select a.advc_rollno ,b.pt_rollno,a.advc_name,a.advc_father_name,a.advc_mother_name,a.advc_genderid,a.advc_categoryid,a.advc_dob,a.advc_isdvcomplete
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_name is null;--0

select a.advc_rollno ,b.pt_rollno,a.advc_name,a.advc_father_name,a.advc_mother_name,a.advc_genderid,a.advc_categoryid,a.advc_dob,a.advc_isdvcomplete
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_father_name is null;--0

select a.advc_rollno ,b.pt_rollno,a.advc_name,a.advc_father_name,a.advc_mother_name,a.advc_genderid,a.advc_categoryid,a.advc_dob,a.advc_isdvcomplete
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_mother_name is null;--0

select a.advc_rollno ,b.pt_rollno,a.advc_name,a.advc_father_name,a.advc_mother_name,a.advc_genderid,a.advc_categoryid,a.advc_dob,a.advc_isdvcomplete
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_genderid is null;--0

select a.advc_rollno ,b.pt_rollno,a.advc_name,a.advc_father_name,a.advc_mother_name,a.advc_genderid,a.advc_categoryid,a.advc_dob,a.advc_isdvcomplete
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_dob is null;--2 candidates rollno "1401011283","2002016847" found for whom advc_isdvcomplete is false

select a.advc_rollno ,b.pt_rollno,a.advc_name,a.advc_father_name,a.advc_mother_name,a.advc_genderid,a.advc_categoryid,a.advc_dob,a.advc_isdvcomplete
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_categoryid is null;--2 candidates rollno "1401011283","2002016847" found for whom advc_isdvcomplete is false


select a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true' and a.advc_isex_serviceman ='true'; ---0 esm

select distinct a.advc_remarks,a.advc_rejectionprovision
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true';

"DQ due to invalid DL"									"R"	
"DQ due invalid DL (Learning licence not applicable)"	"R"
"Qualified"												"C"
"qUALIFIED"												"C"
"QD"													"C"
"clear"													"C"
"finger print not matched"								"W"
"QUALIFED"												"C"
"Qualified"												"C"
"Withheld"												"W"
"q"														"C"
"Qualified  "											"C"
"CLEAR"													"C"
"QUALIFIED"												"W"
"QULIFIED"												"C"
"FINGER MISMATCHED"										"W"
"QUALIFIED BUT FINGER PRINT NOT MATCHED"				"W"
"SUSPECT"												"W"
"qualfied"												"C"
"Q"														"W"
"QUALIFIED "											"C"
"QUALIFIED"												"C"
Withheld"												"W"
"Qualified "											"C"
"face match finger not match 30+ attempt"				"R"
"face match finger not match 10+ attempt"				"R"
"LICENCE NOT PROVIDED DISQUALIFIED"						"R"
"QUALFIED "												"C"
"Q"														"C"
"QUALIFY"												"C"
"DUE TO NON AVAILIBILITY OF DRIVING LICENCE"			"R"
"qualified"												"C"
"CLEAR"													"C"
"Face Match finger not match, 30+ attempt"				"R"
"Clear"													"C"
"DQ in documents due to invalid DL"						"R"
"qualified "											"C"
"FINGERPRINT IS NOT MATCHED BUT FACE IS MATCHED"		"W"
"Driving Licence not provided"							"R"
"DQ in documents verification due to non-availability of DL"	"R"

select a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true' 
and a.advc_rejectionprovision ='W' ; 
---for candidate MOHIT KUMAR(2201251275) advc_rejectionprovision ='W' but advc_remarks is null
--VISHNU 1403021507 advc_rejectionprovision ='W' but advc_remarks is QUALIFIED
--NEERAJ 1402020467
--DEEPAK 1402027231


select a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true' 
and a.advc_rejectionprovision in ('C','W') and advc_age>'25';---81

select a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true' 
and a.advc_rejectionprovision in ('C','W') and advc_age>'25' and a.advc_arccode is null;--0

select distinct a.advc_arccode
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true' 
and a.advc_rejectionprovision in ('C','W') and advc_age>'25' 
and a.advc_categoryid in ('1','2');---correct arc

select distinct a.advc_arccode
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true' 
and a.advc_rejectionprovision in ('C','W') and advc_age>'25' 
and a.advc_categoryid in ('6');--correct arc

select distinct a.advc_arccode
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true' 
and a.advc_rejectionprovision in ('C','W') and advc_age>'25' 
and a.advc_categoryid in ('0','9');

