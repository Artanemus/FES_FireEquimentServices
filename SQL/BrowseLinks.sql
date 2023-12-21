USE IDFES
;

SELECT 
		 [CustSiteID]
		,[CustSite].[CustomerID]
		,[CustSite].[SiteID]
		,[CustSite].[CreatedOn]
		,[CustSite].[IsArchived]
		,[IsEnabled]
		,[SiteContactID]
		,[CustSite].[Note] AS CustSiteNotes
		,[SeedDate]
		,[SeedLevel]
		,[DoReseed]
        ,[Customer].[CustName]
        ,[Customer].[CustCode]
        ,[Customer].Note AS CustNotes
        ,[Site].[Address]
        ,[Site].Note AS SiteNotes
FROM [IDFES].[dbo].[CustSite] 
INNER JOIN [Customer] ON CustSite.CustomerID = [Customer].CustomerID
INNER JOIN [Site] ON CustSite.SiteID = [Site].SiteID
ORDER BY [CustSite].[CreatedOn] DESC;