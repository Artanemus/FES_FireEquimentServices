USE [IDFES]
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.Test DROP CONSTRAINT InspectionOrder_Test
go
ALTER TABLE dbo.CustSite DROP CONSTRAINT Site_CustSite
go
ALTER TABLE dbo.Station DROP CONSTRAINT Site_Station
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.InspectionOrder.PK197','PK197_09072021052646001','INDEX'
go
EXEC sp_rename 'dbo.CustSite_InspectionOrder','CustSite_I_09072021052646002'
go
EXEC sp_rename 'dbo.HR_InspectionOrder','HR_Inspect_09072021052646003'
go
EXEC sp_rename 'dbo.InspectionStatus_InspectionOrder','Inspection_09072021052646004'
go
EXEC sp_rename 'dbo.InspectionOrder','Inspection_09072021052646000',OBJECT
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
EXEC sp_rename 'dbo.Site.PK163','PK163_09072021052647001','INDEX'
go
EXEC sp_rename 'dbo.Postcode_Site','Postcode_S_09072021052647002'
go
EXEC sp_rename 'dbo.DF__Site__IsArchived__546180BB', 'DF__Site___09072021052647003',OBJECT
go
EXEC sp_rename 'dbo.Site','Site_09072021052647000',OBJECT
go
CREATE TABLE dbo.Site
(
    SiteID     int             IDENTITY,
    Note       nvarchar(1024)  NULL,
    Address    nvarchar(256)   NULL,
    CreatedOn  datetime        NULL,
    IsArchived bit             CONSTRAINT DF__Site__IsArchived__546180BB DEFAULT ((0)) NULL,
    PostcodeID int             NULL
)
ON [PRIMARY]
go
EXEC sp_rename 'dbo.Test.PK217','PK217_09072021052648001','INDEX'
go
EXEC sp_rename 'dbo.Station_Test','Station_Te_09072021052648003'
go
EXEC sp_rename 'dbo.TestAction_Test','TestAction_09072021052648004'
go
EXEC sp_rename 'dbo.TestLifeCycle_Test','TestLifeCy_09072021052648005'
go
EXEC sp_rename 'dbo.Equipment_Test','Equipment__09072021052648006'
go
EXEC sp_rename 'dbo.TestResult_TestA','TestResult_09072021052648007'
go
EXEC sp_rename 'dbo.TestResult_TestB','TestResult_09072021052648008'
go
EXEC sp_rename 'dbo.DF__Test__Passed__17AD7836', 'DF__Test___09072021052648009',OBJECT
go
EXEC sp_rename 'dbo.Test','Test_09072021052648000',OBJECT
go
CREATE TABLE dbo.Test
(
    TestID            int            IDENTITY,
    StationNum        float          NULL,
    Location          nvarchar(128)  NULL,
    Note              nvarchar(128)  NULL,
    Passed            bit            CONSTRAINT DF__Test__Passed__17AD7836 DEFAULT ((0)) NULL,
    IsManaged         bit            NULL,
    EquipmentID       int            NULL,
    TestLifeCycleID   int            NULL,
    TestActionID      int            NULL,
    InspectionOrderID int            NULL,
    ReferenceID       int            NULL,
    TestA             int            NULL,
    TestB             int            NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_0', 'dbo.Test.IsManaged'
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
                           FROM dbo.Inspection_09072021052646000 
go
SET IDENTITY_INSERT dbo.InspectionOrder OFF
go
SET IDENTITY_INSERT dbo.Site ON
go
INSERT INTO dbo.Site(
                     SiteID,
                     Note,
                     Address,
                     CreatedOn,
                     IsArchived,
                     PostcodeID
                    )
              SELECT 
                     SiteID,
                     CONVERT(nvarchar(1024),Note),
                     Address,
                     CreatedOn,
                     IsArchived,
                     PostcodeID
                FROM dbo.Site_09072021052647000 
go
SET IDENTITY_INSERT dbo.Site OFF
go
SET IDENTITY_INSERT dbo.Test ON
go
INSERT INTO dbo.Test(
                     TestID,
                     StationNum,
                     Location,
                     Note,
                     Passed,
                     IsManaged,
                     EquipmentID,
                     TestLifeCycleID,
                     TestActionID,
                     InspectionOrderID,
                     ReferenceID,
                     TestA,
                     TestB
                    )
              SELECT 
                     TestID,
                     StationNum,
                     Location,
                     Note,
                     Passed,
                     NULL,
                     EquipmentID,
                     TestLifeCycleID,
                     TestActionID,
                     InspectionOrderID,
                     NULL,
                     TestA,
                     TestB
                FROM dbo.Test_09072021052648000 
go
SET IDENTITY_INSERT dbo.Test OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT PK197
PRIMARY KEY CLUSTERED (InspectionOrderID)
go
ALTER TABLE dbo.Site ADD CONSTRAINT PK163
PRIMARY KEY CLUSTERED (SiteID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT PK217
PRIMARY KEY CLUSTERED (TestID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.Test ADD CONSTRAINT InspectionOrder_Test
FOREIGN KEY (InspectionOrderID)
REFERENCES dbo.InspectionOrder (InspectionOrderID)
go
ALTER TABLE dbo.CustSite ADD CONSTRAINT Site_CustSite
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT Site_Station
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
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
ALTER TABLE dbo.Site ADD CONSTRAINT Postcode_Site
FOREIGN KEY (PostcodeID)
REFERENCES dbo.Postcode (PostcodeID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT Equipment_Test
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestResult_TestA
FOREIGN KEY (TestA)
REFERENCES dbo.TestResult (TestResultID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestResult_TestB
FOREIGN KEY (TestB)
REFERENCES dbo.TestResult (TestResultID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestAction_Test
FOREIGN KEY (TestActionID)
REFERENCES dbo.TestAction (TestActionID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestLifeCycle_Test
FOREIGN KEY (TestLifeCycleID)
REFERENCES dbo.TestLifeCycle (TestLifeCycleID)
go
