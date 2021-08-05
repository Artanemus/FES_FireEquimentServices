USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.Equipment ADD LightFormFactorID int  NULL
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightFormFactor_Equipment
FOREIGN KEY (LightFormFactorID)
REFERENCES dbo.LightFormFactor (LightFormFactorID)
go
