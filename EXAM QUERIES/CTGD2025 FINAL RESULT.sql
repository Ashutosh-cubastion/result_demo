psql -U postgres -h 10.246.126.173 -p 5432 -d alloc_ctgd2025_allocation_final

select * from t_ctgd_2025_dv_dme limit 10;

select distinct attendence,"dmeStatus","dmeFinalStatus","isRmeApplied","rmeAttendence","rmeMedicalStatus","rmeFinalStatus",count(*)
from t_ctgd_2025_dv_dme
group by attendence,"dmeStatus","dmeFinalStatus","isRmeApplied","rmeAttendence","rmeMedicalStatus","rmeFinalStatus";

select * from t_ctgd_2025_dv_dme where "candidateNameChangeRmks" is not null;

select distinct "candidateDvStatusBySystem","isDVBoardStatusChanged","candidateDvStatusByBoard",attendence,"dmeStatus","dmeFinalStatus","isRmeApplied","rmeAttendence","rmeMedicalStatus","rmeFinalStatus",count(*)
from t_ctgd_2025_dv_dme
group by "candidateDvStatusBySystem","isDVBoardStatusChanged","candidateDvStatusByBoard",attendence,"dmeStatus","dmeFinalStatus","isRmeApplied","rmeAttendence","rmeMedicalStatus","rmeFinalStatus";


select distinct "candidateDvStatusBySystem","isDVBoardStatusChanged","candidateDvStatusByBoard",count(*)
from t_ctgd_2025_dv_dme
group by "candidateDvStatusBySystem","isDVBoardStatusChanged","candidateDvStatusByBoard";

select distinct attendence,"dmeStatus","dmeFinalStatus","isRmeApplied","rmeAttendence","rmeMedicalStatus","rmeFinalStatus",count(*)
from t_ctgd_2025_dv_dme where "candidateDvStatusBySystem" is null
group by attendence,"dmeStatus","dmeFinalStatus","isRmeApplied","rmeAttendence","rmeMedicalStatus","rmeFinalStatus";---3477

select distinct "isMigratedFromOrigin","wantsReservationFromOrigin",count(*) 
from t_ctgd_2025_dv_dme 
group by "isMigratedFromOrigin","wantsReservationFromOrigin";

select * from t_ctgd_2025_dv_dme where "isMigratedFromOrigin"=true and "wantsReservationFromOrigin"=true;--110
select * from t_ctgd_2025_dv_dme where "isMigratedFromOrigin"=true and "wantsReservationFromOrigin"=false;--164


pg_restore -U postgres -h 10.246.126.173 -p 5432 -d alloc_ctgd2025_allocation_final -t candidates C:\Users\Public\candidates_petpst_data.dump

\copy vacancy_table from 'C:\Users\SalauddinKhan\Desktop\CTGD2025FINALRESLT\vacancy_table_dme_rme.csv' csv header;---2972
\copy m_states_districts from 'C:\Users\SalauddinKhan\Desktop\CTGD2025FINALRESLT\m_states_districts.csv' csv header;---772


create table dv_dme_data_crpf
(
Attendance character varying,
 Biometric_LTI_Status	character varying,
 photo_matched character varying,
 RollNumber character varying,
 Candidate_Name character varying,
Remarks_Candidate_Name	character varying,
fathers_Name character varying,
Remarks_Father_Name	character varying,
Mother_Name character varying,
Remarks_Mother_Name character varying,
Gender character varying,
Matriculation_Roll_Number character varying,
Domicile_State_UT character varying,
Domicile_District character varying,
Have_you_migrated boolean,
State_UT_of_Origin character varying,
District_of_Origin character varying,
Candidate_belongs_to_Naxal_District	boolean,
Candidate_belongs_to_Border_District boolean,
State_UT_Considered character varying,
District_Considered character varying,
Is_Domicile_State_UT_Verified boolean,
Is_Domicile_District_Verified boolean,
Passed_Matriculation_01_01_2025	boolean,
Examination_Applied_Date character varying,
DV_DME_Schedule_Centre_Name character varying,
DV_DME_Actual_Centre_Name character varying,
DV_DME_Schedule_Centre_Code character varying,
DV_DME_Actual_Centre_Code	character varying,
Region_Code character varying,
DV_DME_Scheduled_Date date,
DV_DME_Actual_Date date,
Category character varying,
Reason_for_Category_Change character varying,
Whether_Ex_Serviceman character varying,
Date_of_Joining date,
Date_of_Discharge date,
Length_of_Service character varying,
Government_job_on_civil_side character varying,
Date_of_Joining_the_Civil_Post date,
submitted_self_declaration_undertaking character varying,
eligible_for_posts_reserved_for_ESM character varying,
Date_of_Birth date,
age character varying,
Age_Relaxation_Code character varying,
NCC_Certificate_Holder character varying,
Type_of_NCC_Certificate character varying,
Highest_Educational_Qualification character varying,
Qualifying_Educational_Qualification character varying,
State_UT_of_Board_University character varying,
Name_of_Board_University	character varying,
Subjects_Branch character varying,
Board_University character varying,
Roll_Number character varying,
Year_of_Passing character varying,
Percentage character varying,
CGPA  character varying,
Approved_by_Distance_Education_Bureau character varying,
Document_in_Support_of_DOB_Produced	 character varying,
Possesses_Essential_Qualification character varying,
Document_in_Support_of_Caste_Produced character varying,
OBC_Certificate_Issued_in_Prescribed_Proforma_Produced character varying,
ESM_Discharge_Certificate_Issued character varying,
Candidature_Status character varying,
DV_Board_change_Candidature_Status character varying,
DV_Board_Candidature_Status	 character varying,
Reason_for_Disqualification	character varying,
Remarks_dv	character varying,
DME_Status character varying,
Reason_for_Unfitness character varying,
Remarks_dme character varying,
applied_for_RME character varying,
DME_Final_Status character varying,
DME_Remarks character varying,
RME_Medical_Status character varying,
Final_RME_Status character varying,
Final_RME_Remarks character varying,
to_be_considered character varying
);


-----out of 3640 candidates 37 EWS candidates Valid certificate not produced.  Category need to be changed to 'UR'

'5107022975','1401011319','1404007441','1401046176','3009060165','3013122867','2411024111','4601000398','7001017738','7001048984','5501010874','1004046673','1010008418','1007014793','1004000160','1010002957','1004001539','1004017443','1004041886','1007007809','1004007587','1004008275','1004031593','1004045904','1004029116','1004039637','1007001983','1004000934','1004031569','1004049968','1004026488','1004052383','1004026560','1004030357','1004052294','1004019916','1004043797'


update dv_dme_data_crpf
set Document_in_Support_of_Caste_Produced='Yes'
where to_be_considered='Yes' and category in ('SC','ST','EWS') and Document_in_Support_of_Caste_Produced='NA';---3640

select * from dv_dme_data_crpf where rollnumber in 
('5107022975','1401011319','1404007441','1401046176','3009060165','3013122867','2411024111','4601000398','7001017738','7001048984','5501010874','1004046673','1010008418','1007014793','1004000160','1010002957','1004001539','1004017443','1004041886','1007007809','1004007587','1004008275','1004031593','1004045904','1004029116','1004039637','1007001983','1004000934','1004031569','1004049968','1004026488','1004052383','1004026560','1004030357','1004052294','1004019916','1004043797');

update dv_dme_data_crpf
set category='UR',
reason_for_category_change='Valid EWS certificate not produced. Hence category changed to  UR'
where rollnumber in 
('5107022975','1401011319','1404007441','1401046176','3009060165','3013122867','2411024111','4601000398','7001017738','7001048984','5501010874','1004046673','1010008418','1007014793','1004000160','1010002957','1004001539','1004017443','1004041886','1007007809','1004007587','1004008275','1004031593','1004045904','1004029116','1004039637','1007001983','1004000934','1004031569','1004049968','1004026488','1004052383','1004026560','1004030357','1004052294','1004019916','1004043797');---37



select * from dv_dme_data_crpf where to_be_considered='Yes' and category in ('OBC') and OBC_Certificate_Issued_in_Prescribed_Proforma_Produced='NA';

update dv_dme_data_crpf
set OBC_Certificate_Issued_in_Prescribed_Proforma_Produced='Yes'
where to_be_considered='Yes' and category in ('OBC') and OBC_Certificate_Issued_in_Prescribed_Proforma_Produced='NA';---611

select * from dv_dme_data_crpf where rollnumber in ('5601001964');

update dv_dme_data_crpf
set category='UR',
reason_for_category_change='OBC certificate not produced. Hence category changed to  UR'
where rollnumber in ('5601001964');

----53 ESM candidates ESM_Discharge_Certificate_Issued---Yes
'8208009517','8208001743','9005008947','6005059734','6005054996','6005042530','6007022044','6007028114','6006057720','6016000741','6007049759','2201220130','2201001251','3303072375','3303051162','2201205344','4410159527','4410041386','4410128222','5107016802','1202008373','3205073448','3206000061','3206304742','3402041651','3206385517','3206012788','3010077423','3009087463','3010070362','3001096966','3009081917','3010183736','3010133033','3003048793','3010124834','3009061721','7202029167','7208018623','2201228716','2401005374','2201299934','2405054342','2405102667','2405175325','2405055100','4602001818','8012018037','1004030261','1004005621','1010009264','1010005405','8007012280'

update dv_dme_data_crpf
set ESM_Discharge_Certificate_Issued='Yes'
where rollnumber in 
('8208009517','8208001743','9005008947','6005059734','6005054996','6005042530','6007022044','6007028114','6006057720','6016000741','6007049759','2201220130','2201001251','3303072375','3303051162','2201205344','4410159527','4410041386','4410128222','5107016802','1202008373','3205073448','3206000061','3206304742','3402041651','3206385517','3206012788','3010077423','3009087463','3010070362','3001096966','3009081917','3010183736','3010133033','3003048793','3010124834','3009061721','7202029167','7208018623','2201228716','2401005374','2201299934','2405054342','2405102667','2405175325','2405055100','4602001818','8012018037','1004030261','1004005621','1010009264','1010005405','8007012280');---53
 
 
 select * from dv_dme_data_crpf where rollnumber in ('5601015104');---ncc type set to 'A'
 
 select * from dv_dme_data_crpf where rollnumber in ('4410102424');----Attendance present Biometric_LTI_Status and photo status set matched
 
 select * from dv_dme_data_crpf where rollnumber in ('6202001160');---remarks from remarks_dme removed
 select * from dv_dme_data_crpf where rollnumber in ('3403023556');---remarks from remarks_dme removed
 
 select * from dv_dme_data_crpf where rollnumber in ('4604015315');---remarks FIR changed to FIT
 
 select * from dv_dme_data_crpf where rollnumber in ('2411019233');----remarks from remarks_dme removed
 
 select * from dv_dme_data_crpf where rollnumber in ('5601014415');----Category chnaged to OBC
 
 select * from dv_dme_data_crpf where rollnumber in ('3303152936');----ESM specific details filled from Application
 
update dv_dme_data_crpf set category='EWS' where rollnumber='6016002848';
update dv_dme_data_crpf set category='EWS' where rollnumber='6016019327';
update dv_dme_data_crpf set category='OBC' where rollnumber='1404018077';
update dv_dme_data_crpf set category='OBC' where rollnumber='1404018833';
update dv_dme_data_crpf set category='OBC' where rollnumber='1404027333';
update dv_dme_data_crpf set category='OBC' where rollnumber='1408014891';
update dv_dme_data_crpf set category='OBC' where rollnumber='1806008069';
update dv_dme_data_crpf set category='SC'  where rollnumber='1401009293';
update dv_dme_data_crpf set category='EWS' where rollnumber='3206291919';
update dv_dme_data_crpf set category='OBC' where rollnumber='4601001052';
update dv_dme_data_crpf set category='OBC' where rollnumber='4609001679';
update dv_dme_data_crpf set category='OBC' where rollnumber='4609001713';
update dv_dme_data_crpf set category='OBC' where rollnumber='4609003322';
update dv_dme_data_crpf set category='OBC' where rollnumber='4609003460';
update dv_dme_data_crpf set category='OBC' where rollnumber='4609003501';
update dv_dme_data_crpf set category='OBC' where rollnumber='4609004535';
update dv_dme_data_crpf set category='OBC' where rollnumber='4609007032';
update dv_dme_data_crpf set category='ST'  where rollnumber='4610012057';
update dv_dme_data_crpf set category='OBC' where rollnumber='6204075189';
update dv_dme_data_crpf set category='OBC' where rollnumber='6204063764';
update dv_dme_data_crpf set category='OBC' where rollnumber='4415045475';
update dv_dme_data_crpf set category='EWS' where rollnumber='2201233087';
update dv_dme_data_crpf set category='EWS' where rollnumber='2201236386';
update dv_dme_data_crpf set category='EWS' where rollnumber='2201305775';
update dv_dme_data_crpf set category='EWS' where rollnumber='2236002021';
update dv_dme_data_crpf set category='EWS' where rollnumber='2405067085';
update dv_dme_data_crpf set category='EWS' where rollnumber='2405172913';
update dv_dme_data_crpf set category='OBC' where rollnumber='2411013020';
update dv_dme_data_crpf set category='SC'  where rollnumber='2404012351';
update dv_dme_data_crpf set category='EWS' where rollnumber='3205066268';
update dv_dme_data_crpf set category='OBC' where rollnumber='3205005153';
update dv_dme_data_crpf set category='OBC' where rollnumber='4417019189';
update dv_dme_data_crpf set category='OBC' where rollnumber='4410070933';
update dv_dme_data_crpf set category='OBC' where rollnumber='2003029767';
update dv_dme_data_crpf set category='OBC' where rollnumber='2002040743';
update dv_dme_data_crpf set category='OBC' where rollnumber='2003027369';
update dv_dme_data_crpf set category='EWS' where rollnumber='2002051979';
update dv_dme_data_crpf set category='EWS' where rollnumber='2003007341';
update dv_dme_data_crpf set category='OBC' where rollnumber='2006017153';
update dv_dme_data_crpf set category='OBC' where rollnumber='2201306940';
update dv_dme_data_crpf set category='EWS' where rollnumber='3303004175';
update dv_dme_data_crpf set category='OBC' where rollnumber='1004002280';
update dv_dme_data_crpf set category='OBC' where rollnumber='1004013057';
update dv_dme_data_crpf set category='OBC' where rollnumber='1004018613';
update dv_dme_data_crpf set category='OBC' where rollnumber='1004019569';
update dv_dme_data_crpf set category='OBC' where rollnumber='1004030649';
update dv_dme_data_crpf set category='OBC' where rollnumber='1004030439';
update dv_dme_data_crpf set category='EWS' where rollnumber='1004039968';
update dv_dme_data_crpf set category='OBC' where rollnumber='3303006042';
update dv_dme_data_crpf set category='EWS' where rollnumber='5105066338';
update dv_dme_data_crpf set category='OBC' where rollnumber='5105053110';




-----------51 candidates category changed----------------

update dv_dme_data_crpf
set Document_in_Support_of_Caste_Produced='Yes' where
rollnumber in ('6016002848','6016019327','1404018077','1404018833','1404027333','1408014891','1806008069','1401009293','3206291919','4601001052','4609001679','4609001713','4609003322','4609003460','4609003501','4609004535','4609007032','4610012057','6204075189','6204063764','4415045475','2201233087','2201236386','2201305775','2236002021','2405067085','2405172913','2411013020','2404012351','3205066268','3205005153','4417019189','4410070933','2003029767','2002040743','2003027369','2002051979','2003007341','2006017153','2201306940','3303004175','1004002280','1004013057','1004018613','1004019569','1004030649','1004030439','1004039968','3303006042','5105066338','5105053110')
and category in ('SC','ST','EWS');---18

update dv_dme_data_crpf
set OBC_Certificate_Issued_in_Prescribed_Proforma_Produced='Yes' where
rollnumber in ('6016002848','6016019327','1404018077','1404018833','1404027333','1408014891','1806008069','1401009293','3206291919','4601001052','4609001679','4609001713','4609003322','4609003460','4609003501','4609004535','4609007032','4610012057','6204075189','6204063764','4415045475','2201233087','2201236386','2201305775','2236002021','2405067085','2405172913','2411013020','2404012351','3205066268','3205005153','4417019189','4410070933','2003029767','2002040743','2003027369','2002051979','2003007341','2006017153','2201306940','3303004175','1004002280','1004013057','1004018613','1004019569','1004030649','1004030439','1004039968','3303006042','5105066338','5105053110')
and category in ('OBC');---33
 

-----NCC Type A certificate-------

'6001039363','5112000252','5107020773','4410043536','4410044756','4410064343','4410071864','4410074972','4410079444','4410038362','4410011051','8007025319','1007015776'

update dv_dme_data_crpf
set ncc_certificate_holder=TRUE,
type_of_ncc_certificate='NCC ''A'' Certificate'
where 
rollnumber in ('6001039363','5112000252','5107020773','4410043536','4410044756','4410064343','4410071864','4410074972','4410079444','4410038362','4410011051','8007025319','1007015776');---13


-----NCC Type B certificate-------

'8207013235','4604026707','5102016533','3205041856','3403009392','3403013022','4410041659','4410048789','4410053819','4410064859','1004012891','1004038454','5501002672'

update dv_dme_data_crpf
set ncc_certificate_holder=TRUE,
type_of_ncc_certificate='NCC ''B'' Certificate'
where 
rollnumber in
('8207013235','4604026707','5102016533','3205041856','3403009392','3403013022','4410041659','4410048789','4410053819','4410064859','1004012891','1004038454','5501002672');---13

-----NCC Type C certificate-------

'3013105679','9001021035','9011001847','1202000559','4604003919','5001004739','5102003925','5102006143','5112007849','5111007657','3402045727','3403002960','3403008901','8601044247','8604010971','1004016378','5501008000'


update dv_dme_data_crpf
set ncc_certificate_holder=TRUE,
type_of_ncc_certificate='NCC ''C'' Certificate'
where 
rollnumber in ('3013105679','9001021035','9011001847','1202000559','4604003919','5001004739','5102003925','5102006143','5112007849','5111007657','3402045727','3403002960','3403008901','8601044247','8604010971','1004016378','5501008000');---17


select rollnumber,ncc_certificate_holder,type_of_ncc_certificate,to_be_considered from dv_dme_data_crpf where rollnumber='4410137260';-----NCC C type set

'2201169009','2411048759','2201229127','2201211956','3009137492','2002046060','1404007441','1401046176','3013142137','3010039706','3206117504','3010157962','5601016562','7007001183'

----------14 NQ candidates due to Overage---------

update dv_dme_data_crpf
set to_be_considered=null,
remarks='Not qualified candidates in revised data'
where
rollnumber in ('2201169009','2411048759','2201229127','2201211956','3009137492','2002046060','1404007441','1401046176','3013142137','3010039706','3206117504','3010157962','5601016562','7007001183');


'2201016391','7012000635','2201265441','2411012002','2201055263','2406027858','2201065573','2201147697','3206006313','2201130868','2401016582','2405166747','2201001409','2401006308','2401002763','2405101380','2405133289','3206313165','2411036800','3206355512','2411041206','2405011665','2411032082','2405108486','2233001480','2236002234','2201320368','2405051160','2405056436','2411004084','7801000581','2201066830','7007015595','7001000648','2201180721','2201302874','2201246078'


---------CANDIDATURE CONSIDERED AS UR from Domicile due non production of caste certificate from origin state

update dv_dme_data_crpf
set state_ut_considered=domicile_state_ut,
district_considered=domicile_district,
Document_in_Support_of_Caste_Produced='NA',
OBC_Certificate_Issued_in_Prescribed_Proforma_Produced='NA',
category='UR',
remarks='Candidates not produced caste certificate of their origin state, therefore DV Board has considered their candidature as UR from his Domicile State'
where rollnumber in ('2201016391','7012000635','2201265441','2411012002','2201055263','2406027858','2201065573','2201147697','3206006313','2201130868','2401016582','2405166747','2201001409','2401006308','2401002763','2405101380','2405133289','3206313165','2411036800','3206355512','2411041206','2405011665','2411032082','2405108486','2233001480','2236002234','2201320368','2405051160','2405056436','2411004084','7801000581','2201066830','7007015595','7001000648','2201180721','2201302874','2201246078');-----37

select a.rollno,a.cat1,a."isMigratedFromOrigin",a."wantsReservationFromOrigin",b.have_you_migrated,b.category,b.reason_for_category_change,b.remarks_dv from 
candidates_petpst a,
dv_dme_data_crpf b where a.rollno=b.rollnumber and
b.to_be_considered='Yes' and b.category='UR' and
b.document_in_support_of_caste_produced='NA' and b.obc_certificate_issued_in_prescribed_proforma_produced='Yes';---all 5 OK

elect a.rollno,a.cat1,a."isMigratedFromOrigin",a."wantsReservationFromOrigin",b.have_you_migrated,b.category,b.reason_for_category_change,b.remarks_dv from 
candidates_petpst a,
dv_dme_data_crpf b where a.rollno=b.rollnumber and
b.to_be_considered='Yes' and b.category='UR' and
b.document_in_support_of_caste_produced='Yes' and b.obc_certificate_issued_in_prescribed_proforma_produced='Yes';---all 35 OK

select a.rollno,a.cat1,a."isMigratedFromOrigin",a."wantsReservationFromOrigin",b.have_you_migrated,b.category,b.reason_for_category_change,b.remarks_dv from 
candidates_petpst a,
dv_dme_data_crpf b where a.rollno=b.rollnumber and
b.to_be_considered='Yes' and b.category='UR' and
b.document_in_support_of_caste_produced='Yes' and b.obc_certificate_issued_in_prescribed_proforma_produced='NA';---all 129 OK

select distinct b.ncc_certificate_holder,a."isNccCertificateHolder",b.type_of_ncc_certificate ,a."nccCertificateType" from 
candidates_petpst a,
dv_dme_data_crpf b where a.rollno=b.rollnumber and
b.to_be_considered='Yes' ;---ok

