CREATE OR REPLACE FUNCTION public.sp_get_application_data_new(
    par_exam_name TEXT,
    par_exam_year INTEGER,
    par_status TEXT
)
RETURNS SETOF record
LANGUAGE 'plpgsql'
COST 100
VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    application_table TEXT;
    mapped_status TEXT;
    query TEXT;
    result RECORD;
BEGIN
    -- Ensure valid input for par_exam_name and par_exam_year
    IF par_exam_name IS NULL OR par_exam_name = '' OR par_exam_year IS NULL THEN
        RAISE EXCEPTION 'Invalid exam name or exam year provided';
    END IF;

    -- Build the table name dynamically
    application_table := par_exam_name || par_exam_year || 'Applications';

    -- Map status to the corresponding statusId
    IF par_status = 'Application Completed' THEN
        mapped_status := '01';
    ELSIF par_status = 'Payment Pending' THEN
        mapped_status := '02';
    ELSIF par_status = 'Pending' THEN
        mapped_status := '03';
    ELSIF par_status = 'Cancelled' THEN
        mapped_status := '04';
    ELSE
        RAISE EXCEPTION 'Invalid status: %', par_status;
    END IF;

    -- Construct the dynamic query to select all columns from the table
   	query := 'SELECT * FROM "' || application_table || '" WHERE "statusId" = ''' || mapped_status || '''';


    -- Execute the dynamic query and return the result
    FOR result IN EXECUTE query LOOP
        RETURN NEXT result;
    END LOOP;

    -- Ensure to return when no rows are found
    RETURN;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error occurred: %, %', SQLSTATE, SQLERRM;
        RETURN;
END;
$BODY$;

ALTER FUNCTION public.sp_get_application_data_new(text, integer, text)
    OWNER TO postgres;
	
	
SELECT * FROM public.sp_get_application_data_new('cgl', 2024, 'Application Completed') 
AS t(
    id character varying(16),"registrationNo" character varying(11),"otrId" character varying(16) ,"myApplicationId" character varying(16),"emailId" character varying(50),"phoneNo" character varying(10),name character varying(50),"newName" character varying(50),"fathersName" character varying(50),"mothersName" character varying(50),dob date,"ageAsOnDob" character varying,"genderId" character varying(16),gender character varying(16),"categoryId" character varying(16),category character varying(16),"isPwbd" boolean,"typeOfPwbd" character varying(16),"submitPwbdType" character varying(10),"nationalityId" character varying(16),nationality character varying(500),"markOfIdentification" character varying(50),"tenthEducationBoardId" character varying(16),"educationBoardName" character varying(500),"tenthRollNumber" character varying(16),"tenthYearOfPassing" character varying(5),"examCentrePreferenceId1" character varying(16),"examCentrePreferenceId2" character varying(16),"examCentrePreferenceId3" character varying(16),"isBenchmarkDisabilityVh" boolean,"isBenchmarkDisabilityOh" boolean,"isPhysicalLimitToWrite" boolean,"isScribe" boolean,"isOwnScribe" boolean,"scribeMedium" character varying(20),"isApplyingMoSPI" boolean,"hasEQForMoSPI" character varying(5),"isApplyingRGI" boolean,"hasEQForRGI" character varying(5),"isEsm" boolean,"dojOfEsm" date,"dodOfEsm" date,"lengthOfService" character varying(30),"isCivilPost" boolean,"dojOfCivilPost" date,"regionCode" character varying(5),"isAgeRelaxation" boolean,"ageRelaxationId" character varying(16),"isPersonalInfoAccess" boolean,"permanentAddress" character varying(500),"permanentStateId" character varying(16),"permanentStateName" character varying(100),"permanentDistrictId" character varying(16),"permanentDistrictName" character varying(100),"permanentPincode" character varying(6),"presentAddress" character varying(500),"presentStateId" character varying(16),"presentStateName" character varying(100),"presentDistrictId" character varying(16),"presentDistrictName" character varying(100),"presentPincode" character varying(6),"isPhotoDeclare" boolean,"isDeclaration" boolean,"statusId" character varying(16),"numberOfAttempts" character varying(2),"photoName" character varying(255),"photoPath" character varying(255),"signName" character varying(255),"signPath" character varying(255),"photoSource" character varying(30),"isActive" boolean,"createdById" character varying(16),"createdByRoleId" character varying(16),"updatedById" character varying(16),"ipAddress" character varying(50),"createdAt" timestamp with time zone,"updatedAt" timestamp with time zone,"isRejected" boolean,description character varying(500),"scribeRegNo" character varying(20),"ownScribeWithdrawal" boolean,rollno character varying
	);		
	
	
SELECT * FROM public.sp_get_application_data('cgl', 2024, 'Application Completed') 
AS t(
    id character varying(16),"registrationNo" character varying(11),"otrId" character varying(16) ,"myApplicationId" character varying(16),"emailId" character varying(50),"phoneNo" character varying(10),name character varying(50),"newName" character varying(50),"fathersName" character varying(50),"mothersName" character varying(50),dob date,"ageAsOnDob" character varying,"genderId" character varying(16),gender character varying(16),"categoryId" character varying(16),category character varying(16),"isPwbd" boolean,"typeOfPwbd" character varying(16),"submitPwbdType" character varying(10),"nationalityId" character varying(16),nationality character varying(500),"markOfIdentification" character varying(50),"tenthEducationBoardId" character varying(16),"educationBoardName" character varying(500),"tenthRollNumber" character varying(16),"tenthYearOfPassing" character varying(5),"examCentrePreferenceId1" character varying(16),"examCentrePreferenceId2" character varying(16),"examCentrePreferenceId3" character varying(16),"isBenchmarkDisabilityVh" boolean,"isBenchmarkDisabilityOh" boolean,"isPhysicalLimitToWrite" boolean,"isScribe" boolean,"isOwnScribe" boolean,"scribeMedium" character varying(20),"isApplyingMoSPI" boolean,"hasEQForMoSPI" character varying(5),"isApplyingRGI" boolean,"hasEQForRGI" character varying(5),"isEsm" boolean,"dojOfEsm" date,"dodOfEsm" date,"lengthOfService" character varying(30),"isCivilPost" boolean,"dojOfCivilPost" date,"regionCode" character varying(5),"isAgeRelaxation" boolean,"ageRelaxationId" character varying(16),"isPersonalInfoAccess" boolean,"permanentAddress" character varying(500),"permanentStateId" character varying(16),"permanentStateName" character varying(100),"permanentDistrictId" character varying(16),"permanentDistrictName" character varying(100),"permanentPincode" character varying(6),"presentAddress" character varying(500),"presentStateId" character varying(16),"presentStateName" character varying(100),"presentDistrictId" character varying(16),"presentDistrictName" character varying(100),"presentPincode" character varying(6),"isPhotoDeclare" boolean,"isDeclaration" boolean,"statusId" character varying(16),"numberOfAttempts" character varying(2),"photoName" character varying(255),"photoPath" character varying(255),"signName" character varying(255),"signPath" character varying(255),"photoSource" character varying(30),"isActive" boolean,"createdById" character varying(16),"createdByRoleId" character varying(16),"updatedById" character varying(16),"ipAddress" character varying(50),"createdAt" timestamp with time zone,"updatedAt" timestamp with time zone,"isRejected" boolean,description character varying(500),"scribeRegNo" character varying(20),"ownScribeWithdrawal" boolean,rollno character varying
	);	