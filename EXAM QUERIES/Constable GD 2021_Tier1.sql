Update candidates table:---->

	
	update candidates set	ncc_marks =null,
    rejection_provision =null,
    merit_male =null,
    merit_female =null,
    dob_flag =null,
    catsel_dob =null,
    cut_off =null,
    catsel =null,
    total_marks =null,
    remarks null,
    allocated_category =null,
    allocated_post =null,
    allocated_state =null,
    allocated_area =null,
    allocated_against_ur =null,
    allocated_state_in_notice =null;
--------------------------------------------------------------------------------	
	Rejection_provision updated to 'C' for not debarred candidates:--->
	
update candidates
set rejection_provision ='C' where regid not in ('30003446813', '72000478327', '72001137753', '20000204112', '10001847116', '72001085463', '72000235320', '92000536492');

--------------------------------------------------------------------------------
NCC marks update:

select regid,rollno,cand_name,category,gender,dob,isncc_certificate,typeofncc_certificate,is_ex_serviceman,ncc_marks,rejection_provision from candidates
where 
is_ex_serviceman ='3';---> ESM candidates ko marks ni dena hei

update candidates
set ncc_marks ='0' where
regid in 
(select regid from candidates where is_ex_serviceman ='3');

select regid,rollno,cand_name,category,gender,dob,isncc_certificate,typeofncc_certificate,is_ex_serviceman,ncc_marks,rejection_provision 
from candidates
where is_ex_serviceman ='0'
and isncc_certificate = 'Yes' and typeofncc_certificate ='C';----> Type C certificate wale non ESM candidates

update candidates
set ncc_marks ='5' where
regid in 
(select regid from candidates where is_ex_serviceman ='0' and isncc_certificate = 'Yes' and typeofncc_certificate ='C');

select regid,rollno,cand_name,category,gender,dob,isncc_certificate,typeofncc_certificate,is_ex_serviceman,ncc_marks,rejection_provision 
from candidates
where is_ex_serviceman ='0'
and isncc_certificate = 'Yes' and typeofncc_certificate ='B';------->  Type B certificate wale non ESM candidates

update candidates
set ncc_marks ='3' where
regid in 
(select regid from candidates where is_ex_serviceman ='0' and isncc_certificate = 'Yes' and typeofncc_certificate ='B');

select regid,rollno,cand_name,category,gender,dob,isncc_certificate,typeofncc_certificate,is_ex_serviceman,ncc_marks,rejection_provision 
from candidates
where is_ex_serviceman ='0'
and isncc_certificate = 'Yes' and typeofncc_certificate ='A';----->Type A certificate wale non ESM candidates

update candidates
set ncc_marks ='2' where
regid in 
(select regid from candidates where is_ex_serviceman ='0' and isncc_certificate = 'Yes' and typeofncc_certificate ='A');

update candidates
set ncc_marks ='0' where ncc_marks is null;----> set 0 for all other candidates

-------------------------------------------------------------------------------------------
Age relaxation:---->

select regid,cand_name,category,dob,is_ex_serviceman,ex_service_period,is_age_relaxation,age_relaxation_code_raw,age_relaxation_code_wipro,age_relaxation_code
from candidates where is_age_relaxation = 'false';----> candidates jinhone relaxation ni liya hei. inko dena padega

select regid,cand_name,category,dob,is_ex_serviceman,ex_service_period,is_age_relaxation,age_relaxation_code_raw,age_relaxation_code_wipro,age_relaxation_code
from candidates where is_age_relaxation = 'false' and is_ex_serviceman ='3';---->ESM candidates jinhe 3 code dena hei

update candidates
set age_relaxation_code ='3' where regid in 
(select regid from candidates where is_age_relaxation = 'false' and is_ex_serviceman ='3');

select regid,cand_name,category,dob,is_ex_serviceman,ex_service_period,is_age_relaxation,age_relaxation_code_raw,age_relaxation_code_wipro,age_relaxation_code
from candidates where is_age_relaxation = 'false' and is_ex_serviceman ='0' and category in ('1','2');------> SC/ST non ESM candidates jinhe 1 arc code dena padega

update candidates
set age_relaxation_code ='1' where regid in 
(select regid from candidates where is_age_relaxation = 'false' and is_ex_serviceman ='0' and category in ('1','2'));

select regid,cand_name,category,dob,is_ex_serviceman,ex_service_period,is_age_relaxation,age_relaxation_code_raw,age_relaxation_code_wipro,age_relaxation_code
from candidates where is_age_relaxation = 'false' and is_ex_serviceman ='0' and category in ('6');------> OBC non ESM candidates jinhe 1 arc code dena padega

update candidates
set age_relaxation_code ='2' where regid in 
(select regid from candidates where is_age_relaxation = 'false' and is_ex_serviceman ='0' and category in ('6'));

update candidates
set age_relaxation_code = '3' where is_ex_serviceman ='3';-----> sare ESM ko 3 dedo irrespective of opted relaxation or not

--------------------------------------------------------------------------------------------------------------------------