select distinct a.cand_name,b.candidate_name from 
candidates_petpst a,
dv_dme_data_crpf b where a.rollno=b.rollnumber and
b.to_be_considered='Yes'
and a.rollno in ('9001031230','9002003998','9001007591','6005030505','6007007504','6007026225','6001000343','6007045391','2201220130','2003021703','4404003813','4410050618','4410087802','4410139638','5105044846','1801012095','1806013617','3402028982','3205009662','3206065202','3206302785','7203010752','7208006836','7202030144','7202017998','7208047598','7203026405','7203000372','7202001211','7203027708','7204002893','4609012026','6204059544','6204006837','6204001930','7007003654','7001042329','7012003226','7013002344','7001048313','7013004498','7001036844','7006023499','7001044824','7001019249','7006002219','8003003913','8604009516','1007005783','5302002100','5302004420','5001003558','7201029313','7205005869','8601053044','4001000644')


'9001031230','9002003998','9001007591','6005030505','6007007504','6007026225','6001000343','6007045391','2201220130','2003021703','4404003813','4410050618','4410087802','4410139638','5105044846','1801012095','1806013617','3402028982','3205009662','3206065202','3206302785','7203010752','7208006836','7202030144','7202017998','7208047598','7203026405','7203000372','7202001211','7203027708','7204002893','4609012026','6204059544','6204006837','6204001930','7007003654','7001042329','7012003226','7013002344','7001048313','7013004498','7001036844','7006023499','7001044824','7001019249','7006002219','8003003913','8604009516','1007005783','5302002100','5302004420','5001003558','7201029313','7205005869','8601053044','4001000644'

update dv_dme_data_crpf set candidate_name='MAHAMMADISUF GALAGALI'	where rollnumber='9001031230';
update dv_dme_data_crpf set candidate_name='SANGAPPA BASAPPA CHINCHALI'	where rollnumber='9002003998';
update dv_dme_data_crpf set candidate_name='K PHENRIWIBOU'	where rollnumber='9001007591';
update dv_dme_data_crpf set candidate_name='ARUN YADAV'	where rollnumber='6005030505';
update dv_dme_data_crpf set candidate_name='VISHAL'	where rollnumber='6007007504';
update dv_dme_data_crpf set candidate_name='SHAILESH'	where rollnumber='6007026225';
update dv_dme_data_crpf set candidate_name='JITENDRA DHURWY'	where rollnumber='6001000343';
update dv_dme_data_crpf set candidate_name='PRADUMN UIKEY'	where rollnumber='6007045391';
update dv_dme_data_crpf set candidate_name='SHAYAID MD JAVED'	where rollnumber='2201220130';
update dv_dme_data_crpf set candidate_name='KM BHAWANA PANU'	where rollnumber='2003021703';
update dv_dme_data_crpf set candidate_name='PALLABI MAUR'	where rollnumber='4404003813';
update dv_dme_data_crpf set candidate_name='SANTANA PARIALI'	where rollnumber='4410050618';
update dv_dme_data_crpf set candidate_name='SOURAV PANDEY'	where rollnumber='4410087802';
update dv_dme_data_crpf set candidate_name='PAPIA SIKDER'	where rollnumber='4410139638';
update dv_dme_data_crpf set candidate_name='BHARGOVJYOTI RAY'	where rollnumber='5105044846';
update dv_dme_data_crpf set candidate_name='SANJAY KUMAR'	where rollnumber='1801012095';
update dv_dme_data_crpf set candidate_name='JAGDEEP SINGH'	where rollnumber='1806013617';
update dv_dme_data_crpf set candidate_name='PARDESHI RAJKUMAR VIJAY'	where rollnumber='3402028982';
update dv_dme_data_crpf set candidate_name='VIKASH KUMAR'	where rollnumber='3205009662';
update dv_dme_data_crpf set candidate_name='KM. ARCHANA RAJBHAR'	where rollnumber='3206065202';
update dv_dme_data_crpf set candidate_name='SAGAR KUMAR'	where rollnumber='3206302785';
update dv_dme_data_crpf set candidate_name='INGAVALE SHIVRAJ SHANKAR'	where rollnumber='7203010752';
update dv_dme_data_crpf set candidate_name='BAVADHANE VIKAS BABURAO'	where rollnumber='7208006836';
update dv_dme_data_crpf set candidate_name='MANDAWAT GEETA MOTILAL'	where rollnumber='7202030144';
update dv_dme_data_crpf set candidate_name='SONAWANE GANESH ARUN'	where rollnumber='7202017998';
update dv_dme_data_crpf set candidate_name='BANKAR SHRIKRUSHNA SHANKAR'	where rollnumber='7208047598';
update dv_dme_data_crpf set candidate_name='BABAR SUSHAMA NANDAKUMAR' where rollnumber='7203026405';
update dv_dme_data_crpf set candidate_name='PARIT AKANKSHA RAMCHANDRA'	where rollnumber='7203000372';
update dv_dme_data_crpf set candidate_name='KHOMANE RHOAN BANAJI' 	where rollnumber='7202001211';
update dv_dme_data_crpf set candidate_name='ADITYA ANAND JADHAV'	where rollnumber='7203027708';
update dv_dme_data_crpf set candidate_name='SATISH YADAV'	where rollnumber='7204002893';
update dv_dme_data_crpf set candidate_name='HARAGOURI MAJHI'	where rollnumber='4609012026';
update dv_dme_data_crpf set candidate_name='VINAY KUMAR VERMA'	where rollnumber='6204059544';
update dv_dme_data_crpf set candidate_name='TOMAN LAL'	where rollnumber='6204006837';
update dv_dme_data_crpf set candidate_name='MANOJ KUMAR'	where rollnumber='6204001930';
update dv_dme_data_crpf set candidate_name='YADAV KU BHAVANA SHREE RAJKUMAR'	where rollnumber='7007003654';
update dv_dme_data_crpf set candidate_name='SOLANKI KARANBHAI MADHUBHAI'	where rollnumber='7001042329';
update dv_dme_data_crpf set candidate_name='ASARI SHOBHANABEN JIVAJI'	where rollnumber='7012003226';
update dv_dme_data_crpf set candidate_name='KHARADI KALIBEN LAXMANBHAI'	where rollnumber='7013002344';
update dv_dme_data_crpf set candidate_name='RATHOD SURSINH OTAMSINH'	where rollnumber='7001048313';
update dv_dme_data_crpf set candidate_name='PRAJAPATI HITESHBHAI SOMABHAI'	where rollnumber='7013004498';
update dv_dme_data_crpf set candidate_name='SENAMA DHARMIKKUMAR RAMABHAI'	where rollnumber='7001036844';
update dv_dme_data_crpf set candidate_name='PIPALIYA PRINCE RAJESHBHAI'	where rollnumber='7006023499';
update dv_dme_data_crpf set candidate_name='CHAUHAN GULAM ABDUL GANI'	where rollnumber='7001044824';
update dv_dme_data_crpf set candidate_name='CHAUHAN JITUBHAI POPATJI'	where rollnumber='7001019249';
update dv_dme_data_crpf set candidate_name='BHAMBHANA DHAVALKUMAR PARASOTAM'	where rollnumber='7006002219';
update dv_dme_data_crpf set candidate_name='KALABANDI ANIL KUMAR'	where rollnumber='8003003913';
update dv_dme_data_crpf set candidate_name='ERRAM SAIKUMAR'	where rollnumber='8604009516';
update dv_dme_data_crpf set candidate_name='SHEZAD AHMED'	where rollnumber='1007005783';
update dv_dme_data_crpf set candidate_name='AWAKASH SINGH CHAUHAN'	where rollnumber='5302002100';
update dv_dme_data_crpf set candidate_name='PHAIBA ISAAC S'	where rollnumber='5302004420';
update dv_dme_data_crpf set candidate_name='CHOW PINTIKA LONGNOW'	where rollnumber='5001003558';
update dv_dme_data_crpf set candidate_name='TAYADE AKASH MURLIDHAR'  	where rollnumber='7201029313';
update dv_dme_data_crpf set candidate_name='HUKARE PANKAJ BABLU'	where rollnumber='7205005869';
update dv_dme_data_crpf set candidate_name='ANGOTH LINGANNA'	where rollnumber='8601053044';
update dv_dme_data_crpf set candidate_name='ANDREW SUBBA'	where rollnumber='4001000644';


-------------migrated but not availed reservation-----------------category set UR

select * from dv_dme_data_crpf where rollnumber in ('4410070933','4610012057','4417019189','4415045475');


select a.rollnumber, b.cat1,a.category from 
dv_dme_data_crpf a,candidates_petpst b where  a.rollnumber=b.rollno and a.to_be_considered='Yes'
and a.category in ('OBC','ST','SC','EWS') and b.cat1='9';


create table candidates_107
(slno character varying,
 dateofpetpst character varying,
 rollno character varying,
 NAME character varying,
 FATHERS_NAME character varying,
 OLD_CENTRE character varying,
 court_order character varying,
 gender character varying,
 domicile_state character varying,
 bg_dist character varying,
 dob character varying,
 CATEGORY character varying,
 height_relaxation character varying,
 chest_relaxation character varying,
 height_prev character varying,
 height_new character varying,
 chest_prev_unexpanded character varying,
 chest_prev_expanded character varying,
 prev_expansion character varying,
 chest_new_unexpanded character varying,
 chest_new_expanded character varying,
 new_expansion character varying,
 final_status character varying,
 remarks character varying
);



select a.*,b.* from 
candidates_petpst a
left join dv_dme_data_crpf b on a.rollno=b.rollnumber;

5105019737	Ratul Talukdar
5105071822	Arup Ray
5105054871	Prabhash
5105030515	Kayum Ali
5111000555	Uttam Basfor
5105065296	Naresh
5105076368	Nirab Pratim
5112005256	Tinku Chetry
8603012451	Putti
8604000203	Manchala

-----10 candidates post vacanct------

'5105019737','5105071822','5105054871','5105030515','5111000555','5105065296','5105076368','5112005256','8603012451','8604000203'


'1010003139','3206155308','4404000475','4404001540','4404015095','4410001712','4410005868','4410011259','4410012333','4410013310','4410014946','4410015023','4410016207','4410016296','4410016798','4410017946','4410021979','4410023879','4410024358','4410025456','4410027030','4410027894','4410027899','4410033600','4410034087','4410037094','4410037492','4410039271','4410040421','4410044015','4410044171','4410045688','4410047482','4410048751','4410048979','4410050489','4410059340','4410061553','4410062425','4410062995','4410063454','4410064664','4410065254','4410066551','4410067444','4410073126','4410074518','4410075210','4410076355','4410079525','4410081787','4410083860','4410083871','4410084155','4410088009','4410088835','4410090757','4410092368','4410096044','4410096073','4410096297','4410105273','4410105887','4410108787','4410108810','4410109013','4410109241','4410109410','4410109847','4410112558','4410112597','4410113339','4410113910','4410117998','4410123638','4410124555','4410125044','4410126412','4410127212','4410127773','4410132409','4410132509','4410135628','4410144210','4410144922','4410147156','4410151572','4410153768','4415001304','4415001362','4415002058','4415004320','4415006959','4415007799','4415010893','4415018738','4415024723','4415034440','4415035271','4415037521','4415039395','4415044679','4415046991','4415047871','4415049167','4415053774','4415053884','4417003566','4417003680','5105022952','5105026501','5105084759','8201000747','8201001784','8201001851','8201001887','8201002286','8201003127','8201003731','8201003810','8201004334','8201005076','8201005188','8201005927','8201005947','8201006535','8201006778','8201007196','8201007632','8201008106','8202000577','8202000709','8202000875','8202001635','8202002013','8202003226','8202003288','8204000095','8204000379','8204000447','8204000590','8204000879','8204001008','8204001128','8204001135','8204001692','8204002241','8204003041','8204003263','8204003297','8204003360','8204003490','8204003546','8204003656','8204003671','8204003803','8204004726','8204004785','8204004897','8204005587','8204005845','8204005857','8204006062','8204007545','8204007560','8204007633','8204007658','8204007747','8204007946','8204008745','8204008925','8204009124','8204009693','8204009780','8204009790','8204010052','8204010562','8204010682','8204010973','8204010986','8204011006','8204011052','8204011498','8204012057','8204012794','8204013244','8204014020','8204014700','8204015081','8204017175','8204017368','8204017643','8204017800','8204018548','8204018923','8204019741','8205000274','8205000907','8205000950','8205001174','8205001283','8205001341','8205001466','8205002621','8205003082','8205004231','8205005136','8206000340','8206001433','8206001637','8206001646','8206001689','8206002047','8206002440','8206002772','8206002804','8206003349','8206003589','8206003891','8206004044','8206004809','8206005304','8206006064','8207000205','8207000280','8207000497','8207000661','8207000925','8207001893','8207003318','8207003494','8207003502','8207003742','8207004109','8207004895','8207004918','8207005404','8207005475','8207005623','8207005638','8207005798','8207006322','8207006381','8207006724','8207006841','8207007089','8207007337','8207007552','8207007605','8207007767','8207007930','8207009465','8207009516','8207010271','8207010363','8207010520','8207010549','8207010605','8207010787','8207010915','8207010934','8207010996','8207011136','8207012043','8207012368','8207012520','8207012533','8207012564','8207012693','8207013869','8207014647','8207014850','8207014991','8207015080','8207015479','8207015504','8207015599','8208000802','8208000948','8208001199','8208001831','8208002165','8208002537','8208002583','8208002875','8208003235','8208004442','8208004492','8208005314','8208005892','8208006438','8208006717','8208007897','8208008120','8208009593','8208010449','8401002089'


----297 duplicate rollnos


select * from candidates_petpst where rollno in ('1010003139','3206155308','4404000475','4404001540','4404015095','4410001712','4410005868','4410011259','4410012333','4410013310','4410014946','4410015023','4410016207','4410016296','4410016798','4410017946','4410021979','4410023879','4410024358','4410025456','4410027030','4410027894','4410027899','4410033600','4410034087','4410037094','4410037492','4410039271','4410040421','4410044015','4410044171','4410045688','4410047482','4410048751','4410048979','4410050489','4410059340','4410061553','4410062425','4410062995','4410063454','4410064664','4410065254','4410066551','4410067444','4410073126','4410074518','4410075210','4410076355','4410079525','4410081787','4410083860','4410083871','4410084155','4410088009','4410088835','4410090757','4410092368','4410096044','4410096073','4410096297','4410105273','4410105887','4410108787','4410108810','4410109013','4410109241','4410109410','4410109847','4410112558','4410112597','4410113339','4410113910','4410117998','4410123638','4410124555','4410125044','4410126412','4410127212','4410127773','4410132409','4410132509','4410135628','4410144210','4410144922','4410147156','4410151572','4410153768','4415001304','4415001362','4415002058','4415004320','4415006959','4415007799','4415010893','4415018738','4415024723','4415034440','4415035271','4415037521','4415039395','4415044679','4415046991','4415047871','4415049167','4415053774','4415053884','4417003566','4417003680','5105022952','5105026501','5105084759','8201000747','8201001784','8201001851','8201001887','8201002286','8201003127','8201003731','8201003810','8201004334','8201005076','8201005188','8201005927','8201005947','8201006535','8201006778','8201007196','8201007632','8201008106','8202000577','8202000709','8202000875','8202001635','8202002013','8202003226','8202003288','8204000095','8204000379','8204000447','8204000590','8204000879','8204001008','8204001128','8204001135','8204001692','8204002241','8204003041','8204003263','8204003297','8204003360','8204003490','8204003546','8204003656','8204003671','8204003803','8204004726','8204004785','8204004897','8204005587','8204005845','8204005857','8204006062','8204007545','8204007560','8204007633','8204007658','8204007747','8204007946','8204008745','8204008925','8204009124','8204009693','8204009780','8204009790','8204010052','8204010562','8204010682','8204010973','8204010986','8204011006','8204011052','8204011498','8204012057','8204012794','8204013244','8204014020','8204014700','8204015081','8204017175','8204017368','8204017643','8204017800','8204018548','8204018923','8204019741','8205000274','8205000907','8205000950','8205001174','8205001283','8205001341','8205001466','8205002621','8205003082','8205004231','8205005136','8206000340','8206001433','8206001637','8206001646','8206001689','8206002047','8206002440','8206002772','8206002804','8206003349','8206003589','8206003891','8206004044','8206004809','8206005304','8206006064','8207000205','8207000280','8207000497','8207000661','8207000925','8207001893','8207003318','8207003494','8207003502','8207003742','8207004109','8207004895','8207004918','8207005404','8207005475','8207005623','8207005638','8207005798','8207006322','8207006381','8207006724','8207006841','8207007089','8207007337','8207007552','8207007605','8207007767','8207007930','8207009465','8207009516','8207010271','8207010363','8207010520','8207010549','8207010605','8207010787','8207010915','8207010934','8207010996','8207011136','8207012043','8207012368','8207012520','8207012533','8207012564','8207012693','8207013869','8207014647','8207014850','8207014991','8207015080','8207015479','8207015504','8207015599','8208000802','8208000948','8208001199','8208001831','8208002165','8208002537','8208002583','8208002875','8208003235','8208004442','8208004492','8208005314','8208005892','8208006438','8208006717','8208007897','8208008120','8208009593','8208010449','8401002089')
order by rollno;

-----------63 court case posts to be kept vacant------------

'4410082061','4410036542','4417016359','4417001744','4417000934','4404014469','4417000723','4410010459','4410030609','4410121205','4410020141','4410079118','4410016017','4410035707','4410078958','4417004786','4415028915','4410057038','4410075155','4410042853','4410138506','4410055722','4410023068','4410101066','4404014997','4410014573','4410107071','4410046955','4410029431','4410042983','4410000724','4410107806','4410071424','4410020497','4410002145','4410124237','4410093162','4410004367','4410044918','4410111866','4410005490','4417019523','4417011263','4410082781','4410013777','4410073546','4410119892','4410037949','4410117471','4410146895','4415053884','4410108787','4415047871','4417017542','4410044171','4410076355','4417003680','4410124555','4415053774','4410081787','4410040421','4410044015','4410017946'



'4207008105','4206004149','4206023417','4205007879','4206021480','4205009021','4207019443','4205005041','4208003779','4207007744','4208003234','4207009621','4207018935','4207001572','4204006737','4208009195','4410140359','4206026380','4206027284','4410139888','4207003800','4205003664','4206023443','4419018583','4206006346','4206027261','4206029338','4410022945','4207022200','4207025262','4204003257','4205038176','4206024958','4206029594','4410054110','4207001040','4410070707','4206002560','4207013621','4206026185','4426002374','4207008916','4419004797','4206013050','4207020068','4207001463','4419012296','4410002121','4207002693','4207029795','4207025645','4207007170','4206002911','4410067147','4205049719','4206005301','4416000417','4206015016','4207011688','4207010599','4207026546','4208001929','4419014657','4426005771','4207026770','4208001994','4205032276','4207004986','4207006364','4207021501','4416000467','4416001820','4207022726','4426009913','4419015543','4205022653','4410108651','4208002783','4205053135','4207006717','4207004568','4207018737','4207018769','4207020020','4419005817','4206002251','4207014018','4207023917','4207017553','4426005300','4207009929','4207022854','4204005444','4205019254','4207004708','4207024540','4206001747','4206029965','4205027551','4208004235','4206002519','4204003742','4208001154','4206014805','4207029171','4206013358','4206018807','4208007869','4207023559','4208008549','4208005465','4426008572','4410122436','4410145156','4410038432','4208000233','4208000534','4207008462','4208000458','4208006558','4208004086','4426009892','4419004086','4419006691','4206001718','4410021833','4419002555','4207003070','4205039785','4207004903','4208000010','4207011419','4206020770','4207003978','4410076105','4207002572','4205038047','4416002455','4204000650','4410081941','4410118743','4419013399','4419014754','4206008448','4206005065','4207013568','4410157783','4416000463','4205046449','4419008990','4207012743','4207017092','4416003236','4207017447','4208003808','4205012130','4410109148','4417008698','4410125713','4206005250','4205020439','4207011885','4206022084','4208001101','4206026162','4205026435','4205009435','4410146068','4417017577','4416007173','4204007974','4206003997','4204006405','4206001375','4416004581','4206022484','4207028114','4206004106','4207027815','4416002496','4206004504','4205045507','4204000737','4208007939','4206004819','4419007842','4204003734','4205022946','4410093867','4206004837','4410133218','4206001731','4206001944','4419009197','4206004906','4207013571','4205028574','4419008515','4419006934','4206018842','4206027854','4206018333','4207015564','4207021024','4205013904','4410078788','4207001999','4416004933','4419011010','4206006103','4206026440','4207024255','4410153872','4207017757','4205061035','4426001103','4426004333','4206009619','4206009855','4207011897','4206008271','4419020131','4205004101','4208005218','4419015676','4208008441','4206012710','4206005055','4206014482','4416001643','4206011248','4206004714','4206003048','4206023915','4416000441','4426005702','4426005748','4207002037','4426007864','4207025273','4207003742','4208003575','4410116850','4206020106','4206020515','4207007040','4206022735','4206016699','4206016954','4426008406','4206018241','4206021681','4206015982','4419012644','4416002381','4207018038','4205026609','4206015478','4207022588','4207007270','4206030292','4417004565','4416006633','4426004189','4204000727','4410059649','4206015130','4206014739','4207021953','4207020253','4207030221','4207022627','4207005913','4207001157','4207010310','4426008302','4207013054','4205013771','4207015201','4206025633','4416005961','4205032512','4208001580','4416005009','4205045288','4204000762','4205023451','4205021820','4205058376','4205022111','4204001360','4205041499','4208006202','4416005969','4416006558','4207007649','4426008612','4205031489','4207023159','4419005818','4419019405','4207023346','4207010934','4410047759','4410081416','4417013149','4419016513','4426000951','4419001160','4419001461','4206014580','4206030475','4205014234','4204003855','4426001773','4206020497','4207013063','4206002731','4419019131','4206013295','4206016363','4206003465','4410029081','4419017453','4419015028','4207012094','4206015552','4207019995','4207021014','4207003523','4416006251','4416001341','4206026781','4207026298','4208009615','4205019592','4207026006','4206017914','4205047661','4206026205','4206024760','4206010436','4206015297','4207007138','4419017134','4208002819','4206002645','4206005482','4206013217','4205017794','4205036156','4419000893','4205028705','4207029478','4205019299','4205005890','4205012583','4205029803','4206019622','4416005569','4419020120','4416005435','4419008535','4416000839','4206028176','4207016855','4205037445','4205029163','4417020114','4206004918','4207007411','4207008838','4205015236','4419008354','4206026830','4206022018','4207014029','4207030179','4207002918','4207018801','4208006024','4419002180','4204007323','4206004900','4206004381','4205035343','4204000158','4417020034','4419017584','4207019121','4426001608','4419011212','4207023408','4206019490','4417020150','4208000174','4206004772','4416001811','4205027349','4206005941','4208007485','4208009540','4419017332','4207028686','4208008398','4206009746','4205030877','4207023086','4207027456','4416006735','4207029807','4206028611','4206013793','4207028004','4419006348','4208001304','4417013620','4426009820','4410040082','4416003142','4208008059','4416006502','4206030315','4208002882','4419001279','4426005759','4207021105','4426004051','4207014151','4206026122','4419006677','4206001990','4205032166','4206023011','4208003925','4419014382','4419019627','4410154004','4208000207','4206009424','4416001982'



