USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.EquipType DROP CONSTRAINT qfesGroup_EquipType
go
ALTER TABLE dbo.EquipType DROP COLUMN qfesGroupID
go


-- Drop Constraint, Rename and Create Table SQL
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[qfesGroup]') AND type in (N'U'))
DROP TABLE [dbo].[qfesGroup]
GO


CREATE TABLE dbo.CoreGroup
(
    CoreGroupID int           IDENTITY,
    Caption     nvarchar(50)  NULL,
    CONSTRAINT PK268
    PRIMARY KEY CLUSTERED (CoreGroupID)
)
go

ALTER TABLE dbo.EquipType ADD CoreGroupID int  NULL
go
ALTER TABLE dbo.EquipType ADD CONSTRAINT CoreGroup_EquipType
FOREIGN KEY (CoreGroupID)
REFERENCES dbo.CoreGroup (CoreGroupID)
go
