USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.EquipType ADD CONSTRAINT CoreGroup_EquipType
FOREIGN KEY (CoreGroupID)
REFERENCES dbo.CoreGroup (CoreGroupID)
go
