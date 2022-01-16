USE [IDFES];

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
/*
IMPORTANT .......
include this line - else no records are returned by ACCESS ... random error.
Stops the message that shows the count of the number of rows affected by a Transact-SQL statement or stored procedure from being returned as part of the result set.
*/
SET NOCOUNT ON;

DECLARE @ServiceInterval AS FLOAT;
DECLARE @RequestedDT AS DATETIME;
DECLARE @SiteID AS INT;
DECLARE @NewLine CHAR(2);

SET @NewLine = CHAR(13) + CHAR(10);
SET @ServiceInterval = 6.0;
SET @RequestedDT = '01-13-2022';
SET @SiteID = 1029;

SELECT InspectionOrder.InspectionOrderID
	,InspectionOrder.SiteID
	,InspectionOrder.SiteID
	,CONCAT (
		'SITE# '
		,FORMAT(InspectionOrder.SiteID, '#0000')
		,@NewLine
		,dbo.GetSiteAddrMultiLine(InspectionOrder.SiteID)
		) AS xSiteLabel
	,Equipment.EquipTypeID
	,InspectionOrder.ServiceInterval
	,CASE 
		WHEN EquipType.CoreGroupID = 1
			THEN CONCAT (
					'P'
					,Test.StationNum
					)
		WHEN EquipType.CoreGroupID = 2
			THEN CONCAT (
					'E'
					,Test.StationNum
					)
		WHEN EquipType.CoreGroupID = 3
			THEN CONCAT (
					'W'
					,Test.StationNum
					)
		WHEN EquipType.CoreGroupID = 4
			THEN CONCAT (
					'S'
					,Test.StationNum
					)
		END AS xStationNum
	,Test.StationNum
	,Test.Note
	,Equipment.Caption
	,InspectionOrder.RequestedDT
	,EquipType.CoreGroupID
FROM InspectionOrder
INNER JOIN Test ON InspectionOrder.InspectionOrderID = Test.InspectionOrderID
INNER JOIN Equipment ON Test.EquipmentID = Equipment.EquipmentID
INNER JOIN EquipType ON Equipment.EquipTypeID = EquipType.EquipTypeID
WHERE Equipment.Caption NOT LIKE '%EMPTY%'
	AND SiteID = @SiteID
	AND InspectionOrder.ServiceInterval = @ServiceInterval
	AND (
		InspectionOrder.RequestedDT < @RequestedDT
		AND InspectionOrder.RequestedDT >= DATEADD(yy, - 3, @RequestedDT)
		)
ORDER BY InspectionOrder.SiteID
	,EquipType.CoreGroupID ASC
	,Test.StationNum ASC;
