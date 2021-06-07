USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.[Global] DROP CONSTRAINT DF__Global__DoOffset__2CDD9F46
go
ALTER TABLE dbo.[Global] DROP COLUMN DoRelative
go
ALTER TABLE dbo.Site DROP COLUMN SeedDate,SeedLevel
go