create table candidates as
(select a."registrationNo",a.rollno,a."emailId",a."phoneNo",a.name,a."newName",a."fathersName",a."mothersName",a.dob,a.gender as gender_app,a.category as category_app,
a."isNccCertificateHolder" as ncc_holder_app,a."nccCertificateType" as ncc_type_app,a."domicileState" as domicile_state_app,a."domicileDistrict" as domicile_dist_app,
a."isMigratedFromOrigin",a."wantsReservationFromOrigin",a."stateOfOrigin" as state_origin_app, a."districtOfOrigin" as dist_origin_app,
a."isEsm",a."dojOfEsm",a."dodOfEsm",a."lengthOfService" as length_of_service_app,a."isCivilPost" as is_civil_post_app, a.cat1 as cat1_app,a.cat2 as cat2_app,a.cat3,a.exs_reservation,
a.arc_code,a.statecode_considered as statecode_considered_app,a.statename_considered as statename_considered_app, a.districtcode_considered as districtcode_considered_app,
a.districtname_considered as districtname_considered_app,a.naxal_district as naxal_district_app,a.border_district as border_district_app,
a.parta_gi,a.partb_ga,a.partc_maths,a.partd_eng_hin,a.score,a.normalized_score,a.ncc_marks as ncc_marks_app,a.total_marks,a.rej_prov,a.debarred,
a.pet_status,a.pst_height,a.pst_chest_not_expanded,a.pst_chest_expanded,a.pst_weight,a.final_pet_pst_status,a.final_remarks,a.ht_rlx_code,a.chst_rlx_code,a.rejection_provision,
a.height_relax,a.chest_relax,a.height_chest_relax,a.post_preference ,b.*
from candidates_petpst a left join dv_dme_data_crpf b
on a.rollno=b.rollnumber);


---------102 rme under process---- seats to be kept vacant if making in merit

'4208003234','4207018935','4206006346','4204003257','4205038176','4206002560','4206002911','4205049719','4426005771','4207004568','4206002251','4207009929','4205019254','4206001747','4204003742','4206018807','4208008549','4410122436','4410038432','4205039785','4205038047','4416002455','4419013399','4419014754','4206005065','4205046449','4410109148','4410125713','4206005250','4205020439','4410146068','4417017577','4206022484','4204000737','4204003734','4207021024','4206026440','4207024255','4206009619','4208008441','4206014482','4206004714','4206016699','4206016954','4206021681','4207022588','4205013771','4205045288','4205058376','4205041499','4208006202','4419001160','4206002731','4205047661','4206015297','4207007138','4206002645','4206005482','4419000893','4205028705','4205019299','4205005890','4205012583','4206019622','4205037445','4205029163','4417020114','4206004918','4206022018','4205035343','4419017584','4206005941','4208007485','4207028686','4206009746','4205030877','4426009820','4206001990','4205032166','4207020020','4207008838','4208001154','4206014805','4208007869','4208000207','4207011419','4410118743','4417013149','4207007170','4417013620','4208003575','4207014029','4419020131','4207019121','4419008535','4419020120','4416004933','4419008354','4208000458','4208004086','4416003236','4410076105'


update candidates
set 
to_be_considered='Yes',
remarks='RME under process of 102 candidates, seats to kept vacant'
where rollno in ('4208003234','4207018935','4206006346','4204003257','4205038176','4206002560','4206002911','4205049719','4426005771','4207004568','4206002251','4207009929','4205019254','4206001747','4204003742','4206018807','4208008549','4410122436','4410038432','4205039785','4205038047','4416002455','4419013399','4419014754','4206005065','4205046449','4410109148','4410125713','4206005250','4205020439','4410146068','4417017577','4206022484','4204000737','4204003734','4207021024','4206026440','4207024255','4206009619','4208008441','4206014482','4206004714','4206016699','4206016954','4206021681','4207022588','4205013771','4205045288','4205058376','4205041499','4208006202','4419001160','4206002731','4205047661','4206015297','4207007138','4206002645','4206005482','4419000893','4205028705','4205019299','4205005890','4205012583','4206019622','4205037445','4205029163','4417020114','4206004918','4206022018','4205035343','4419017584','4206005941','4208007485','4207028686','4206009746','4205030877','4426009820','4206001990','4205032166','4207020020','4207008838','4208001154','4206014805','4208007869','4208000207','4207011419','4410118743','4417013149','4207007170','4417013620','4208003575','4207014029','4419020131','4207019121','4419008535','4419020120','4416004933','4419008354','4208000458','4208004086','4416003236','4410076105');

create table rme_underprocess_102
(regno character varying,
rollno character varying,
rme_medical_status character varying,
 final_rme_status character varying,
 final_rme_remarks character varying,
 to_be_considered character varying
);

select * from rme_underprocess_102;

update candidates a
set a.rme_medical_status=b.rme_medical_status,
a.final_rme_status=b.final_rme_status,
a.final_rme_remarks=b.final_rme_remarks,
a.to_be_considered=b.to_be_considered
from rme_underprocess_102 b
where a."registrationNo"=b.regno;


update candidates set cat1='1' where cat1='SC';----17732
update candidates set cat1='2' where cat1='ST';----12419
update candidates set cat1='6' where cat1='OBC';----37473
update candidates set cat1='0' where cat1='EWS';----10669
update candidates set cat1='9' where cat1='UR';----10997

UPDATE candidates set cat2='3' where whether_ex_serviceman='TRUE';---623

--------NCC MARKS------

update candidates set ncc_marks_new='8' where type_of_ncc_certificate='NCC ''C'' Certificate';---4283
update candidates set ncc_marks_new='4.8' where type_of_ncc_certificate='NCC ''B'' Certificate';---2804
update candidates set ncc_marks_new='3.2' where type_of_ncc_certificate='NCC ''A'' Certificate';---1925

------5 Court case candidates revised pet/pst result-------

Update candidates 
set to_be_considered='Yes',
rejection_provision='Q',
candidate_name=name,
remarks='5 Court case candidates revised pet_pst result',
cat1=cat1_app,
cat2=cat2_app,
age_relaxation_code=arc_code,
date_of_birth=dob,
ncc_certificate_holder=ncc_holder_app,
type_of_ncc_certificate=ncc_type_app,
state_ut_considered=statename_considered_app,
district_considered=districtname_considered_app
where rollno in ('3206155308','1010003139','5105022952','5105026501','5105084759');

----------6 Court case candidates whose post to be kept vaanct --------

select * from candidates where rollnumber in('1004035515','4604032377','4601004857','1007014701','5501007875','7201001218');

Update candidates 
set to_be_considered='Yes',
rejection_provision='Q',
candidate_name=name,
remarks='6 Court case candidates post to be kept vacant',
cat1=cat1_app,
cat2=cat2_app,
age_relaxation_code=arc_code,
date_of_birth=dob,
ncc_certificate_holder=ncc_holder_app,
type_of_ncc_certificate=ncc_type_app,
state_ut_considered=statename_considered_app,
district_considered=districtname_considered_app
where "registrationNo" in ('10019139388','10014417968');------2 candidate details from Application

Update candidates 
set to_be_considered='Yes',
rejection_provision='Q',
remarks='6 Court case candidates post to be kept vacant'
where rollnumber in('1004035515','1007014701','5501007875','7201001218');----4 candidates dv done

post pref for "4604032377"	"SANKAR MOHANTY" updated from tier1 
{B,D,C,E,F,A,H,G}


----------10 candidates post to be kept vacant----------

5111000555 BISHAL SINGHA----already dv done and found FIT

Update candidates 
set to_be_considered='Yes',
rejection_provision='Q',
rollnumber=rollno,
candidate_name=name,
remarks='10 Court case candidates post to be kept vacant',
cat1=cat1_app,
cat2=cat2_app,
age_relaxation_code=arc_code,
date_of_birth=dob,
ncc_certificate_holder=ncc_holder_app,
type_of_ncc_certificate=ncc_type_app,
state_ut_considered=statename_considered_app,
district_considered=districtname_considered_app
where rollno in
('5105019737','5105071822','5105054871','5105030515','5105065296','5105076368','5112005256','8603012451','8604000203');----9 candidates details updated from Application


------ 63 court case candidates posts to be kept vacanct--------------

select * from candidates where rollnumber in 
('4410082061','4410036542','4417016359','4417001744','4417000934','4404014469','4417000723','4410010459','4410030609','4410121205','4410020141','4410079118','4410016017','4410035707','4410078958','4417004786','4415028915','4410057038','4410075155','4410042853','4410138506','4410055722','4410023068','4410101066','4404014997','4410014573','4410107071','4410046955','4410029431','4410042983','4410000724','4410107806','4410071424','4410020497','4410002145','4410124237','4410093162','4410004367','4410044918','4410111866','4410005490','4417019523','4417011263','4410082781','4410013777','4410073546','4410119892','4410037949','4410117471','4410146895','4415053884','4410108787','4415047871','4417017542','4410044171','4410076355','4417003680','4410124555','4415053774','4410081787','4410040421','4410044015','4410017946');

Update candidates 
set to_be_considered='Yes',
rejection_provision='Q',
rollnumber=rollno,
candidate_name=name,
remarks='63 Court case candidates post to be kept vacant',
cat1=cat1_app,
cat2=cat2_app,
age_relaxation_code=arc_code,
date_of_birth=dob,
ncc_certificate_holder=ncc_holder_app,
type_of_ncc_certificate=ncc_type_app,
state_ut_considered=statename_considered_app,
district_considered=districtname_considered_app
where rollno in
('4410082061','4410036542','4417016359','4417001744','4417000934','4404014469','4417000723','4410010459','4410030609','4410121205','4410020141','4410079118','4410016017','4410035707','4410078958','4417004786','4415028915','4410057038','4410075155','4410042853','4410138506','4410055722','4410023068','4410101066','4404014997','4410014573','4410107071','4410046955','4410029431','4410042983','4410000724','4410107806','4410071424','4410020497','4410002145','4410124237','4410093162','4410004367','4410044918','4410111866','4410005490','4417019523','4417011263','4410082781','4410013777','4410073546','4410119892','4410037949','4410117471','4410146895','4415053884','4410108787','4415047871','4417017542','4410044171','4410076355','4417003680','4410124555','4415053774','4410081787','4410040421','4410044015','4410017946');

ncc marks updated accordingly.

-------- 1 additional candidate post to be kept vacant---------

update candidates
set to_be_considered='Yes',
rejection_provision='Q',
remarks='1 additional Court case candidate post to be kept vacant'
where rollnumber in ('5601010713');

---------83 qualified in pet/pst out of 185 candidates in revised result ------------

'8201001784','8201001851','8201002286','8201003127','8201003810','8201004334','8201005076','8201005188','8201005947','8201006535','8201006778','8204000447','8204000879','8204001128','8204001692','8204003041','8204003297','8204003360','8204003656','8204003803','8204004726','8204005845','8204005857','8204006062','8204007560','8204007633','8204007747','8204008745','8204008925','8204009780','8204009790','8204010682','8204011052','8204013244','8204014020','8204014700','8204015081','8204017368','8204017643','8204017800','8204018923','8204019741','8205000274','8205000907','8205001174','8205002621','8205003082','8206001637','8206001689','8206002047','8206004044','8206005304','8207000280','8207000661','8207000925','8207003502','8207005404','8207005623','8207006322','8207009465','8207009516','8207010271','8207010520','8207010915','8207010934','8207012043','8207012368','8207012520','8207012533','8207014850','8207015080','8207015479','8207015504','8208000802','8208000948','8208001831','8208002165','8208003235','8208004442','8208005314','8208006717','8208009593','8208010449'

Update candidates 
set to_be_considered='Yes',
rejection_provision='Q',
final_pet_pst_status='Qualified',
rollnumber=rollno,
candidate_name=name,
remarks='83 candidates qualified out of 185 in revised pet/pst',
cat1=cat1_app,
cat2=cat2_app,
age_relaxation_code=arc_code,
date_of_birth=dob,
ncc_certificate_holder=ncc_holder_app,
type_of_ncc_certificate=ncc_type_app,
state_ut_considered=statename_considered_app,
district_considered=districtname_considered_app
where rollno in ('8201001784','8201001851','8201002286','8201003127','8201003810','8201004334','8201005076','8201005188','8201005947','8201006535','8201006778','8204000447','8204000879','8204001128','8204001692','8204003041','8204003297','8204003360','8204003656','8204003803','8204004726','8204005845','8204005857','8204006062','8204007560','8204007633','8204007747','8204008745','8204008925','8204009780','8204009790','8204010682','8204011052','8204013244','8204014020','8204014700','8204015081','8204017368','8204017643','8204017800','8204018923','8204019741','8205000274','8205000907','8205001174','8205002621','8205003082','8206001637','8206001689','8206002047','8206004044','8206005304','8207000280','8207000661','8207000925','8207003502','8207005404','8207005623','8207006322','8207009465','8207009516','8207010271','8207010520','8207010915','8207010934','8207012043','8207012368','8207012520','8207012533','8207014850','8207015080','8207015479','8207015504','8208000802','8208000948','8208001831','8208002165','8208003235','8208004442','8208005314','8208006717','8208009593','8208010449');

ncc marks updated accordingly.

update candidates set ncc_marks_new='8' where type_of_ncc_certificate='NCC ''C'' Certificate' and rollno in ('8201001784','8201001851','8201002286','8201003127','8201003810','8201004334','8201005076','8201005188','8201005947','8201006535','8201006778','8204000447','8204000879','8204001128','8204001692','8204003041','8204003297','8204003360','8204003656','8204003803','8204004726','8204005845','8204005857','8204006062','8204007560','8204007633','8204007747','8204008745','8204008925','8204009780','8204009790','8204010682','8204011052','8204013244','8204014020','8204014700','8204015081','8204017368','8204017643','8204017800','8204018923','8204019741','8205000274','8205000907','8205001174','8205002621','8205003082','8206001637','8206001689','8206002047','8206004044','8206005304','8207000280','8207000661','8207000925','8207003502','8207005404','8207005623','8207006322','8207009465','8207009516','8207010271','8207010520','8207010915','8207010934','8207012043','8207012368','8207012520','8207012533','8207014850','8207015080','8207015479','8207015504','8208000802','8208000948','8208001831','8208002165','8208003235','8208004442','8208005314','8208006717','8208009593','8208010449');
update candidates set ncc_marks_new='4.8' where type_of_ncc_certificate='NCC ''B'' Certificate' and rollno in ('8201001784','8201001851','8201002286','8201003127','8201003810','8201004334','8201005076','8201005188','8201005947','8201006535','8201006778','8204000447','8204000879','8204001128','8204001692','8204003041','8204003297','8204003360','8204003656','8204003803','8204004726','8204005845','8204005857','8204006062','8204007560','8204007633','8204007747','8204008745','8204008925','8204009780','8204009790','8204010682','8204011052','8204013244','8204014020','8204014700','8204015081','8204017368','8204017643','8204017800','8204018923','8204019741','8205000274','8205000907','8205001174','8205002621','8205003082','8206001637','8206001689','8206002047','8206004044','8206005304','8207000280','8207000661','8207000925','8207003502','8207005404','8207005623','8207006322','8207009465','8207009516','8207010271','8207010520','8207010915','8207010934','8207012043','8207012368','8207012520','8207012533','8207014850','8207015080','8207015479','8207015504','8208000802','8208000948','8208001831','8208002165','8208003235','8208004442','8208005314','8208006717','8208009593','8208010449');
update candidates set ncc_marks_new='3.2' where type_of_ncc_certificate='NCC ''A'' Certificate' and rollno in ('8201001784','8201001851','8201002286','8201003127','8201003810','8201004334','8201005076','8201005188','8201005947','8201006535','8201006778','8204000447','8204000879','8204001128','8204001692','8204003041','8204003297','8204003360','8204003656','8204003803','8204004726','8204005845','8204005857','8204006062','8204007560','8204007633','8204007747','8204008745','8204008925','8204009780','8204009790','8204010682','8204011052','8204013244','8204014020','8204014700','8204015081','8204017368','8204017643','8204017800','8204018923','8204019741','8205000274','8205000907','8205001174','8205002621','8205003082','8206001637','8206001689','8206002047','8206004044','8206005304','8207000280','8207000661','8207000925','8207003502','8207005404','8207005623','8207006322','8207009465','8207009516','8207010271','8207010520','8207010915','8207010934','8207012043','8207012368','8207012520','8207012533','8207014850','8207015080','8207015479','8207015504','8208000802','8208000948','8208001831','8208002165','8208003235','8208004442','8208005314','8208006717','8208009593','8208010449');

-----------42 qualified in pet/pst out of 107 candidates in revised result ----------------

'4410048751','4410112558','4410025456','4410090757','4415001304','4417003566','4410061553','4410027894','4410079525','4410001712','4410039271','4410109410','4410062995','4410088835','4410113910','4410015023','4410096044','4410092368','4410074518','4410132509','4415035271','4415049167','4415039395','4415044679','4404000475','4415007799','4410047482','4410045688','4410037094','4410084155','4410050489','4410105887','4410083860','4410073126','4410048979','4410023879','4410144210','4410088009','4415006959','4410066551','4410062425','4410034087'

Update candidates 
set to_be_considered='Yes',
rejection_provision='Q',
final_pet_pst_status='Qualified',
rollnumber=rollno,
candidate_name=name,
remarks='42 candidates qualified out of 107 in revised pet/pst',
cat1=cat1_app,
cat2=cat2_app,
age_relaxation_code=arc_code,
date_of_birth=dob,
ncc_certificate_holder=ncc_holder_app,
type_of_ncc_certificate=ncc_type_app,
state_ut_considered=statename_considered_app,
district_considered=districtname_considered_app
where rollno in ('4410048751','4410112558','4410025456','4410090757','4415001304','4417003566','4410061553','4410027894','4410079525','4410001712','4410039271','4410109410','4410062995','4410088835','4410113910','4410015023','4410096044','4410092368','4410074518','4410132509','4415035271','4415049167','4415039395','4415044679','4404000475','4415007799','4410047482','4410045688','4410037094','4410084155','4410050489','4410105887','4410083860','4410073126','4410048979','4410023879','4410144210','4410088009','4415006959','4410066551','4410062425','4410034087');


-------------JHARKHAND ON HOLD PROCESSING 2729 CANDIDATES----------------------------------

