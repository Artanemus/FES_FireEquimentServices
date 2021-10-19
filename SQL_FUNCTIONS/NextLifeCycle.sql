USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[NextLifeCycle]    Script Date: 12/10/2021 2:52:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Ambrose
-- Create date: 12/10/2021
-- Description:	Compute the next Life Cycle service date.
-- =============================================
ALTER FUNCTION [dbo].[NextLifeCycle] 
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
