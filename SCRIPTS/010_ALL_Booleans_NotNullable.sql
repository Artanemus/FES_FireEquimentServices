USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.Role
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.Site DROP CONSTRAINT DF__Site__IsArchived__546180BB
go
ALTER TABLE dbo.Site ADD CONSTRAINT DF__Site__IsArchived__546180BB DEFAULT ((0)) FOR IsArchived
go
ALTER TABLE dbo.Site
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.SurveyOrder
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.Test DROP CONSTRAINT DF__Test__Passed__17AD7836
go
ALTER TABLE dbo.Test ADD CONSTRAINT DF__Test__Passed__17AD7836 DEFAULT ((0)) FOR Passed
go
ALTER TABLE dbo.Test
ALTER COLUMN Passed bit NOT NULL
go
ALTER TABLE dbo.Test
ALTER COLUMN IsManaged bit NOT NULL
go
ALTER TABLE dbo.AddressType DROP CONSTRAINT DF__AddressTy__UsedB__4AB81AF0
go
ALTER TABLE dbo.AddressType DROP CONSTRAINT DF__AddressTy__UsedB__4BAC3F29
go
ALTER TABLE dbo.AddressType ADD CONSTRAINT DF__AddressTy__UsedB__4AB81AF0 DEFAULT ((0)) FOR UsedByHR
go
ALTER TABLE dbo.AddressType
ALTER COLUMN UsedByHR bit NOT NULL
go
ALTER TABLE dbo.AddressType ADD CONSTRAINT DF__AddressTy__UsedB__4BAC3F29 DEFAULT ((0)) FOR UsedByCust
go
ALTER TABLE dbo.AddressType
ALTER COLUMN UsedByCust bit NOT NULL
go
ALTER TABLE dbo.AddressType
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.ContactNumType DROP CONSTRAINT DF__ContactNu__UsedB__4F7CD00D
go
ALTER TABLE dbo.ContactNumType DROP CONSTRAINT DF__ContactNu__UsedB__5070F446
go
ALTER TABLE dbo.ContactNumType ADD CONSTRAINT DF__ContactNu__UsedB__4F7CD00D DEFAULT ((0)) FOR UsedByHR
go
ALTER TABLE dbo.ContactNumType
ALTER COLUMN UsedByHR bit NOT NULL
go
ALTER TABLE dbo.ContactNumType ADD CONSTRAINT DF__ContactNu__UsedB__5070F446 DEFAULT ((0)) FOR UsedByCust
go
ALTER TABLE dbo.ContactNumType
ALTER COLUMN UsedByCust bit NOT NULL
go
ALTER TABLE dbo.ContactNumType
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.ContactType DROP CONSTRAINT DF__ContactTy__UsedB__09A971A2
go
ALTER TABLE dbo.ContactType DROP CONSTRAINT DF__ContactTy__UsedB__0A9D95DB
go
ALTER TABLE dbo.ContactType ADD CONSTRAINT DF__ContactTy__UsedB__09A971A2 DEFAULT ((0)) FOR UsedByHR
go
ALTER TABLE dbo.ContactType
ALTER COLUMN UsedByHR bit NOT NULL
go
ALTER TABLE dbo.ContactType ADD CONSTRAINT DF__ContactTy__UsedB__0A9D95DB DEFAULT ((0)) FOR UsedByCust
go
ALTER TABLE dbo.ContactType
ALTER COLUMN UsedByCust bit NOT NULL
go
ALTER TABLE dbo.ContactType
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.CustAddress
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.CustContact
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.CustContactNum
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.CustEmail
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.CustSite DROP CONSTRAINT DF__CustSite__IsEnab__114A936A
go
ALTER TABLE dbo.CustSite
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.CustSite ADD CONSTRAINT DF__CustSite__IsEnab__114A936A DEFAULT ((0)) FOR IsEnabled
go
ALTER TABLE dbo.CustSite
ALTER COLUMN IsEnabled bit NOT NULL
go
ALTER TABLE dbo.CustSite
ALTER COLUMN DoReseed bit NOT NULL
go
ALTER TABLE dbo.EmailType DROP CONSTRAINT DF__EmailType__UsedB__6B24EA82
go
ALTER TABLE dbo.EmailType DROP CONSTRAINT DF__EmailType__UsedB__6C190EBB
go
ALTER TABLE dbo.EmailType ADD CONSTRAINT DF__EmailType__UsedB__6B24EA82 DEFAULT ((0)) FOR UsedByHR
go
ALTER TABLE dbo.EmailType
ALTER COLUMN UsedByHR bit NOT NULL
go
ALTER TABLE dbo.EmailType ADD CONSTRAINT DF__EmailType__UsedB__6C190EBB DEFAULT ((0)) FOR UsedByCust
go
ALTER TABLE dbo.EmailType
ALTER COLUMN UsedByCust bit NOT NULL
go
ALTER TABLE dbo.EmailType
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.Equipment
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.HR
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.HRAddress
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.HRContactNum
ALTER COLUMN IsArchived bit NOT NULL
go
ALTER TABLE dbo.HREmail
ALTER COLUMN IsArchived bit NOT NULL
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.CustAddress DROP CONSTRAINT Customer_CustAddress
go
ALTER TABLE dbo.CustSite DROP CONSTRAINT Customer_CustSite
go
ALTER TABLE dbo.CustContact DROP CONSTRAINT Customer_CustContact
go
ALTER TABLE dbo.CustContactNum DROP CONSTRAINT Customer_CustContactNum
go
ALTER TABLE dbo.CustEmail DROP CONSTRAINT Customer_CustEmail
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.Station.PK154','PK154_11192021231819001','INDEX'
go
EXEC sp_rename 'dbo.Equipment_Station','Equipment__11192021231819002'
go
EXEC sp_rename 'dbo.CoreGroup_Station','CoreGroup__11192021231819003'
go
EXEC sp_rename 'dbo.Site_Station','Site_Stati_11192021231819004'
go
EXEC sp_rename 'dbo.DF__Station__IsEmpty__1DB06A4F', 'DF__Statio_11192021231819005',OBJECT
go
SET QUOTED_IDENTIFIER OFF
go
SET ANSI_NULLS OFF
go
-- =============================================
-- Author:		Ben Ambrose
-- Create date: 9/10/2021
-- Description:	DateTime of the last known 'passed' inspection 
--	for the equipment located at the given station.
-- PARAMS:
--	1. The station ID
--	2. MINOR or MAJOR life-cycle option. DEFAULT: find the last MAJOR DateTime.
-- =============================================
CREATE   FUNCTION [dbo].[LastPassed_11192021231819006] 
(
	-- Add the parameters for the function here
	@StationID int
	,@DoMajor BIT
)
-- Returns the date the equipment was inspected on. 
--	if InspectedOn is null then returns RequestedDT (the date of inspection)
RETURNS DateTime
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result DateTime;
	DECLARE @DT as DateTime;

	-- DEFAULT is return last Major LC Service
	IF @DoMajor IS NULL SET @DoMajor = 1; 


	-- =============================================
	-- Multi CTE table statements
	-- =============================================


	-- CTE table - TmpA 
	-- Retrive the EquipmentID and StationNum.
	-- Ignore stations with empty LifeCycleSeed DateTimes
	WITH TmpA AS 
	(
		SELECT StationNum
			, EquipmentID
			, SiteID
		FROM Station
		WHERE StationID = @StationID
			AND LifeCycleSeed IS NOT NULL
	)
	,
	-- CTE table - TmpB
	-- Pull TESTs for the given SITE, narrow list by station number and equipment type.
	-- NOTE: TEST and STATION are loosly paired by a Non-Specific relationship via fieldname ReferenceID
	--		This isn't used here...
	--		The inspection status was COMPLETED 
	TmpB AS 
	(
		SELECT InspectionOrder.InspectedOn
			, InspectionOrder.RequestedDT
			, InspectionOrder.SiteID
			, Test.EquipmentID
			, Test.StationNum
		FROM InspectionOrder
		INNER JOIN Test
			ON InspectionOrder.InspectionOrderID = Test.InspectionOrderID
		-- The inspection order was COMPLETED
		WHERE (InspectionOrder.InspectionStatusID = 2)
			-- The equipment passed the inspection
			AND (Test.Passed = 1)
			-- PARAM 2: option MINOR or MAJOR
			AND (
				(
					TestLifeCycleID = (
						CASE @DoMajor
							WHEN 1
								THEN 2
							WHEN 0
								THEN 1
							END
						)
					)
				)
	)

	-- =============================================
	-- Computed return value here
	-- =============================================
	SELECT TOP 1 @Result = 
		(CASE 
			WHEN InspectedOn IS NULL THEN RequestedDT
			ELSE InspectedOn 
		END )
	FROM TmpB
		INNER JOIN tmpA
			ON tmpA.SiteID = TmpB.SiteID
				AND tmpA.EquipmentID = TmpB.EquipmentID
				AND tmpA.StationNum = TmpB.StationNum
		ORDER BY TmpB.RequestedDT DESC

	-- =============================================
	-- Return the result of the function
	-- =============================================
	RETURN @Result

