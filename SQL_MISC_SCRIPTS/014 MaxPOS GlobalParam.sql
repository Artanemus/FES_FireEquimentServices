USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.[Global] ADD MaxPOS int  NULL
go



UPDATE [dbo].[Global]
   SET [MaxPOS] = 5
GO

