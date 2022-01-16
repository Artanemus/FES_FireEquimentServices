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
    , CONCAT (
        'SITE# '
        , FORMAT(Site.SiteID, '#0000')
        , @NewLine
        , dbo.GetSiteAddrMultiLine(dbo.InspectionOrder.SiteID)
        , @NewLine
		, 'Site Contact: '
		, dbo.GetCustSiteContactSingleLine(dbo.InspectionOrder.CustSiteID, default)
        ) AS xSiteLabel

    , CONCAT (
        'CUSTOMER# '
        , FORMAT(dbo.InspectionOrder.CustomerID, '#0000')
        , @NewLine
        , Customer.CustName
        , @NewLine
        , dbo.GetCustAddrMultiLine(dbo.InspectionOrder.CustomerID)
		, @NewLine
		, 'PH: '
		, dbo.GetCustContactNum( dbo.InspectionOrder.CustomerID) 
        ) AS xCustLabel   


FROM dbo.InspectionOrder
INNER JOIN Site
    ON InspectionOrder.SiteID = Site.SiteID
INNER JOIN Customer
    ON InspectionOrder.CustomerID = Customer.CustomerID
LEFT OUTER JOIN dbo.Postcode as A
    ON site.PostcodeID = A.PostcodeID;
