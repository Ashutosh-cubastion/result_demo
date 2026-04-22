select * from t_appl_dv_cedp2023candidatedetails_ssc where advc_isactive='true';---3882
select * from t_appl_dv_cedp2023candidatedetails_ssc where advc_isactive='true';---3882
select distinct advc_rollno from t_appl_dv_cedp2023candidatedetails_ssc;---3822
select * from t_appl_dv_ro_candidatedata_ssc where advcd_notificationid='74' and advcd_examid='22'
and advcd_scheduledate='2024-01-14' and advcd_isactive='false' ;---10800
 
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


-------------------------------------------------------------------------------------------------

select b.*,a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_dob is null;---2 absent candidate

select distinct a.advc_rejectionprovision
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and a.advc_dob is null;---0

select b.*,a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and (a.advc_father_name is null or a.advc_mother_name is null or a.advc_name is null);---0

select b.*,a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and (a.advc_father_name is null or a.advc_mother_name is null or a.advc_name is null or a.advc_genderid is null or a.advc_categoryid is null);---0

select b.pt_isheightrelxavail,pt_heightrelx,pt_ischestrelxavail,pt_chestrelx
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and (b.pt_heightrelx is not null or b.pt_chestrelx is not null);---287

select distinct a.advc_categoryid,a.advc_genderid,count(*)
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and (b.pt_heightrelx ='ST')
group by a.advc_categoryid,a.advc_genderid;---242

select distinct a.advc_categoryid,a.advc_genderid,count(*)
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and (b.pt_chestrelx ='ST')
group by a.advc_categoryid,a.advc_genderid;---27

select b.*,a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and (b.pt_heightrelx ='hrelaxforward') and (a.advc_iswards_of_delhipolice is null or a.advc_iswards_of_delhipolice='false');--11

select b.*,a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and (b.pt_heightrelx ='hillareas');

select b.pt_chestrelx,a.advc_genderid,a.advc_categoryid
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and  b.pt_chestrelx is not null;---27 ST male candidates

select a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and a.advc_genderid='2'
--and a.advc_driving_licence_formotorcycle is null
and (a.advc_drivinglicensenumberlmv is null or a.advc_drivinglicensenumberlmv='');

select * from m_states_gis where st_stateid in ('10','14','21','35');


select a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and a.advc_isncc_certificate='true'
and (a.advc_typeof_ncccertificate is null or a.advc_typeof_ncccertificate='');---0


select a.advc_rollno,a.advc_age,a.advc_genderid,a.advc_categoryid,a.advc_isex_serviceman,a.advc_arccode,a.advc_isdept_candidate,
a.advc_isdept_certificate,a.advc_iswards_of_delhipolice,a.advc_issportsperson_of_distinction
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and a.advc_arccode='1,5'

select distinct a.advc_categoryid
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='' or a.advc_arccode='0')
and a.advc_age>'25';---0

select distinct a.advc_categoryid
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='1,5');---1,2

select distinct a.advc_categoryid
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='2,3');---6

select distinct a.advc_categoryid
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='20,5');--0,9

select distinct a.advc_categoryid,a.advc_isdept_candidate
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='22,15');---9


select a.* 
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='22,15');---1 candidates found


select distinct a.advc_categoryid,a.advc_isdept_candidate
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='24,20');

select a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='24,20');

select distinct a.advc_categoryid,a.advc_iswards_of_delhipolice
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='25,4');

select distinct a.advc_categoryid,a.advc_isex_serviceman
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='26,3');---0,9

select distinct a.advc_categoryid,a.advc_isex_serviceman
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='27,6');---6

select distinct a.advc_categoryid,a.advc_isex_serviceman
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='28,8');---1,2

select a.*
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and( a.advc_arccode='29,5');---0,6,9


select a.advc_rollno,a.advc_categoryid,a.advc_arccode,a.advc_iswards_of_delhipolice,pt_heightrelx
from t_appl_dv_cedp2023candidatedetails_ssc a,
t_appl_dv_cedp2023petpst_ssc b 
where a.advc_rollno = b.pt_rollno
and b.pt_finalstatus ='true'
and a.advc_rejectionprovision in ('C','W')
and (b.pt_heightrelx ='hrelaxforward')
and  a.advc_arccode<>'25,4'

advc_rejectionprovision = ‘W’ but advc_driving_licence_formotorcycle = ‘NULL’

Candidate = 01
advc_rejectionprovision = ‘C’ but advc_remarks = ‘DISQUALIFIED’
advc_rejectionprovision = ‘C’ but advc_remarks = ‘Absent’
advc_rejectionprovision = ‘C’ but advc_driving_licence_formotorcycle = ‘NULL’
advc_rejectionprovision = ‘C’ and advc_driving_licence_formotorcycle   = ‘TRUE’ but advc_drivinglicensenumberlmv  = ‘NULL’ and advc_authoritynameforlmv = ‘NULL’
advc_rejectionprovision = ‘C’ and advc_iswards_of_delhipolice = ‘TRUE’ but pt_isheightrelxavail = ‘TRUE’ advc_arccode = ‘1,5’

advc_rejectionprovision = ‘C’ pt_isheightrelxavail = ‘hillareas’ but advc_permanentstateid = ‘10’ (DELHI) 

advc_rejectionprovision = ‘C’ and pt_finalstatus = ‘TRUE’ but pt_remarks = ‘NQ’ / ‘Disqualified in Long Jump’ / ‘DISQUALIFIED IN RACE’/ DQ in Height
advc_rejectionprovision = ‘C’ and pt_finalstatus = ‘TRUE’ but pt_remarks = ‘Absent’



Dear Sir/Madam,

Thank you for your co-operation.

We have checked and found all the 35 records have been successfully updated with correct information.
Enclosed, please find the final complete PE&MT+DV data dump. Please review the data at your end and give final confirmation in order for us to start the result processing.

Awaiting your final confirmation.