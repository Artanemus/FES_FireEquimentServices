-- Drop a temporary table called '#tmpTechs'
-- Drop the table if it already exists
IF OBJECT_ID('tempDB..#tmpTechs', 'U') IS NOT NULL
    DROP TABLE #tmpTechs
GO
-- Create the temporary table from a physical table called 'InspectTime' in schema 'dbo' in database 'IDFES'
SELECT [InspectTime].[InspectionOrderID]
     , STRING_AGG(CONCAT(HR.FirstName, ' ', UPPER(HR.LastName)), ', ') AS TechsStr
INTO #tmpTechs
FROM [IDFES].[dbo].[InspectTime]
    INNER JOIN [HR]
        ON [InspectTime].[HRID] = [HR].[HRID]
GROUP BY [InspectTime].[InspectionOrderID];

/*
Please note that the STRING_AGG() function is available starting with SQL Server 20171.
For versions prior to SQL Server 2017, you can use the FOR XML PATH method to achieve 
a similar result. Here’s an example:

SELECT STUFF(
         (SELECT ', ' + Name 
          FROM YourTable
          FOR XML PATH('')), 1, 2, '') AS Names

*/


DECLARE @NewLine AS CHAR(2);
SET @NewLine = CHAR(13) + CHAR(10);
UPDATE [IDFES].[dbo].[InspectionOrder]
SET [InspectionOrder].[TMSCaption] = CONCAT(   [InspectionOrder].InspectionOrderID
                                             , ' '
                                             , [InspectionStatus].Caption
                                             , CASE
                                                   WHEN [CUSTOMER].CustCode IS NULL THEN
                                                       ''
                                                   ELSE
                                                       CONCAT(' ', [CUSTOMER].CustCode)
                                               END
                                           )
  , [InspectionOrder].[TMSNotes] = CONCAT(
                                             [CUSTOMER].[CustName]
                                           , @NewLine
                                           , @NewLine
                                           , dbo.GetSiteAddrMultiLine([Site].SiteID)
                                           , @NewLine
                                           , @NewLine
                                           , CONCAT('TECHS:', #tmpTechs.TechsStr)
                                         )
FROM [IDFES].[dbo].[InspectionOrder]
    INNER JOIN #tmpTechs
        ON [InspectionOrder].[InspectionOrderID] = #tmpTechs.[InspectionOrderID]
    INNER JOIN [CUSTOMER]
        ON [InspectionOrder].Customerid = [customer].[customerid]
    INNER JOIN [SITE]
        ON [InspectionOrder].Siteid = [SITE].[Siteid]
    LEFT JOIN [InspectionStatus]
        ON [InspectionOrder].InspectionStatusID = [InspectionStatus].InspectionStatusID