END
go
IF OBJECT_ID('dbo.LastPassed_11192021231819006') IS NOT NULL
    PRINT '<<< CREATED FUNCTION dbo.LastPassed_11192021231819006 >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION dbo.LastPassed_11192021231819006 >>>'
go
-- =============================================
-- Author:		Ben Ambrose
-- Create date: 12/10/2021
-- Description:	Compute the next Life Cycle service date.
-- =============================================
CREATE   FUNCTION [dbo].[NextLifeCy_11192021231819007] 
(
	-- Add the parameters for the function here
	@StationID int
	,@DoMajor BIT
)
RETURNS DateTime
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result DateTime

	DECLARE @LastPassedInspection DATETIME;
	DECLARE @Interval FLOAT;
	DECLARE @Months INT;
	DECLARE @Count INT;
	DECLARE @SeedDate DATETIME;
	DECLARE @ComputeDate DATETIME;

	Set @Result = NULL;

	-- DEFAULT: Compute last Major LC Service
	IF @DoMajor IS NULL
		SET @DoMajor = 1;


	-- Get commission date for equipment (LifeCycle seed date).
	SELECT @SeedDate = LifeCycleSeed 
		FROM Station
		WHERE StationID = @StationID;
	-- REQUIRED.
	IF @SeedDate IS NULL GOTO Jump01

	-- Get interval used for MINOR\MAJOR life cycle services.
	SELECT @Interval = 
		iif(@DoMajor = 1, MajorLifeCycle, MinorLifeCycle)
		FROM Station
		INNER JOIN Equipment ON Station.EquipmentID = Equipment.EquipmentID
		INNER JOIN EquipType ON Equipment.EquipTypeID = EquipType.EquipTypeID
		WHERE StationID = @StationID;
	-- REQUIRED
	IF @Interval IS NULL GOTO Jump01 

	-- Get last qualified passed inspection date
    Set @LastPassedInspection = dbo.LastPassedInspection(@StationID, @DoMajor);
	-- NO INSPECTIONS DONE: NEXT LIFE CYCLE = SEED-DATE
    if @LastPassedInspection IS NULL 
		Set @Result = @SeedDate
	if @Result IS NOT NULL
		GOTO Jump01

	-- Count life-cycle intervals between SeedDate and LastPassedInspection
	Set @Months = DATEDIFF(MONTH, @SeedDate, @LastPassedInspection);
	-- (LOWER BOUND) Count of service intervals needed to just preceed or equal the date of the LastPassedInspection 
	Set @Count = FLOOR(CAST(@Months AS FLOAT) / @Interval)
	-- FINAL LifeCycle date -  post dating the last passed inspection date.
	Set @ComputeDate = DATEADD(month,  (@Interval * (@Count+1)), @SeedDate); 

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = @StationID

