USE IDFES;

DECLARE @NewLine AS CHAR(2);
SET @NewLine = CHAR(13) + CHAR(10);
SELECT CONCAT(   InspectionOrderID
               , CASE
                     WHEN [CUSTOMER].CustCode IS NULL THEN
                         ''
                     ELSE
                         CONCAT(' ', [CUSTOMER].CustCode)
                 END
               , ' '
               , [InspectionStatus].Caption
             )
     , CONCAT(
                 [CUSTOMER].[CustName]
               , @NewLine
               , dbo.GetSiteAddrMultiLine([Site].SiteID)
               , @NewLine
               , CASE
                     WHEN InspectionOrder.HRID IS NULL THEN
                         ''
                     ELSE
                         CONCAT('TECH:', [HR].FirstName, ' ', UPPER(HR.Lastname))
                 END
             )
FROM [IDFES].[dbo].[InspectionOrder]
    INNER JOIN [CUSTOMER]
        ON [InspectionOrder].Customerid = [customer].[customerid]
    INNER JOIN [SITE]
        ON [InspectionOrder].Siteid = [SITE].[Siteid]
    LEFT JOIN [InspectionStatus]
        ON [InspectionOrder].InspectionStatusID = [InspectionStatus].InspectionStatusID
    LEFT JOIN [HR]
        ON [InspectionOrder].[HRID] = [HR].[HRID]
WHERE [InspectionOrder].Caption IS NULL