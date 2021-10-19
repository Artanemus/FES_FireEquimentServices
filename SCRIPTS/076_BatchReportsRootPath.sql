USE [IDFES]
go

-- Standard Alter Table SQL

EXEC sp_rename 'dbo.Global.TechInspectOrderRootPath', 'RootPathBatchReports','COLUMN'
go
