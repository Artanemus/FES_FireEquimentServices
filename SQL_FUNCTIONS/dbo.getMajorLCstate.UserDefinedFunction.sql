USE [IDFES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 24/01/2022
-- Description:	Get majpr life cycle alert for inspection order
-- =============================================
CREATE OR ALTER FUNCTION GetMajorLCstate 
(
	-- Add the parameters for the function here
	@InspectionOrderID int
	,@CoreGroupID int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result bit
	SET @Result = 0

	IF @InspectionOrderID IS NULL
		return @Result;

	IF @CoreGroupID IS NULL
		return @Result;

	-- Add the T-SQL statements to compute the return value here
WITH CTE AS (
		SELECT InspectionOrder.InspectionOrderID
		,Station.CoreGroupID
		, CASE WHEN DatePart(year, InspectionOrder.RequestedDT) = DatePart(year, dbo.NextLifeCycle(InspectionOrder.SiteID, DEFAULT)) THEN 1 ELSE 0 END AS X
	FROM InspectionOrder
	INNER JOIN Site ON InspectionOrder.SiteID = Site.SiteID
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	WHERE InspectionOrder.InspectionOrderID = @InspectionOrderID
		AND Station.CoreGroupID = @CoreGroupID
	)
	SELECT TOP 1 @Result = CTE.X FROM CTE WHERE CTE.X = 1

	if @Result IS NULL 
		Set @Result = 0

	-- Return the result of the function
	RETURN @Result

END
GO

