USE IDFES
GO

SELECT dbo.InspectionOrder.InspectionOrderID,
       dbo.CustSite.CustomerID,
       dbo.CustSite.SiteID,
       dbo.CustSite.IsEnabled,
       dbo.InspectionOrder.RequestedDT,
       dbo.InspectionOrder.CompletedDT,
       dbo.Customer.CustName,
       dbo.InspectionStatus.Caption,
       dbo.Site.[Address],
       dbo.InspectionOrder.InspectionStatusID,
       dbo.Site.PostcodeID,
       dbo.Postcode.Suburb,
       -- Human reable label for grid
       CASE dbo.CustSite.IsEnabled
           WHEN 1 THEN
               'ENABLED'
           ELSE
               'DISABLED'
       END AS LinkStatus,
       -- Field address is a Memo type. What's needed is a single line without line feeds and carriage returns.
       REPLACE(REPLACE([Address], CHAR(10), ''), CHAR(13), '') AS xAddress,
       dbo.InspectionOrder.CreatedOn,
       dbo.InspectionOrder.ServiceInterval
FROM dbo.InspectionOrder
    LEFT JOIN dbo.InspectionStatus
        ON dbo.InspectionOrder.InspectionStatusID = dbo.InspectionStatus.InspectionStatusID
    LEFT JOIN dbo.CustSite
        ON dbo.InspectionOrder.CustSiteID = dbo.CustSite.CustSiteID
    LEFT JOIN dbo.Site
        ON dbo.CustSite.SiteID = dbo.Site.SiteID
    LEFT JOIN dbo.Postcode
        ON dbo.Site.PostcodeID = dbo.Postcode.PostcodeID
    LEFT JOIN dbo.Customer
        ON dbo.CustSite.CustomerID = dbo.Customer.CustomerID
ORDER BY dbo.InspectionOrder.RequestedDT DESC;



