SELECT [SurveyOrderID]
     , [SurveyOrder].[CreatedOn]
     --,[RequestedDT]
     --,[SurveyedOn]
     --,[CompletedDT]
     , CONCAT('REQU:', CONVERT(DATE, [RequestedDT], 102)) AS RequestedDTstr
     , CONCAT('INSP:', CONVERT(DATE, [SurveyedOn], 102)) AS SurveyedOnstr
     , CONCAT('COMP:', CONVERT(DATE, [CompletedDT], 102)) AS CompletedDTstr
     , [SurveyOrder].[IsArchived]
     , [SurveyStatusID]
     , [SurveyOrder].[HRID]
     , [CustSiteID]
     , [CustomerID]
     , [SurveyOrder].[SiteID]
     , [Site].[Address]
     , CONCAT('TECH:', firstname, ' ', UPPER(lastname)) AS FNAME
     , dbo.GetSiteAddrSingleLine([SurveyOrder].[SiteID], 1) AS SiteAddrStr

FROM [dbo].[SurveyOrder]
    INNER JOIN [dbo].[Site]
        ON [SurveyOrder].SiteID = Site.SiteID
    LEFT JOIN HR
        ON SurveyOrder.HRID = HR.HRID;