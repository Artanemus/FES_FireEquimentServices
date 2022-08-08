USE IDFES
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SET NOCOUNT ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 21/01/2022
-- Description:	Find the Site's Pay-On-Site state
-- Count the number of stations (that pass criteria). Site's with a low number of stations - Customer can pay-on-site.
-- RETURNS true if <= MaxPOS ... Customer can pay on site
-- =============================================
CREATE OR ALTER FUNCTION GetPOSstate 
(
	-- Add the parameters for the function here
	@SiteID int
)
RETURNS bit
AS
BEGIN

	-- Declare the return variable here
	DECLARE @Result bit
	DECLARE @MaxPOS AS INT

	SET @Result = 0

	SET @MaxPOS = (SELECT TOP 1 Global.MaxPos FROM Global WHERE Global.GlobalID = 1);
	-- assign arbetry default
	IF @MaxPOS IS NULL or @MaxPOS = 0 
		Set @MaxPOS = 5;

	IF @SiteID IS NULL
		return @Result;

	WITH CTE AS (
			SELECT Station.SiteID
			,COUNT(Station.StationID) AS StationCount
		FROM Station
		INNER JOIN Equipment ON Station.EquipmentID = Equipment.EquipmentID
		-- criteria 
		-- STATION isn't empty (has not equipment)
		-- STATION is structual (ignore this station in count)
		WHERE (NOT (Equipment.Caption LIKE N'%EMPTY%'))
			AND (Station.CoreGroupID <> 4)
		GROUP BY Station.SiteID
	)
	SELECT @Result = (CASE WHEN StationCount <= @MaxPOS THEN 1 ELSE 0 END) FROM CTE WHERE CTE.SiteID = @SiteID

	-- Return the result of the function
	RETURN @Result

END
GO