update candidates
set
to_be_considered='On Hold',
remarks='Jharkhand state on hold result processing',
rollnumber=rollno
where rollno in ('4205028442','4205035575','4205013799','4205047913','4205063906','4205041499','4205052321','4205022111','4205039817','4205056330','4205058376','4205020333','4205047039','4205038868','4205028949','4205035559','4205030992','4205010635','4205016188','4205007228','4205021820','4205047661','4205026252','4205003073','4205023451','4205045288','4205032512','4205013771','4205054432','4205033193','4205047829','4205061538','4205049580','4205060225','4205063214','4205005547','4205007879','4205016806','4205058479','4205022420','4205018067','4205055838','4205019699','4205050554','4205043924','4205026609','4205054997','4205024140','4205009021','4205030769','4205021165','4205013491','4205008462','4205063597','4205012845','4205003133','4205026273','4205056257','4205000554','4205006265','4205003700','4205005041','4205058181','4205009689','4205006751','4205035855','4205058216','4205001800','4205017021','4205005765','4205007909','4205031003','4205004425','4205004101','4205050487','4205012774','4205022659','4205013578','4205038006','4205018287','4205013222','4205007327','4205003942','4205016401','4205017587','4205055490','4205053485','4205001304','4205062519','4205052212','4205001246','4205014234','4205005476','4205043139','4205050904','4205060639','4205016256','4205008226','4205039848','4205033808','4205009891','4205013904','4205009906','4205044503','4205036156','4205028574','4205029568','4205030937','4205021153','4205029803','4205034260','4205030174','4205054108','4205032276','4205025675','4205000411','4205054587','4205026752','4205042984','4205035823','4205061365','4205004933','4205062361','4205009435','4205064392','4205064921','4205005890','4205010846','4205009214','4205005963','4205012244','4205012178','4205017794','4205012130','4205016015','4205012620','4205002155','4205019299','4205028705','4205000309','4205012687','4205017669','4205010536','4205012583','4205014469','4205056584','4205039152','4205046449','4205049635','4205009991','4205002518','4205006310','4205005532','4205003192','4205054272','4205038047','4205010925','4205037451','4205037445','4205042280','4205042793','4205022777','4205024086','4205036571','4205039245','4205034993','4205039785','4205042553','4205043847','4205043199','4205042570','4205010406','4205003664','4205017533','4205017116','4205060902','4205032166','4205029495','4205024616','4205040801','4205012216','4205001120','4205000514','4205043390','4205041635','4205041551','4205038809','4205058372','4205012927','4205051042','4205053710','4205002042','4205019882','4205009620','4205015236','4205008497','4205012928','4205019254','4205062953','4205052317','4205051688','4205019671','4205037610','4205036188','4205040547','4205050322','4205033024','4205002328','4205007221','4205035343','4205011051','4205049224','4205046343','4205048127','4205012434','4205031445','4205028924','4205025551','4205022653','4205021028','4205045461','4205064562','4205006710','4205058202','4205052369','4205000549','4205000757','4205060476','4205049719','4205054158','4205061591','4205014648','4205011132','4205017577','4205013325','4205016582','4205016946','4205015132','4205038176','4205006108','4205009058','4205005758','4205005347','4207003488','4204005735','4207007138','4206012825','4207008105','4206008934','4206004149','4204009922','4410154959','4206021769','4207026688','4204006870','4207008397','4206009734','4410085735','4204006620','4204009700','4204001643','4204001360','4204006222','4205064629','4205008902','4207010496','4206011601','4207005875','4207011014','4419006090','4204005853','4205031646','4204001423','4206009955','4204004487','4204000946','4204002473','4205013639','4205016146','4204009618','4204000951','4205021300','4205029938','4206000707','4410159222','4204000762','4206011535','4207010573','4206008875','4206021480','4206011484','4204003539','4206016886','4206018885','4206020718','4206024173','4206026969','4204005301','4207002803','4204002376','4204002350','4204006198','4207007465','4204007313','4204000727','4206015329','4206015613','4206010436','4206012619','4206012314','4419011457','4206010070','4206011692','4207006401','4206009424','4207027188','4206009641','4206011302','4206022255','4206022224','4206021551','4206020269','4206015297','4206021435','4206019882','4208003779','4207007744','4206017140','4419017134','4206016404','4426000948','4208007712','4419015457','4419020001','4207022588','4204000258','4208003234','4208002525','4208001980','4204006704','4410013756','4410021376','4207018405','4426002902','4206021787','4207018935','4410101429','4207020894','4207016321','4410028509','4419017848','4419010267','4419017453','4206015478','4206017854','4419015609','4419019102','4207012559','4207013754','4204000912','4207014430','4207030225','4207028686','4204006737','4208000580','4208004136','4208006079','4410117633','4419014590','4208006202','4419008932','4410028897','4426009611','4419017174','4410046023','4426008444','4419013444','4410029081','4204003966','4410140359','4208009195','4206015552','4416006783','4206014085','4417013455','4419008087','4419007141','4419009102','4417015761','4416007993','4416005736','4416006929','4204007208','4419000944','4410139888','4206010719','4204004605','4204000111','4417011953','4419012644','4419013287','4206005436','4206008817','4206013217','4206013087','4206015904','4206015982','4206021912','4426001917','4206013793','4206009336','4206008784','4205049974','4206022472','4206021681','4206021496','4206021329','4416004056','4206021323','4204005017','4416004245','4206018493','4419019822','4410075949','4419003033','4204004604','4204003459','4204002806','4206018241','4206005180','4426006055','4204005394','4206018197','4206018178','4206017948','4419000893','4206017822','4419019811','4419018583','4206017795','4419018492','4206017656','4206017454','4206006346','4419015171','4206017385','4205012642','4205037763','4206017362','4206017316','4205011383','4205007558','4206017109','4206016954','4206016699','4206006805','4206016616','4206016520','4204008100','4206016363','4204007401','4204007362','4207015458','4206008202','4206022870','4204007073','4204005555','4206022735','4206022698','4206022024','4206022297','4416005447','4206022059','4410022945','4206021658','4205047202','4206005482','4206021002','4206020989','4206020984','4207001331','4204005540','4206020683','4206002731','4206020515','4204005444','4206020468','4206021149','4206020106','4206019466','4206019214','4206019118','4206019069','4206019017','4208006737','4206022695','4206019240','4206002916','4206018999','4206018765','4206020845','4206018701','4206005837','4206005901','4206003465','4206003074','4206002586','4204003257','4206002645','4206003305','4204002996','4206003204','4204004642','4206003048','4206004714','4206016931','4204009081','4206011248','4206025092','4206011035','4206021846','4206010957','4206010819','4206010352','4206010313','4206010189','4206010110','4207028851','4208007026','4206015178','4206015121','4206015016','4419010407','4416001643','4207001723','4207003635','4206014834','4208001521','4206014482','4206005753','4206014320','4207011558','4206014221','4410118635','4205012856','4410059649','4206013983','4416001884','4206005127','4207026756','4410054110','4206013539','4410116455','4206012965','4206005055','4206001303','4410132958','4416001203','4206012710','4208008441','4416001341','4206021961','4208005218','4206021863','4208005325','4410115704','4204004061','4206007557','4206008537','4206012288','4410070707','4206002560','4206012248','4206011982','4207013621','4206011880','4206008271','4206011704','4205014314','4206009736','4206010016','4205025235','4206009855','4205043431','4205053814','4206000467','4206009635','4206009619','4206009600','4205018666','4205021167','4207023338','4205018896','4206001519','4205022975','4206008463','4206009503','4206008407','4206007947','4206007594','4206017281','4206021504','4206005323','4205041209','4205031582','4206009194','4206022270','4207000572','4205045919','4206026185','4205061731','4205056531','4206012694','4204008800','4206002057','4206002779','4206001563','4206011328','4206003689','4206004396','4206026453','4206021403','4207014863','4206017736','4206011480','4419001179','4206018343','4206002277','4206017412','4206000713','4205061035','4205042696','4206018156','4206019622','4206017500','4206008433','4204006777','4206019743','4205002086','4207018482','4207002058','4206015019','4206014912','4207024255','4207016855','4206011516','4206002589','4207022103','4206011000','4206010944','4207008961','4207012533','4207010079','4206011694','4206012446','4206013050','4419017022','4206020792','4206013823','4206026440','4206001992','4206004472','4206003572','4207022810','4207024067','4419011872','4207022227','4207014992','4206010823','4206006103','4206008429','4206008239','4206008151','4206007513','4206007234','4206008780','4206008686','4206008502','4206006894','4206006831','4206006786','4204002884','4419012296','4206006654','4206006453','4206006368','4410002121','4205049368','4206001537','4206005877','4206005843','4207021643','4207021024','4207029795','4207015564','4206003126','4206018333','4204005704','4206026566','4206018842','4206007096','4206003758','4207020111','4206005585','4208006855','4206005354','4206027457','4207002788','4204006683','4207003913','4207019218','4206008080','4206026577','4206026758','4206025932','4206030037','4206027061','4204009089','4207007822','4206005477','4207013571','4206004918','4206011264','4206009137','4206014270','4205047771','4206002911','4419000120','4206021722','4206004906','4206004900','4206002392','4410067147','4206012497','4206002314','4206002232','4206014504','4206002062','4206002013','4206001990','4207015442','4206001944','4206001856','4206001834','4207003176','4206001731','4206004837','4206005301','4204003734','4205005022','4204003483','4204003964','4207025248','4204003958','4206002744','4419012363','4204003723','4204003357','4205013610','4419007842','4205011935','4206018739','4205031107','4205016647','4206004819','4206013042','4206000570','4419014890','4205055945','4206004806','4205050627','4205055789','4204000158','4205054067','4419000953','4426007648','4426003335','4205029163','4426000415','4204002132','4204002261','4204000737','4206012138','4206004836','4419013755','4419015316','4205057057','4206014714','4419001160','4206000037','4205017540','4206017397','4426005771','4205000318','4206000034','4205064083','4206004504','4206023765','4204007323','4205062817','4206000288','4417020114','4206012525','4204005621','4206019687','4205034315','4206012502','4205032537','4206004381','4206000275','4206014679','4206010790','4419012665','4206004106','4206022484','4419008667','4205031089','4206013502','4206016233','4206001375','4204006574','4206018677','4206025411','4204006405','4206013092','4419003892','4419004736','4419000324','4206003997','4419004347','4419002839','4206004648','4206022018','4207016010','4205003259','4204008692','4204007974','4206014580','4417017577','4410146068','4206015827','4204004631','4205026435','4206013295','4206026162','4208001101','4206007144','4204004654','4205026638','4206026055','4204007796','4204007561','4204007505','4204007394','4204007388','4205000303','4204010052','4205037802','4204010040','4206024235','4204009795','4206010854','4204009516','4206024827','4419013057','4204007738','4206019547','4206015075','4206015062','4206007227','4204004601','4204004235','4204003914','4205048639','4206003215','4416003489','4206009527','4206004424','4205020439','4206005250','4206010553','4419011834','4410125713','4206018654','4417008698','4426009913','4419015543','4419012232','4419011212','4410109148','4204005508','4208003808','4205036303','4207017447','4205019418','4410150171','4207017092','4206011375','4416006697','4205018814','4204005964','4206027583','4419008046','4204007224','4204000244','4419011680','4419008990','4204009360','4204007799','4206005430','4417007839','4419003539','4426007436','4426006238','4426005579','4426005157','4426003952','4426003789','4426000097','4426002218','4426002082','4206011913','4204002403','4206008844','4206020898','4206027657','4207025719','4205034564','4419012505','4206003987','4419019131','4204007947','4205051995','4419018735','4206023064','4207004976','4206003672','4206028486','4206029441','4205053937','4419017584','4204001472','4204006756','4204002634','4204001777','4206029634','4204002643','4206017338','4207005128','4207005255','4207005706','4207005751','4426009008','4426008995','4419016138','4207006247','4419015491','4206019388','4206019633','4206005065','4206019863','4204006967','4206020345','4204006418','4206021260','4206030188','4207000191','4419015268','4207000461','4419015057','4207001098','4206002339','4206024972','4207002170','4207003525','4207003407','4207003863','4419015028','4205053135','4207025195','4419014606','4419014166','4419013208','4207013516','4204001490','4419014754','4419013399','4206030572','4419011620','4207003929','4206028731','4419009337','4207006717','4206005339','4419004287','4419001935','4419004588','4207006810','4204001325','4207006975','4207007558','4419012984','4207007677','4207007784','4426008405','4207004568','4205049314','4419002111','4204009268','4204001502','4204005061','4426009820','4204000847','4204000817','4204000726','4206015213','4204000650','4204000285','4416006564','4204000606','4416002455','4410160572','4206002166','4206020770','4419005392','4410020314','4208003871','4205038033','4208000994','4208004016','4208000010','4206004956','4205039770','4204004447','4207023683','4205041426','4206001293','4206003437','4416000791','4205017261','4206016839','4206003316','4419005817','4207023310','4410120029','4419005226','4410058176','4206000144','4206002251','4208009247','4207010730','4419003117','4419002562','4206010849','4419002555','4206018173','4419002410','4419001896','4419001613','4419000879','4419000233','4417010475','4417019071','4417001283','4417000958','4417008832','4416007707','4416007558','4204006998','4416006961','4205013637','4205047966','4419006221','4416007272','4207011103','4416007094','4208002074','4207025866','4207009353','4205062013','4207014174','4416006671','4207016362','4416006375','4416006350','4416005239','4419003106','4207016956','4419002545','4419007858','4207017553','4206016097','4419005284','4207017559','4206001626','4206000243','4419003355','4207017993','4207011975','4207011208','4207010418','4207008462','4206016216','4205063942','4207018517','4207018987','4426001299','4204008570','4207020492','4207020534','4410038432','4207020754','4207020764','4208005452','4207021518','4206011083','4410129253','4205053191','4207021552','4207021958','4207017381','4207009929','4207022009','4204006063','4207022105','4207023100','4410100524','4419006336','4410056782','4207026054','4204006464','4207022751','4207022752','4208004110','4416004700','4207022854','4207022771','4204004449','4410151990','4207023287','4410145156','4207023664','4410140231','4410129289','4207024084','4207024767','4207025126','4207027858','4207026162','4207025799','4207026573','4410122436','4207027205','4207027611','4207008509','4410086002','4205032772','4207020900','4206013223','4207009244','4416002780','4207009954','4410126976','4416001197','4410103002','4208001696','4410075792','4410058066','4207012554','4207010581','4419007275','4207011298','4410040845','4206020967','4416001459','4207013555','4207012829','4208001558','4410019015','4410018447','4416005186','4416005126','4416003909','4416003308','4206016575','4416002280','4416003051','4206001536','4419007504','4416001328','4207004708','4207027760','4208009615','4410143857','4208005087','4419007331','4208003647','4208007485','4206005941','4204000966','4205006569','4205059781','4208007912','4208006388','4206001747','4206029965','4208005465','4206027592','4208009146','4208008549','4208008483','4205018090','4204006195','4205006883','4206022666','4207004772','4208003259','4205027349','4208001691','4207006314','4207029673','4206026339','4208000596','4207028575','4206001390','4208000397','4208000022','4207029376','4207029808','4419007345','4206026999','4206001271','4206018807','4419007344','4205030877','4207002565','4205027551','4206009746','4208005584','4206002519','4206004872','4204003742','4206007200','4205055139','4205049605','4205048757','4205046536','4205043510','4205038989','4205031489','4205041422','4205045507','4205053367','4205052293','4205061194','4205056301','4205052478','4205051154','4205054503','4205031799','4205050836','4205050438','4205044556','4205031447','4205031225','4205059205','4205052078','4205055536','4205053773','4205055002','4205064730','4205064460','4205064058','4205062200','4205052349','4205027332','4205027318','4205026929','4205026319','4205014235','4205026052','4205025205','4205019534','4205014961','4205052010','4205021330','4205056282','4205017184','4205015686','4205013621','4205014397','4205031485','4205035236','4205041627','4205041801','4205034934','4205045553','4205044284','4205048339','4205032405','4205034675','4205035537','4205036562','4205058228','4205029817','4205025094','4205026005','4205021908','4205013790','4205022142','4205027406','4205061844','4205013694','4204007201','4206007782','4426001384','4419015581','4206005047','4206026280','4206020497','4207013632','4206029612','4207016680','4207014415','4206029788','4426001773','4206018008','4207005533','4206023173','4207010010','4206018764','4207002918','4204003855','4426005867','4419001461','4207008802','4417008077','4207017499','4416004339','4416003524','4207019088','4416000125','4206023417','4204005927','4410063804','4410026509','4208007580','4208007305','4426000951','4426001779','4419016513','4419018071','4208006010','4417013149','4419003119','4419003211','4419008899','4208001390','4410080640','4410081416','4410061539','4410047759','4410041899','4208008573','4207017970','4208000918','4207029488','4207009861','4206023195','4207015655','4206017731','4207012721','4206020005','4207019443','4206007873','4207029150','4207029478','4207009640','4206021951','4206019515','4207010961','4207023962','4207021559','4207010934','4207023346','4207004853','4207000135','4419019405','4416005772','4419016906','4410055719','4419011449','4419005197','4419005818','4419004787','4419005084','4419002043','4206023721','4207023159','4207016053','4207011560','4206030446','4206010885','4207003585','4206027590','4207005898','4204008127','4426008612','4206016760','4207017168','4206005859','4207016123','4207015186','4207009621','4204009043','4206001773','4207014735','4206013582','4207014669','4207018801','4207001572','4426005974','4206007259','4207012979','4207012906','4207020157','4206023392','4207012647','4207012500','4206024138','4207012396','4207008936','4204006217','4426004503','4207007649','4204007702','4207005805','4204002549','4206023926','4426004250','4204006251','4207007411','4207021728','4206024985','4419015819','4207009471','4419008912','4416005969','4416005569','4416005009','4416005961','4207013063','4207010871','4207003574','4207015201','4207018162','4206026380','4416000564','4206027284','4207009267','4207013054','4207011686','4410082749','4207010801','4207012274','4207015140','4207015957','4206023795','4207007306','4207000094','4419009460','4416003833','4207010310','4207003800','4207000589','4207021757','4207009334','4207001643','4207003080','4206026064','4206028557','4206026735','4207003728','4206025792','4207005262','4207005144','4207005913','4207006559','4207017850','4207006734','4207007429','4206023443','4206026902','4206023035','4206029569','4206022553','4206023133','4206022332','4207028995','4410127128','4206026266','4206025399','4206026205','4206024747','4206024760','4410030524','4419002299','4206025633','4419018384','4206025367','4206030374','4426001626','4206023969','4206026122','4206025413','4206026474','4419010305','4419003642','4207024592','4206029280','4419014382','4426001120','4207021809','4206027261','4206027740','4206015499','4206028603','4206029338','4206014828','4206026365','4206014277','4206011507','4206011649','4206010432','4207021014','4206007697','4426003811','4206026515','4206026939','4206023442','4208009179','4207021953','4206027115','4419015870','4206027639','4206007080','4206006933','4206006204','4207009613','4207025257','4206005967','4206005376','4206014829','4206014739','4207022200','4206015130','4207025262','4204000315','4426004189','4208007601','4416006251','4207027456','4416006364','4206026819','4416006670','4416006633','4417004565','4416004615','4206029921','4416004505','4419001306','4417013620','4206023482','4206026791','4206026781','4206025432','4206030231','4206025803','4410143017','4207028848','4206027265','4207022566','4206028073','4206028359','4206030292','4206024961','4206025263','4206025686','4206026088','4206025078','4207010159','4207008653','4206026285','4206027303','4206025801','4206025699','4207009587','4206025966','4206024958','4207007361','4207007270','4207000334','4206030422','4207001780','4419015313','4416001992','4206030315','4206029465','4416002013','4206029594','4416001919','4416001982','4206030324','4207027281','4207026006','4416005750','4419003294','4207009210','4208001649','4416005524','4416000062','4207014549','4207005200','4416002381','4208000156','4416004440','4204008803','4207025474','4205016121','4207001040','4205030696','4206000210','4206019812','4206000766','4205050672','4207028697','4206019094','4207029459','4207015483','4207009068','4206017498','4416006028','4206019259','4419005140','4206017540','4410047664','4207015927','4426008964','4426008834','4207000976','4207022782','4426008724','4207005290','4426008721','4426008511','4426008406','4426008156','4207000795','4208001686','4426006837','4426006242','4419019958','4207010040','4207007040','4207006536','4419015721','4207008444','4207011576','4207011265','4416001923','4416000446','4410067027','4410116850','4410113615','4410100335','4207004652','4419010930','4208003575','4419012405','4207003742','4207024218','4410126033','4208005298','4207025512','4207003523','4207002246','4207002037','4426006182','4206029616','4206029498','4206019851','4207004885','4206019084','4426005759','4426005748','4426005702','4426005509','4426005115','4426004627','4207003014','4410020342','4426002374','4426004548','4207008916','4426004434','4410154004','4426002457','4208001683','4426004039','4207005522','4426003464','4206023915','4206025626','4206024890','4206024332','4206024167','4206024553','4206027586','4206027462','4206023239','4419015291','4206028176','4207004086','4416003142','4419015991','4426002001','4419014320','4419014325','4416004503','4419014427','4419014712','4419014714','4419015676','4208001858','4207020068','4419016528','4207025643','4419001701','4426001829','4207001107','4207001132','4419013565','4207001148','4207001234','4426001427','4207002354','4410155041','4207001463','4208006774','4207001476','4419019627','4207001600','4419011909','4207008429','4207002304','4419020025','4426000029','4207002660','4207002661','4208006088','4207002693','4207002883','4410097654','4207029811','4208007454','4419020131','4207025645','4206030475','4208006024','4410071951','4207011897','4419002180','4204002301','4206019694','4206030333','4426005815','4206030558','4207025957','4426009031','4206030587','4207000330','4206030635','4207000698','4207023446','4207000885','4206014529','4426009578','4419016174','4426004333','4207007170','4410158438','4208001884','4419008812','4419008535','4207020253','4419008136','4416000839','4426009806','4207008200','4419013128','4410117627','4207011293','4426001610','4419020120','4419019285','4419005163','4426001417','4207008373','4204002038','4207012598','4426000146','4207026166','4416005005','4426000381','4204007679','4426001103','4207020408','4426001125','4204007286','4204001881','4416000417','4207013456','4204003095','4204001333','4419013860','4426004243','4426008569','4207011542','4207011688','4207011739','4207012340','4207012461','4207012094','4204000291','4207012880','4419016405','4419015203','4207010728','4419014841','4207010933','4207010588','4426009082','4207010599','4207026546','4419014031','4419016206','4208001929','4419016474','4419014763','4426003926','4207020353','4207026569','4419014387','4207016592','4419016642','4207017420','4207021549','4419002036','4419016838','4419017004','4419017088','4207017939','4419017276','4419017368','4207026710','4426004051','4419001984','4419017820','4419017827','4207019475','4207013099','4410153872','4207022708','4419017988','4419018288','4207019995','4206020048','4207020670','4419018675','4207026770','4419018929','4419019158','4419016610','4416000933','4419001308','4419017094','4419018933','4419000182','4417020150','4419019178','4208001994','4419016830','4417020034','4207004986','4207006364','4419017265','4207005693','4207006879','4207020505','4416007084','4207007135','4416006935','4207007912','4206024468','4416005818','4207007936','4207008198','4207006157','4204002496','4207006162','4416005435','4419018709','4206020677','4207007543','4419012889','4419012793','4419012792','4419012495','4419009638','4207018912','4207007550','4419012323','4419011785','4207007846','4419011010','4419011905','4206001452','4419011940','4419009454','4204000719','4416004933','4207001999','4208005135','4410045567','4416000829','4410151519','4416005514','4410078788','4410056801','4206025937','4419011248','4426007617','4419004559','4410135892','4208002045','4206027854','4410028971','4419009827','4419009493','4207022726','4419005917','4419006677','4419006707','4208000354','4419006740','4207016986','4207008838','4419006934','4419007752','4419008181','4419008191','4207026923','4207008478','4419008415','4419008515','4419008583','4207022892','4208008950','4208002294','4419009153','4207025263','4419006323','4426005316','4419007251','4207015300','4417013044','4419003520','4419008258','4419008354','4207014029','4419009197','4410133218','4419002722','4410093867','4419009306','4419001279','4416004172','4426003639','4410041402','4207027065','4416003761','4419002808','4419003269','4426003109','4416002885','4208004238','4416002604','4416002507','4207023913','4416001957','4416001925','4416001566','4208007939','4208001580','4426002695','4416002496','4207016804','4416001501','4416000887','4207014813','4206030466','4207017594','4207026328','4416000767','4207022208','4207023535','4207027259','4208002783','4207028020','4410159982','4207027815','4207028895','4410145568','4410032921','4207021105','4206026830','4207014151','4416005943','4416005838','4416005143','4416005740','4416000991','4416005129','4207021108','4416005109','4416005070','4416005033','4207029042','4416004581','4416007821','4416007548','4416006828','4416006852','4416007992','4207002165','4206030123','4416007173','4419007951','4207007260','4207026298','4416001026','4416004404','4206021122','4416007691','4207028939','4207015135','4207011635','4206019958','4416001046','4416003924','4416007597','4416003577','4416003022','4416002350','4206019581','4207000843','4416007511','4206022040','4207002892','4416002522','4416006610','4206004602','4207011885','4206004158','4426004186','4206002352','4207020562','4416003236','4206001475','4417011583','4417003229','4207002296','4207017173','4207017830','4410131184','4207027301','4207017870','4207009805','4207025382','4207008004','4207017900','4207018309','4207018374','4206027486','4416007346','4207018044','4207027997','4207018556','4206023011','4207018723','4207018769','4207018737','4416001171','4207019121','4207019263','4207019176','4207013564','4207019541','4207019865','4206023178','4416002295','4207020020','4416000917','4416000463','4208000510','4205055841','4416007261','4416000195','4410157783','4207013527','4205028127','4207011474','4207013832','4207009914','4206023606','4208005258','4416002688','4206023933','4207014018','4205028066','4207015414','4207013568','4205000058','4426002604','4207000457','4207008070','4207007890','4410081603','4206024502','4204009277','4416001375','4410092334','4207003998','4207007520','4416003273','4206025219','4416001631','4207016293','4207004494','4410110784','4410118743','4207023086','4207023450','4207023917','4207024643','4207024724','4207024778','4410124688','4426002035','4207025081','4416003059','4207028273','4204008718','4410081941','4205058276','4207025157','4426003012','4207030179','4419006545','4207002271','4207002572','4208003917','4416003221','4410076105','4208000174','4410074275','4410064308','4410059760','4410056769','4410048611','4207025971','4410043411','4410043440','4410040843','4410045482','4204008384','4410080851','4410040293','4410035749','4207003978','4206000150','4410095469','4207030221','4204007948','4410110095','4410116456','4410123795','4207011419','4207001401','4410032871','4410020838','4207004903','4207004555','4419005642','4208008520','4207004398','4208008398','4208008259','4207004183','4207003070','4419000534','4207002843','4426002606','4410009968','4410028865','4208007509','4410021833','4419003298','4410015051','4410009044','4206030542','4206026886','4208005334','4410008616','4207001888','4208003925','4416002336','4207000023','4208009540','4208005403','4208005037','4419004086','4208007503','4426009892','4208006484','4208006124','4208005417','4419003730','4208006157','4208004086','4419005359','4419004390','4419005749','4208006205','4416001636','4419004356','4208007062','4208006843','4208006558','4208000896','4208000458','4208000890','4208000572','4208000534','4208000233','4207026677','4207028270','4419004561','4208000069','4207024723','4207030007','4208008614','4207030048','4207024540','4207029982','4208008500','4207029807','4419004633','4208001853','4207024467','4208001710','4419004654','4416002263','4207029826','4207029779','4426008572','4419004739','4208000207','4419005194','4416002213','4419002828','4208008168','4208004281','4207023623','4416002116','4419005231','4207024505','4426007373','4206029377','4207024144','4206029109','4207023868','4207023846','4419005242','4207023559','4206028611','4208007869','4207022999','4206028378','4208007616','4207028979','4208004927','4206026843','4207028176','4207028809','4416001995','4207029705','4207029615','4207027758','4207029194','4207029171','4206026000','4205065087','4208004681','4426008090','4208001154','4206014805','4426003939','4426003228','4426002336','4410076956','4207017643','4410140647','4206019395','4206026112','4410122706','4207007351','4205062150','4204001544','4410070987','4419007733','4416004914','4419003633','4419003071','4417003990','4416007672','4416006558','4426009445','4419017332','4206026873','4426006148','4410066440','4410119108','4410094329','4410092154','4410083179','4416006437','4410051965','4410135997','4410005397','4410011313','4208006078','4410105185','4410100435','4410095913','4410014126','4410030036','4410037408','4410157255','4410135678','4426001608','4207010979','4410113336','4410001509','4205051166','4205052628','4206028467','4419017713','4419015764','4416002132','4419009331','4417003905','4416006468','4410138766','4419009892','4410084613','4416005928','4419003039','4416005554','4205038575','4416006722','4416005700','4416004694','4416003096','4416003861','4416003525','4416003312','4416004479','4416002651','4416003579','4416002137','4416004420','4206008470','4416005331','4416005730','4416008049','4206018969','4416005723','4206020663','4416002837','4419008246','4206022122','4419005489','4419004823','4410124959','4419004695','4410115318','4419004676','4419004581','4419003963','4419004283','4426001003','4419003706','4416002530','4416000531','4416000483','4416000481','4208005686','4207022060','4410068630','4207030163','4410039389','4207001822','4419011836','4416007048','4419000541','4204009451','4419003031','4417019477','4417011188','4417011145','4417005234','4207028736','4419002749','4207023429','4207022754','4410034278','4208006646','4410036680','4207021157','4207016229','4207006996','4410024801','4206020328','4410039918','4207027501','4416000081','4207021880','4207025587','4410160284','4207018038','4207017659','4410083276','4207016328','4410084429','4416000096','4207013115','4426004169','4207012809','4207011137','4207010197','4410084433','4208002676','4410094582','4207021533','4207022947','4207026177','4410095879','4410153269','4426007281','4410048424','4410121094','4208002120','4207018770','4207015088','4410120133','4419009326','4207014749','4207001742','4410117528','4410102969','4207009480','4410021293','4207023408','4207004198','4410021043','4426006111','4207003190','4206001192','4410019911','4410036536','4410010502','4207026835','4206030113','4207027214','4410009175','4207028690','4206029729','4206028947','4426006817','4208003820','4419014299','4208003214','4419011118','4419015574','4206028197','4426008459','4410144132','4426009844','4208003637','4410076970','4206025705','4206017532','4419016013','4206028153','4410100456','4419014470','4419008845','4207026815','4207006807','4207010413','4207012561','4426007104','4207007386','4208001420','4206026309','4206017785','4410040082','4207025485','4426000521','4419019420','4426008143','4426001871','4426008458','4426001900','4426005363','4410075706','4207027588','4419018191','4207024653','4419020144','4426001447','4207025300','4206016176','4206011348','4206011038','4206017507','4207025273','4426007864','4206017755','4206019490','4206002754','4410054627','4206020633','4206021874','4206024299','4416006134','4206023694','4206022944','4419006348','4206013280','4206013803','4208003915','4206014575','4426003084','4206024858','4206023823','4206023367','4206021988','4206021707','4206020854','4206016355','4206003912','4426007407','4426004992','4206025004','4419010156','4426005449','4416000441','4206023772','4208003735','4206023331','4206022662','4206015209','4206014715','4206014810','4206012763','4206007960','4206007389','4206007674','4206015257','4416001782','4206004044','4416002366','4206020488','4207028004','4204010038','4206000298','4417009210','4205009792','4206013815','4204007735','4208007419','4419016755','4204002815','4206004772','4204002621','4205010943','4416001811','4410055175','4419004591','4419006223','4419019997','4416002797','4416003413','4208005982','4206006085','4206008572','4206014052','4207004131','4426004210','4206008198','4206012435','4206012805','4208005658','4410155211','4207017836','4419019305','4207017807','4207017757','4207017252','4207015366','4426002381','4207016968','4207016684','4207016556','4205013962','4206002893','4207016238','4207015547','4207014840','4207013926','4410114550','4207012725','4207012422','4207009825','4207008552','4419002062','4426002991','4207006902','4207006747','4426001251','4207006327','4207018005','4207019049','4207020001','4410124663','4207020232','4207020621','4207021083','4426007670','4207022627','4207023013','4207017877','4207024187','4206003109','4416003353','4410112175','4206005385','4426008701','4206005631','4410149522','4205064065','4206000195','4426000591','4426003192','4206001317','4410010504','4205064897','4205019642','4206001339','4206001442','4206000648','4410057756','4410026039','4206000458','4206014162','4410056279','4206000547','4205060189','4207026804','4410094887','4410127425','4206025193','4206021540','4206021972','4410069265','4410081052','4206007345','4206027677','4206006943','4419007303','4207014880','4206005461','4205035183','4206028590','4206029119','4207004596','4206027864','4206026614','4419003625','4206026071','4206025919','4417014104','4207001157','4206030363','4206030199','4206026165','4426006814','4206030575','4206029225','4207001217','4207002045','4205011466','4419004797','4426005861','4207005551','4204003014','4205003212','4206001551','4205059910','4205022946','4205041041','4205054750','4207003395','4208003315','4208003452','4207027202','4208002959','4206029706','4208001311','4207002118','4206029065','4206029924','4205010734','4417003697','4206029632','4206029713','4419007718','4207002065','4207004609','4207005512','4419009916','4206022852','4419011639','4207006243','4207006094','4206030275','4208000706','4206024406','4205059294','4207029450','4206006503','4206030261','4207028114','4207027785','4206030423','4208009334','4419012358','4208003192','4207000428','4426008495','4208001304','4206004547','4419019865','4417009598','4416003245','4205016553','4208004949','4207028046','4206025721','4206025363','4410151892','4206024983','4206024378','4206021483','4206021171','4206019155','4207000965','4206020996','4206003898','4410055817','4419008231','4206020547','4206002029','4206022326','4416006180','4426005296','4206022174','4206022084','4206021827','4206017726','4206017566','4206001314','4426004805','4206017028','4206016885','4206024036','4206022750','4204009926','4206020247','4207002920','4208004258','4206020177','4206020159','4410110790','4206019989','4206017914','4410150677','4204006889','4205007246','4207016339','4204008777','4426001348','4204009294','4204000885','4204006376','4419003595','4204001984','4204010067','4205010945','4204005909','4204004589','4204009739','4205009038','4207008169','4208006060','4208004619','4208009582','4205012868','4207026930','4207006943','4205011183','4410001544','4207014780','4207012743','4207015266','4207011769','4204001918','4426004327','4208008521','4207022834','4207001064','4208003874','4207006856','4207022521','4207022179','4419013280','4419014657','4206013145','4206008409','4206008098','4205019592','4207022714','4206008004','4206007847','4208008033','4206006851','4416002304','4426004273','4206027931','4419014942','4208005537','4410021898','4206006651','4416004651','4206016323','4206015780','4208007039','4416004774','4208007914','4206014985','4208008059','4206014674','4204004652','4204005183','4206014326','4206011728','4204006207','4426000564','4205005791','4204004110','4205007763','4205005974','4206009730','4206009564','4208005321','4206009483','4206009106','4208008071','4207003432','4419011579','4207020951','4206008861','4206010158','4206008448','4208005945','4208003144','4207020712','4206006547','4206006322','4206006038','4207021501','4206005670','4208002535','4417010248','4206013826','4419010043','4207022109','4207022223','4416007375','4207022646','4206012962','4206030031','4207001307','4419009514','4207022745','4208004645','4207023334','4208008545','4208000902','4208003962','4208008597','4206029448','4206001312','4417012202','4410146368','4207030137','4419015099','4206029700','4419016457','4416000467','4207000561','4205021364','4208001579','4207024148','4206027508','4416001820','4207003504','4208000875','4207001539','4208008835','4410012845','4207005400','4206027247','4206029741','4410130469','4207006265','4410017455','4206004023','4426009633','4419001662','4206005116','4410025877','4410030374','4206004766','4208008693','4207028293','4208000351','4208001665','4208009206','4206003849','4206003787','4207028592','4207002609','4206003709','4426009911','4208002819','4206026696','4206002913','4208002882','4206000290','4205064808','4205064465','4426003540','4206001979','4208004206','4208001532','4205056774','4208006140','4207003493','4207026939','4410040980','4206001718','4410049760','4417003277','4410098341','4419006691','4410099453','4206022331','4426005054','4410108651','4206003083','4426008841','4207027017','4410132546','4416006502','4410135984','4416006435','4426007415','4426000116','4416004142','4426005350','4206020087','4205049954','4419000948','4426002079','4206003741','4416006735','4419011735','4426000417','4205010391','4208002282','4205048488','4206018670','4206018330','4205030588','4206024724','4205047183','4417005691','4206027722','4205047126','4206029795','4205028151','4208002655','4206025320','4426000602','4206017046','4206017579','4205040809','4206030022','4208004796','4206020244','4206002715','4206017909','4205038605','4206016506','4206020735','4426002145','4205033493','4206029935','4204009410','4204009106','4204009094','4204008607','4204008558','4204008134','4206020935','4204008004','4204007904','4204007426','4204006930','4204007144','4204006798','4206027305','4410075815','4208002204','4207025617','4204006746','4426003497','4208003368','4208008200','4204006537','4204006125','4204001853','4206004856','4206013458','4205003754','4417016255','4205003733','4206017784','4205002290','4419002188','4205001587','4206005015','4206004330','4204005797','4204005469','4204005329','4426002349','4204005210','4207028083','4204003390','4205012174','4205011562','4204003312','4204003044','4204002995','4204002181','4204001679','4206000730','4410050947','4206008457','4206013358','4206009701','4426002810','4208003501','4206007028','4208006421','4207021122','4410069352','4208003781','4208004235','4206006931','4206004842','4410159128','4206011823','4207022193','4410028093','4410149919','4207026169','4416001347','4410117897','4206016068','4419000298','4419010762','4419003133','4419001933','4419000752','4206012086','4205061108','4206011409','4426002917','4205024750','4206010090','4205026452','4206010541','4206005842','4426008268','4208000693','4206012499','4204006321','4206012989','4417006030','4417005300','4417004183','4417002955','4416007102','4426008302','4426002398','4419015561','4426004979','4426001745','4419013628','4416005933','4204000536','4204000411','4426007786','4426007422','4426006762','4426005300','4205024776','4417013215','4426003099','4419006968','4419005643','4417017690','4419003727','4205008803','4207028450')
and rollnumber is null;

