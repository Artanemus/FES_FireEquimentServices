USE [IDFES]
GO

UPDATE [dbo].[Station]
   SET [IsManaged] = 0
   WHERE [IsManaged] IS NULL
GO

UPDATE [dbo].[Station]
   SET [IsEmpty] = 0
   WHERE [IsEmpty] IS NULL
GO

UPDATE [dbo].[Customer]
   SET [IsArchived] = 0
 WHERE [IsArchived] IS NULL
GO

UPDATE [dbo].[CustAddress]
   SET [IsArchived] = 0
 WHERE [IsArchived] IS NULL
GO


UPDATE [dbo].[CustSite]
   SET [IsArchived] = 0
 WHERE [IsArchived] IS NULL
GO

UPDATE [dbo].[CustSite]
   SET [IsEnabled] = 0
 WHERE [IsEnabled] IS NULL
GO


UPDATE [dbo].[CustContact]
   SET [IsArchived] = 0
 WHERE [IsArchived] IS NULL
GO


UPDATE [dbo].[CustContactNum]
   SET [IsArchived] = 0
 WHERE [IsArchived] IS NULL
GO

UPDATE [dbo].[CustEmail]
   SET [IsArchived] = 0
 WHERE  [IsArchived] IS NULL
GO



