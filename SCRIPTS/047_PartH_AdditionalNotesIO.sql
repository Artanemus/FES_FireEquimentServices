USE [IDFES]
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.Test DROP CONSTRAINT InspectionOrder_Test
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.InspectionOrder.PK197','PK197_09062021011323001','INDEX'
go
EXEC sp_rename 'dbo.CustSite_InspectionOrder','CustSite_I_09062021011323002'
go
EXEC sp_rename 'dbo.HR_InspectionOrder','HR_Inspect_09062021011323003'
go
EXEC sp_rename 'dbo.InspectionStatus_InspectionOrder','Inspection_09062021011323004'
go
EXEC sp_rename 'dbo.InspectionOrder','Inspection_09062021011323000',OBJECT
go
CREATE TABLE dbo.InspectionOrder
(
    InspectionOrderID  int            IDENTITY,
    CreatedOn          datetime       NULL,
    RequestedDT        datetime       NULL,
    InspectedOn        datetime       NULL,
    CompletedDT        datetime       NULL,
    ServiceInterval    float          NULL,
    LevelNum           int            NULL,
    Note               nvarchar(128)  NULL,
    NotePortable       nvarchar(128)  NULL,
    NoteElectrical     nvarchar(128)  NULL,
    NoteWaterBase      nvarchar(128)  NULL,
    NoteStructual      nvarchar(128)  NULL,
    InspectionStatusID int            NULL,
    HRID               int            NULL,
    CustSiteID         int            NULL,
    CustomerID         int            NULL,
    SiteID             int            NULL
)
ON [PRIMARY]
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.InspectionOrder ON
go
INSERT INTO dbo.InspectionOrder(
                                InspectionOrderID,
                                CreatedOn,
                                RequestedDT,
                                InspectedOn,
                                CompletedDT,
                                ServiceInterval,
                                LevelNum,
                                Note,
                                NotePortable,
                                NoteElectrical,
                                NoteWaterBase,
                                NoteStructual,
                                InspectionStatusID,
                                HRID,
                                CustSiteID,
                                CustomerID,
                                SiteID
                               )
                         SELECT 
                                InspectionOrderID,
                                CreatedOn,
                                RequestedDT,
                                InspectedOn,
                                CompletedDT,
                                ServiceInterval,
                                LevelNum,
                                Note,
                                NoteEquip,
                                NoteLight,
                                NULL,
                                NULL,
                                InspectionStatusID,
                                HRID,
                                CustSiteID,
                                CustomerID,
                                SiteID
                           FROM dbo.Inspection_09062021011323000 
go
SET IDENTITY_INSERT dbo.InspectionOrder OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT PK197
PRIMARY KEY CLUSTERED (InspectionOrderID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.Test ADD CONSTRAINT InspectionOrder_Test
FOREIGN KEY (InspectionOrderID)
REFERENCES dbo.InspectionOrder (InspectionOrderID)
go
ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT CustSite_InspectionOrder
FOREIGN KEY (CustSiteID,CustomerID,SiteID)
REFERENCES dbo.CustSite (CustSiteID,CustomerID,SiteID)
go
ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT HR_InspectionOrder
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT InspectionStatus_InspectionOrder
FOREIGN KEY (InspectionStatusID)
REFERENCES dbo.InspectionStatus (InspectionStatusID)
go