-----------Temporary Unfit Candidates 10 ------------

update candidates set rejection_provision='TU' where to_be_considered='Yes' and gender_App='Female' and dme_status='Temporary Unfit';---10

------------------ DEBARRED CHECKING --------------------------------------------

Create table debarreds
(id character varying,
 regionId character varying,
 registrationNumber character varying,
 name character varying,
 fatherName character varying,
 motherName character varying,
 dob date,
 genderId character varying,
 categoryId	character varying,
 educationBoardId character varying,
 matriculationRollNumber character varying,
 matriculationPassYear character varying,
 examId character varying,
 examYear character varying,
 rollNumber character varying,
 debarredFrom date,
 debarredUpto date,
 reason character varying,
 otherReason character varying,
 letterNumber character varying,
 letterDate date,
 isActive boolean
);

SELECT * FROM debarreds where isactive=true and debarredupto>'2025-01-01' ;

select a.debarred,a."registrationNo",a.rollno,a.name,b.name as d_name,a."fathersName",b."fatherName" as d_father_name,a."mothersName",b."motherName" as d_mother_name,a.dob,b.dob as d_dob,a.gender,a.cat1,
b."regionId",b."examId",b."examYear",b."rollNumber",b."debarredFrom",b."debarredUpto",b.reason,b."otherReason",b."createdAt",b."updatedAt"
from candidates a,debarreds b where 
b."debarredUpto" >'2025-01-01' and
b."isActive"=true and

--replace((UPPER(a.name)||UPPER(a."fathersName")||UPPER(a."mothersName")),' ','') = replace((UPPER(b.name)||UPPER(b."fatherName")||UPPER(b."motherName")),' ','')
--and a.dob=b.dob;
 
--replace ((UPPER(b.name)||UPPER(b."motherName")),' ','') = replace ((UPPER(a.name)||UPPER(a."mothersName")),' ','') and a.dob = b.dob;
 
replace ((UPPER(b.name)||UPPER(b."fatherName")),' ','') = replace ((UPPER(a.name)||UPPER(a."fathersName")),' ','') and a.dob = b.dob;


----------- 342 debarred candidates by EDP-----------

'1404010153','1401022286','1401045077','1401045303','1806001635','1004035034','1004043963','1008000419','1008000421','1403010070','1004009824','1403012708','3303008994','3009133155','3303069780','3303124123','3009113523','3010127221','3010044919','3206213384','3013089403','3206377876','3203038337','3303015136','3009084784','3009080607','3009070964','3009139450','3013039637','3206342209','3206253197','3206009646','3206305999','3010061362','3209018766','3404028765','3302024038','3303009575','3303040784','3303071305','3303160705','3303104996','3206077662','3206119831','3402034809','3205031994','3403000375','3013011074','3404027446','3206118278','3013119314','3010133721','3206212988','3013076747','3009028210','3303098235','3009112358','3205046404','3402019191','3206083210','3010034973','3013046118','3016003503','3302005140','3205013341','3205054474','3205024387','3206122092','3303121979','3009021782','3206048650','3404020793','3207005135','3206041239','3209007923','3009106196','3003059445','3013011668','3206041123','3206270638','3206339045','3001052739','3009005666','3009100633','3009030074','3003001061','3207002527','3205060936','3206360482','3206137539','3206109033','3403007422','3303105866','3402005370','3206305025','3001045555','3007032983','3008009124','3003045100','3013025145','3013086983','3013101055','3013012919','3203015470','3205059072','3206204796','3206399423','3206099676','3206269322','3206396517','3206057982','3206125830','3209006537','3303030545','3402036594','3013032705','3206252857','3009060798','3403022721','3206120913','3016002244','3013095151','3013106253','3009050472','3302030353','3301011929','3003008218','3206139857','3207004982','3403002158','3003037391','3007010607','3206340498','3007038783','3009121162','3206245688','3010035462','3401006511','3206293069','3206238027','3206340056','3013027461','3008003660','3013051994','3009024662','3010072285','3016013532','3209017237','3003021319','3009098364','3013117880','3206242454','3009131909','3303083000','3003050794','3203006452','3206304343','3206134474','3205064316','3016009868','3206310846','3206284380','3009005546','3206170231','3206225118','3008013032','3302007198','3402000598','3401006865','3401006448','3401006807','4205000418','4205044158','4205044175','4205050497','4419000536','4205021168','5105066092','5102004723','5105085468','6015001180','6204051261','6005056548','6005057060','6016013831','6016014599','6016016082','6016016182','6007042421','6007043530','6007042999','6007043352','6007045498','6007047147','6007047455','6007053565','6007043966','6007050213','6007050688','6007050500','6007049938','6007049544','6007051002','6007050869','6005050171','6005007667','6001019545','6016011506','6204062792','6014013752','6005023941','6001038299','6005043130','6005026853','6005045493','6007026879','6007041349','6007013959','6007044701','6006020272','6016004072','6016008303','6005012471','6006029450','6005058137','6005007084','6016001842','6204074336','6005033883','6001040838','6005038302','6007002583','6001008690','6005002302','6001030177','6204047968','6005004474','6005054617','6005039896','6001049716','6005057088','6005040399','6005027789','6005040542','7214012042','7214002161','7206002920','7208047700','7007013100','7208044586','7214014830','7208003927','7007011283','7214000908','7202010218','7007017876','7007019744','7206012462','7208042658','7801000254','7801000401','7801000569','7801000691','7801000386','9002009201','9011006209','9009008107','9005015182','9002002607','2201133880','2201224795','2201056208','2225014812','2201207239','2002015874','2201181089','2201157029','2201308752','2401018329','2406020207','2405066948','2405066963','2405094060','2405094069','2201096023','2201096044','2405008283','2405008287','2405063165','2406024569','2405037359','2201239414','2405117196','2406046997','2405087551','2406048642','2201082545','2406011799','2405025905','2405038284','2201114971','2201226051','2233007627','2405143026','2201262428','2405126638','2002043077','2201177186','2201159065','2201065205','2405060447','2405120432','2201239648','2201193409','2411017413','2405018095','2405063865','2405153784','2406031544','2406027723','2405131103','2405009429','2201164327','2201034115','2201027117','2201019377','2006003986','2006003993','8205002039','8601033547','8007025995','8601047032','8601049849','8601053140','8601007549','8007020957','8603011073','8601016655','8601049164','8204008555','8007012775','8008009799'

------------------------SUSPECTED CASES 609 ----------------------------------

