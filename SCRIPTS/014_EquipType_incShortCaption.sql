USE [IDFES]
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.Equipment DROP CONSTRAINT EquipType_Equipment
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.EquipType.PK178','PK178_07132021050333001','INDEX'
go
EXEC sp_rename 'dbo.EquipType','EquipType_07132021050333000',OBJECT
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
                     FROM dbo.EquipType_07132021050333000 
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
