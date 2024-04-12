-- Planner Item
DECLARE @MAXCUSTNAME AS INT;
SET @MAXCUSTNAME = 32;

SELECT [InspectionOrderID]       -- AS CreateKey
     , [InspectionOrder].[CreatedOn]
     , [BookIN] AS StartTime
     , CASE
           WHEN [BookOUT] IS NULL
                OR ([BookOUT] < [BookIN]) THEN
               DATEADD(hour, 4, [BookIN] + 4)
           ELSE
               [BookIN]
       END AS EndTime
     , [ServiceInterval]
     , [LevelNum]
     , [InspectionOrder].[Note] AS Notes
     , [NotePortable]
     , [NoteElectrical]
     , [NoteWaterBase]
     , [NoteStructual]
     , [InspectionStatusID]
     , [HRID]
     , [InspectionOrder].[IsArchived]
     , [CustSiteID]
     , [IsEnabled]
     , [InspectionOrder].[CustomerID]
     , CONCAT(   [Customer].[CustCode]
               , ' - '
               , CASE
                     WHEN (LEN([Customer].[CustName]) > @MAXCUSTNAME) THEN
                         CONCAT(LEFT([Customer].[CustName], @MAXCUSTNAME), '...')
                     ELSE
                         [Customer].[CustName]
                 END
             ) AS [Subject]
     , CASE
           WHEN [Customer].[CustCode] IS NULL THEN
               CASE
                   WHEN (LEN([Customer].[CustName]) > @MAXCUSTNAME) THEN
                       CONCAT(LEFT([Customer].[CustName], @MAXCUSTNAME), '...')
                   ELSE
                       [Customer].[CustName]
               END
           ELSE
               [Customer].[CustCode]
       END AS [Recurrency]
     , [BookIN] AS MinTimeField  -- optional usedBy Recurrency
     , [BookOUT] AS MaxTimeField -- optional usedBy Recurrency
     , [IsPinned]
     , [SiteID]
     , [InspectionOrder].[ModifiedOn]
     , [InspectionOrder].[ModifiedBy]
FROM [IDFES].[dbo].[InspectionOrder]
    LEFT JOIN [Customer]
        ON [InspectionOrder].[CustomerID] = [Customer].[CustomerID]