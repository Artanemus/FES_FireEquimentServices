USE [IDFES]
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.Test DROP CONSTRAINT InspectionOrderTest
go
ALTER TABLE dbo.InspectTime DROP CONSTRAINT InspectionOrderInspectTime
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.InspectionOrder.PK_InspectionOrder','PK_Inspect_04142024045153001','INDEX'
go
EXEC sp_rename 'dbo.CustSiteInspectionOrder','CustSiteIn_04142024045153002'
go
EXEC sp_rename 'dbo.HRInspectionOrder','HRInspecti_04142024045153003'
go
EXEC sp_rename 'dbo.InspectionStatusInspectionOrder','Inspection_04142024045153004'
go
EXEC sp_rename 'dbo.DF__Inspectio__IsPin__5F9E293D', 'DF__Inspec_04142024045153005',OBJECT
go
EXEC sp_rename 'dbo.DF__Inspectio__IsEna__5EAA0504', 'DF__Inspec_04142024045153006',OBJECT
go
EXEC sp_rename 'dbo.InspectionOrder','Inspection_04142024045153000',OBJECT
go
CREATE TABLE dbo.InspectionOrder
(
    InspectionOrderID  int            IDENTITY,
    Caption            nvarchar(64)   NULL,
    CreatedOn          datetime       NULL,
    BookIN             datetime       NULL,
    BookOUT            datetime       NULL,
    ServiceInterval    float          NULL,
    LevelNum           int            NULL,
    Note               nvarchar(128)  NULL,
    NotePortable       nvarchar(128)  NULL,
    NoteElectrical     nvarchar(128)  NULL,
    NoteWaterBase      nvarchar(128)  NULL,
    NoteStructual      nvarchar(128)  NULL,
    InspectionStatusID int            NULL,
    HRID               int            NULL,
    IsArchived         bit             NOT NULL,
    CustSiteID         int            NULL,
    IsEnabled          bit            CONSTRAINT DF__Inspectio__IsEna__5EAA0504 DEFAULT ((0))  NOT NULL,
    CustomerID         int            NULL,
    IsPinned           bit            CONSTRAINT DF__Inspectio__IsPin__5F9E293D DEFAULT ((0))  NOT NULL,
    SiteID             int            NULL,
    ModifiedOn         datetime       NULL,
    ModifiedBy         int            NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_0', 'dbo.InspectionOrder.IsArchived'
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.InspectionOrder ON
go
INSERT INTO dbo.InspectionOrder(
                                InspectionOrderID,
                                Caption,
                                CreatedOn,
                                BookIN,
                                BookOUT,
                                ServiceInterval,
                                LevelNum,
                                Note,
                                NotePortable,
                                NoteElectrical,
                                NoteWaterBase,
                                NoteStructual,
                                InspectionStatusID,
                                HRID,
                                IsArchived,
                                CustSiteID,
                                IsEnabled,
                                CustomerID,
                                IsPinned,
                                SiteID,
                                ModifiedOn,
                                ModifiedBy
                               )
                         SELECT 
                                InspectionOrderID,
                                NULL,
                                CreatedOn,
                                BookIN,
                                BookOUT,
                                ServiceInterval,
                                LevelNum,
                                Note,
                                NotePortable,
                                NoteElectrical,
                                NoteWaterBase,
                                NoteStructual,
                                InspectionStatusID,
                                HRID,
                                IsArchived,
                                CustSiteID,
                                IsEnabled,
                                CustomerID,
                                IsPinned,
                                SiteID,
                                ModifiedOn,
                                ModifiedBy
                           FROM dbo.Inspection_04142024045153000 
go
SET IDENTITY_INSERT dbo.InspectionOrder OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT PK_InspectionOrder
PRIMARY KEY CLUSTERED (InspectionOrderID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.Test ADD CONSTRAINT InspectionOrderTest
FOREIGN KEY (InspectionOrderID)
REFERENCES dbo.InspectionOrder (InspectionOrderID)
go
ALTER TABLE dbo.InspectTime ADD CONSTRAINT InspectionOrderInspectTime
FOREIGN KEY (TechnicianID)
REFERENCES dbo.InspectionOrder (InspectionOrderID)
go
ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT CustSiteInspectionOrder
FOREIGN KEY (CustSiteID,CustomerID,SiteID)
REFERENCES dbo.CustSite (CustSiteID,CustomerID,SiteID)
go
ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT HRInspectionOrder
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT InspectionStatusInspectionOrder
FOREIGN KEY (InspectionStatusID)
REFERENCES dbo.InspectionStatus (InspectionStatusID)
go
