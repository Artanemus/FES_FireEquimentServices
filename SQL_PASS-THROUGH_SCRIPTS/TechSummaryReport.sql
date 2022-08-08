USE [IDFES];

-- NOTE: ACCESS via ADO - T_SQL 'GO' cannot be used.
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
/*
IMPORTANT .......
include this line - else no records are returned by ACCESS ... random error.
Stops the message that shows the count of the number of rows affected by a Transact-SQL statement or stored procedure from being returned as part of the result set.
*/
SET NOCOUNT ON;

WITH A (
	SiteID
	,StationCount
	)
AS (
	SELECT Site.SiteID
		,COUNT(Station.StationID) AS StationCount
	FROM Site
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	GROUP BY Site.SiteID
	)
	,B (
	SiteID
	,PCount
	)
AS (
	SELECT Site.SiteID
		,COUNT(Station.StationID) AS PCount
	FROM Site
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	WHERE (Station.CoreGroupID = 1)
	GROUP BY Site.SiteID
	)
	,C (
	SiteID
	,ECount
	)
AS (
	SELECT Site.SiteID
		,COUNT(Station.StationID) AS ECount
	FROM Site
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	WHERE (Station.CoreGroupID = 2)
	GROUP BY Site.SiteID
	)
	,D (
	SiteID
	,WCount
	)
AS (
	SELECT Site.SiteID
		,COUNT(Station.StationID) AS WCount
	FROM Site
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	WHERE (Station.CoreGroupID = 3)
	GROUP BY Site.SiteID
	)
	,E (
	SiteID
	,SCount
	)
AS (
	SELECT Site.SiteID
		,COUNT(Station.StationID) AS SCount
	FROM Site
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	WHERE (Station.CoreGroupID = 4)
	GROUP BY Site.SiteID
	)
	,FX (
	SiteID
	,FXCount
	)
AS (
	SELECT Site.SiteID
		,COUNT(Equipment.EquipmentID) AS FXCount
	FROM Site
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	INNER JOIN Equipment ON Station.EquipmentID = Equipment.EquipmentID
	WHERE (Equipment.EquipTypeID = 3) -- Fire Extinguisher
	GROUP BY Site.SiteID
	)
	,HY (
	SiteID
	,HYCount
	)
AS (
	SELECT Site.SiteID
		,COUNT(Equipment.EquipmentID) AS HYCount
	FROM Site
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	INNER JOIN Equipment ON Station.EquipmentID = Equipment.EquipmentID
	WHERE (Equipment.EquipTypeID = 1) -- Hydrants
	GROUP BY Site.SiteID
	)
	,FH (
	SiteID
	,FHCount
	)
AS (
	SELECT Site.SiteID
		,COUNT(Equipment.EquipmentID) AS FHCount
	FROM Site
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	INNER JOIN Equipment ON Station.EquipmentID = Equipment.EquipmentID
	WHERE (Equipment.EquipTypeID = 4) -- Fire Hose
	GROUP BY Site.SiteID
	)
	,BO (
	SiteID
	,BOCount
	)
AS (
	SELECT Site.SiteID
		,COUNT(Equipment.EquipmentID) AS BOCount
	FROM Site
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	INNER JOIN Equipment ON Station.EquipmentID = Equipment.EquipmentID
	WHERE (Equipment.EquipTypeID = 7) -- Booster
	GROUP BY Site.SiteID
	)
	,PS (
	SiteID
	,PSCount
	)
AS (
	SELECT Site.SiteID
		,COUNT(Equipment.EquipmentID) AS PSCount
	FROM Site
	INNER JOIN Station ON Site.SiteID = Station.SiteID
	INNER JOIN Equipment ON Station.EquipmentID = Equipment.EquipmentID
	WHERE (Equipment.EquipTypeID = 8) -- PumpSet
	GROUP BY Site.SiteID
	)
SELECT InspectionOrder.InspectionOrderID
	--	,InspectionOrder.CreatedOn
	,InspectionOrder.RequestedDT
	--	,InspectionOrder.InspectedOn
	--	,InspectionOrder.CompletedDT
	,InspectionOrder.ServiceInterval
	,InspectionOrder.LevelNum
	--	,InspectionOrder.InspectionStatusID
	,InspectionOrder.HRID
	--	,InspectionOrder.CustSiteID
	-- ,InspectionOrder.CustomerID
	--	,InspectionOrder.SiteID
	--	,dbo.GetHRAddrMultiLine(InspectionOrder.HRID) AS xHRAddr
	--	,dbo.GetHREmail(InspectionOrder.HRID) AS xHREmail
	,A.StationCount
	,B.PCount AS Portables
	,C.ECount AS Electrical
	,D.WCount AS WaterBase
	,E.SCount AS Structual
	,FX.FXCount AS FX
	,HY.HYCount AS Hydrant
	,FH.FHCount AS FHose
	,BO.BOCount AS Booster
	,PS.PSCount AS PumpSet
	,Customer.CustName
	,dbo.GetSiteAddrMultiLine(InspectionOrder.SiteID) AS xSiteAddr
	,dbo.GetCustSiteContactSingleLine(InspectionOrder.CustSiteID, DEFAULT) AS xCustSiteContactDetails
	,dbo.GetLCCountCoreGroup(InspectionOrder.SiteID, DATEADD(mm, - InspectionOrder.ServiceInterval, InspectionOrder.RequestedDT), DATEADD(mm, InspectionOrder.ServiceInterval, InspectionOrder.RequestedDT), 1, 1) AS LCCount_Portable
	,dbo.GetLCCountCoreGroup(InspectionOrder.SiteID, DATEADD(mm, - InspectionOrder.ServiceInterval, InspectionOrder.RequestedDT), DATEADD(mm, InspectionOrder.ServiceInterval, InspectionOrder.RequestedDT), 1, 3) AS LCCount_WaterBase
FROM InspectionOrder
LEFT OUTER JOIN A ON InspectionOrder.SiteID = A.SiteID
LEFT OUTER JOIN B ON InspectionOrder.SiteID = B.SiteID
LEFT OUTER JOIN C ON InspectionOrder.SiteID = C.SiteID
LEFT OUTER JOIN D ON InspectionOrder.SiteID = D.SiteID
LEFT OUTER JOIN E ON InspectionOrder.SiteID = E.SiteID
LEFT OUTER JOIN FX ON InspectionOrder.SiteID = FX.SiteID
LEFT OUTER JOIN HY ON InspectionOrder.SiteID = HY.SiteID
LEFT OUTER JOIN FH ON InspectionOrder.SiteID = FH.SiteID
LEFT OUTER JOIN BO ON InspectionOrder.SiteID = BO.SiteID
LEFT OUTER JOIN PS ON InspectionOrder.SiteID = PS.SiteID
LEFT OUTER JOIN HR ON InspectionOrder.HRID = HR.HRID
INNER JOIN Site ON InspectionOrder.SiteID = Site.SiteID
INNER JOIN Customer ON InspectionOrder.CustomerID = Customer.CustomerID
-- WHERE NOT InspectionOrder.HRID IS NULL
ORDER BY InspectionOrder.RequestedDT ASC;