'9212001520','4415043595','5601009103','2405009615','9206005222','3206163697','5107003926','2201194621','3205014183','7006005637','4404019733','3206369874','5601003804','4415024697','4415026475','3206022102','4404005178','5501004257','5107003048','4415013695','7012001836','9206003509','5601010968','7006009527','2225015169','4410023409','2201078283','9212007799','2201284943','3206019134','4415008687','3206269322','4415040229','4415046969','4415010433','3005019853','8201006930','3301000440','7205005478','5105064402','5105069285','3301008588','5601014658','9206009433','6006054115','4404003132','6006041204','5601002897','4404001972','7201002073','3206341405','7006016333','4417016556','5601004312','3303062229','5105080274','7006014922','4410020269','4404004899','5111009841','3205045410','4404002788','5302001951','7205039191','9010018604','7203006225','5111000133','9002010384','4604012532','1005001614','6006007391','4404019908','5601010594','4404016650','3001048535','3302024055','5111009828','1401003781','7203008301','4410050425','5111000227','4609015547','9010015853','2201249849','5111005854','5601007712','5102002249','5102008802','4410136275','4410065454','5102016898','5105009763','4410060589','5701006719','6016003621','5401004512','5105005549','5105002294','5105080137','2201201153','7006025569','4404005102','2411014347','5105020022','9211005580','9212006130','3016003090','5111009457','5105083241','5302006036','4410095079','7013006189','7206009631','5102008913','1004023313','6005047856','3205076215','4410047947','4410055681','4604024529','7205012567','1004038003','2405000543','3206160039','2404018952','3010097228','4611013500','2406033991','6202006838','3206238882','5501000813','5501007311','4415051141','5107007414','4601009308','3205011583','6204000385','5102005968','4410051640','4604016747','8205001924','5105071126','7201025053','5105040058','9206005946','6204069600','4410040714','1401015833','1404009688','5107017087','1401057490','4410088415','4415024742','5107020610','3001093372','5107017513','4415026573','5105037758','5111007015','4415053145','9008001588','2406040171','6006050255','1004046350','4415033520','4415032139','5107002282','3209001124','9213000494','9206009493','2201044378','4609020797','5111007990','3010113175','6001035670','7201028187','1401036055','3403003389','9212002874','3303120395','6006038903','9206010667','6204089051','6204017644','5105055941','4604022055','4604036055','1004020665','5401005456','4410092267','9011008253','9011013744','2201066534','5105055175','3013121338','4410080375','5107015474','6006058385','4410133705','5105039528','7012006369','4601000049','4601001363','5105028335','9002012592','1004013709','4410155657','2225005858','4410012992','2201008113','5401002830','5401003685','5401000644','9010004359','5105046255','5601005872','6006040386','5112000576','5105044045','7205019597','3206406209','6006010001','4410084773','4604032312','4609024123','4410026911','7013002272','4410064476','5501001390','5105055164','7201030778','4410102345','9010012712','3206350871','6001073149','8204005134','7202018134','7202032432','4410095360','3015019383','4410085027','4410024888','4417013567','7013004027','4417019943','9001037045','9211003690','3011007483','4415030120','2406051621','4417008384','6204044138','4417019320','6006058216','1004008851','3303126630','7001007102','5111004610','6204050256','7205012438','7001009583','5601003938','5105085731','7203029864','5105086306','3303170470','8207010616','5107006840','6006057807','8208008875','8208002425','3206140274','7208038814','6204074895','1004005822','4410097005','4410097034','4410080178','5105069356','4410060514','7013008589','2411020720','3303060840','5105044843','6006045891','4609019381','4404002847','4410002044','6204072965','3206101362','5107018435','7202040375','5105064764','4609012718','6005033060','7206018614','9005017333','6006048684','5105031659','3402013899','2406049996','1004031593','9105000692','4410008884','4609010035','6001015416','1004039760','5601015302','3011029655','8207004393','8204015621','5111012378','5105080782','1004002842','5105077336','7006001675','5105080924','5302005725','4410127532','5111007410','8207015025','4404008002','8207006808','6204044686','4417004259','5107003963','1801011090','4410032931','6204057372','7001025374','8207009549','1004018260','7205034227','4417019542','6204063486','3303018955','4602000093','5105085898','3402022580','2411019477','4417019067','4410100539','5001004635','3402032420','9002021837','4410094358','5105009884','5105006157','3206037613','4410122580','4609024045','9005013320','7205040331','7203017682','7203018716','7203019348','6204088268','4417013407','5111004961','4609013849','9008001208','4410095871','4417003665','4410041945','8601018585','4410066779','4410027145','5105082906','5112001078','4609020669','4611015766','4415043125','4611017049','9005019646','7203019718','3206134866','5107016484','6005057097','6204009313','2006002663','4410090504','5112006791','1007003737','9010008096','4410121263','8201003479','5302004440','4410147856','7204006390','3206053815','5001004395','7001014302','5107005835','4417008909','7001002464','3206066797','4609025046','8206004028','7001014611','8204016302','7001020899','7206018456','4611011446','8012010946','9102001096','1004048128','6005026630','7001031991','6007049185','3303057382','7203030417','6204087516','8204006388','6204075332','7001031772','7214006998','4604003132','5107020812','3403015300','4410114230','7206008505','6007053517','4410133751','5111006707','5105082057','5102003170','4610011875','4604043131','2201131444','7203011857','5102008689','7001015497','5105022748','4410010307','7001049642','3402032379','3403000251','5105012461','5105008786','4410159882','9005009460','4611008886','8207002743','4410077877','3206322564','4410079915','8603002978','9012005845','6204086161','6204085408','4410001392','5102005691','5105034592','9011001023','3005028736','8207008080','3010142082','3008020546','3008017605','5105033131','3302030576','5107024195','5302002780','9002021621','5105037109','4415028094','6001056760','7206022001','4410010002','7206021937','4410052986','4410009473','4410145167','4415015499','4410148611','4410007690','4410045820','4410149233','4410158972','4604033445','5111012350','9105001490','1010009261','6005009140','7201001914','6005034648','6005056529','4410141420','4604026049','5107024455','4410147147','7201004850','3303087766','4601004661','4604016743','7205012984','4604031220','6204028588','6204041198','7208036260','2201288400','4410118152','4410139906','7204013440','8201006843','4417013103','5105057568','5112008187','5112000616','7205007175','7201023464','7201008545','7201015906','7205019549','7203026378','4410154819','7201003622','8207009562','4410068344','7006023623','4417002307','6204013404','7203011551','2411025326','4410137590','4410019052','9001044340','3206089428','4415039816','4410075262','5601009735','9002013060','8007036308','9001027783','2201309480','7006015145','5102010812','5105046885','5105047859','5105049685','4415026623','7205038134','3403008623','3303065060','3013020283','2201320862','7202019020','4415033485','3010122969','8604011237','4410143933','9302002708','9010003699','8204003323','2405055816','6202004098','3206192531','4410156532','4410012525','4410021392','8204004764','8204009632','7202025262','8204014800','8204001906','8012003426','6204042404','8207009730','7006013297','7006020318','7013006389','4415039400','4410110210','7006021171','4410037920','4415037764','4415014376','5105083513','7208008381','4410032174','6204067192','6204058378','1004012450','2232009116','4410124877','3206269324','4410088357','6204006855','4410069340','6204058743','1007014572','7205001682','3009079943','8012004017','3010114840','3010017373','4410089911','7204015933','7204008695','4410055822','3013090952','4410011339','1004005513','1004021025','8601029334','8601023301','8601002352','3002008576','2404011244'

update candidates
set rejection_provision='W',
remarks='in 609 SUSPECTED Candidates'
where rollno in ('9212001520','4415043595','5601009103','2405009615','9206005222','3206163697','5107003926','2201194621','3205014183','7006005637','4404019733','3206369874','5601003804','4415024697','4415026475','3206022102','4404005178','5501004257','5107003048','4415013695','7012001836','9206003509','5601010968','7006009527','2225015169','4410023409','2201078283','9212007799','2201284943','3206019134','4415008687','3206269322','4415040229','4415046969','4415010433','3005019853','8201006930','3301000440','7205005478','5105064402','5105069285','3301008588','5601014658','9206009433','6006054115','4404003132','6006041204','5601002897','4404001972','7201002073','3206341405','7006016333','4417016556','5601004312','3303062229','5105080274','7006014922','4410020269','4404004899','5111009841','3205045410','4404002788','5302001951','7205039191','9010018604','7203006225','5111000133','9002010384','4604012532','1005001614','6006007391','4404019908','5601010594','4404016650','3001048535','3302024055','5111009828','1401003781','7203008301','4410050425','5111000227','4609015547','9010015853','2201249849','5111005854','5601007712','5102002249','5102008802','4410136275','4410065454','5102016898','5105009763','4410060589','5701006719','6016003621','5401004512','5105005549','5105002294','5105080137','2201201153','7006025569','4404005102','2411014347','5105020022','9211005580','9212006130','3016003090','5111009457','5105083241','5302006036','4410095079','7013006189','7206009631','5102008913','1004023313','6005047856','3205076215','4410047947','4410055681','4604024529','7205012567','1004038003','2405000543','3206160039','2404018952','3010097228','4611013500','2406033991','6202006838','3206238882','5501000813','5501007311','4415051141','5107007414','4601009308','3205011583','6204000385','5102005968','4410051640','4604016747','8205001924','5105071126','7201025053','5105040058','9206005946','6204069600','4410040714','1401015833','1404009688','5107017087','1401057490','4410088415','4415024742','5107020610','3001093372','5107017513','4415026573','5105037758','5111007015','4415053145','9008001588','2406040171','6006050255','1004046350','4415033520','4415032139','5107002282','3209001124','9213000494','9206009493','2201044378','4609020797','5111007990','3010113175','6001035670','7201028187','1401036055','3403003389','9212002874','3303120395','6006038903','9206010667','6204089051','6204017644','5105055941','4604022055','4604036055','1004020665','5401005456','4410092267','9011008253','9011013744','2201066534','5105055175','3013121338','4410080375','5107015474','6006058385','4410133705','5105039528','7012006369','4601000049','4601001363','5105028335','9002012592','1004013709','4410155657','2225005858','4410012992','2201008113','5401002830','5401003685','5401000644','9010004359','5105046255','5601005872','6006040386','5112000576','5105044045','7205019597','3206406209','6006010001','4410084773','4604032312','4609024123','4410026911','7013002272','4410064476','5501001390','5105055164','7201030778','4410102345','9010012712','3206350871','6001073149','8204005134','7202018134','7202032432','4410095360','3015019383','4410085027','4410024888','4417013567','7013004027','4417019943','9001037045','9211003690','3011007483','4415030120','2406051621','4417008384','6204044138','4417019320','6006058216','1004008851','3303126630','7001007102','5111004610','6204050256','7205012438','7001009583','5601003938','5105085731','7203029864','5105086306','3303170470','8207010616','5107006840','6006057807','8208008875','8208002425','3206140274','7208038814','6204074895','1004005822','4410097005','4410097034','4410080178','5105069356','4410060514','7013008589','2411020720','3303060840','5105044843','6006045891','4609019381','4404002847','4410002044','6204072965','3206101362','5107018435','7202040375','5105064764','4609012718','6005033060','7206018614','9005017333','6006048684','5105031659','3402013899','2406049996','1004031593','9105000692','4410008884','4609010035','6001015416','1004039760','5601015302','3011029655','8207004393','8204015621','5111012378','5105080782','1004002842','5105077336','7006001675','5105080924','5302005725','4410127532','5111007410','8207015025','4404008002','8207006808','6204044686','4417004259','5107003963','1801011090','4410032931','6204057372','7001025374','8207009549','1004018260','7205034227','4417019542','6204063486','3303018955','4602000093','5105085898','3402022580','2411019477','4417019067','4410100539','5001004635','3402032420','9002021837','4410094358','5105009884','5105006157','3206037613','4410122580','4609024045','9005013320','7205040331','7203017682','7203018716','7203019348','6204088268','4417013407','5111004961','4609013849','9008001208','4410095871','4417003665','4410041945','8601018585','4410066779','4410027145','5105082906','5112001078','4609020669','4611015766','4415043125','4611017049','9005019646','7203019718','3206134866','5107016484','6005057097','6204009313','2006002663','4410090504','5112006791','1007003737','9010008096','4410121263','8201003479','5302004440','4410147856','7204006390','3206053815','5001004395','7001014302','5107005835','4417008909','7001002464','3206066797','4609025046','8206004028','7001014611','8204016302','7001020899','7206018456','4611011446','8012010946','9102001096','1004048128','6005026630','7001031991','6007049185','3303057382','7203030417','6204087516','8204006388','6204075332','7001031772','7214006998','4604003132','5107020812','3403015300','4410114230','7206008505','6007053517','4410133751','5111006707','5105082057','5102003170','4610011875','4604043131','2201131444','7203011857','5102008689','7001015497','5105022748','4410010307','7001049642','3402032379','3403000251','5105012461','5105008786','4410159882','9005009460','4611008886','8207002743','4410077877','3206322564','4410079915','8603002978','9012005845','6204086161','6204085408','4410001392','5102005691','5105034592','9011001023','3005028736','8207008080','3010142082','3008020546','3008017605','5105033131','3302030576','5107024195','5302002780','9002021621','5105037109','4415028094','6001056760','7206022001','4410010002','7206021937','4410052986','4410009473','4410145167','4415015499','4410148611','4410007690','4410045820','4410149233','4410158972','4604033445','5111012350','9105001490','1010009261','6005009140','7201001914','6005034648','6005056529','4410141420','4604026049','5107024455','4410147147','7201004850','3303087766','4601004661','4604016743','7205012984','4604031220','6204028588','6204041198','7208036260','2201288400','4410118152','4410139906','7204013440','8201006843','4417013103','5105057568','5112008187','5112000616','7205007175','7201023464','7201008545','7201015906','7205019549','7203026378','4410154819','7201003622','8207009562','4410068344','7006023623','4417002307','6204013404','7203011551','2411025326','4410137590','4410019052','9001044340','3206089428','4415039816','4410075262','5601009735','9002013060','8007036308','9001027783','2201309480','7006015145','5102010812','5105046885','5105047859','5105049685','4415026623','7205038134','3403008623','3303065060','3013020283','2201320862','7202019020','4415033485','3010122969','8604011237','4410143933','9302002708','9010003699','8204003323','2405055816','6202004098','3206192531','4410156532','4410012525','4410021392','8204004764','8204009632','7202025262','8204014800','8204001906','8012003426','6204042404','8207009730','7006013297','7006020318','7013006389','4415039400','4410110210','7006021171','4410037920','4415037764','4415014376','5105083513','7208008381','4410032174','6204067192','6204058378','1004012450','2232009116','4410124877','3206269324','4410088357','6204006855','4410069340','6204058743','1007014572','7205001682','3009079943','8012004017','3010114840','3010017373','4410089911','7204015933','7204008695','4410055822','3013090952','4410011339','1004005513','1004021025','8601029334','8601023301','8601002352','3002008576','2404011244');


-------cancelled application------

'4205000418','4205044158','4205044175','4205050497','4419000536','4205021168','9002002607'

-----rejected_application-----

'8003003982','8601033892'

----------WITHHELD CASES 1623 -------------