Jump01:
	-- Return the result of the function
	RETURN @Result

END
go
IF OBJECT_ID('dbo.NextLifeCy_11192021231819007') IS NOT NULL
    PRINT '<<< CREATED FUNCTION dbo.NextLifeCy_11192021231819007 >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION dbo.NextLifeCy_11192021231819007 >>>'
go
EXEC sp_rename 'dbo.Station','Station_11192021231819000',OBJECT
go
CREATE TABLE dbo.Station
(
    StationID     int            IDENTITY,
    StationNum    float          NULL,
    CircuitBlock  nvarchar(18)   NULL,
    Location      nvarchar(128)  NULL,
    Note          text           NULL,
    CreatedOn     datetime       NULL,
    LifeCycleSeed datetime       NULL,
    IsEmpty       bit            CONSTRAINT DF__Station__IsEmpty__1DB06A4F DEFAULT ((0))  NOT NULL,
    IsManaged     bit             NOT NULL,
    SiteID        int            NULL,
    EquipmentID   int            NULL,
    CoreGroupID   int            NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_0', 'dbo.Station.IsManaged'
go
EXEC sp_rename 'dbo.Customer.PK100','PK100_11192021231820001','INDEX'
go
EXEC sp_rename 'dbo.DF_Customer_IsArchived', 'DF_Custome_11192021231820002',OBJECT
go
EXEC sp_rename 'dbo.Customer','Customer_11192021231820000',OBJECT
go
CREATE TABLE dbo.Customer
(
    CustomerID int           IDENTITY,
    CustName   nvarchar(64)  NULL,
    CustCode   nvarchar(8)   NULL,
    MYOBID     int           NULL,
    Note       text          NULL,
    CreatedBy  int           NULL,
    CreatedOn  datetime      NULL,
    ModifiedBy int           NULL,
    ModifiedOn datetime      NULL,
    IsArchived bit           CONSTRAINT DF_Customer_IsArchived DEFAULT ((0))  NOT NULL
)
ON [PRIMARY]
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.Station ON
go
INSERT INTO dbo.Station(
                        StationID,
                        StationNum,
                        CircuitBlock,
                        Location,
                        Note,
                        CreatedOn,
                        LifeCycleSeed,
                        IsEmpty,
                        IsManaged,
                        SiteID,
                        EquipmentID,
                        CoreGroupID
                       )
                 SELECT 
                        StationID,
                        StationNum,
                        CircuitBlock,
                        Location,
                        Note,
                        CreatedOn,
                        LifeCycleSeed,
                        IsEmpty,
                        IsManaged,
                        SiteID,
                        EquipmentID,
                        CoreGroupID
                   FROM dbo.Station_11192021231819000 
go
SET IDENTITY_INSERT dbo.Station OFF
go
SET IDENTITY_INSERT dbo.Customer ON
go
INSERT INTO dbo.Customer(
                         CustomerID,
                         CustName,
                         CustCode,
                         MYOBID,
                         Note,
                         CreatedBy,
                         CreatedOn,
                         ModifiedBy,
                         ModifiedOn,
                         IsArchived
                        )
                  SELECT 
                         CustomerID,
                         CustName,
                         CustCode,
                         MYOBID,
                         Note,
                         CreatedBy,
                         CreatedOn,
                         ModifiedBy,
                         ModifiedOn,
                         IsArchived
                    FROM dbo.Customer_11192021231820000 
go
SET IDENTITY_INSERT dbo.Customer OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.Station ADD CONSTRAINT PK154
PRIMARY KEY CLUSTERED (StationID)
go
ALTER TABLE dbo.Customer ADD CONSTRAINT PK100
PRIMARY KEY CLUSTERED (CustomerID)
go

-- Add Dependencies SQL

SET QUOTED_IDENTIFIER ON
go
SET ANSI_NULLS ON
go
IF EXISTS (select * from syscomments where id = object_id('dbo.LastPassedInspection') and texttype & 4 = 0)
BEGIN
    DROP FUNCTION dbo.LastPassedInspection
    IF OBJECT_ID('dbo.LastPassedInspection') IS NOT NULL
        PRINT '<<< FAILED DROPPING FUNCTION dbo.LastPassedInspection >>>'
    ELSE
        PRINT '<<< DROPPED FUNCTION dbo.LastPassedInspection >>>'
END
go
-- =============================================
-- Author:		Ben Ambrose
-- Create date: 9/10/2021
-- Description:	DateTime of the last known 'passed' inspection 
--	for the equipment located at the given station.
-- PARAMS:
--	1. The station ID
--	2. MINOR or MAJOR life-cycle option. DEFAULT: find the last MAJOR DateTime.
-- =============================================
CREATE   FUNCTION [dbo].[LastPassedInspection] 
(
	-- Add the parameters for the function here
	@StationID int
	,@DoMajor BIT
)
-- Returns the date the equipment was inspected on. 
--	if InspectedOn is null then returns RequestedDT (the date of inspection)
RETURNS DateTime
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result DateTime;
	DECLARE @DT as DateTime;

	-- DEFAULT is return last Major LC Service
	IF @DoMajor IS NULL SET @DoMajor = 1; 


	-- =============================================
	-- Multi CTE table statements
	-- =============================================


	-- CTE table - TmpA 
	-- Retrive the EquipmentID and StationNum.
	-- Ignore stations with empty LifeCycleSeed DateTimes
	WITH TmpA AS 
	(
		SELECT StationNum
			, EquipmentID
			, SiteID
		FROM Station
		WHERE StationID = @StationID
			AND LifeCycleSeed IS NOT NULL
	)
	,
	-- CTE table - TmpB
	-- Pull TESTs for the given SITE, narrow list by station number and equipment type.
	-- NOTE: TEST and STATION are loosly paired by a Non-Specific relationship via fieldname ReferenceID
	--		This isn't used here...
	--		The inspection status was COMPLETED 
	TmpB AS 
	(
		SELECT InspectionOrder.InspectedOn
			, InspectionOrder.RequestedDT
			, InspectionOrder.SiteID
			, Test.EquipmentID
			, Test.StationNum
		FROM InspectionOrder
		INNER JOIN Test
			ON InspectionOrder.InspectionOrderID = Test.InspectionOrderID
		-- The inspection order was COMPLETED
		WHERE (InspectionOrder.InspectionStatusID = 2)
			-- The equipment passed the inspection
			AND (Test.Passed = 1)
			-- PARAM 2: option MINOR or MAJOR
			AND (
				(
					TestLifeCycleID = (
						CASE @DoMajor
							WHEN 1
								THEN 2
							WHEN 0
								THEN 1
							END
						)
					)
				)
	)

	-- =============================================
	-- Computed return value here
	-- =============================================
	SELECT TOP 1 @Result = 
		(CASE 
			WHEN InspectedOn IS NULL THEN RequestedDT
			ELSE InspectedOn 
		END )
	FROM TmpB
		INNER JOIN tmpA
			ON tmpA.SiteID = TmpB.SiteID
				AND tmpA.EquipmentID = TmpB.EquipmentID
				AND tmpA.StationNum = TmpB.StationNum
		ORDER BY TmpB.RequestedDT DESC

	-- =============================================
	-- Return the result of the function
	-- =============================================
	RETURN @Result

END
go
IF OBJECT_ID('dbo.LastPassedInspection') IS NOT NULL
    PRINT '<<< CREATED FUNCTION dbo.LastPassedInspection >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION dbo.LastPassedInspection >>>'
go
SET ANSI_NULLS OFF
go
SET QUOTED_IDENTIFIER OFF
go
IF OBJECT_ID('dbo.LastPassedInspection') IS NULL
BEGIN
	EXEC sp_rename 'LastPassed_11192021231819006', 'LastPassedInspection'
	IF OBJECT_ID('dbo.LastPassedInspection') IS NOT NULL
	   PRINT '<<< Function dbo.LastPassedInspection is no longer valid. Please modify the SQL so that it is validated against dbo.Station >>>'
END
go
IF EXISTS (select * from syscomments where id = object_id('dbo.NextLifeCycle') and texttype & 4 = 0)
BEGIN
    DROP FUNCTION dbo.NextLifeCycle
    IF OBJECT_ID('dbo.NextLifeCycle') IS NOT NULL
        PRINT '<<< FAILED DROPPING FUNCTION dbo.NextLifeCycle >>>'
    ELSE
        PRINT '<<< DROPPED FUNCTION dbo.NextLifeCycle >>>'
END
go
-- =============================================
-- Author:		Ben Ambrose
-- Create date: 12/10/2021
-- Description:	Compute the next Life Cycle service date.
-- =============================================
CREATE   FUNCTION [dbo].[NextLifeCycle] 
(
	-- Add the parameters for the function here
	@StationID int
	,@DoMajor BIT
)
RETURNS DateTime
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result DateTime

	DECLARE @LastPassedInspection DATETIME;
	DECLARE @Interval FLOAT;
	DECLARE @Months INT;
	DECLARE @Count INT;
	DECLARE @SeedDate DATETIME;
	DECLARE @ComputeDate DATETIME;

	Set @Result = NULL;

	-- DEFAULT: Compute last Major LC Service
	IF @DoMajor IS NULL
		SET @DoMajor = 1;


	-- Get commission date for equipment (LifeCycle seed date).
	SELECT @SeedDate = LifeCycleSeed 
		FROM Station
		WHERE StationID = @StationID;
	-- REQUIRED.
	IF @SeedDate IS NULL GOTO Jump01

	-- Get interval used for MINOR\MAJOR life cycle services.
	SELECT @Interval = 
		iif(@DoMajor = 1, MajorLifeCycle, MinorLifeCycle)
		FROM Station
		INNER JOIN Equipment ON Station.EquipmentID = Equipment.EquipmentID
		INNER JOIN EquipType ON Equipment.EquipTypeID = EquipType.EquipTypeID
		WHERE StationID = @StationID;
	-- REQUIRED
	IF @Interval IS NULL GOTO Jump01 

	-- Get last qualified passed inspection date
    Set @LastPassedInspection = dbo.LastPassedInspection(@StationID, @DoMajor);
	-- NO INSPECTIONS DONE: NEXT LIFE CYCLE = SEED-DATE
    if @LastPassedInspection IS NULL 
		Set @Result = @SeedDate
	if @Result IS NOT NULL
		GOTO Jump01

	-- Count life-cycle intervals between SeedDate and LastPassedInspection
	Set @Months = DATEDIFF(MONTH, @SeedDate, @LastPassedInspection);
	-- (LOWER BOUND) Count of service intervals needed to just preceed or equal the date of the LastPassedInspection 
	Set @Count = FLOOR(CAST(@Months AS FLOAT) / @Interval)
	-- FINAL LifeCycle date -  post dating the last passed inspection date.
	Set @ComputeDate = DATEADD(month,  (@Interval * (@Count+1)), @SeedDate); 

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = @StationID

Jump01:
	-- Return the result of the function
	RETURN @Result

END
go
IF OBJECT_ID('dbo.NextLifeCycle') IS NOT NULL
    PRINT '<<< CREATED FUNCTION dbo.NextLifeCycle >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION dbo.NextLifeCycle >>>'
go
IF OBJECT_ID('dbo.NextLifeCycle') IS NULL
BEGIN
	EXEC sp_rename 'NextLifeCy_11192021231819007', 'NextLifeCycle'
	IF OBJECT_ID('dbo.NextLifeCycle') IS NOT NULL
	   PRINT '<<< Function dbo.NextLifeCycle is no longer valid. Please modify the SQL so that it is validated against dbo.Station >>>'
END
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.CustAddress ADD CONSTRAINT Customer_CustAddress
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustSite ADD CONSTRAINT Customer_CustSite
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustContact ADD CONSTRAINT Customer_CustContact
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustContactNum ADD CONSTRAINT Customer_CustContactNum
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustEmail ADD CONSTRAINT Customer_CustEmail
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT Equipment_Station
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT CoreGroup_Station
FOREIGN KEY (CoreGroupID)
REFERENCES dbo.CoreGroup (CoreGroupID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT Site_Station
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
go
