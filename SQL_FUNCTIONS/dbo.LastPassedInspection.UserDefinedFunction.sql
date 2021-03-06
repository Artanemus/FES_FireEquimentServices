USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[LastPassedInspection]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Ambrose
-- Create date: 9/10/2021
-- Description:	DateTime of the last known 'passed' inspection 
--	for the equipment located at the given station.
-- PARAMS:
--	1. The station ID
--	2. MINOR or MAJOR life-cycle option. DEFAULT: find the last MAJOR DateTime.
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[LastPassedInspection] 
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
			-- DEPRECIATED : New criteria - they station equipment only has to be attended by the Technician
			-- for this to be the last valid inspection DateTime
			-- AND (Test.Passed = 1)
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
GO