update candidates
set rejection_provision='W',
remarks=remarks || ' in 1623 withheld list'
where rollno in ('3013047319','3206104560','3206380579','3013072446','1404006513','1004043111','1404003482','3013060399','1004044950','3013074997','2201297792','3013051071','3206133556','3013050244','3013048285','1401012023','3003022223','3402015327','3013037352','3013010586','3013013697','1004028295','3013016621','3013023032','3206266785','3013040300','3013030307','1004029944','3206287761','3013087903','3013081787','3013079515','3013081297','3013091127','1004005232','3013129989','3013131083','3013005691','4415005590','4410095000','1403014959','3013120674','3013142590','3013125532','3009106436','3203019520','3013021864','3206155209','2201011391','3009016935','3013109539','3013026840','2405138675','4415032782','3206186766','3206065993','3013096295','4415006833','4415016474','3206279438','3013005804','2406052979','3206282601','5401004324','4404000785','3013025154','3013067516','2225001495','3010092787','3206176556','3206240778','2232012550','5401009822','7205018301','6204020254','7205000890','3206326483','3013000639','7205019594','7205030000','3206202669','3013028611','3206081928','3206082210','3303001737','3010154264','3206098376','3013132155','1801007965','3013111486','3206400551','3009116636','2411000238','7205039161','3206146367','2405141154','1004038863','1801018470','1004000333','3001076694','1004010567','3206281127','3009063679','3206314222','3009098326','3206065308','3009088121','3010073012','3009020904','1401037211','3013022967','3003032297','3013085391','1401018802','2236007284','4410020865','4415051226','3013085587','3206125750','3206162886','3013113082','3206300032','1401003734','1401003722','3003005377','2201045623','1203007036','1203011100','1401002709','2225013499','3206369045','2405022731','3013057883','3013030719','3206299595','3013013899','3013044744','3003040868','2201030893','5401009828','7205007212','1401019469','3013049823','3003049229','2201245411','2225007141','1004025835','1401053181','3003060671','3206313506','3013005198','3009049772','2201055691','1203007627','3013010947','1203002206','3206385820','3206259938','7205022823','5401010108','1004009903','2201054283','2002020300','1401012744','2236006297','2201221907','1203000643','6202000630','2401004491','3009155245','2405152222','5105033349','3009014423','2232003746','1401034636','1805005600','3013120866','3206241842','3206245302','3013067997','3010106175','3010134860','2201045556','3206256378','1401039352','3013001957','1401017677','2225006168','1403021603','2225010928','3206039434','2201260487','1801017590','3013119994','3010149097','1801006484','3206262287','3206288845','2405132183','3013118432','3206361653','3206372382','3206376067','3206385934','3206395614','3207009998','2405107106','3206230758','3003060481','3206077773','3206081452','3206085116','3013089687','3013104697','5401007750','3206095530','3013129098','3013120824','3013129568','3013062448','3013087790','3013105018','3013137107','3206022994','3013121318','3205045837','5701000452','3013134176','3013061321','3008009979','3206056083','3206146720','3206172606','3009061621','3013142222','3206017063','3009075997','3013070684','3206075003','3013079029','3206109706','3013089432','3206182110','3206014809','3010025633','3013091054','3013115000','3013121295','2225007413','3206329449','3206114399','3013061112','3013073998','3206077087','3206050584','2405019391','3013085503','3013127369','3013111989','3206153270','2411039441','3206148715','2405079160','2411028453','3206090629','7001027842','3206068449','3206021854','3013088425','3013141455','3013142137','3013106749','3206340966','3206298279','3206051776','3013074427','3003063957','3003064087','3013021935','3013007290','3013020209','3003010142','3013049918','3013038166','3003035251','3013030248','3013043932','3003007987','3013006740','3013040832','3013052299','3003050992','3003015012','3009150406','3013038413','1403028613','1401012436','3206311421','3206324332','3206299479','3206279010','3206274870','3206334438','3206288660','3206292384','3206377309','3206338025','2406029320','3303075618','3206363168','4410033800','1403013548','3206366756','3206391821','4410023138','1403010173','4410022810','2405094112','3206259787','1401001833','1401049636','3206231686','3206191469','1403008161','3206182994','3206240267','3206339880','3206227204','3206232535','3206215429','1004044447','3206201706','3206382288','2201288430','3206259783','2405039181','2401006839','2405033016','2405148896','1203004472','2406036613','3013123214','3010009861','2411000707','3303009512','3206325104','3013119016','3206251813','3206243546','3010066150','2236001314','3206240378','3206236271','2232005569','2233001919','3206203232','3009146106','3206186190','3010061302','3206292893','3010086721','3206263873','3005015309','2201080647','3206278993','2201039738','4410028076','3003029851','3013063718','3009108401','3003033874','3206104295','3003047830','2201197331','3403002836','2405068051','3003048231','2201075460','4410050618','3009122910','2201036678','3206086104','3013064643','1202003906','3206069909','2201080621','2201253721','2225002359','5401009238','1401041887','6204012854','3013039559','3205061839','4410054651','4410062086','3009140482','3206021063','2201294963','3009044817','6204059616','6204002696','5501000623','4410037314','3203026543','3206102946','3206126388','2201059399','3013000386','3013128580','3013000728','3206195921','3013004263','3013004487','3013005222','3013006920','3013010601','2201085658','3013016501','3013025489','2201026418','3013046372','3013029131','3013029772','3013030777','2405033649','3013042823','3013129772','3013095841','3206343831','3010148549','3013055506','3206308332','3009039299','3013063498','5501004087','3013092787','3013132172','2201327866','4404001790','3013132752','1401034354','6202019475','3013119837','2232004703','3013123417','3206328956','3206240513','3013126212','2201130793','2233008152','3206370614','3206143929','3013051831','2405049488','3206135135','3206065978','4410106378','3206024822','3206120811','5501002159','3206062704','3206001223','3206306209','3013122406','2201190106','3206109691','3206205603','2201185387','2405041997','2201058741','3013049956','1403001142','2405000174','1401050583','2405056200','6202009493','2201210122','2201212351','1401048400','2232011349','4410124594','2201082687','1408016612','2405049974','2002050915','2201306682','3206278113','2406041119','1401038833','3013044198','2405136176','1401030835','2405077632','2405077586','2405106883','2405090466','1401022144','2227006289','3001064138','3206168614','2201122826','3013056960','2233001664','3013036111','3013066108','2002035250','1403028660','2002023502','2002028981','2002035577','2405129985','3206309906','7007018632','2201106661','2405051256','3205015928','5701006228','3206050585','3206226742','5701004651','3206013613','5401002188','5401006690','4410073661','3010121381','3013020133','7001026823','2201168039','2201194400','3010136014','2201184780','7001048846','3206246434','5701004768','3013031874','4417002656','2406036111','3013110405','5401009421','2405071964','2201124095','1401030836','1401047774','1401001728','2406005804','1401054069','3013067944','3206309725','6204084125','5501006175','3206020522','3013004565','6202003906','1401003039','5701003514','3206199905','2201062217','6204082621','1408017728','2201044185','2405134502','5701002263','2201059141','3013116536','2411038825','7205011402','7205017052','7205018199','2236004308','2405097114','3206276319','2406043056','2233000717','7205013257','3206335272','1403009311','3206403674','6202009549','1203002098','5401005568','3001099408','1404025127','3206138496','2201139228','2201328473','3013027066','1401004166','2225009383','2201098996','3009064670','1203003021','3206014873','3206353330','2405149896','2201323919','2201098739','1401041147','2201102149','3206349054','2201062299','1401004703','3009030941','2201143930','2201137701','1401048607','3206260374','3206361581','3206151450','1401043939','3009008695','3013004989','3206316064','3206037619','3009013716','1401041806','3003045543','2201245649','6202003925','1203000488','2201274965','2405160992','2201186125','2201178023','3206260282','2201182779','1401027028','1202009350','3206374727','3013026517','3009071293','1801001159','1801004124','3206257942','1203006523','1401004867','1203005265','1203006204','4410030101','3206347914','1408008991','3206391377','2201174259','3009016019','3206209910','3010084311','3013021977','3206307191','1004039682','2405108556','2236001621','1401037095','1408019715','2405139197','3013014444','3205042299','6204011713','3205042072','4404010964','3206290959','3206403093','4410065962','3003005994','1403024265','1401027682','1004015121','2227009922','3206230588','3013062736','2225015675','3008012336','3206221729','2225015622','1401035236','3206252076','1202003033','2201298644','3013085548','2201300507','2232004153','1806015470','3206321638','2201310005','2405172734','1403005221','3013063977','2201055918','2201028200','3013126853','3203034507','3013036606','2201316293','6204049374','2201258641','3013086645','2232006639','3013016244','2233006994','3013098502','1401012856','3013092618','7205021252','3013000580','3206346320','2401009605','7205015130','3013069326','3009154227','3013071372','1401043852','3013099607','3206196463','3013075019','4410101131','1401053952','1401001053','4404001612','6204024985','3206249723','2401016940','3206028682','3206060013','3206032278','3206075841','2406014803','2406056506','3206065735','3009006991','6204046987','2002008462','2401012098','2401014255','2401009393','6204046879','6204055531','1401055094','6202000641','2405011991','7205022059','2401015804','1401048274','1401010084','1004030650','2406008153','2405133235','2405088827','1203004612','2405103567','3013068325','5401007049','1401020776','3013072084','2405040554','3013099946','2405045059','2405033846','2405034223','6204015485','1401027591','2405090996','1401011745','5401006368','6202000074','6202014780','3003054533','1203000037','6202013585','7007014703','3013104325','3203001253','3013092670','1403025877','3206346043','6202001069','3009098304','6204086964','3206146737','3206302558','3013077967','3207009964','2201061692','3206350676','3207006950','5701001036','3013089271','3013088284','2201179094','2405056800','2405068269','2411050256','1408018314','3206346274','2405067503','2405054043','3009083639','3206181569','3205082431','3206000401','3206343695','2411035159','4417012186','5401005737','2201295708','2201260163','2201109472','3013053848','3003007820','2201288373','8204015749','3206132246','2405115264','3013073395','1801012095','7205036211','2201058686','2201108536','2405121186','2405122959','2201187912','2201165082','1203010723','2201023959','5401008029','3010131127','3010128188','3013101439','1401021775','2201205722','3010146080','3009081447','2405159497','3010010440','5401003925','2002034400','2002006106','3206077523','2006023614','2006022652','2411002431','2405116615','2201060142','6204036870','2201063829','2201060315','2201043672','2201066033','2201068849','2201051874','2201046866','2201069280','2201019817','2201001529','2201125296','2002040743','2201119973','2201108745','2201086029','2201112649','2405014040','3206125732','2405142836','2401006308','2401002763','3010127270','1004041747','8204017862','3206047465','7007016910','4410094816','2405126062','2201102882','2201113221','2201109857','2201108142','2201129294','2201144088','2201131203','2201149468','3013088883','3013104032','1806008458','4404005757','5401010239','3205057597','3013000695','4417012614','2405119874','7205040770','2405120825','4410103621','2201176257','3013029218','2405043775','4417008234','2405128449','5401007878','2405109335','2405107186','2405130020','1203006341','4410107969','4410087910','3206227908','7205041075','1401000061','1401001095','3010172670','1401001403','5701002630','4417017627','1203011378','2405017080','3010161425','2201159329','2201151766','2201182076','2201160912','2201190529','2201173025','2201173203','2201206006','2201180930','2201189762','2201181345','2201171792','2201164476','2201262607','2201232985','2201290847','2201236656','2201212944','2201262321','2201214595','2201215167','1403027290','2201295480','2201262201','2201270413','1403022548','2201270165','2201224107','2201226083','2201261101','2201275540','3010162362','2002021924','1403020368','2201317411','1403010893','2201311513','1401050389','2201323253','3010157795','2201308335','2201312985','1401047449','2201310891','2201030216','1401046961','1401044638','2002044756','2002046060','1401028710','1401021414','3010176921','1401019061','1401018060','1401017430','1801015101','1403011467','1801001548','1004010288','2405152478','2201282673','5401005210','4415009581','2405016124','3013079554','8007012294','2405151054','2405143562','6204040169','3013037585','3206110465','5401003081','3010090046','1401024520','3003064430','3206078515','4410041954','2405158525','3013041881','3013020518','3206087998','2401015459','3010151198','2201081052','4410113020','7001016402','5401004111','2201064123','3206076732','3206076353','3013019249','3206060574','3206169095','3013046587','3013022488','2201215839','3206191932','3013028680','2201060939','1004007935','4404010545','3003011016','4404015329','3013021298','2201084553','1403007413','3013035935','1401049347','2201168689','2405125431','4410007288','4410014490','1004035307','2411004789','3206100304','5701004524','3009065456','3206146430','6204009762','2405165511','2201224386','1004046473','1004048636','3009085100','2401020090','5501004404','4410021322','4410134155','3003028792','2405173606','4410091707','4404012934','4410152257','3013051607','4410141061','2405153237','4410137824','2201331578','4410097642','4410086685','4410074071','8206005520','4410066093','4410047599','4410030291','2411017168','3013048050','3206167206','3206186083','2411034809','2401017289','2405057032','2411038079','4410015805','6202004871','4410022360','7205009083','3013048896','7205000159','2411003950','2411015024','3206128534','1404019400','3013067472','3013004604','3013023373','6204053522','3206202380','4404017213','2405128606','3206033091','4410121072','4417016913','1004048319','3013073092','3013103642','6204054038','4410028517','1408016297','2201203640','2201203017','3206341362','6204055486','6204009111','3206271333','7001045321','7001045526','6202018357','3206319662','3206322700','3013050520','3206282683','3206207894','7205028816','2404012643','3206141026','2201004552','1004043016','3206180209','3206167440','5701005985','6204053724','3206157064','1004042543','3013108190','3010102921','3003037572','1408015236','1404026862','2201152554','6204027296','1404023916','1404022639','1401048874','6204049605','4410153948','1404021889','1404012644','1404005108','1401054274','1403002026','1004049200','1004047959','1004019154','2201073980','1004036011','1004018773','1004004851','3009138424','3001032106','1004008283','3009021881','2201191507','3303092357','1004039356','3009084638','1004026391','2201149357','2411043192','2201172381','5401004840','2201285402','2405056140','2201296902','3206318106','4410002028','2201076125','5401010981','3010116237','2201141977','3013106407','3013127607','2201187222','3013113532','5401009045','3206319868','3303064516','3303022709','1404018740','3010130292','3009055435','2201221794','3206161087','3013113146','1004020660','3303155519','3013074502','3013035455','2232000311','2232003133','3013114902','3013011477','3013116913','3013067562','3206302592','3009158569','3206065202','2201119105','4404011075','2201175970','2405121476','2411001782','3013117604','1004015281','6204074542','1004008212','2201219094','2405011665','3013045872','1004022083','5401009684','3010160380','1004021719','6204083644','1004037740','2225013750','3206003048','1004035478','3010090833','3010134298','6204019745','3206207777','2406032223','3013049200','3009005731','3206186195','6202014262','4410096893','3010086425','4410129221','3009073009','6202009661','3206315515','6202003519','1004031831','3206278899','3010117897','4404012273','3206034546','3013009771','1004028511','1401001763','3009048927','4410038829','1004050908','4604013958','4604017598','2201323298','1004018068','1004017495','3009145642','1401033198','2201291780','1404004396','2201097914','1404013950','2201279888','2201170890','2201262024','6204034928','6204035907','6204045085','3206347041','1404003449','6204039801','1401022112','1401022066','2405070676','2201314509','1004024596','2201199183','6204064000','3010139738','6204072800','1401011614','1401009882','4410013958','1004018106','1404003111','3010101417','3010104918','3009120315','3009080599','3009072938','1004047207','1004020608','1404026523','4404001693','6202013653','6204077100','1404019563','7205020700','1004012151','2232005347','3010139214','4415014834','1404001144','1004014781','1004004129','4410017743','1401057105','2405158533','2201115328','3206196352','3206105316','3206203340','4410113793','4604036727','3206119236','4611009939','1806004379','4410061712','3206254725','4404005192','4415002103','2201181092','3206239153','2201154410','2236003075','4410000707','2201075555','3206178501','3206181794','6204055278','3206380014','2405105669','2201209079','4410065735','2405110441','4410154071','2201129703','2232005115','2201146728','6204019115','3010039301','4410044420','3003019604','3013022036','3003003025','2201232711','4410091067','4410117774','3303164243','3010033411','2232004605','4410009465','2201285825','2411040214','2225003142','2232000120','2405084487','3010014932','1403021381','5401006584','5401008298','5401010070','3001050397','2225009239','3001056433','5401010107','5401008529','3010083716','5401011159','3010083773','2201325538','4410092638','4404001327','2405175736','5401001543','2405019643','3206077254','2236003596','1404005671','1004026426','2201262541','3009010451','3013120632','3206017918','8006004351','2201275035','1408016821','1401030233','2201226316','1004032480','1401052124','4415043793','2201047861','1805003433','1401044652','1404028699','2225002971','1004042447','1004045519','2201316102','2201303055','7001012871','1004007127','7001004802','1004011686','7001022453','1004021745','7001034825','7205002307','1401036961','4415030700','7205028679','7205023834','7205011521','1401021715','7001025221','1404024710','7001043101','7002005934','7002007315','7007009058','1404027164','7007013214','1404001161','7012000998','7012003607','1004048442','7001049494','7205024000','7205027588','3013116480','7006001554','7006011714','7205038671','2411021854','7006018132','3003000594','1404005783','7001012258','7001014713','3009097417','3206169349','3206269871','3013093573','2201184171','1404027728','7001002614','7001006953','3003024269','7001009584','3013090267','3010179501','3010174117','5401005981','4410058974','3009061729','3206333719','3010147497','3013097143','2201136688','4415041557','1404013564','3013035305','2006021291','3206057867','5401010847','7205020604','7205010754','7205009811','2405051837','3206002330','3013059689','4410037407','3009006828','1004041606','3009103993','2201330950','3206309881','1404010178','2201100039','2405059021','6202000874','7001021471','3206356180','3206257748','3206165479','6204024537','6204057792','6204070460','6204000600','4410142783','7201001940','7205013636','3013014988','2201028569','2201033279','2201040763','2201043101','2201047835','2201076058','7205028868','4410122687','2405093970','7205006682','7205040378','2201092387','2201093080','2201100234','2201117308','2201124515','2201120032','2201126797','2201133417','2201129712','2201140096','2201178653','2002031874','2201155562','2201179554','2201216137','2201162374','2201300332','2201246964','2201002053','2201267822','2002001260','2201304023','2002027493','2201316321','2201327480','2002030936','2201031554','2201080283','2201150699','3009020588','2002016843','2002025362','2002047971','2002030545','2201043661','2201013324','3010111290','2002009354','2002012190','3206249463','3206277733','7205036924','2411009287','7205004014','8001001953','4410143881','4410155639','1403019821','3303137504','4410091263','4410029721','2411026021','2404007590','2405065627','2227017232','3206298254','3206289046','2227002862','3206164950','4410150543','2405045004','5105087404','5401000238','2406046468','2411015927','4410132128','2201210564','2232014553','2405058855','4410081295','4410120614','6204065627','3010116851','3010015423','6204088373','6204057988','2411043140','2405155220','2405022037','4410012970','2405170527','2405030660','2201216731','2201261854','6204028793','2411000375','2201123805','2201179822','2201118612','1404006034','3206170263','3206114668','3303020133','3010010823','3010008948','8204013252','2201078803','8204007382','1004010024','1004049498','1004023364','1004001791','1404027533','2406037915','2406005572','2406053565','1806008460','3009033768','2201267125','2201300397','2201232660','2201188022','2201229964','4410019320','3009002909','3303167382','2201145946','2201087801','2201211201','2201096398','2201194809','2201210383','3009108843','2201144684','2201210114','3303066667','3303155024','3009001470','2201180721','2201302874','2201246078','3001035397')
and rejection_provision<>'NQ';

------------JHARKHAND RESULT NOT PROCESSED 218 CANDIDATES ------------------

update candidates 
set to_be_considered='On Hold',
remarks='JHARKHAND STATE NOT PROCESSED'
where  to_be_considered is not null and state_ut_considered='Jharkhand';---218

----------STATE DISTRICT CODE UPDATE --------------

with cte as
(
	select distinct statecode_considered_app,statename_considered_app from candidates order by statecode_considered_app
)

update candidates_new a
set a.state_ut_code_considered=cte.statecode_considered_app
from cte
where cte.statename_considered_app=a.state_ut_considered;------92867

with cte as
(
select distinct districtcode_considered_app,districtname_considered_app from candidates order by districtcode_considered_app
)

update candidates_new a
set a.district_code_considered=cte.districtcode_considered_app
from cte
where cte.districtname_considered_app=a.district_considered;---92867

------------NAXAL/BOARDER DISTRICT UPDATE---------------

update candidates_new a
set a.naxal_district=b."isNaxalDistrict",
a.border_district=b."isBoarderDistrict"
from m_states_districts b
where a.district_code_considered=b."distCode" and 
b."Present_Active"=true;---92867

update candidates_new
set rejection_provision='NQ' where 
to_be_considered='No' and rejection_provision='Q';-----21225

select distinct type_of_ncc_certificate,ncc_marks_new from candidates_new where to_be_considered='Yes';--all ok

---------------AGE RELAXATION CODE-----------------------------

select distinct age_relaxation_code,count(*) from candidates_new where to_be_considered='Yes' group by age_relaxation_code;

update candidates_new
set agerelax_code_new='01'
where to_be_considered='Yes' and
age_relaxation_code in ('01','01 - SC/ST','1');---13059

update candidates_new
set agerelax_code_new='02'
where to_be_considered='Yes' and
age_relaxation_code in ('02','02 - OBC','2');---14892

update candidates_new
set agerelax_code_new='03'
where to_be_considered='Yes' and
age_relaxation_code in ('03 - Ex-Servicemen (ESM)');---275

select * from candidates_new where to_be_considered='Yes' and cat1='1' and cat2='3' and agerelax_code_new is null;---2 candidates given arc 03

select * from candidates_new where to_be_considered='Yes' and cat1='1' and cat2 is null and agerelax_code_new is null;----6033 candidates given arc 01

update candidates_new
set agerelax_code_new='01'
where to_be_considered='Yes' and cat1='1' and cat2 is null and agerelax_code_new is null;----6033

select * from candidates_new where to_be_considered='Yes' and cat1='2' and cat2='3' and agerelax_code_new='01';---1 candidate given arc 03

select * from candidates_new where to_be_considered='Yes' and cat1='2' and cat2 is null and agerelax_code_new is null;-----4799 candidates given arc 01

update candidates_new
set agerelax_code_new='01'
where to_be_considered='Yes' and cat1='2' and cat2 is null and agerelax_code_new is null;---4799

select * from candidates_new where to_be_considered='Yes' and cat1='6' and cat2='3' and agerelax_code_new='02';----2 candidates given arc 03

select * from candidates_new where to_be_considered='Yes' and cat1='6' and cat2='3' and agerelax_code_new is null;---1 candidates given arc 03

select * from candidates_new where to_be_considered='Yes' and cat1='6' and cat2 is null and agerelax_code_new is null;---14930 candidates given arc 02

update candidates_new
set agerelax_code_new='02'
where to_be_considered='Yes' and cat1='6' and cat2 is null and agerelax_code_new is null;---14930

select * from candidates_new where to_be_considered='Yes' and cat1='9' and cat2='3' and agerelax_code_new is null;---4 candidates given arc 03

select * from candidates_new where to_be_considered='Yes' and cat1='9' and cat2 is null and agerelax_code_new='01';---4 candidates arc removed

select * from candidates_new where to_be_considered='Yes' and cat1='9' and cat2 is null and agerelax_code_new='02';---42 candidates arc removed

update candidates_new
set agerelax_code_new=null
where to_be_considered='Yes' and cat1='9' and cat2 is null and agerelax_code_new='02';---42

select distinct cat1,cat2,agerelax_code_new,count(*) from candidates_new where to_be_considered='Yes' group by cat1,cat2,agerelax_code_new;---all ok

---------------CANDIDATES FOR RESULT PROCESSING 71314-------------

select "registrationNo" as regno,rollno,candidate_name as cand_name, dob,cat1,cat2,cat3,gender,state_ut_code_considered as statecode_considered
,naxal_district,border_district, parta_gi, partb_ga,normalized_score,total_marks_new as total_marks,rejection_provision,post_preference as post_pref,
agerelax_code_new as agerelax_code,ncc_marks_new as ncc_marks,exs_reservation,length_of_service as service_period,ht_rlx_code,chst_rlx_code,height_relax,chest_relax,height_chest_relax
from candidates where to_be_considered='Yes' and rejection_provision in ('Q','TU','W');


select * from candidates_new where rollno='1004042111';

create table candidates_python
(regno character varying,
 rollno	character varying,
 cand_name character varying,
 dob date,
 cat1 character varying,
 cat2 character varying,
 cat3 character varying,
 gender character varying,
 statecode_considered character varying,
 naxal_district boolean,
 border_district boolean,
 parta_gi	numeric,
 partb_ga	numeric,
 normalized_score numeric,
 total_marks numeric,
 rejection_provision character varying,
 post_pref character varying,
 agerelax_code character varying,
 ncc_marks numeric,
 exs_reservation character varying,
 service_period character varying,
 merit integer,
 cutoff_flag character varying,
 exsm_yrs character varying,
 exsm_months character varying,
 exsm_days character varying,
 dob_flag character varying,
 catsel_dob_flag character varying,
 catsel character varying,
 allocated_category character varying,
 allocated_post character varying,
 allocated_state character varying,
 allocated_area character varying,
 allocated_against_ur character varying
);

update candidates_python set
catsel=replace(catsel,'9','') where height_chest_relax='Yes';----4643


alter table candidates add column merit integer;
alter table candidates add column dob_flag character varying;
alter table candidates add column catsel_dob_flag character varying;
alter table candidates add column cutoff_flag character varying;
alter table candidates add column catsel character varying;
alter table candidates add column allocated_state character varying;
alter table candidates add column allocated_category character varying;
alter table candidates add column allocated_post character varying;
alter table candidates add column allocated_area character varying;
alter table candidates add column allocated_against_ur character varying;

update candidates a
set
a.merit =b.merit,
a.dob_flag =b.dob_flag,
a.catsel_dob_flag =b.catsel_dob_flag,
a.cutoff_flag=b.cutoff_flag,
a.catsel=b.catsel,
a.allocated_state=b.allocated_state,
a.allocated_category=b.allocated_category,
a.allocated_post=b.allocated_post,
a.allocated_area=b.allocated_area,
a.allocated_against_ur =b.allocated_against_ur
from candidates_python b
where a.rollno=b.rollno;----71314


with cte as
(
	select distinct state_ut_code_considered, state_ut_considered from candidates
)
update candidates a
set a.allocated_state_name=cte.state_ut_considered
from cte
where a.allocated_state=cte.state_ut_code_considered
and a.allocated_state is not null;----48437

update candidates
set allocated_state_name='ALL INDIA'
where allocated_state='39';---132


----------------------13 court case candidates ---------------------------

'9212002651','9206002829','3402012616','3206164771','3206146922','7003025433','7001019566','7001007262','7001007543','7006000049','9212007937','9212001500','9210003440'


