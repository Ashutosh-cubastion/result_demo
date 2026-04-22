-- Table: public.ctgd2025Applications

-- DROP TABLE IF EXISTS public."ctgd2025Applications_result";

CREATE TABLE IF NOT EXISTS public."ctgd2025Applications_result"
(
    id character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "registrationNo" character varying(11) COLLATE pg_catalog."default" NOT NULL,
    "otrId" character varying(16) COLLATE pg_catalog."default" NOT NULL,
    "myApplicationId" character varying(16) COLLATE pg_catalog."default",
    "emailId" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "phoneNo" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "newName" character varying(50) COLLATE pg_catalog."default",
    "fathersName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "mothersName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    dob date NOT NULL,
    "ageAsOnDob" character varying(30) COLLATE pg_catalog."default" NOT NULL,
    "genderId" character varying(16) COLLATE pg_catalog."default",
    gender character varying(16) COLLATE pg_catalog."default",
    "categoryId" character varying(16) COLLATE pg_catalog."default",
    category character varying(16) COLLATE pg_catalog."default",
    "isPwbd" boolean,
    "typeOfPwbd" character varying(16) COLLATE pg_catalog."default",
    "submitPwbdType" character varying(10) COLLATE pg_catalog."default",
    "nationalityId" character varying(16) COLLATE pg_catalog."default",
    nationality character varying(255) COLLATE pg_catalog."default",
    "markOfIdentification" character varying(50) COLLATE pg_catalog."default",
    "tenthEducationBoardId" character varying(16) COLLATE pg_catalog."default",
    "educationBoardName" character varying(500) COLLATE pg_catalog."default",
    "tenthRollNumber" character varying(16) COLLATE pg_catalog."default",
    "tenthYearOfPassing" character varying(5) COLLATE pg_catalog."default",
    "examCentrePreferenceId1" character varying(16) COLLATE pg_catalog."default",
    "examCentrePreferenceId2" character varying(16) COLLATE pg_catalog."default",
    "examCentrePreferenceId3" character varying(16) COLLATE pg_catalog."default",
    "cbeMedium" character varying(100) COLLATE pg_catalog."default",
    "isNccCertificateHolder" boolean,
    "nccCertificateType" character varying(100) COLLATE pg_catalog."default",
    "isPlaySport" boolean,
    "typeOfSport" character varying(100) COLLATE pg_catalog."default",
    "levelOfSport" character varying(100) COLLATE pg_catalog."default",
    "yearOfCompetition" character varying(4) COLLATE pg_catalog."default",
    "medalType" character varying(100) COLLATE pg_catalog."default",
    "domicileState" character varying(100) COLLATE pg_catalog."default",
    "domicileDistrict" character varying(100) COLLATE pg_catalog."default",
    "isMigratedFromOrigin" boolean,
    "wantsReservationFromOrigin" boolean,
    "stateOfOrigin" character varying(100) COLLATE pg_catalog."default",
    "districtOfOrigin" character varying(100) COLLATE pg_catalog."default",
    "isFromNaxalDistrict" boolean,
    "isFromBorderDistrict" boolean,
    "postPreference" character varying(1)[] COLLATE pg_catalog."default",
    "isEsm" boolean,
    "dojOfEsm" date,
    "dodOfEsm" date,
    "lengthOfService" character varying(30) COLLATE pg_catalog."default",
    "isCivilPost" boolean,
    "dojOfCivilPost" date,
    "regionCode" character varying(5) COLLATE pg_catalog."default",
    "isAgeRelaxation" boolean,
    "ageRelaxationId" character varying(16) COLLATE pg_catalog."default",
    "isPersonalInfoAccess" boolean,
    "permanentAddress" character varying(500) COLLATE pg_catalog."default",
    "permanentStateId" character varying(16) COLLATE pg_catalog."default",
    "permanentStateName" character varying(100) COLLATE pg_catalog."default",
    "permanentDistrictId" character varying(16) COLLATE pg_catalog."default",
    "permanentDistrictName" character varying(100) COLLATE pg_catalog."default",
    "permanentPincode" character varying(6) COLLATE pg_catalog."default",
    "presentAddress" character varying(500) COLLATE pg_catalog."default",
    "presentStateId" character varying(16) COLLATE pg_catalog."default",
    "presentStateName" character varying(100) COLLATE pg_catalog."default",
    "presentDistrictId" character varying(16) COLLATE pg_catalog."default",
    "presentDistrictName" character varying(100) COLLATE pg_catalog."default",
    "presentPincode" character varying(6) COLLATE pg_catalog."default",
    "isPhotoDeclare" boolean,
    "isDeclaration" boolean,
    "statusId" character varying(16) COLLATE pg_catalog."default",
    "numberOfAttempts" character varying(2) COLLATE pg_catalog."default",
    "photoName" character varying(255) COLLATE pg_catalog."default",
    "photoPath" character varying(255) COLLATE pg_catalog."default",
    "signName" character varying(255) COLLATE pg_catalog."default",
    "signPath" character varying(255) COLLATE pg_catalog."default",
    "photoSource" character varying(30) COLLATE pg_catalog."default",
    "isActive" boolean,
    "createdById" character varying(16) COLLATE pg_catalog."default",
    "createdByRoleId" character varying(16) COLLATE pg_catalog."default",
    "updatedById" character varying(16) COLLATE pg_catalog."default",
    "ipAddress" character varying(50) COLLATE pg_catalog."default",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "isRejected" boolean,
    description character varying(500) COLLATE pg_catalog."default",
	row_number INT,
    CONSTRAINT "ctgd2025Applications_pkey_result" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."ctgd2025Applications_result"
    OWNER to sscpgadmin;

insert into "ctgd2025Applications_result"
(
id, "registrationNo", "otrId", "myApplicationId", "emailId", "phoneNo", name, "newName", "fathersName", "mothersName", dob, "ageAsOnDob", "genderId", gender, "categoryId", category, "isPwbd", "typeOfPwbd", "submitPwbdType", "nationalityId", nationality, "markOfIdentification", "tenthEducationBoardId", "educationBoardName", "tenthRollNumber", "tenthYearOfPassing", "examCentrePreferenceId1", "examCentrePreferenceId2", "examCentrePreferenceId3", "cbeMedium", "isNccCertificateHolder", "nccCertificateType", "isPlaySport", "typeOfSport", "levelOfSport", "yearOfCompetition", "medalType", "domicileState", "domicileDistrict", "isMigratedFromOrigin", "wantsReservationFromOrigin", "stateOfOrigin", "districtOfOrigin", "isFromNaxalDistrict", "isFromBorderDistrict", "postPreference", "isEsm", "dojOfEsm", "dodOfEsm", "lengthOfService", "isCivilPost", "dojOfCivilPost", "regionCode", "isAgeRelaxation", "ageRelaxationId", "isPersonalInfoAccess", "permanentAddress", "permanentStateId", "permanentStateName", "permanentDistrictId", "permanentDistrictName", "permanentPincode", "presentAddress", "presentStateId", "presentStateName", "presentDistrictId", "presentDistrictName", "presentPincode", "isPhotoDeclare", "isDeclaration", "statusId", "numberOfAttempts", "photoName", "photoPath", "signName", "signPath", "photoSource", "isActive", "createdById", "createdByRoleId", "updatedById", "ipAddress", "createdAt", "updatedAt", "isRejected", description, row_number)
select 
id, "registrationNo", "otrId", "myApplicationId", "emailId", "phoneNo", name, "newName", "fathersName", "mothersName", dob, "ageAsOnDob", "genderId", gender, "categoryId", category, "isPwbd", "typeOfPwbd", "submitPwbdType", "nationalityId", nationality, "markOfIdentification", "tenthEducationBoardId", "educationBoardName", "tenthRollNumber", "tenthYearOfPassing", "examCentrePreferenceId1", "examCentrePreferenceId2", "examCentrePreferenceId3", "cbeMedium", "isNccCertificateHolder", "nccCertificateType", "isPlaySport", "typeOfSport", "levelOfSport", "yearOfCompetition", "medalType", "domicileState", "domicileDistrict", "isMigratedFromOrigin", "wantsReservationFromOrigin", "stateOfOrigin", "districtOfOrigin", "isFromNaxalDistrict", "isFromBorderDistrict", "postPreference", "isEsm", "dojOfEsm", "dodOfEsm", "lengthOfService", "isCivilPost", "dojOfCivilPost", "regionCode", "isAgeRelaxation", "ageRelaxationId", "isPersonalInfoAccess", "permanentAddress", "permanentStateId", "permanentStateName", "permanentDistrictId", "permanentDistrictName", "permanentPincode", "presentAddress", "presentStateId", "presentStateName", "presentDistrictId", "presentDistrictName", "presentPincode", "isPhotoDeclare", "isDeclaration", "statusId", "numberOfAttempts", "photoName", "photoPath", "signName", "signPath", "photoSource", "isActive", "createdById", "createdByRoleId", "updatedById", "ipAddress", "createdAt", "updatedAt", "isRejected", description, row_number() over (order by "registrationNo")
from "ctgd2025Applications" where "statusId"='01' and "isActive"=true; ------52,69,512

\copy (select * from "ctgd2025Applications_result" where row_number<='900000') to 'C:\Users\Public\file1.csv' csv header;

create table regrollmap_ctgd25
(regno character varying,
rollno character varying,
constraint pk_rr primary key(regno));----50,98,887

update "ctgd2025Applications_result" a
set a.rollno=b.rollno
from regrollmap_ctgd25 b where
a."registrationNo"=b.regno;----50,98,887 updates

select count(*) from "ctgd2025Applications_result" where rollno is not null;-----5098887

alter table "ctgd2025Applications_result" add column cat1 character varying;
alter table "ctgd2025Applications_result" add column cat2 character varying;
alter table "ctgd2025Applications_result" add column cat3 character varying;

select distinct category,count(*) from "ctgd2025Applications_result" group by category;
"EWS"	312715
"OBC"	2378578
"SC"	1232097
"ST"	694016
"UR"	652106

update "ctgd2025Applications_result"
set cat1=CASE
WHEN category='EWS' then '0'
WHEN category='SC' then '1'
WHEN category='ST' then '2'
WHEN category='OBC' then '6'
WHEN category='UR' then '9'
ELSE null END;

select distinct category,cat1,count(*) from "ctgd2025Applications_result" group by category,cat1;

"EWS"	"0"		312715
"OBC"	"6"		2378578
"SC"	"1"		1232097
"ST"	"2"		694016
"UR"	"9"		652106	

select distinct gender,count(*) from "ctgd2025Applications_result" group by gender;
"Female"		1280133
"Male"			3989337
"Transgender"	42

select distinct gender,genderid,count(*) from "ctgd2025Applications_result" group by gender,genderid;
"Female"		"1"		1280133
"Male"			"2"		3989337
"Transgender"	"3"		42

select distinct "typeOfPwbd",count(*) from "ctgd2025Applications_result" group by "typeOfPwbd";
----no such candidate found

select distinct "isEsm",count(*) from "ctgd2025Applications_result" group by "isEsm";
false	5263255
true	6257

update "ctgd2025Applications_result" set cat2='3' where "isEsm"=true;----6257 updates

alter table "ctgd2025Applications_result" add column exs_reservation character varying;

select distinct "isEsm",cat2,"isCivilPost",count(*) from "ctgd2025Applications_result"  where cat2='3' group by "isEsm",cat2,"isCivilPost";

true	"3"		false	5455
true	"3"		true	245
true	"3"				557


update "ctgd2025Applications_result"
set exs_reservation='Yes' where cat2='3';---6257 updates

update "ctgd2025Applications_result"
set exs_reservation='No' where cat2='3' and "isCivilPost"=true;---245 updates

select distinct "isEsm",cat2,"isCivilPost",exs_reservation,count(*) from "ctgd2025Applications_result"  where cat2='3' group by "isEsm",cat2,"isCivilPost",exs_reservation;

true	"3"		false	"Yes"	5455
true	"3"		true	"No"	245
true	"3"				"Yes"	557

alter table "ctgd2025Applications_result" add column arc_code character varying;
alter table "ctgd2025Applications_result" add column remarks character varying;

select distinct "isAgeRelaxation","ageRelaxationId",count(*) from "ctgd2025Applications_result" group by "isAgeRelaxation","ageRelaxationId";

false						3530325
true	"po3uys0tshj7u33"	904358
true	"po3uys0tshj7u34"	782321
true	"po3uys0tshj7u35"	5639
true	"po3uys0tshj7u36"	23360
true	"po3uys0tshj7u37"	8994
true	"po3uys0tshj7u38"	14514
		1
		


update "ctgd2025Applications_result"
set arc_code='01' where "ageRelaxationId"='po3uys0tshj7u33';----904358 updates

update "ctgd2025Applications_result"
set arc_code='02' where "ageRelaxationId"='po3uys0tshj7u34';----782321 updates

update "ctgd2025Applications_result"
set arc_code='03' where "ageRelaxationId"='po3uys0tshj7u35';----5639 updates

update "ctgd2025Applications_result"
set arc_code='04' where "ageRelaxationId"='po3uys0tshj7u36';----23360 updates

update "ctgd2025Applications_result"
set arc_code='05' where "ageRelaxationId"='po3uys0tshj7u37';----8994 updates

update "ctgd2025Applications_result"
set arc_code='06' where "ageRelaxationId"='po3uys0tshj7u38';----14514 updates


select distinct "isAgeRelaxation","ageRelaxationId",arc_code,count(*) from "ctgd2025Applications_result" group by "isAgeRelaxation","ageRelaxationId",arc_code;

false								3530325
true	"po3uys0tshj7u33"	"01"	904358
true	"po3uys0tshj7u34"	"02"	782321
true	"po3uys0tshj7u35"	"03"	5639
true	"po3uys0tshj7u36"	"04"	23360
true	"po3uys0tshj7u37"	"05"	8994
true	"po3uys0tshj7u38"	"06"	14514
			1
alter table "ctgd2025Applications_result" add column arc_code character varying;

update "ctgd2025Applications_result" set arc_code=arc_code_app;

select arc_code,arc_code_app,count(*) from "ctgd2025Applications_result" group by arc_code,arc_code_app;

"01"	"01"	904358
"02"	"02"	782321
"03"	"03"	5639
"04"	"04"	23360
"05"	"05"	8994
"06"	"06"	14514
				3530326
				
select "isNccCertificateHolder","nccCertificateType",count(*) from "ctgd2025Applications_result" group by "isNccCertificateHolder","nccCertificateType";

false							2638465
false	"NCC 'A' Certificate"	39
false	"NCC 'B' Certificate"	61
false	"NCC 'C' Certificate"	34
false							2382520
true	"NCC 'A' Certificate"	76902
true	"NCC 'B' Certificate"	92670
true	"NCC 'C' Certificate"	72597
								6224	
								
select distinct "tenthYearOfPassing",count(*) from "ctgd2025Applications_result" group by "tenthYearOfPassing";
---all years upto 2024

alter table "ctgd2025Applications_result" add column statecode_considered character varying;
alter table "ctgd2025Applications_result" add column statename_considered character varying;
alter table "ctgd2025Applications_result" add column districtcode_considered character varying;
alter table "ctgd2025Applications_result" add column districtname_considered character varying;

select distinct "isMigratedFromOrigin","wantsReservationFromOrigin",count(*) from "ctgd2025Applications_result" group by "isMigratedFromOrigin","wantsReservationFromOrigin";

false	false	226
false			5231293
true	false	31373 --------these will be considered as UR from state of domicile
true	true	6620 -------- these will be considered in respective category from state of origin except UR/EWS

select distinct cat1,count(*) from "ctgd2025Applications_result" where ("isMigratedFromOrigin"=true and "wantsReservationFromOrigin"=true) group by cat1;---6620
"0"	203----special will be considered from domicile state
"1"	2111
"2"	915
"6"	2869
"9"	522 -----special will be considered from domicile state

update "ctgd2025Applications_result" a
set a.statename_considered=a."domicileState",
a.districtname_considered=a."domicileDistrict";----5269512 updates

update "ctgd2025Applications_result" a
set a.statename_considered=a."stateOfOrigin",
a.districtname_considered=a."districtOfOrigin"
where (a."isMigratedFromOrigin"=true and a."wantsReservationFromOrigin"=true)
and cat1 in ('1','2','6');---5895 updates

select distinct cat1,count(*) from "ctgd2025Applications_result" where ("isMigratedFromOrigin"=true and "wantsReservationFromOrigin"=false) group by cat1;---

"0"	1435
"1"	8131 ---these will be treated as UR from domicile state
"2"	4849 ------these will be treated as UR from domicile state
"6"	12790 -------these will be treated as UR from domicile state
"9"	4168

update "ctgd2025Applications_result" a
set a.cat1='9',
a.remarks ='Migrated but Reservation not opted'
where (a."isMigratedFromOrigin"=true and a."wantsReservationFromOrigin"=false)
and category in ('SC','ST','OBC');---25770 updates

select distinct cat1,cat2,arc_code,count(*) from "ctgd2025Applications_result" where arc_code is not null group by cat1,cat2,arc_code;

"0"		"3"	  "03"		205 	--ok
"0"		"3"	  "04"		6       --ok
"0"			  "01"		6       --not ok
"0"			  "02"		7       --not ok
"0"			  "04"		11304   --ok
"0"			  "05"		1       --not ok but can get 04 ----later corret arc given
-----------------------------------------------------------------------------------------------
"1"		"3"	  "01"		115     --ok
"1"		"3"	  "03"		401     --ok
"1"		"3"	  "06"		7       --ok
"1"			  "01"		534517  --ok
"1"			  "02"		14      --not ok but can get 01 -----later corret arc given
"1"			  "06"		8050    --ok
-------------------------------------------------------------------------------------------------
"2"		"3"	  "01"		70      --ok
"2"		"3"	  "03"		109     --ok
"2"		"3"	  "06"		6       --ok
"2"			  "01"		362543  --ok
"2"			  "02"		9       --not ok but can get 01 -----later corret arc given
"2"			  "04"		3       --not ok but can get 06 -----later corret arc given
"2"			  "05"		2       --not ok but can get 06 -----later corret arc given
"2"			  "06"		6066    --ok
----------------------------------------------------------------------------------------------------
"6"		"3"	  "02"		154     --ok
"6"		"3"	  "03"		2074    --ok
"6"		"3"	  "05"		4       --ok
"6"			  "01"		21      --not ok but can get 02
"6"			  "02"		776890  --ok
"6"			  "04"		16      --not ok but can get 05
"6"			  "05"		8791    --ok
"6"			  "06"		1       --not ok but can get 05
-----------------------------------------------------------------------------------------------------
"9"		"3"	  "01"		23      --not ok but can get 03
"9"		"3"	  "02"		8       --not ok but can get 03
"9"		"3"	  "03"		2850    --ok
"9"		"3"	  "04"		5       --ok
"9"		"3"	  "06"		3       --not ok but can get 03
"9"			  "01"		7063    --not ok
"9"			  "02"		5239    --not ok
"9"			  "04"		12026   --ok
"9"			  "05"		196     --not ok but can get 04
"9"			  "06"		381     --not ok but can get 04

----wrong arc taken----
select * from "ctgd2025Applications_result" where cat1='0' and arc_code in ('01','02','05','06');---14

update"ctgd2025Applications_result" 
set arc_code=null where cat1='0' and arc_code in ('01','02','05','06');---14

update"ctgd2025Applications_result" 
set arc_code='04',
remarks='arc corrected'
where cat1='0' and arc_code_app in ('05');---1    10008389649


select cat1,arc_code_app,arc_code,remarks from "ctgd2025Applications_result" where cat1='1' and arc_code_app in ('02','04','05');---14

update"ctgd2025Applications_result" 
set arc_code=null
where cat1='1' and arc_code_app in ('02','04','05');---14

update"ctgd2025Applications_result" 
set arc_code='01',
remarks='arc corrected'
where cat1='1' and arc_code_app in ('02');---14


select cat1,arc_code_app,arc_code,remarks from "ctgd2025Applications_result" where cat1='2' and arc_code_app in ('02','04','05');---14

update"ctgd2025Applications_result" 
set arc_code=null
where cat1='2' and arc_code_app in ('02','04','05');---14

update"ctgd2025Applications_result" 
set arc_code='01',
remarks='arc corrected'
where cat1='2' and arc_code_app in ('02');---9

update"ctgd2025Applications_result" 
set arc_code='06',
remarks='arc corrected'
where cat1='2' and arc_code_app in ('04','05');---5


select cat1,arc_code_app,arc_code,remarks from "ctgd2025Applications_result" where cat1='6' and arc_code_app in ('01','04','06');---38

update"ctgd2025Applications_result" 
set arc_code=null
where cat1='6' and arc_code_app in ('01','04','06');---38

update"ctgd2025Applications_result" 
set arc_code='02',
remarks='arc corrected'
where cat1='6' and arc_code_app in ('01');---21

update"ctgd2025Applications_result" 
set arc_code='05',
remarks='arc corrected'
where cat1='6' and arc_code_app in ('04','06');---17

select cat1,arc_code_app,arc_code,remarks from "ctgd2025Applications_result" where cat1='9' and arc_code_app in ('01','02','05','06');---12913

update"ctgd2025Applications_result" 
set arc_code=null
where cat1='9' and arc_code_app in ('01','02','05','06');---12913

select cat1,cat2,arc_code_app,arc_code,remarks from "ctgd2025Applications_result" where cat1='9' and cat2='3' and arc_code_app in ('01','02','06');---34

update"ctgd2025Applications_result" 
set arc_code='03',
remarks='Migrated but Reservation not opted, arc corrected'
where cat1='9' and cat2='3' and arc_code_app in ('01','02','06');---34

select cat1,cat2,arc_code_app,arc_code,remarks from "ctgd2025Applications_result" where cat1='9' and cat2 is null and arc_code_app in ('05','06');---577

update"ctgd2025Applications_result" 
set arc_code='04',
remarks='Migrated but Reservation not opted, arc corrected'
where cat1='9' and cat2 is null and  arc_code_app in ('05','06');---577

------------arc given to those who didn't opted ---------------
select category,gender,cat1,cat2,arc_code_app,arc_code,remarks from "ctgd2025Applications_result" where substring("ageAsOnDob",0,3)::integer>='23' and arc_code_app is null;--2775

select distinct cat1,cat2,count(*) from "ctgd2025Applications_result" where substring("ageAsOnDob",0,3)::integer>='23' and arc_code_app is null group by cat1,cat2;

"0"				313 ----no arc applicable
"1"				491
"2"				337 
"6"				1124
"9"	 "3"		1
"9"				509 ---no arc applicable

select cat1,cat2,arc_code_app,arc_code,remarks from  "ctgd2025Applications_result" where substring("ageAsOnDob",0,3)::integer>='23' and arc_code_app is null and cat1 in ('1','2') and cat2 is null;---828

update"ctgd2025Applications_result" 
set arc_code='01',
remarks='arc given'
where substring("ageAsOnDob",0,3)::integer>='23' and arc_code_app is null and cat1 in ('1','2') and cat2 is null;---828

select cat1,cat2,arc_code_app,arc_code,remarks from  "ctgd2025Applications_result" where substring("ageAsOnDob",0,3)::integer>='23' and arc_code_app is null and cat1 in ('6') and cat2 is null;---828

update"ctgd2025Applications_result" 
set arc_code='02',
remarks='arc given'
where substring("ageAsOnDob",0,3)::integer>='23' and arc_code_app is null and cat1 in ('6') and cat2 is null;---1124

select cat1,cat2,arc_code_app,arc_code,remarks from  "ctgd2025Applications_result" where substring("ageAsOnDob",0,3)::integer>='23' and arc_code_app is null and cat1 in ('9') and cat2='3';---1

update"ctgd2025Applications_result" 
set arc_code='03',
remarks='arc given'
where substring("ageAsOnDob",0,3)::integer>='23' and arc_code_app is null and cat1 in ('9') and cat2='3' ;---1

select * from "ctgd2025Applications_result" where substring("ageAsOnDob",0,3)::integer>='23' and arc_code is null;------7858

Select distinct statename_considered ,count(*) from "ctgd2025Applications_result" group by statename_considered;
"Andaman and Nicobar Islands"				992
"Andhra Pradesh"							124978
"Arunachal Pradesh"							8361
"Assam"										199214
"Bihar"										628515
"Chandigarh"								1942
"Chhattisgarh"								112104
"Dadra and Nagar Haveli and Daman and Diu"	210
"Daman and Diu"								62
"Delhi"										56625
"Goa"										608
"Gujarat"									120642
"Haryana"									187636
"Himachal Pradesh"							57305
"Jammu and Kashmir"							82958
"Jharkhand"									215435
"Karnataka"									169144
"Kerala"									44462
"Ladakh"									2549
"Lakshadweep"								103
"Madhya Pradesh"							333482
"Maharashtra"								304223
"Manipur"									23033
"Meghalaya"									12960
"Mizoram"									6032
"Nagaland"									7384
"Odisha"									145429
"Puducherry"								930
"Punjab"									96879
"Rajasthan"									480854
"Sikkim"									1166
"Tamil Nadu"								72122
"Telangana"									79784
"Tripura"									25893
"Uttarakhand"								79028
"Uttar Pradesh"								1339185
"West Bengal"								247283



do
$$
begin

update "ctgd2025Applications_result" set statecode_considered='1'	where statename_considered='Andaman and Nicobar Islands';
update "ctgd2025Applications_result" set statecode_considered='2'	where statename_considered='Andhra Pradesh';
update "ctgd2025Applications_result" set statecode_considered='3'	where statename_considered='Arunachal Pradesh';
update "ctgd2025Applications_result" set statecode_considered='4'	where statename_considered='Assam';
update "ctgd2025Applications_result" set statecode_considered='5'	where statename_considered='Bihar';
update "ctgd2025Applications_result" set statecode_considered='6'	where statename_considered='Chandigarh';
update "ctgd2025Applications_result" set statecode_considered='7'	where statename_considered='Chhattisgarh';
update "ctgd2025Applications_result" set statecode_considered='8'	where statename_considered='Dadra and Nagar Haveli and Daman and Diu';
update "ctgd2025Applications_result" set statecode_considered='9'	where statename_considered='Daman and Diu';
update "ctgd2025Applications_result" set statecode_considered='10'	where statename_considered='Delhi';
update "ctgd2025Applications_result" set statecode_considered='11'	where statename_considered='Goa';
update "ctgd2025Applications_result" set statecode_considered='12'	where statename_considered='Gujarat';
update "ctgd2025Applications_result" set statecode_considered='13'	where statename_considered='Haryana';
update "ctgd2025Applications_result" set statecode_considered='14'	where statename_considered='Himachal Pradesh';
update "ctgd2025Applications_result" set statecode_considered='15'	where statename_considered='Jammu and Kashmir';
update "ctgd2025Applications_result" set statecode_considered='16'	where statename_considered='Jharkhand';
update "ctgd2025Applications_result" set statecode_considered='17'	where statename_considered='Karnataka';
update "ctgd2025Applications_result" set statecode_considered='18'	where statename_considered='Kerala';
update "ctgd2025Applications_result" set statecode_considered='19'	where statename_considered='Lakshadweep';
update "ctgd2025Applications_result" set statecode_considered='20'	where statename_considered='Madhya Pradesh';
update "ctgd2025Applications_result" set statecode_considered='21'	where statename_considered='Maharashtra';
update "ctgd2025Applications_result" set statecode_considered='22'	where statename_considered='Manipur';
update "ctgd2025Applications_result" set statecode_considered='23'	where statename_considered='Meghalaya';
update "ctgd2025Applications_result" set statecode_considered='24'	where statename_considered='Mizoram';
update "ctgd2025Applications_result" set statecode_considered='25'	where statename_considered='Nagaland';
update "ctgd2025Applications_result" set statecode_considered='26'	where statename_considered='Odisha';
update "ctgd2025Applications_result" set statecode_considered='27'	where statename_considered='Puducherry';
update "ctgd2025Applications_result" set statecode_considered='28'	where statename_considered='Punjab';
update "ctgd2025Applications_result" set statecode_considered='29'	where statename_considered='Rajasthan';
update "ctgd2025Applications_result" set statecode_considered='30'	where statename_considered='Sikkim';
update "ctgd2025Applications_result" set statecode_considered='31'	where statename_considered='Tamil Nadu';
update "ctgd2025Applications_result" set statecode_considered='32'	where statename_considered='Telangana';
update "ctgd2025Applications_result" set statecode_considered='33'	where statename_considered='Tripura';
update "ctgd2025Applications_result" set statecode_considered='34'	where statename_considered='Uttar Pradesh';
update "ctgd2025Applications_result" set statecode_considered='35'	where statename_considered='Uttarakhand';
update "ctgd2025Applications_result" set statecode_considered='36'	where statename_considered='West Bengal';
update "ctgd2025Applications_result" set statecode_considered='37'	where statename_considered='Ladakh';

END
$$

select distinct "districtName" ,count(*) from m_districts group by "districtName" having count(*)<>1;

"Pratapgarh"	2
"Leh"			2
"Balrampur"		2
"Hamirpur"		2
"Aurangabad"	2
"Diu"			2
"Daman"			2
"Bilaspur"		2
"Kargil"		2


update "ctgd2025Applications_result" a
set a.districtcode_considered=b.code
from m_districts b
where a.districtname_considered=b."districtName"
and a.districtname_considered not in ('Pratapgarh','Leh','Balrampur','Hamirpur','Aurangabad','Diu','Daman','Bilaspur','Kargil');

update "ctgd2025Applications_result" 
set districtcode_considered='565'
where districtname_considered ='Pratapgarh' and statecode_considered='29';---rajasthan 2066

update "ctgd2025Applications_result" 
set districtcode_considered='723'
where districtname_considered ='Pratapgarh' and statecode_considered='34';---uttar pradesh 24359

update "ctgd2025Applications_result" 
set districtcode_considered='264'
where districtname_considered ='Leh' and statecode_considered='15';---Jammu and Kashmir 38

update "ctgd2025Applications_result" 
set districtcode_considered='773'
where districtname_considered ='Leh' and statecode_considered='37';---Ladakh 1222

update "ctgd2025Applications_result" 
set districtcode_considered='130'
where districtname_considered ='Balrampur' and statecode_considered='7';---Chhattisgarh 2886

update "ctgd2025Applications_result" 
set districtcode_considered='702'
where districtname_considered ='Balrampur' and statecode_considered='34';---uttar pradesh 4100

update "ctgd2025Applications_result" 
set districtcode_considered='238'
where districtname_considered ='Hamirpur' and statecode_considered='14';---Himachal Pradesh 4241

update "ctgd2025Applications_result" 
set districtcode_considered='687'
where districtname_considered ='Hamirpur' and statecode_considered='34';---uttar pradesh 6737

update "ctgd2025Applications_result" 
set districtcode_considered='91'
where districtname_considered ='Aurangabad' and statecode_considered='5';---Bihar 24830

update "ctgd2025Applications_result" 
set districtcode_considered='400'
where districtname_considered ='Aurangabad' and statecode_considered='21';---Maharastra 15050

update "ctgd2025Applications_result" 
set districtcode_considered='167'
where districtname_considered ='Diu' and statecode_considered='9';---Daman and Diu 14

update "ctgd2025Applications_result" 
set districtcode_considered='164'
where districtname_considered ='Diu' and statecode_considered='8';---Dadra and Nagar Haveli and Daman and Diu 7

update "ctgd2025Applications_result" 
set districtcode_considered='166'
where districtname_considered ='Daman' and statecode_considered='9';---Daman and Diu 48

update "ctgd2025Applications_result" 
set districtcode_considered='165'
where districtname_considered ='Daman' and statecode_considered='8';---Dadra and Nagar Haveli and Daman and Diu 18

update "ctgd2025Applications_result" 
set districtcode_considered='146'
where districtname_considered ='Bilaspur' and statecode_considered='7';---Chhattisgarh 8304

update "ctgd2025Applications_result" 
set districtcode_considered='236'
where districtname_considered ='Bilaspur' and statecode_considered='14';---Himachal Pradesh 3901

update "ctgd2025Applications_result" 
set districtcode_considered='269'
where districtname_considered ='Kargil' and statecode_considered='15';---Jammu and Kashmir 27

update "ctgd2025Applications_result" 
set districtcode_considered='772'
where districtname_considered ='Kargil' and statecode_considered='37';---Ladakh 1327

alter table "ctgd2025Applications_result" add column naxal_district character varying;
alter table "ctgd2025Applications_result" add column border_district character varying;

update "ctgd2025Applications_result" a
set a.naxal_district=b."isNaxalDistrict",
	a.border_district=b."isBoarderDistrict"
from m_districts b
where a.districtcode_considered=b.code;

select * from "ctgd2025Applications_result" where "stateOfOrigin"='Others';---8601001473

select * from "ctgd2025Applications_result" where statecode_considered='9' and districtcode_considered='166';---48

update "ctgd2025Applications_result"
set statename_considered='Dadra and Nagar Haveli and Daman and Diu',
statecode_considered='8',
districtcode_considered='165'
 where statecode_considered='9' and districtcode_considered='166';---48 updates

select * from "ctgd2025Applications_result" where statecode_considered='9' and districtcode_considered='167';---14

update "ctgd2025Applications_result"
set statename_considered='Dadra and Nagar Haveli and Daman and Diu',
statecode_considered='8',
districtcode_considered='164'
 where statecode_considered='9' and districtcode_considered='167';---14 updates
 
select * from "ctgd2025Applications_result" where statecode_considered='15' and districtcode_considered='264';---38

update "ctgd2025Applications_result"
set statename_considered='Ladakh',
statecode_considered='37',
districtcode_considered='773',
border_district=true
 where statecode_considered='15' and districtcode_considered='264';---38 updates

select * from "ctgd2025Applications_result" where statecode_considered='15' and districtcode_considered='269';---27

update "ctgd2025Applications_result"
set statename_considered='Ladakh',
statecode_considered='37',
districtcode_considered='772',
border_district=true
 where statecode_considered='15' and districtcode_considered='269';---27 updates

select distinct naxal_district,border_district from "ctgd2025Applications_result" where districtname_considered in ('Leh','Kargil') group by naxal_district,border_district;---true,true
select distinct statecode_considered,statename_considered from "ctgd2025Applications_result" where districtname_considered in ('Leh','Kargil') group by statecode_considered,statename_considered;---37,Ladakh
select distinct statecode_considered,statename_considered from "ctgd2025Applications_result" where districtname_considered in ('Daman','Diu') group by statecode_considered,statename_considered;---8,Dadra and Nagar Haveli and Daman and Diu
 
---------TCS marks DATA-------

create table ctgd25_marks
(DriveID character varying,
 ExamID	character varying,
 ParticipantID character varying,
 Name character varying,
 ParticipantType character varying,
 TestCenterCode character varying,
 TestCenterName	character varying,
 LanName character varying,
 City character varying,
 State character varying,
 Country character varying,
 Subject character varying,
 QuestionPaperName character varying,
 TotalQuestions character varying,
 QuestionsNotVisited character varying,
 QuestionsNotAttempted character varying,
 QuestionsAttempted	 character varying,
 QuestionsAttemptedandMarkedForReview character varying,
 QuestionsNotAttemptedandMarkedForReview character varying,
 TotalAttempted	character varying,
 TotalCorrect character varying,
 TotalWrong character varying,
 "DelayedDuration(sec)"character varying,
 SubmitTime character varying,
 Part_A numeric,
 Part_B numeric,
 Part_C numeric,
 Part_D_English numeric,
 Part_D_Hindi numeric,
 Score	numeric,
 FirstLoginTime	character varying,
 ProfileConfirmTime character varying,
 RingtheBellTime character varying,
 DefaultLanguage character varying,
 MaximumMarks character varying,
 Normalized_Score numeric,
 Date_Shift character varying,
 SystemName character varying
);----2521839


psql -U sscpgadmin -h 10.192.97.43 -p 5432 -d ssc_db_candidate_portal
\copy ctgd25_marks from 'C:\Users\SalauddinKhan\Desktop\CTGD2025TIER1RESULT\Marks\Normalized Score_Part 1.csv' csv header;

select distinct part_d_english  from ctgd25_marks where part_d_hindi<>0;---null
select distinct part_d_hindi  from ctgd25_marks where part_d_english<>0;---null

alter table "ctgd2025Applications_result" add column parta_gi numeric;
alter table "ctgd2025Applications_result" add column partb_ga numeric;
alter table "ctgd2025Applications_result" add column partc_maths numeric;
alter table "ctgd2025Applications_result" add column partd_eng_hin numeric;
alter table "ctgd2025Applications_result" add column score numeric;
alter table "ctgd2025Applications_result" add column normalized_score numeric;
alter table "ctgd2025Applications_result" add column marks_available character varying;

update "ctgd2025Applications_result" a
set
a.parta_gi =b.part_a,
a.partb_ga =b.part_b,
a.partc_maths =b.part_c,
a.partd_eng_hin =(b.part_d_english+b.part_d_hindi),
a.score =b.score,
a.normalized_score =b.normalized_score,
a.marks_available ='Yes'
from ctgd25_marks b
where a.rollno=b.participantid;---2521818

----NCC MARKS-------

alter table "ctgd2025Applications_result" add column ncc_marks numeric;

update "ctgd2025Applications_result" set ncc_marks=0;

select distinct "isNccCertificateHolder","nccCertificateType",count(*) from "ctgd2025Applications_result" group by "isNccCertificateHolder","nccCertificateType";

false							2638465
false	"NCC 'A' Certificate"	39	  ----not eligible
false	"NCC 'B' Certificate"	61	  ----not eligible
false	"NCC 'C' Certificate"	34	  ----not eligible
false							2382520
true	"NCC 'A' Certificate"	76902 ----eligible
true	"NCC 'B' Certificate"	92670 ----eligible
true	"NCC 'C' Certificate"	72597 ----eligible
								6224
								
update "ctgd2025Applications_result" set ncc_marks=3.2 where
"isNccCertificateHolder"=true and
"nccCertificateType"='NCC ''A'' Certificate';---76902 updates

update "ctgd2025Applications_result" set ncc_marks=4.8 where
"isNccCertificateHolder"=true and
"nccCertificateType"='NCC ''B'' Certificate';---92670 updates

update "ctgd2025Applications_result" set ncc_marks=8 where
"isNccCertificateHolder"=true and
"nccCertificateType"='NCC ''C'' Certificate';---72597	updates

select * from "ctgd2025Applications_result" where cat2='3' and marks_available='Yes'and ncc_marks <>'0' limit 100;

alter table "ctgd2025Applications_result" add column total_marks numeric;

select distinct ncc_marks from "ctgd2025Applications_result";
0
3.2
4.8
8

update  "ctgd2025Applications_result"
set total_marks=normalized_score+ncc_marks 
where marks_available='Yes';---2521818 updates

alter table "ctgd2025Applications_result" add column cand_name character varying;

update  "ctgd2025Applications_result"
set cand_name=name;---5269512

update  "ctgd2025Applications_result"
set cand_name="newName"
where ("newName" is not null and "newName"<>'');---10849
							
-----------debarred checking------------------------------------
alter table "ctgd2025Applications_result" add column rej_prov character varying;
alter table "ctgd2025Applications_result" add column debarred character varying;

update "ctgd2025Applications_result" set rej_prov='C' where marks_available='Yes';---2521818 updates


	
select a.debarred,a."registrationNo",a.rollno,a.name,b.name as d_name,a."fathersName",b."fatherName" as d_father_name,a."mothersName",b."motherName" as d_mother_name,a.dob,b.dob as d_dob,a.gender,a.cat1,
b."regionId",b."examId",b."examYear",b."rollNumber",b."debarredFrom",b."debarredUpto",b.reason,b."otherReason"
from candidates a,debarreds b where 
a.marks_available='Yes' and
b."debarredUpto" >'2025-01-01' and
b."isActive"=true and

--replace((UPPER(a.name)||UPPER(a."fathersName")||UPPER(a."mothersName")),' ','') = replace((UPPER(b.name)||UPPER(b."fatherName")||UPPER(b."motherName")),' ','')
--and a.dob=b.dob;
 
--replace ((UPPER(b.name)||UPPER(b."motherName")),' ','') = replace ((UPPER(a.name)||UPPER(a."mothersName")),' ','') and a.dob = b.dob;
 
replace ((UPPER(b.name)||UPPER(b."fatherName")),' ','') = replace ((UPPER(a.name)||UPPER(a."fathersName")),' ','') and a.dob = b.dob;


update "ctgd2025Applications_result"
set debarred='Yes'
where rollno in ('2227012238','8601053167','2201233628','2201331100','2201074722','2405129223','2405139773','8601030267','2405023057','2201197585','9002014494','2201066880','9001017269','2405137946','2201226937','3206052643','8007018280','8012007403','7205041549','2201290188','4204008491','9010009300','6006016704','6005050962','9011006209','9008000859','9011010759','3013024253','8003002287','9009008107','3007008669','7201015848','1404013353','4205016260','4410085829','4208004683','4417018796','9002009201','9005015182','3001079469','9001044901','5105068378','7801000401','2411032404','4417009725','4205028156','3206230875','6005016184','4611013055','2201266065','2405162911','7801000254','4207001423','6005056548','9001016388','2201142762','6005024180','2201126046','7204018604','1404014400','4410086605','2201308752','2201328435','6005039485','2002011982','2201209165','3402020223','3002007299','2405075317','2401003232','5107009204','2201001463','2201076227','3402019606','2405044451','2201079357','2405167347','2405151694','6005017933','2201274010','2201274010','3206332304','2201074568','3206007405','2201238254','3303153692','2405010416'
);

update "ctgd2025Applications_result"
set rej_prov='D' where debarred='Yes';---86 updates
---------------------------------------------------------------------------

select gender,force_name,sum(total) from vacancy_ctgd25_raw group by gender ,force_name order by gender,force_name;---all okay

create table vacancy_table as
(
SELECT 
    state_code,
	state,
	genderid,
	force_code as post_code,
	force_name as force,
	area,
	'UR' as category,
	'9' as category_code,
	 ur AS "vacancies"
	 from vacancy_ctgd25_raw

UNION ALL
SELECT 
    state_code,
	state,
	genderid,
	force_code as post_code,
	force_name as force,
	area,
	'SC' as category,
	'1' as category_code,
	 sc AS "vacancies"
	 from vacancy_ctgd25_raw
UNION ALL	
SELECT 
    state_code,
	state,
	genderid,
	force_code as post_code,
	force_name as force,
	area,
	'ST' as category,
	'2' as category_code,
	 st AS "vacancies"
	 from vacancy_ctgd25_raw
UNION ALL
SELECT 
    state_code,
	state,
	genderid,
	force_code as post_code,
	force_name as force,
	area,
	'OBC' as category,
	'6' as category_code,
	 obc AS "vacancies"
	 from vacancy_ctgd25_raw 
UNION ALL
SELECT 
    state_code,
	state,
	genderid,
	force_code as post_code,
	force_name as force,
	area,
	'EWS' as category,
	'0' as category_code,
	 ews AS "vacancies"
	 from vacancy_ctgd25_raw
UNION ALL
SELECT 
    state_code,
	state,
	genderid,
	force_code as post_code,
	force_name as force,
	area,
	'ESM' as category,
	'3' as category_code,
	 esm AS "vacancies"
	 from vacancy_ctgd25_raw
);

select gender, sum(vacancies) from vacancy_table where category<>'ESM' group by gender;---53690
"2"	48320
"1"	5370

select gender, sum(vacancies) from vacancy_table where category='ESM' group by gender;---5378
"1"	538
"2"	4840

alter table vacancy_table add constraint pk_prim primary key (state_code,gender,post_code,category_code,area);

alter table vacancy_table add column initial integer;
alter table vacancy_table add column current integer;
alter table vacancy_table add column allocated integer;
alter table vacancy_table add column left_vacancy integer;

update vacancy_table 
set initial=vacancies*8
where post_code not in ('G','H');

update vacancy_table 
set initial=vacancies*15
where post_code  in ('G','H');

update vacancy_table
set current=initial;

-----cancelled candidates by regions----------------------

4205000418
4205021168
4205044158
4205044175
4205050497
4419000536
9002002607---not present in candidates file 

update  "ctgd2025Applications_result"
set rej_prov='cancelled'
where
rollno in ('4205000418','4205044158','4205044175','4205050497','4419000536','4205021168','9002002607');


----debarred by region-------------

5102004723
5105085468
5111011697
5302005480

update  "ctgd2025Applications_result"
set rej_prov=null,
debarred='Yes',
remarks='Debarment being processed'
where
rollno in ('5102004723','5105085468','5111011697','5302005480');

3009021782
3009028210
3009070964
3009080607
3009084784
3009112358
3009113523
3009133155
3009139450
3010034973
3010044919
3010061362
3010127221
3013011074
3013039637
3013046118
3013076747
3013089403
3013119314
3016003503
3203038337
3205013341
3205024387
3205031994
3205046404
3205054474
3206009646
3206077662
3206083210
3206118278
3206119831
3206122092
3206213384
3206253197
3206305999
3206342209
3206377876
3209018766
3302005140
3302024038
3303008994
3303009575
3303015136
3303040784
3303069780
3303071305
3303098235
3303104996
3303121979
3303124123
3303160705
3402019191
3402034809
3403000375
3404027446
3404028765
5105066092
7801000254
7801000386
7801000401
7801000569
7801000691
9002009201
9005015182
9009008107
9011006209

update  "ctgd2025Applications_result"
set rej_prov='D',
debarred='Yes',
remarks='Debarred by region'
where
rollno in ('3009021782','3009028210', '3009070964', '3009080607', '3009084784', '3009112358', '3009113523', '3009133155', '3009139450', '3010034973', '3010044919', '3010061362', '3010127221', '3013011074', '3013039637', '3013046118', '3013076747', '3013089403', '3013119314', '3016003503', '3203038337', '3205013341', '3205024387', '3205031994', '3205046404', '3205054474', '3206009646', '3206077662', '3206083210', '3206118278', '3206119831', '3206122092', '3206213384', '3206253197', '3206305999', '3206342209', '3206377876', '3209018766', '3302005140', '3302024038', '3303008994', '3303009575', '3303015136', '3303040784', '3303069780', '3303071305', '3303098235', '3303104996', '3303121979', '3303124123', '3303160705', '3402019191', '3402034809', '3403000375', '3404027446', '3404028765', '5105066092', '7801000254', '7801000386', '7801000401', '7801000569', '7801000691', '9002009201', '9005015182', '9009008107', '9011006209');

----rejected candidates-----------------------------------------------------

'8001001348','8001002607','8001002787','8001005865','8003005149','8003006018','8003006042','8003011100','8004001538','8004001796','8004002088','8004007001','8004014229','8006002381','8006005768','8007017109','8007031700','8008002729','8008005162','8008013132','8012005191','8201001335','8201002212','8201006860','8202001313','8204005303','8204015899','8204017527','8205003259','8206000305','8206000758','8208000248','8401000295','8601001797','8601005712','8601005937','8601008070','8601014334','8601017291','8601017376','8601017865','8601020257','8601023827','8601027238','8601028934','8601029486','8601029924','8601030103','8601031763','8601033960','8601035566','8601041180','8601043704','8601052373','8601054265','8601054804','8601054871','8601055018','8603000275','8603012164','8604006305','8604008316','8604008883'

update  "ctgd2025Applications_result"
set rej_prov='R',
remarks='Rejected by region'
where
rollno in ('8001001348','8001002607','8001002787','8001005865','8003005149','8003006018','8003006042','8003011100','8004001538','8004001796','8004002088','8004007001','8004014229','8006002381','8006005768','8007017109','8007031700','8008002729','8008005162','8008013132','8012005191','8201001335','8201002212','8201006860','8202001313','8204005303','8204015899','8204017527','8205003259','8206000305','8206000758','8208000248','8401000295','8601001797','8601005712','8601005937','8601008070','8601014334','8601017291','8601017376','8601017865','8601020257','8601023827','8601027238','8601028934','8601029486','8601029924','8601030103','8601031763','8601033960','8601035566','8601041180','8601043704','8601052373','8601054265','8601054804','8601054871','8601055018','8603000275','8603012164','8604006305','8604008316','8604008883'
) ;-----found just 13

------suspected candidates ----------------------------------------------------

'1004005822','1004009824','1004015728','1004035034','1004043005','1004043963','1004046800','1004051148','1008000419','1008000421','1010006728','1010006729','1202000081','1401022286','1401043686','1401045077','1401045303','1403010070','1403012708','1403018122','1404010153','1408011388','1806001635','1806010296'

update  "ctgd2025Applications_result"
set rej_prov='W',
remarks='suspected'
where
rollno in ('1004005822','1004009824','1004015728','1004035034','1004043005','1004043963','1004046800','1004051148','1008000419','1008000421','1010006728','1010006729','1202000081','1401022286','1401043686','1401045077','1401045303','1403010070','1403012708','1403018122','1404010153','1408011388','1806001635','1806010296');

------withheld candidates--------------------------------------------------------

'2002015874','2002043077','2201019377','2201027117','2201034115','2201056208','2201065205','2201082545','2201096023','2201096044','2201114971','2201133880','2201144236','2201157029','2201159065','2201164327','2201177186','2201181089','2201193409','2201202745','2201202945','2201207239','2201224795','2201226051','2201239414','2201239648','2201243779','2201262428','2201275183','2201308752','2225014812','2227017395','2233007627','2401018329','2405003091','2405003093','2405006393','2405008283','2405008287','2405009429','2405018095','2405025905','2405037359','2405038284','2405060447','2405063165','2405063865','2405066948','2405066963','2405087551','2405094060','2405094069','2405109794','2405109803','2405117196','2405120432','2405126607','2405126638','2405126667','2405131103','2405143026','2405153784','2405161149','2405161249','2406001456','2406011799','2406020207','2406024569','2406027723','2406031544','2406046997','2406048642','2411017413','2411020708','2411020720','3001045555','3001052739','3003001061','3003045100','3003059445','3007032983','3008009124','3009005666','3009030074','3009077061','3009100633','3009106196','3009107722','3010049623','3010083226','3013012919','3013025145','3013086983','3013101055','3203015470','3203032823','3205059072','3205060936','3206041239','3206048650','3206057982','3206099676','3206109033','3206118489','3206121520','3206125830','3206137539','3206204796','3206269322','3206270638','3206305025','3206339045','3206360482','3206396517','3206399423','3207002527','3207005135','3209006537','3209007923','3302026065','3302028002','3302028012','3303022988','3303030545','3303057382','3303105866','3401006448','3401006807','3401006865','3402005370','3402036594','3403007422','3404020793','3404023287','4207020723','4208000655','4410044351','4410062558','4410085829','4410094007','4410159750','4601008655','6001008690','6001019545','6001030177','6001038299','6001040838','6001049716','6005002302','6005004474','6005007084','6005007667','6005012471','6005013353','6005023941','6005026853','6005027789','6005033883','6005038302','6005039896','6005040399','6005040542','6005043130','6005045493','6005050171','6005054617','6005056548','6005057060','6005057088','6005058137','6006020272','6006029450','6007002583','6007013959','6007026879','6007041349','6007042421','6007042999','6007043352','6007043530','6007043966','6007044701','6007045498','6007047147','6007047455','6007049544','6007049938','6007050213','6007050500','6007050688','6007050869','6007051002','6007053565','6014013752','6015001180','6016001842','6016004072','6016008303','6016011506','6016013831','6016014206','6016014599','6016016082','6016016182','6204004286','6204047968','6204051261','6204062792','6204074336','7001011996','7001021277','7001024693','7001024793','7001043006','7006010260','7007011283','7007013100','7007017876','7007019744','7201033298','7202010218','7202012074','7202032381','7202032402','7202033324','7202042262','7203001632','7203028523','7205017903','7205026500','7205040512','7205046295','7205046296','7206002920','7206004086','7206006291','7206007055','7206010288','7206012462','7206014062','7206014110','7206014527','7206016333','7207019637','7208003927','7208041702','7208042658','7208042683','7208044586','7208045104','7208047700','7214000908','7214002161','7214005425','7214007508','7214007993','7214008656','7214010631','7214012042','7214014830','8003003982','8004006063','8004006262','8007012775','8007015847','8007020957','8007025995','8008005496','8008009799','8012018771','8201000780','8201001594','8201001848','8201002084','8201002404','8202002830','8204004437','8204004726','8204005134','8204006959','8204008555','8204008917','8204015391','8204015621','8204018139','8205001435','8205002039','8205002597','8205003308','8205004923','8206005302','8207004393','8207004701','8207007952','8207009562','8207014180','8207014303','8208001297','8208003369','8208008118','8208008531','8208008737','8208008839','8208009104','8208010709','8401001801','8601007549','8601011092','8601011243','8601016512','8601016655','8601031762','8601033547','8601033892','8601034734','8601047032','8601049164','8601049849','8601053140','8603011073','8604002910','8604009679'

update  "ctgd2025Applications_result"
set rej_prov='W',
remarks='withheld'
where
rollno in ('2002015874','2002043077','2201019377','2201027117','2201034115','2201056208','2201065205','2201082545','2201096023','2201096044','2201114971','2201133880','2201144236','2201157029','2201159065','2201164327','2201177186','2201181089','2201193409','2201202745','2201202945','2201207239','2201224795','2201226051','2201239414','2201239648','2201243779','2201262428','2201275183','2201308752','2225014812','2227017395','2233007627','2401018329','2405003091','2405003093','2405006393','2405008283','2405008287','2405009429','2405018095','2405025905','2405037359','2405038284','2405060447','2405063165','2405063865','2405066948','2405066963','2405087551','2405094060','2405094069','2405109794','2405109803','2405117196','2405120432','2405126607','2405126638','2405126667','2405131103','2405143026','2405153784','2405161149','2405161249','2406001456','2406011799','2406020207','2406024569','2406027723','2406031544','2406046997','2406048642','2411017413','2411020708','2411020720','3001045555','3001052739','3003001061','3003045100','3003059445','3007032983','3008009124','3009005666','3009030074','3009077061','3009100633','3009106196','3009107722','3010049623','3010083226','3013012919','3013025145','3013086983','3013101055','3203015470','3203032823','3205059072','3205060936','3206041239','3206048650','3206057982','3206099676','3206109033','3206118489','3206121520','3206125830','3206137539','3206204796','3206269322','3206270638','3206305025','3206339045','3206360482','3206396517','3206399423','3207002527','3207005135','3209006537','3209007923','3302026065','3302028002','3302028012','3303022988','3303030545','3303057382','3303105866','3401006448','3401006807','3401006865','3402005370','3402036594','3403007422','3404020793','3404023287','4207020723','4208000655','4410044351','4410062558','4410085829','4410094007','4410159750','4601008655','6001008690','6001019545','6001030177','6001038299','6001040838','6001049716','6005002302','6005004474','6005007084','6005007667','6005012471','6005013353','6005023941','6005026853','6005027789','6005033883','6005038302','6005039896','6005040399','6005040542','6005043130','6005045493','6005050171','6005054617','6005056548','6005057060','6005057088','6005058137','6006020272','6006029450','6007002583','6007013959','6007026879','6007041349','6007042421','6007042999','6007043352','6007043530','6007043966','6007044701','6007045498','6007047147','6007047455','6007049544','6007049938','6007050213','6007050500','6007050688','6007050869','6007051002','6007053565','6014013752','6015001180','6016001842','6016004072','6016008303','6016011506','6016013831','6016014206','6016014599','6016016082','6016016182','6204004286','6204047968','6204051261','6204062792','6204074336','7001011996','7001021277','7001024693','7001024793','7001043006','7006010260','7007011283','7007013100','7007017876','7007019744','7201033298','7202010218','7202012074','7202032381','7202032402','7202033324','7202042262','7203001632','7203028523','7205017903','7205026500','7205040512','7205046295','7205046296','7206002920','7206004086','7206006291','7206007055','7206010288','7206012462','7206014062','7206014110','7206014527','7206016333','7207019637','7208003927','7208041702','7208042658','7208042683','7208044586','7208045104','7208047700','7214000908','7214002161','7214005425','7214007508','7214007993','7214008656','7214010631','7214012042','7214014830','8003003982','8004006063','8004006262','8007012775','8007015847','8007020957','8007025995','8008005496','8008009799','8012018771','8201000780','8201001594','8201001848','8201002084','8201002404','8202002830','8204004437','8204004726','8204005134','8204006959','8204008555','8204008917','8204015391','8204015621','8204018139','8205001435','8205002039','8205002597','8205003308','8205004923','8206005302','8207004393','8207004701','8207007952','8207009562','8207014180','8207014303','8208001297','8208003369','8208008118','8208008531','8208008737','8208008839','8208009104','8208010709','8401001801','8601007549','8601011092','8601011243','8601016512','8601016655','8601031762','8601033547','8601033892','8601034734','8601047032','8601049164','8601049849','8601053140','8603011073','8604002910','8604009679');

alter table "ctgd2025Applications_result" add column merit integer;
alter table "ctgd2025Applications_result" add column dob_flag character varying;
alter table "ctgd2025Applications_result" add column catseldob_flag character varying;
alter table "ctgd2025Applications_result" add column cutoff_flag character varying;
alter table "ctgd2025Applications_result" add column catsel character varying;
alter table "ctgd2025Applications_result" add column allocated_state character varying;
alter table "ctgd2025Applications_result" add column allocated_post character varying;
alter table "ctgd2025Applications_result" add column allocated_area character varying;
alter table "ctgd2025Applications_result" add column allocated_category character varying;
alter table "ctgd2025Applications_result" add column allocated_against_ur character varying;

------------------------- verifications ------------------------------------------------------------------------------

select distinct rej_prov,debarred,count(*) from "ctgd2025Applications_result" where marks_available='Yes' group by rej_prov,debarred;

"C"				2521344
"cancelled"		6
"D"	"Yes"		146
"R"				13
"W"				309

select * from "ctgd2025Applications_result" where dob_flag='99' and arc_code='01';---ok
select * from "ctgd2025Applications_result" where dob_flag='99' and arc_code='02';---ok
select * from "ctgd2025Applications_result" where dob_flag='99' and arc_code='04';---ok

select distinct statecode_considered,allocated_state,count(*) from
"ctgd2025Applications_result" where allocated_state is not null group by statecode_considered,allocated_state;---ok

select distinct statecode_considered,allocated_state,count(*) from
"ctgd2025Applications_result" where allocated_state is not null and statecode_considered::int<>allocated_state::int group by statecode_considered,allocated_state;---all 39 ok

select distinct allocated_category,catsel,count(*) from
"ctgd2025Applications_result" where allocated_state is not null group by allocated_category,catsel;---all ok

select sum(vacancies),sum(initial),sum(current),sum(allocated),sum(left_vacancy) from vacancy_table_ctgd_allocated;----59068	473727	473727	394122	79605

select * from vacancy_table_ctgd_allocated where allocated<>'0' and min_marks<>total_marks;---none
select * from vacancy_table_ctgd_allocated where allocated<>'0' and min_marks_parta<>parta_gi;---none
select * from vacancy_table_ctgd_allocated where allocated<>'0' and min_marks_partb<>partb_ga;---none
select * from vacancy_table_ctgd_allocated where min_marks_cand_dob<>dob;---none
select * from vacancy_table_ctgd_allocated where min_marks_merit<>merit;---none

select distinct ncc_marks from "ctgd2025Applications_result" where cat2='3';---0
select distinct "tenthYearOfPassing" from "ctgd2025Applications_result" ;

select distinct rej_prov from "ctgd2025Applications_result" ;"C","cancelled","D","R","W",null

select distinct rej_prov from "ctgd2025Applications_result" where debarred='Yes';---D

select distinct merit from "ctgd2025Applications_result" where debarred='Yes';---null

select distinct rej_prov from "ctgd2025Applications_result" where allocated_state is not null---C, W

select distinct allocated_state from "ctgd2025Applications_result" where debarred='Yes';----null

select distinct cutoff_flag,min(normalized_score) from "ctgd2025Applications_result" where cat2='3' group by cutoff_flag;
select distinct cutoff_flag,max(normalized_score) from "ctgd2025Applications_result" where cat2='3' group by cutoff_flag;----max marks 31.95323

select distinct cutoff_flag,min(normalized_score) from "ctgd2025Applications_result" where cat1='1' group by cutoff_flag;
select distinct cutoff_flag,max(normalized_score) from "ctgd2025Applications_result" where cat1='1' and rej_prov in ('C','W') group by cutoff_flag;---MAX 31.98913

select distinct cutoff_flag,min(normalized_score) from "ctgd2025Applications_result" where cat1='2' group by cutoff_flag;
select distinct cutoff_flag,max(normalized_score) from "ctgd2025Applications_result" where cat1='2' and rej_prov in ('C','W') group by cutoff_flag;---MAX 31.98913

select distinct cutoff_flag,min(normalized_score) from "ctgd2025Applications_result" where cat1='6' group by cutoff_flag;
select distinct cutoff_flag,max(normalized_score) from "ctgd2025Applications_result" where cat1='6' and rej_prov in ('C','W') group by cutoff_flag;---MAX 39.98703

select distinct cutoff_flag,min(normalized_score) from "ctgd2025Applications_result" where cat1='0' group by cutoff_flag;
select distinct cutoff_flag,max(normalized_score) from "ctgd2025Applications_result" where cat1='0' and rej_prov in ('C','W') group by cutoff_flag;---MAX 39.98703

select distinct cutoff_flag,min(normalized_score) from "ctgd2025Applications_result" where cat1='9' group by cutoff_flag;
select distinct cutoff_flag,max(normalized_score) from "ctgd2025Applications_result" where cat1='9' and rej_prov in ('C','W') group by cutoff_flag;---MAX 47.99937

select distinct "domicileState",statename_considered from "ctgd2025Applications_result" 
where "isMigratedFromOrigin"=true and "wantsReservationFromOrigin"=false and marks_available='Yes' group by "domicileState",statename_considered;----all ok

select distinct "domicileState","stateOfOrigin",statename_considered from "ctgd2025Applications_result" 
where "isMigratedFromOrigin"=true and "wantsReservationFromOrigin"=true and marks_available='Yes' 
and cat1 in ('1','2','6') group by "domicileState","stateOfOrigin",statename_considered;----stateOfOrigin considered

select distinct "domicileState","stateOfOrigin",statename_considered from "ctgd2025Applications_result" 
where "isMigratedFromOrigin"=true and "wantsReservationFromOrigin"=true and marks_available='Yes' 
and cat1 in ('0','9') group by "domicileState","stateOfOrigin",statename_considered;----domicileState considered

select * from "ctgd2025Applications_result" where marks_available='Yes' and row_number<1000000;
