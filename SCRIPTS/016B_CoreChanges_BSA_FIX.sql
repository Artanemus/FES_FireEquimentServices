USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.CompanyInfo DROP CONSTRAINT Postcode_CompanyI35
go
ALTER TABLE dbo.CompanyInfo DROP CONSTRAINT Postcode_CompanyI32
go
ALTER TABLE dbo.CompanyInfo ADD CONSTRAINT Postcode_CompanyInfoPostal
FOREIGN KEY (PostalPostcodeID)
REFERENCES dbo.Postcode (PostcodeID)
go
ALTER TABLE dbo.CompanyInfo ADD CONSTRAINT Postcode_CompanyInfo
FOREIGN KEY (PostcodeID)
REFERENCES dbo.Postcode (PostcodeID)
go

-- Drop Constraint, Rename and Create Table SQL

DROP TABLE dbo.Global_08052021014356000
go
DROP TABLE dbo.Station_08052021014353000
go
DROP TABLE dbo.Test_08052021014354000
go
DROP TABLE dbo.Equipment_08052021014355000
go
