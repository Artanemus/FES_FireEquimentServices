USE [IDFES]
go

-- Drop Constraint, Rename and Create Table SQL

CREATE TABLE dbo.LightFormFactor
(
    LightFormFactorID int           IDENTITY,
    Caption           nvarchar(50)  NULL,
    CONSTRAINT PK264
    PRIMARY KEY CLUSTERED (LightFormFactorID)
)
go

-- Standard Alter Table SQL

ALTER TABLE dbo.Equipment ADD LightFormFactorID int  NULL
go
ALTER TABLE dbo.Equipment ADD FOREIGN KEY (LightFormFactorID)
REFERENCES dbo.LightFormFactor (LightFormFactorID)
go