to_be_considered	rollno
update candidates set to_be_considered='Yes'	WHERE rollno='4410080841';
update candidates set to_be_considered='No'		WHERE rollno='4610007781';
update candidates set to_be_considered='Yes'	WHERE rollno='3206063123';
update candidates set to_be_considered='No'		WHERE rollno='4417002709';
update candidates set to_be_considered='No' 	WHERE rollno='3207012500';
update candidates set to_be_considered='Yes'	WHERE rollno='4417002661';
update candidates set to_be_considered='Yes'	WHERE rollno='3013137685';
update candidates set to_be_considered='Yes'	WHERE rollno='3013051943';
update candidates set to_be_considered='Yes'	WHERE rollno='4610000022';
update candidates set to_be_considered='Yes'	WHERE rollno='3206346579';
update candidates set to_be_considered='Yes'	WHERE rollno='4417019964';
update candidates set to_be_considered='Yes'	WHERE rollno='4610019775';
update candidates set to_be_considered='Yes'	WHERE rollno='3206050253';
update candidates set to_be_considered='Yes'	WHERE rollno='3206347668';
update candidates set to_be_considered='Yes'	WHERE rollno='3013020420';
update candidates set to_be_considered='No'		WHERE rollno='4417006266';
update candidates set to_be_considered='Yes'	WHERE rollno='3206265142';
update candidates set to_be_considered='Yes'	WHERE rollno='4417017869';
update candidates set to_be_considered='Yes'	WHERE rollno='4404016513';
update candidates set to_be_considered='Yes'	WHERE rollno='3203010825';
update candidates set to_be_considered='No' 	WHERE rollno='3206050218';
update candidates set to_be_considered='Yes'	WHERE rollno='3206280406';
update candidates set to_be_considered='Yes'	WHERE rollno='3013005451';
update candidates set to_be_considered='Yes'	WHERE rollno='3206278079';
update candidates set to_be_considered='Yes'	WHERE rollno='3206375567';
update candidates set to_be_considered='No' 	WHERE rollno='2201006166';
update candidates set to_be_considered='Yes'	WHERE rollno='4610020795';
update candidates set to_be_considered='Yes'	WHERE rollno='4610003228';
update candidates set to_be_considered='Yes'	WHERE rollno='3206068079';
update candidates set to_be_considered='Yes'	WHERE rollno='3203003714';
update candidates set to_be_considered='Yes'	WHERE rollno='3206113224';
update candidates set to_be_considered='Yes'	WHERE rollno='4610021910';
update candidates set to_be_considered='Yes'	WHERE rollno='3013082669';
update candidates set to_be_considered='Yes'	WHERE rollno='3013017152';
update candidates set to_be_considered='Yes'	WHERE rollno='3013027434';
update candidates set to_be_considered='No' 	WHERE rollno='4410063711';
update candidates set to_be_considered='No' 	WHERE rollno='4410105564';
update candidates set to_be_considered='Yes'	WHERE rollno='3206059197';
update candidates set to_be_considered='Yes'	WHERE rollno='4410093669';
update candidates set to_be_considered='Yes'	WHERE rollno='4417006617';
update candidates set to_be_considered='Yes'	WHERE rollno='3013061340';
update candidates set to_be_considered='Yes'	WHERE rollno='3206328547';
update candidates set to_be_considered='No' 	WHERE rollno='4605008113';
update candidates set to_be_considered='Yes'	WHERE rollno='3013032862';
update candidates set to_be_considered='Yes'	WHERE rollno='3013039473';
update candidates set to_be_considered='No' 	WHERE rollno='3013048999';
update candidates set to_be_considered='Yes'	WHERE rollno='4404000701';
update candidates set to_be_considered='Yes'	WHERE rollno='4404005437';
update candidates set to_be_considered='Yes'	WHERE rollno='3206180937';
update candidates set to_be_considered='Yes'	WHERE rollno='2201220130';
update candidates set to_be_considered='No' 	WHERE rollno='3206235147';
update candidates set to_be_considered='Yes'	WHERE rollno='3206291963';
update candidates set to_be_considered='Yes'	WHERE rollno='3013034634';
update candidates set to_be_considered='Yes'	WHERE rollno='3013012719';
update candidates set to_be_considered='No' 	WHERE rollno='4417010423';
update candidates set to_be_considered='Yes'	WHERE rollno='3013091703';
update candidates set to_be_considered='Yes'	WHERE rollno='4610018567';
update candidates set to_be_considered='Yes'	WHERE rollno='4610004912';
update candidates set to_be_considered='No' 	WHERE rollno='4410108764';
update candidates set to_be_considered='No' 	WHERE rollno='3206354785';
update candidates set to_be_considered='Yes'	WHERE rollno='4610016975';
update candidates set to_be_considered='No' 	WHERE rollno='4610008727';
update candidates set to_be_considered='Yes'	WHERE rollno='2405027333';
update candidates set to_be_considered='No' 	WHERE rollno='3206387553';
update candidates set to_be_considered='Yes'	WHERE rollno='3207005918';
update candidates set to_be_considered='Yes'	WHERE rollno='3013107928';
update candidates set to_be_considered='No' 	WHERE rollno='4610004765';
update candidates set to_be_considered='Yes'	WHERE rollno='3206180966';
update candidates set to_be_considered='Yes'	WHERE rollno='4610010529';
update candidates set to_be_considered='Yes'	WHERE rollno='4610004724';
update candidates set to_be_considered='Yes'	WHERE rollno='3013113803';
update candidates set to_be_considered='Yes'	WHERE rollno='4417017128';
update candidates set to_be_considered='No' 	WHERE rollno='4610004733';
update candidates set to_be_considered='Yes'	WHERE rollno='2201224609';
update candidates set to_be_considered='Yes'	WHERE rollno='4610001180';
update candidates set to_be_considered='No' 	WHERE rollno='3013008198';
update candidates set to_be_considered='Yes'	WHERE rollno='3203016092';
update candidates set to_be_considered='Yes'	WHERE rollno='2201155999';
update candidates set to_be_considered='Yes'	WHERE rollno='4610003819';
update candidates set to_be_considered='Yes'	WHERE rollno='3013070842';
update candidates set to_be_considered='Yes'	WHERE rollno='4610022765';
update candidates set to_be_considered='Yes'	WHERE rollno='4610022137';
update candidates set to_be_considered='Yes'	WHERE rollno='3206036035';
update candidates set to_be_considered='Yes'	WHERE rollno='4610021042';
update candidates set to_be_considered='No' 	WHERE rollno='4410070430';
update candidates set to_be_considered='Yes'	WHERE rollno='4610016735';
update candidates set to_be_considered='Yes'	WHERE rollno='3206157123';
update candidates set to_be_considered='Yes'	WHERE rollno='4610000289';
update candidates set to_be_considered='Yes'	WHERE rollno='7801000773';
update candidates set to_be_considered='Yes'	WHERE rollno='4610013983';
update candidates set to_be_considered='Yes'	WHERE rollno='4610008647';
update candidates set to_be_considered='Yes'	WHERE rollno='4610000973';
update candidates set to_be_considered='Yes'	WHERE rollno='4610008900';
update candidates set to_be_considered='Yes'	WHERE rollno='3013121338';
update candidates set to_be_considered='Yes'	WHERE rollno='4610015487';
update candidates set to_be_considered='Yes'	WHERE rollno='4410032174';
update candidates set to_be_considered='Yes'	WHERE rollno='4410008884';
update candidates set to_be_considered='Yes'	WHERE rollno='3206402970';
update candidates set to_be_considered='Yes'	WHERE rollno='4410017530';
update candidates set to_be_considered='Yes'	WHERE rollno='4410070277';
update candidates set to_be_considered='Yes'	WHERE rollno='3206076861';
update candidates set to_be_considered='Yes'	WHERE rollno='2201063290';
update candidates set to_be_considered='Yes'	WHERE rollno='4404015089';
update candidates set to_be_considered='No' 	WHERE rollno='4410039943';
update candidates set to_be_considered='No' 	WHERE rollno='3013088601';
update candidates set to_be_considered='No' 	WHERE rollno='4410016626';
update candidates set to_be_considered='Yes'	WHERE rollno='3203012687';
update candidates set to_be_considered='Yes'	WHERE rollno='2406003692';
update candidates set to_be_considered='Yes'	WHERE rollno='3206056062';
update candidates set to_be_considered='Yes'	WHERE rollno='4410115317';
update candidates set to_be_considered='No' 	WHERE rollno='3201012250';
update candidates set to_be_considered='Yes'	WHERE rollno='4410140995';
update candidates set to_be_considered='Yes'	WHERE rollno='4410059750';
update candidates set to_be_considered='No' 	WHERE rollno='4410040754';
update candidates set to_be_considered='Yes'	WHERE rollno='4610012391';
update candidates set to_be_considered='Yes'	WHERE rollno='4610017357';
update candidates set to_be_considered='Yes'	WHERE rollno='4610004757';
update candidates set to_be_considered='Yes'	WHERE rollno='4610008132';
update candidates set to_be_considered='Yes'	WHERE rollno='4610011316';
update candidates set to_be_considered='Yes'	WHERE rollno='4610002459';
update candidates set to_be_considered='Yes'	WHERE rollno='4610022733';
update candidates set to_be_considered='Yes'	WHERE rollno='4410064091';
update candidates set to_be_considered='No' 	WHERE rollno='4610002306';
update candidates set to_be_considered='Yes'	WHERE rollno='4610011958';
update candidates set to_be_considered='Yes'	WHERE rollno='4610023496';
update candidates set to_be_considered='Yes'	WHERE rollno='3205029522';
update candidates set to_be_considered='Yes'	WHERE rollno='4610005529';
update candidates set to_be_considered='Yes'	WHERE rollno='3207004643';
update candidates set to_be_considered='No' 	WHERE rollno='4410010346';
update candidates set to_be_considered='Yes'	WHERE rollno='4610008639';
update candidates set to_be_considered='Yes'	WHERE rollno='4410088591';
update candidates set to_be_considered='Yes'	WHERE rollno='7001021655';
update candidates set to_be_considered='Yes'	WHERE rollno='4410087910';
update candidates set to_be_considered='Yes'	WHERE rollno='4410155639';
update candidates set to_be_considered='Yes'	WHERE rollno='4410037314';
update candidates set to_be_considered='Yes'	WHERE rollno='1401057105';
update candidates set to_be_considered='Yes'	WHERE rollno='4610001169';
update candidates set to_be_considered='Yes'	WHERE rollno='4610015112';
update candidates set to_be_considered='Yes'	WHERE rollno='4610013840';
update candidates set to_be_considered='Yes'	WHERE rollno='4610022970';
update candidates set to_be_considered='Yes'	WHERE rollno='4610014401';
update candidates set to_be_considered='Yes'	WHERE rollno='3209016507';
update candidates set to_be_considered='Yes'	WHERE rollno='4610018741';
update candidates set to_be_considered='Yes'	WHERE rollno='4610000602';
update candidates set to_be_considered='Yes'	WHERE rollno='3013055844';
update candidates set to_be_considered='No' 	WHERE rollno='4410066650';
update candidates set to_be_considered='Yes'	WHERE rollno='8601027249';
update candidates set to_be_considered='No' 	WHERE rollno='4610002238';
update candidates set to_be_considered='No' 	WHERE rollno='4610012813';
update candidates set to_be_considered='Yes'	WHERE rollno='4610001793';
update candidates set to_be_considered='Yes'	WHERE rollno='3013070285';
update candidates set to_be_considered='Yes'	WHERE rollno='4610013533';
update candidates set to_be_considered='Yes'	WHERE rollno='3206224101';
update candidates set to_be_considered='Yes'	WHERE rollno='3203019702';
update candidates set to_be_considered='Yes'	WHERE rollno='4610002298';
update candidates set to_be_considered='Yes'	WHERE rollno='4610022000';
update candidates set to_be_considered='Yes'	WHERE rollno='3203000282';
update candidates set to_be_considered='No' 	WHERE rollno='3206277063';
update candidates set to_be_considered='Yes'	WHERE rollno='3013126547';
update candidates set to_be_considered='Yes'	WHERE rollno='4610014827';
update candidates set to_be_considered='Yes'	WHERE rollno='4417005744';
update candidates set to_be_considered='Yes'	WHERE rollno='3206246701';
update candidates set to_be_considered='Yes'	WHERE rollno='3013062154';
update candidates set to_be_considered='Yes'	WHERE rollno='3206369133';
update candidates set to_be_considered='Yes'	WHERE rollno='4610004845';
update candidates set to_be_considered='Yes'	WHERE rollno='3207001821';
update candidates set to_be_considered='Yes'	WHERE rollno='4610016123';
update candidates set to_be_considered='Yes'	WHERE rollno='2201091510';
update candidates set to_be_considered='Yes'	WHERE rollno='3013013219';
update candidates set to_be_considered='No' 	WHERE rollno='4610001362';
update candidates set to_be_considered='No' 	WHERE rollno='3206294625';
update candidates set to_be_considered='Yes'	WHERE rollno='3206134004';
update candidates set to_be_considered='No' 	WHERE rollno='3013064431';
update candidates set to_be_considered='Yes'	WHERE rollno='4610016967';
update candidates set to_be_considered='Yes'	WHERE rollno='4610008135';
update candidates set to_be_considered='Yes'	WHERE rollno='4610023489';
update candidates set to_be_considered='Yes'	WHERE rollno='4410036345';
update candidates set to_be_considered='Yes'	WHERE rollno='3206215631';
update candidates set to_be_considered='Yes'	WHERE rollno='3013015826';
update candidates set to_be_considered='Yes'	WHERE rollno='3013137140';
update candidates set to_be_considered='Yes'	WHERE rollno='4410102313';
update candidates set to_be_considered='Yes'	WHERE rollno='4610001121';
update candidates set to_be_considered='No' 	WHERE rollno='4410115202';
update candidates set to_be_considered='Yes'	WHERE rollno='4410159729';
update candidates set to_be_considered='Yes'	WHERE rollno='3206288568';
update candidates set to_be_considered='Yes'	WHERE rollno='4417010683';
update candidates set to_be_considered='Yes'	WHERE rollno='4610014250';
update candidates set to_be_considered='Yes'	WHERE rollno='4410057355';
update candidates set to_be_considered='Yes'	WHERE rollno='4417007868';
update candidates set to_be_considered='Yes'	WHERE rollno='4417007160';
update candidates set to_be_considered='Yes'	WHERE rollno='7007003209';
update candidates set to_be_considered='Yes'	WHERE rollno='3203029400';
update candidates set to_be_considered='No' 	WHERE rollno='4610019041';
update candidates set to_be_considered='Yes'	WHERE rollno='4610021852';
update candidates set to_be_considered='Yes'	WHERE rollno='3010063114';
update candidates set to_be_considered='No' 	WHERE rollno='4610001397';
update candidates set to_be_considered='No' 	WHERE rollno='3203019590';
update candidates set to_be_considered='Yes'	WHERE rollno='4410031261';
update candidates set to_be_considered='No' 	WHERE rollno='4404016882';
update candidates set to_be_considered='Yes'	WHERE rollno='4410120393';
update candidates set to_be_considered='Yes'	WHERE rollno='4610012163';
update candidates set to_be_considered='Yes'	WHERE rollno='4610003212';
update candidates set to_be_considered='Yes'	WHERE rollno='2201184354';
update candidates set to_be_considered='Yes'	WHERE rollno='4410035875';
update candidates set to_be_considered='Yes'	WHERE rollno='4410051120';
update candidates set to_be_considered='No' 	WHERE rollno='3013105670';
update candidates set to_be_considered='Yes'	WHERE rollno='3206177852';
update candidates set to_be_considered='No' 	WHERE rollno='4410132763';
update candidates set to_be_considered='No' 	WHERE rollno='4610003219';
update candidates set to_be_considered='No' 	WHERE rollno='3206358335';
update candidates set to_be_considered='Yes'	WHERE rollno='4610002497';
update candidates set to_be_considered='No' 	WHERE rollno='4410048003';
update candidates set to_be_considered='Yes'	WHERE rollno='3206319129';
update candidates set to_be_considered='No'	 	WHERE rollno='3013030983';
update candidates set to_be_considered='Yes'	WHERE rollno='3403006850';
update candidates set to_be_considered='Yes'	WHERE rollno='3206279962';
update candidates set to_be_considered='No' 	WHERE rollno='4410092041';
update candidates set to_be_considered='Yes'	WHERE rollno='2201009480';


update candidates set rejection_provision='NQ' where remarks='3324 candidates data from CRPF' and to_be_considered='No';---867

update candidates set rejection_provision='TU' where remarks='3324 candidates data from CRPF' and to_be_considered='Yes' and dme_final_status='Temporary Unfit';---1

--------FIT TO BE WITH HELD--------------58

'4410036542','4410082061','4410111866','4410013777','4410030609','4410010459','4417016359','4417000934','4404014469','4417000723','4410035707','4410078958','4417004786','4410075155','4410042853','4410055722','4410101066','4410107071','4410107806','4410020497','4410002145','4410044918','4410005490','4417019523','4410119892','4410037949','4410117471','4410016017','4410138506','4410014573','4410029431','4410042983','4410071424','4410124237','4410073546','4410146895','4415028915','4410023068','4404014997','4410093162','4417011263','4410121205','4410020141','4410046955','4410000724','4410004367','4410108787','4415047871','4417017542','4410044171','4410076355','4417003680','4410124555','4415053774','4410081787','4410040421','4410044015','4410017946'

------FIT IN DV/DME------10

'3402012616','3206164771','3206146922','7006025433','7001019566','7001007262','7006000049','9212007937','9212001500','9210003440'

update candidates set cat1='9' where remarks='3324 candidates data from CRPF' and category='UR';---252
update candidates set cat1='0' where remarks='3324 candidates data from CRPF' and category='EWS';---385
update candidates set cat1='6' where remarks='3324 candidates data from CRPF' and category='OBC';---1052
update candidates set cat1='2' where remarks='3324 candidates data from CRPF' and category='ST';---783
update candidates set cat1='1' where remarks='3324 candidates data from CRPF' and category='SC';---310

select distinct to_be_considered,rejection_provision from candidates  where remarks='3324 candidates data from CRPF' and category is null;---101 NQ candidates

select distinct gender_app,gender,count(*) from candidates where remarks='3324 candidates data from CRPF' group by gender_app,gender;

update candidates set gender='1' where remarks='3324 candidates data from CRPF' and gender='Female';---281
update candidates set gender='2' where remarks='3324 candidates data from CRPF' and gender='Male';---2601

select distinct cat2_app,whether_ex_serviceman,cat2,count(*) from candidates where remarks='3324 candidates data from CRPF' group by  cat2_app,whether_ex_serviceman,cat2;

update candidates set cat2='3' where remarks='3324 candidates data from CRPF' and whether_ex_serviceman='TRUE';----7

update candidates 
set agerelax_code_new='01' where remarks='3324 candidates data from CRPF'
and cat2 is null and cat1 in ('1','2');---1093

update candidates 
set agerelax_code_new='02' where remarks='3324 candidates data from CRPF'
and cat2 is null and cat1 in ('6');---1049

update candidates 
set agerelax_code_new='03' where remarks='3324 candidates data from CRPF'
and cat2='3';---7


with cte as
(
	select distinct statecode_considered_app,statename_considered_app from candidates order by statecode_considered_app
)

update candidates a
set a.state_ut_code_considered=cte.statecode_considered_app
from cte
where cte.statename_considered_app=a.state_ut_considered;------95760

with cte as
(
select distinct districtcode_considered_app,districtname_considered_app from candidates order by districtcode_considered_app
)

update candidates a
set a.district_code_considered=cte.districtcode_considered_app
from cte
where cte.districtname_considered_app=a.district_considered;---95760

update candidates a
set a.naxal_district=b."isNaxalDistrict",
a.border_district=b."isBoarderDistrict"
from m_states_districts b
where a.district_code_considered=b."distCode" and 
b."Present_Active"=true;---95760


update candidates
set total_marks_new=normalized_score+ncc_marks_new;----95760

--------ST CANDIDATES FROM NE STATES HAVING CHEST_EXP>=82 AND CHEST_NOT_EXP>=77 to be teated as not opted CHEST_RELAXTION ---------------------552


select rollno,cat1_app,cat1,cat2,gender,state_ut_considered,state_ut_code_considered,pst_chest_not_expanded,pst_chest_expanded,ht_rlx_code,chst_rlx_code,height_relax,
chest_relax,height_chest_relax from candidates where to_be_considered='Yes' and rejection_provision in ('Q','TU','W') 
and state_ut_code_considered in ('3','22','23','24','25','30','33') and cat1='2' and chst_rlx_code='5';---666

select rollno,cat1_app,cat1,cat2,gender,state_ut_considered,state_ut_code_considered,pst_chest_not_expanded,pst_chest_expanded,ht_rlx_code,chst_rlx_code,height_relax,
chest_relax,height_chest_relax from candidates where to_be_considered='Yes' and rejection_provision in ('Q','TU','W') 
and state_ut_code_considered in ('3','22','23','24','25','30','33') and chst_rlx_code='5'and cat1='2' and (pst_chest_not_expanded>='77' and pst_chest_expanded>='82');---552

update candidates
set chest_relax=null
where rollno in (select rollno from candidates where to_be_considered='Yes' and rejection_provision in ('Q','TU','W') 
and state_ut_code_considered in ('3','22','23','24','25','30','33') and chst_rlx_code='5'and cat1='2' and (pst_chest_not_expanded>='77' and pst_chest_expanded>='82')
);---552 updates


update candidates 
set height_chest_relax=null
where to_be_considered='Yes' and rejection_provision in ('Q','TU','W') and height_relax is null and chest_relax is null and height_chest_relax='Yes';---347 updates


select * from candidates where rollno ='9212002651';----no
select * from candidates where rollno ='9206002829';---no
select * from candidates where rollno ='3402012616';---yes
select * from candidates where rollno ='3206164771';---yes
select * from candidates where rollno ='3206146922';---yes
select * from candidates where rollno ='7003025433';---no
select * from candidates where rollno ='7001019566';---yes
select * from candidates where rollno ='7001007262';---yes
select * from candidates where rollno ='7001007543';---no
select * from candidates where rollno ='7006000049';---yes
select * from candidates where rollno ='9212007937';---yes
select * from candidates where rollno ='9212001500';---yes
select * from candidates where rollno ='9210003440';---yes


Update candidates 
set to_be_considered='Yes',
rejection_provision='W',
rollnumber=rollno,
candidate_name=name,
remarks='Court case candidates',
cat1=cat1_app,
cat2=cat2_app,
age_relaxation_code=arc_code,
date_of_birth=dob,
ncc_certificate_holder=ncc_holder_app,
type_of_ncc_certificate=ncc_type_app,
state_ut_considered=statename_considered_app,
district_considered=districtname_considered_app
where rollno in ('7207011852','7203018465','7207021094');


select rollno,candidate_name,to_be_considered,rejection_provision,ncc_type_app,type_of_ncc_certificate,normalized_score,ncc_marks_new,total_marks_new
from candidates where rollno in ('7207011852','7203018465','7207021094','1004038263','9212002651','9206002829','7006025433','7001007543');


update candidates 
set
merit =null,
dob_flag =null,
catsel_dob_flag =null,
cutoff_flag=null,
catsel=null,
catsel_bkp=null,
allocated_state=null,
allocated_category=null,
allocated_post=null,
allocated_area=null,
allocated_against_ur =null,
allocated_state_name=null;


update candidates_new a
set
a.merit =b.merit,
a.dob_flag =b.dob_flag,
a.catsel_dob_flag =b.catsel_dob_flag,
a.cutoff_flag=b.cutoff_flag,
a.catsel=b.catsel,
a.catsel_bkp=b.catsel_bkp,
a.allocated_state=b.allocated_state,
a.allocated_category=b.allocated_category,
a.allocated_post=b.allocated_post,
a.allocated_area=b.allocated_area,
a.allocated_against_ur =b.allocated_against_ur
from candidates_python_new b
where a.rollno=b.rollno;----73465

