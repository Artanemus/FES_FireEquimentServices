
SELECT 
		 [InspectionOrderID]
		,[InspectionOrder].[CreatedOn]
		,[RequestedDT]
		,[InspectedOn]
		,[CompletedDT]
		,[ServiceInterval]
		,[LevelNum]
		,[InspectionOrder].[Note]
		,[NotePortable]
		,[NoteElectrical]
		,[NoteWaterBase]
		,[NoteStructual]
		,[InspectionOrder].[InspectionStatusID]
		,[HRID]
		,[CustSiteID]
		,[CustomerID]
		,[InspectionOrder].[SiteID]
        ,[Site].Address
        ,[InspectionStatus].Caption AS InspectStatusStr
FROM [dbo].[InspectionOrder] 
INNER JOIN [dbo].[Site] ON [InspectionOrder].SiteID =  Site.SiteID
INNER JOIN InspectionStatus ON [InspectionOrder].InspectionStatusID = InspectionStatus.InspectionStatusID;