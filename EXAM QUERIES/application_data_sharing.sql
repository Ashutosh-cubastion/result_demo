CREATE TABLE IF NOT EXISTS public."cgl2024Applications_for_edp"
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
    nationality character varying(500) COLLATE pg_catalog."default",
    "markOfIdentification" character varying(50) COLLATE pg_catalog."default",
    "tenthEducationBoardId" character varying(16) COLLATE pg_catalog."default",
    "educationBoardName" character varying(500) COLLATE pg_catalog."default",
    "tenthRollNumber" character varying(16) COLLATE pg_catalog."default",
    "tenthYearOfPassing" character varying(5) COLLATE pg_catalog."default",
    "examCentrePreferenceId1" character varying(16) COLLATE pg_catalog."default",
    "examCentrePreferenceId2" character varying(16) COLLATE pg_catalog."default",
    "examCentrePreferenceId3" character varying(16) COLLATE pg_catalog."default",
    "isBenchmarkDisabilityVh" boolean,
    "isBenchmarkDisabilityOh" boolean,
    "isPhysicalLimitToWrite" boolean,
    "isScribe" boolean,
    "isOwnScribe" boolean,
    "scribeMedium" character varying(20) COLLATE pg_catalog."default",
    "isApplyingMoSPI" boolean,
    "hasEQForMoSPI" character varying(5) COLLATE pg_catalog."default",
    "isApplyingRGI" boolean,
    "hasEQForRGI" character varying(5) COLLATE pg_catalog."default",
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
    CONSTRAINT "cgl2024Applications_for_edp_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."cgl2024Applications_for_edp"
    OWNER to sscpgadmin;
	
	
insert into "cgl2024Applications_for_edp"
(
id ,"registrationNo","otrId","myApplicationId","emailId","phoneNo",name,"newName" ,"fathersName","mothersName",dob,"ageAsOnDob","genderId",gender,"categoryId",category,"isPwbd","typeOfPwbd","submitPwbdType","nationalityId",nationality,"markOfIdentification","tenthEducationBoardId","educationBoardName","tenthRollNumber","tenthYearOfPassing","examCentrePreferenceId1","examCentrePreferenceId2","examCentrePreferenceId3","isBenchmarkDisabilityVh","isBenchmarkDisabilityOh","isPhysicalLimitToWrite","isScribe","isOwnScribe","scribeMedium","isApplyingMoSPI","hasEQForMoSPI","isApplyingRGI","hasEQForRGI","isEsm","dojOfEsm","dodOfEsm","lengthOfService","isCivilPost","dojOfCivilPost","regionCode","isAgeRelaxation","ageRelaxationId","isPersonalInfoAccess","permanentAddress","permanentStateId","permanentStateName","permanentDistrictId","permanentDistrictName","permanentPincode","presentAddress","presentStateId","presentStateName","presentDistrictId","presentDistrictName","presentPincode","isPhotoDeclare","isDeclaration","statusId","numberOfAttempts","photoName","photoPath","signName","signPath","photoSource","isActive","createdById","createdByRoleId","updatedById","ipAddress","createdAt","updatedAt","isRejected",description, row_number
)
select 
id ,"registrationNo","otrId","myApplicationId","emailId","phoneNo",name,"newName" ,"fathersName","mothersName",dob,"ageAsOnDob","genderId",gender,"categoryId",category,"isPwbd","typeOfPwbd","submitPwbdType","nationalityId",nationality,"markOfIdentification","tenthEducationBoardId","educationBoardName","tenthRollNumber","tenthYearOfPassing","examCentrePreferenceId1","examCentrePreferenceId2","examCentrePreferenceId3","isBenchmarkDisabilityVh","isBenchmarkDisabilityOh","isPhysicalLimitToWrite","isScribe","isOwnScribe","scribeMedium","isApplyingMoSPI","hasEQForMoSPI","isApplyingRGI","hasEQForRGI","isEsm","dojOfEsm","dodOfEsm","lengthOfService","isCivilPost","dojOfCivilPost","regionCode","isAgeRelaxation","ageRelaxationId","isPersonalInfoAccess","permanentAddress","permanentStateId","permanentStateName","permanentDistrictId","permanentDistrictName","permanentPincode","presentAddress","presentStateId","presentStateName","presentDistrictId","presentDistrictName","presentPincode","isPhotoDeclare","isDeclaration","statusId","numberOfAttempts","photoName","photoPath","signName","signPath","photoSource","isActive","createdById","createdByRoleId","updatedById","ipAddress","createdAt","updatedAt","isRejected",description, row_number() OVER (ORDER BY "registrationNo")
from "cgl2024Applications" where "statusId"='01';


