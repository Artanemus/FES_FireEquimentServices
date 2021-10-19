/*
   Thursday, 14 October 202112:42:13 PM
   User: 
   Server: DESKTOP-PNP1I3O
   Database: IDFES
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Station
	DROP CONSTRAINT Site_Station
GO
ALTER TABLE dbo.Site SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Site', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Site', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Site', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Station
	DROP CONSTRAINT CoreGroup_Station
GO
ALTER TABLE dbo.CoreGroup SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.CoreGroup', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CoreGroup', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CoreGroup', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Station
	DROP CONSTRAINT Equipment_Station
GO
ALTER TABLE dbo.Equipment SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Station
	DROP CONSTRAINT DF__Station__IsEmpty__1DB06A4F
GO
CREATE TABLE dbo.Tmp_Station
	(
	StationID int NOT NULL IDENTITY (1, 1),
	StationNum float(53) NULL,
	CircuitBreakerNum float(53) NULL,
	Location nvarchar(128) NULL,
	Note text NULL,
	CreatedOn datetime NULL,
	LifeCycleSeed datetime NULL,
	IsEmpty bit NULL,
	IsManaged bit NULL,
	SiteID int NULL,
	EquipmentID int NULL,
	CoreGroupID int NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Station SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_Station ADD CONSTRAINT
	DF__Station__IsEmpty__1DB06A4F DEFAULT ((0)) FOR IsEmpty
GO
EXECUTE sp_bindefault N'dbo.BIT_0', N'dbo.Tmp_Station.IsManaged'
GO
SET IDENTITY_INSERT dbo.Tmp_Station ON
GO
IF EXISTS(SELECT * FROM dbo.Station)
	 EXEC('INSERT INTO dbo.Tmp_Station (StationID, StationNum, CircuitBreakerNum, Location, Note, CreatedOn, LifeCycleSeed, IsEmpty, IsManaged, SiteID, EquipmentID, CoreGroupID)
		SELECT StationID, StationNum, CONVERT(float(53), CircuitBreakerNum), Location, Note, CreatedOn, LifeCycleSeed, IsEmpty, IsManaged, SiteID, EquipmentID, CoreGroupID FROM dbo.Station WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Station OFF
GO
DROP TABLE dbo.Station
GO
EXECUTE sp_rename N'dbo.Tmp_Station', N'Station', 'OBJECT' 
GO
ALTER TABLE dbo.Station ADD CONSTRAINT
	PK154 PRIMARY KEY CLUSTERED 
	(
	StationID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Station ADD CONSTRAINT
	Equipment_Station FOREIGN KEY
	(
	EquipmentID
	) REFERENCES dbo.Equipment
	(
	EquipmentID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Station ADD CONSTRAINT
	CoreGroup_Station FOREIGN KEY
	(
	CoreGroupID
	) REFERENCES dbo.CoreGroup
	(
	CoreGroupID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Station ADD CONSTRAINT
	Site_Station FOREIGN KEY
	(
	SiteID
	) REFERENCES dbo.Site
	(
	SiteID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Station', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Station', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Station', 'Object', 'CONTROL') as Contr_Per 