/*
   Wednesday, 1 September 202112:13:52 PM
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
ALTER TABLE dbo.Site
	DROP CONSTRAINT Postcode_Site
GO
ALTER TABLE dbo.Postcode SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Postcode', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Postcode', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Postcode', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Site
	DROP CONSTRAINT DF__Site__IsArchived__546180BB
GO
CREATE TABLE dbo.Tmp_Site
	(
	SiteID int NOT NULL IDENTITY (1, 1),
	Note nvarchar(1024) NULL,
	Address nvarchar(256) NULL,
	CreatedOn datetime NULL,
	IsArchived bit NULL,
	PostcodeID int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Site SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_Site ADD CONSTRAINT
	DF__Site__IsArchived__546180BB DEFAULT ((0)) FOR IsArchived
GO
SET IDENTITY_INSERT dbo.Tmp_Site ON
GO
IF EXISTS(SELECT * FROM dbo.Site)
	 EXEC('INSERT INTO dbo.Tmp_Site (SiteID, Note, Address, CreatedOn, IsArchived, PostcodeID)
		SELECT SiteID, CONVERT(nvarchar(1024), Note), Address, CreatedOn, IsArchived, PostcodeID FROM dbo.Site WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Site OFF
GO
ALTER TABLE dbo.Station
	DROP CONSTRAINT Site_Station
GO
ALTER TABLE dbo.CustSite
	DROP CONSTRAINT Site_CustSite
GO
DROP TABLE dbo.Site
GO
EXECUTE sp_rename N'dbo.Tmp_Site', N'Site', 'OBJECT' 
GO
ALTER TABLE dbo.Site ADD CONSTRAINT
	PK163 PRIMARY KEY CLUSTERED 
	(
	SiteID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Site ADD CONSTRAINT
	Postcode_Site FOREIGN KEY
	(
	PostcodeID
	) REFERENCES dbo.Postcode
	(
	PostcodeID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Site', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Site', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Site', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.CustSite ADD CONSTRAINT
	Site_CustSite FOREIGN KEY
	(
	SiteID
	) REFERENCES dbo.Site
	(
	SiteID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.CustSite SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.CustSite', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CustSite', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CustSite', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
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
ALTER TABLE dbo.Station SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Station', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Station', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Station', 'Object', 'CONTROL') as Contr_Per 