alter table "cgl2024Applications_for_edp" add column "examCentrePreference1" character varying;
alter table "cgl2024Applications_for_edp" add column "examCentrePreference1" character varying;
alter table "cgl2024Applications_for_edp" add column "examCentrePreference1" character varying;
alter table "cgl2024Applications_for_edp" add column "ageRelaxationCode" character varying;


update "cgl2024Applications_for_edp" a
set a."examCentrePreference1"=b."centreName"
from "temp_m_examCentreNames" b
where a."examCentrePreferenceId1"=b.Id
and b."examIds"::character varying like '%xsd91hjkshdk92xk%';-----cgl

update "cgl2024Applications_for_edp" a
set a."examCentrePreference2"=b."centreName"
from "temp_m_examCentreNames" b
where a."examCentrePreferenceId2"=b.Id
and b."examIds"::character varying like '%xsd91hjkshdk92xk%';

update "cgl2024Applications_for_edp" a
set a."ageRelaxationCode"=b."arcCode"
from "ageRelaxations" b
where a."ageRelaxationId"=b.Id
and b."examName"='cgl';


select 
id,"registrationNo","emailId","phoneNo",name,"newName" ,"fathersName","mothersName",dob,"ageAsOnDob",gender,category,"isPwbd","typeOfPwbd","submitPwbdType",nationality,"markOfIdentification","educationBoardName","tenthRollNumber","tenthYearOfPassing","examCentrePreference1","examCentrePreference2","examCentrePreference3","isBenchmarkDisabilityVh","isBenchmarkDisabilityOh","isPhysicalLimitToWrite","isScribe","isOwnScribe","scribeMedium","isApplyingMoSPI","hasEQForMoSPI","isApplyingRGI","hasEQForRGI","isEsm","dojOfEsm","dodOfEsm","lengthOfService","isCivilPost","dojOfCivilPost","regionCode","isAgeRelaxation","ageRelaxationCode","isPersonalInfoAccess","permanentAddress","permanentStateName","permanentDistrictName","permanentPincode","presentAddress","presentStateName","presentDistrictName","presentPincode","isPhotoDeclare","isDeclaration","statusId","numberOfAttempts","photoName","photoPath","signName","signPath","photoSource","isActive","createdById","createdByRoleId","updatedById","ipAddress","createdAt","updatedAt","isRejected",description, row_number
from "cgl2024Applications_for_edp" where row_number<=900000 order by row_number;


\copy (select id,"registrationNo","emailId","phoneNo",name,"newName" ,"fathersName","mothersName",dob,"ageAsOnDob",gender,category,"isPwbd","typeOfPwbd","submitPwbdType",nationality,"markOfIdentification","educationBoardName","tenthRollNumber","tenthYearOfPassing","examCentrePreference1","examCentrePreference2","examCentrePreference3","isBenchmarkDisabilityVh","isBenchmarkDisabilityOh","isPhysicalLimitToWrite","isScribe","isOwnScribe","scribeMedium","isApplyingMoSPI","hasEQForMoSPI","isApplyingRGI","hasEQForRGI","isEsm","dojOfEsm","dodOfEsm","lengthOfService","isCivilPost","dojOfCivilPost","regionCode","isAgeRelaxation","ageRelaxationCode","isPersonalInfoAccess","permanentAddress","permanentStateName","permanentDistrictName","permanentPincode","presentAddress","presentStateName","presentDistrictName","presentPincode","isPhotoDeclare","isDeclaration","statusId","numberOfAttempts","photoName","photoPath","signName","signPath","photoSource","isActive","createdById","createdByRoleId","updatedById","ipAddress","createdAt","updatedAt","isRejected",description, row_number from "cgl2024Applications_for_edp" where row_number<=900000 order by row_number) to 'C:\Users\Public\CGLE 2024 Application Data\file1_900000.csv' csv header;