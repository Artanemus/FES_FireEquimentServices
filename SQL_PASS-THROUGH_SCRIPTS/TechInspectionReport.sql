USE IDFES;

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
/*
IMPORTANT .......
include this line - else no records are returned by ACCESS ... random error.
Stops the message that shows the count of the number of rows affected by a Transact-SQL statement or stored procedure from being returned as part of the result set.
*/
SET NOCOUNT ON;

DECLARE @NewLine CHAR(2);

SET @NewLine = CHAR(13) + CHAR(10);

/* 
---------------------------------------
TECHNICIAN INSPECTION REPORT
---------------------------------------
*/

SELECT dbo.InspectionOrder.InspectionOrderID
    , dbo.InspectionOrder.ServiceInterval
    , dbo.InspectionOrder.CustSiteID
    , dbo.InspectionOrder.CustomerID
    , dbo.InspectionOrder.SiteID
    , dbo.InspectionOrder.RequestedDT
    , dbo.InspectionOrder.InspectedOn
    , dbo.InspectionOrder.CompletedDT
    , dbo.InspectionOrder.LevelNum
    , Format(IIf([InspectedOn] IS NULL, [RequestedDT], [InspectedOn]), 'dd/MM/yyyy') AS xInspectDT
	, CONCAT(SUBSTRING(dbo.Customer.CustName,1,96), ' (', dbo.GetCustContactNum(dbo.InspectionOrder.CustomerID), ')') AS xCustNameBusNum
	, dbo.GetHRContactSingleLine(dbo.GetCustContactID(dbo.InspectionOrder.CustomerID), 1) AS xCustContactNameNum
	, dbo.GetCustSiteContactSingleLine(dbo.InspectionOrder.CustSiteID, default) AS xCustSiteContactNum
	, dbo.GetSiteAddrSingleLine(dbo.InspectionOrder.SiteID, default) AS xSiteAddressPC
	, dbo.GetHRContactSingleLine(dbo.InspectionOrder.HRID, 0) AS xTechNameNum

	, SUBSTRING(CustSite.Note, 1, 128) as xCustSiteNotes

FROM dbo.InspectionOrder
INNER JOIN CustSite
    ON InspectionOrder.CustSiteID = CustSite.CustSiteID
INNER JOIN Customer
    ON InspectionOrder.CustomerID = Customer.CustomerID
