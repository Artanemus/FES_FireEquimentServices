USE [IDFES]
go

CREATE TABLE dbo.LightFormFactor
(
    LightFormFactorID int           IDENTITY,
    Caption           nvarchar(50)  NULL,
    ShortCaption      nvarchar(50)  NULL,
    CONSTRAINT PK264
    PRIMARY KEY CLUSTERED (LightFormFactorID)
)
go


-- Standard Alter Table SQL

ALTER TABLE dbo.Equipment ADD LightFormFactorID int  NULL
go
ALTER TABLE dbo.LightLampType ADD ShortCaption nvarchar(50)  NULL
go
ALTER TABLE dbo.LightType ADD ShortCaption nvarchar(50)  NULL
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightFormFactor_Equipment
FOREIGN KEY (LightFormFactorID)
REFERENCES dbo.LightFormFactor (LightFormFactorID)
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.Equipment DROP CONSTRAINT EquipType_Equipment
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.EquipType.PK178','PK178_07152021055327001','INDEX'
go
EXEC sp_rename 'dbo.EquipType','EquipType_07152021055327000',OBJECT
go
CREATE TABLE dbo.EquipType
(
    EquipTypeID    int           IDENTITY,
    Caption        nvarchar(50)  NULL,
    ShortCaption   nvarchar(50)  NULL,
    MinorInterval  float         NULL,
    MajorInterval  float         NULL,
    EnableRules    bit           NULL,
    RuleMinorLevel int           NULL,
    RuleMajorLevel int           NULL
)
ON [PRIMARY]
go
DROP TABLE dbo.Equipment_07072021052935000
go
DROP TABLE dbo.Station_07072021052936000
go
-- Insert Data SQL

SET IDENTITY_INSERT dbo.EquipType ON
go
INSERT INTO dbo.EquipType(
                          EquipTypeID,
                          Caption,
                          ShortCaption,
                          MinorInterval,
                          MajorInterval,
                          EnableRules,
                          RuleMinorLevel,
                          RuleMajorLevel
                         )
                   SELECT 
                          EquipTypeID,
                          Caption,
                          NULL,
                          MinorInterval,
                          MajorInterval,
                          EnableRules,
                          RuleMinorLevel,
                          RuleMajorLevel
                     FROM dbo.EquipType_07152021055327000 
go
SET IDENTITY_INSERT dbo.EquipType OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.EquipType ADD CONSTRAINT PK178
PRIMARY KEY CLUSTERED (EquipTypeID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.Equipment ADD CONSTRAINT EquipType_Equipment
FOREIGN KEY (EquipTypeID)
REFERENCES dbo.EquipType (EquipTypeID)
go
