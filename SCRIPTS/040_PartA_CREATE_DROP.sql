USE [IDFES]
go

-- Drop Constraint, Rename and Create Table SQL

ALTER TABLE dbo.Equipment DROP CONSTRAINT StationType_Equipment
go
ALTER TABLE dbo.Station DROP CONSTRAINT StationType_Station
go
ALTER TABLE dbo.[Global] DROP CONSTRAINT Unit_Global
go
DROP TABLE dbo.StationType
go
DROP TABLE dbo.Unit
go
CREATE TABLE dbo.TestResult
(
    TestResultID int           IDENTITY,
    Caption      nvarchar(50)  NULL,
    ShortCaption nvarchar(50)  NULL,
    CONSTRAINT PK267
    PRIMARY KEY CLUSTERED (TestResultID)
)
go
CREATE TABLE dbo.CoreGroup
(
    CoreGroupID int           IDENTITY,
    Caption     nvarchar(50)  NULL,
    CONSTRAINT PK268
    PRIMARY KEY CLUSTERED (CoreGroupID)
)
go
CREATE TABLE dbo.HydrantType
(
    HydrantTypeID int           IDENTITY,
    Caption       nvarchar(50)  NULL,
    ShortCaption  nvarchar(50)  NULL,
    CONSTRAINT PK266
    PRIMARY KEY CLUSTERED (HydrantTypeID)
)
go
