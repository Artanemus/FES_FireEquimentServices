USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.EquipType ADD CONSTRAINT qfesGroup_EquipType
FOREIGN KEY (qfesGroupID)
REFERENCES dbo.qfesGroup (qfesGroupID)
go
