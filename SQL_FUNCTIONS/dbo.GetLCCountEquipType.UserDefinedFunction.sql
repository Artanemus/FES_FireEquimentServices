USE [IDFES]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 21/01/2022
-- Description:	Count the number of stations within a SITE that are due for a life cycle service.
-- CRITERIA: 
-- . Specific SITE
-- . Within the specific date range. 
-- . Choose Life Cycle type MINOR = 0 or MAJOR = 1 
-- . Specify one of the core groups
-- Note: StartDT must always be <= to EndDT.
-- =============================================

CREATE OR ALTER FUNCTION [dbo].[GetLCCountEquipType] (
	-- Add the parameters for the function here
	@SiteID AS INT
	,@StartDT DATE
	,@EndDT DATE
	,@DoMajor AS BIT = 1
	,@EquipTypeID AS INT
	)
RETURNS INT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result INT;

	SET @Result = 0;

	WITH CTE  AS (
			SELECT Site.SiteID
			,COUNT(Site.SiteID) AS LCCount
		FROM Site
		INNER JOIN Station ON Site.SiteID = Station.SiteID
		INNER JOIN Equipment ON Station.EquipmentID = Equipment.EquipmentID
		WHERE (
			(dbo.NextLifeCycle(Station.StationID, @DoMajor) >= @StartDT)
			AND (dbo.NextLifeCycle(Station.StationID, @DoMajor) <= @EndDT)
			AND Equipment.EquipTypeID = @EquipTypeID
			)
		GROUP BY Site.SiteID
		)

	SELECT @Result = CTE.LCCount
	FROM CTE
	WHERE CTE.SiteID = @SiteID

	-- Return the result of the function
	RETURN @Result
END
GO


