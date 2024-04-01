SELECT [InspectionOrderID]
     , [CustSiteID]
     , [CustomerID]
     --, [InspectionOrder].[CreatedOn]
     --, [InspectionOrder].[RequestedDT]
     --, [InspectionOrder].[InspectedOn]
     --, [InspectionOrder].[CompletedDT]
     , CONCAT('REQU:', CONVERT(DATE, [RequestedDT], 102)) AS RequestedDT
     , CONCAT('INSP:', CONVERT(DATE, [InspectedOn], 102)) AS InspectedOn
     , CONCAT('COMP:', CONVERT(DATE, [CompletedDT], 102)) AS CompletedDT
     , [ServiceInterval]
     , [LevelNum]
     --,[InspectionOrder].[Note]
     --,[NotePortable]
     --,[NoteElectrical]
     --,[NoteWaterBase]
     --,[NoteStructual]
     , [InspectionOrder].[InspectionStatusID]
     , [InspectionOrder].[HRID]
     , CONCAT('TECH:', firstname, ' ', UPPER(lastname)) AS FNAME
     , [InspectionOrder].[SiteID]
     , dbo.GetSiteAddrSingleLine([InspectionOrder].[SiteID], 1) AS SiteAddrStr
     , [InspectionStatus].Caption AS InspectStatusStr
FROM [dbo].[InspectionOrder]
    INNER JOIN [dbo].[Site]
        ON [InspectionOrder].SiteID = Site.SiteID
    LEFT JOIN InspectionStatus
        ON [InspectionOrder].InspectionStatusID = InspectionStatus.InspectionStatusID
    LEFT JOIN HR
        ON InspectionOrder.HRID = HR.HRID;