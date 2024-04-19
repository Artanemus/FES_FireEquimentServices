SELECT 
		 [CustSite].[CustSiteID]
		,[CustSite].[CustomerID]
		,[CustSite].[SiteID]
		,[CustSite].[CreatedOn]
		,[CustSite].[ModifiedOn]
		,[CustSite].[IsArchived]
		,[CustSite].[ModifiedBy]
		,[CustSite].[IsEnabled]
		,[CustSite].[SiteContactID]
		,[CustSite].[Note]
		,[CustSite].[SeedDate]
		,[CustSite].[SeedLevel]
		,[CustSite].[DoReseed]
        ,[InspectionOrder].[InspectionOrderID]
FROM [IDFES].[dbo].[CustSite] 
    INNER JOIN [InspectionOrder]
        ON [CustSite].[SiteID] = [InspectionOrder].[SiteID]
           AND [CustSite].[CustomerID] = [InspectionOrder].[CustomerID]