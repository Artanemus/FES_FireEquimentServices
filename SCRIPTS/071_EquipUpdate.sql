USE [IDFES]
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.Test DROP CONSTRAINT Equipment_Test
go
ALTER TABLE dbo.Station DROP CONSTRAINT Equipment_Station
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.Equipment.PK177','PK177_10032021014347001','INDEX'
go
EXEC sp_rename 'dbo.ChemicalType_Equipment','ChemicalTy_10032021014347002'
go
EXEC sp_rename 'dbo.EquipBrand_Equipment','EquipBrand_10032021014347003'
go
EXEC sp_rename 'dbo.EquipType_Equipment','EquipType__10032021014347004'
go
EXEC sp_rename 'dbo.LightLampType_Equipment','LightLampT_10032021014347005'
go
EXEC sp_rename 'dbo.LightType_Equipment','LightType__10032021014347006'
go
EXEC sp_rename 'dbo.LightFormFactor_Equipment','LightFormF_10032021014347007'
go
EXEC sp_rename 'dbo.HydrantType_Equipment','HydrantTyp_10032021014347008'
go
EXEC sp_rename 'dbo.DF__Equipment__IsArc__36470DEF', 'DF__Equipm_10032021014347009',OBJECT
go
EXEC sp_rename 'dbo.Equipment','Equipment_10032021014347000',OBJECT
go
CREATE TABLE dbo.Equipment
(
    EquipmentID       int           IDENTITY,
    Caption           nvarchar(64)  NULL,
    ShortCaption      nvarchar(50)  NULL,
    IsArchived        bit           CONSTRAINT DF__Equipment__IsArc__36470DEF DEFAULT ((0)) NULL,
    CreatedOn         datetime      NULL,
    NetWeight         float         NULL,
    GrossWeight       float         NULL,
    Litres            float         NULL,
    Height            float         NULL,
    Width             float         NULL,
    Length            float         NULL,
    Watt              float         NULL,
    EquipTypeID       int           NULL,
    ChemicalTypeID    int           NULL,
    EquipBrandID      int           NULL,
    LightTypeID       int           NULL,
    LightLampTypeID   int           NULL,
    LightFormFactorID int           NULL,
    HydrantTypeID     int           NULL
)
ON [PRIMARY]
go
EXEC sp_rename 'dbo.Station.PK154','PK154_10032021014348001','INDEX'
go
EXEC sp_rename 'dbo.CoreGroup_Station','CoreGroup__10032021014348003'
go
EXEC sp_rename 'dbo.Site_Station','Site_Stati_10032021014348004'
go
EXEC sp_rename 'dbo.DF__Station__IsEmpty__1DB06A4F', 'DF__Statio_10032021014348005',OBJECT
go
EXEC sp_rename 'dbo.Station','Station_10032021014348000',OBJECT
go
CREATE TABLE dbo.Station
(
    StationID       int            IDENTITY,
    StationNum      float          NULL,
    CircuitBoardNum int            NULL,
    Location        nvarchar(128)  NULL,
    Note            text           NULL,
    CreatedOn       datetime       NULL,
    LifeCycleSeed   datetime       NULL,
    IsEmpty         bit            CONSTRAINT DF__Station__IsEmpty__1DB06A4F DEFAULT ((0)) NULL,
    IsManaged       bit            NULL,
    SiteID          int            NULL,
    EquipmentID     int            NULL,
    CoreGroupID     int            NULL,
    PowerBoardID    int            NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_0', 'dbo.Station.IsManaged'
go
EXEC sp_rename 'dbo.Test.PK217','PK217_10032021014349001','INDEX'
go
EXEC sp_rename 'dbo.TestResult_TestA','TestResult_10032021014349003'
go
EXEC sp_rename 'dbo.TestResult_TestB','TestResult_10032021014349004'
go
EXEC sp_rename 'dbo.TestAction_Test','TestAction_10032021014349005'
go
EXEC sp_rename 'dbo.TestLifeCycle_Test','TestLifeCy_10032021014349006'
go
EXEC sp_rename 'dbo.InspectionOrder_Test','Inspection_10032021014349007'
go
EXEC sp_rename 'dbo.DF__Test__Passed__17AD7836', 'DF__Test___10032021014349008',OBJECT
go
EXEC sp_rename 'dbo.Test','Test_10032021014349000',OBJECT
go
CREATE TABLE dbo.Test
(
    TestID            int            IDENTITY,
    StationNum        float          NULL,
    Location          nvarchar(128)  NULL,
    Note              nvarchar(128)  NULL,
    Passed            bit            CONSTRAINT DF__Test__Passed__17AD7836 DEFAULT ((0)) NULL,
    IsManaged         bit            NULL,
    kPaStatic         int            NULL,
    kPaFlow           int            NULL,
    LitrePerSec       int            NULL,
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
CREATE TABLE dbo.PowerBoard
(
    PowerBoardID  int            IDENTITY,
    Caption       nvarchar(50)   NULL,
    PowerBoardNum float          NULL,
    Location      nvarchar(128)  NULL,
    Note          text           NULL,
    SiteID        int            NULL,
    CONSTRAINT PK275
    PRIMARY KEY CLUSTERED (PowerBoardID)
)
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.Equipment ON
go
INSERT INTO dbo.Equipment(
                          EquipmentID,
                          Caption,
                          ShortCaption,
                          IsArchived,
                          CreatedOn,
                          NetWeight,
                          GrossWeight,
                          Litres,
                          Height,
                          Width,
                          Length,
                          Watt,
                          EquipTypeID,
                          ChemicalTypeID,
                          EquipBrandID,
                          LightTypeID,
                          LightLampTypeID,
                          LightFormFactorID,
                          HydrantTypeID
                         )
                   SELECT 
                          EquipmentID,
                          Caption,
                          ShortCaption,
                          IsArchived,
                          CreatedOn,
                          NetWeight,
                          GrossWeight,
                          Litres,
                          Height,
                          Width,
                          NULL,
                          Watt,
                          EquipTypeID,
                          ChemicalTypeID,
                          EquipBrandID,
                          LightTypeID,
                          LightLampTypeID,
                          LightFormFactorID,
                          HydrantTypeID
                     FROM dbo.Equipment_10032021014347000 
go
SET IDENTITY_INSERT dbo.Equipment OFF
go
SET IDENTITY_INSERT dbo.Station ON
go
INSERT INTO dbo.Station(
                        StationID,
                        StationNum,
                        CircuitBoardNum,
                        Location,
                        Note,
                        CreatedOn,
                        LifeCycleSeed,
                        IsEmpty,
                        IsManaged,
                        SiteID,
                        EquipmentID,
                        CoreGroupID,
                        PowerBoardID
                       )
                 SELECT 
                        StationID,
                        StationNum,
                        NULL,
                        Location,
                        Note,
                        CreatedOn,
                        LifeCycleSeed,
                        IsEmpty,
                        IsManaged,
                        SiteID,
                        EquipmentID,
                        CoreGroupID,
                        NULL
                   FROM dbo.Station_10032021014348000 
go
SET IDENTITY_INSERT dbo.Station OFF
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
                     kPaStatic,
                     kPaFlow,
                     LitrePerSec,
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
                     IsManaged,
                     NULL,
                     NULL,
                     NULL,
                     EquipmentID,
                     TestLifeCycleID,
                     TestActionID,
                     InspectionOrderID,
                     ReferenceID,
                     TestA,
                     TestB
                FROM dbo.Test_10032021014349000 
go
SET IDENTITY_INSERT dbo.Test OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.Equipment ADD CONSTRAINT PK177
PRIMARY KEY CLUSTERED (EquipmentID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT PK154
PRIMARY KEY CLUSTERED (StationID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT PK217
PRIMARY KEY CLUSTERED (TestID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.Test ADD CONSTRAINT Equipment_Test
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT Equipment_Station
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
go
ALTER TABLE dbo.PowerBoard 
    ADD CONSTRAINT Site_PowerBoard
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightFormFactor_Equipment
FOREIGN KEY (LightFormFactorID)
REFERENCES dbo.LightFormFactor (LightFormFactorID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT HydrantType_Equipment
FOREIGN KEY (HydrantTypeID)
REFERENCES dbo.HydrantType (HydrantTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT ChemicalType_Equipment
FOREIGN KEY (ChemicalTypeID)
REFERENCES dbo.ChemicalType (ChemicalTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT EquipBrand_Equipment
FOREIGN KEY (EquipBrandID)
REFERENCES dbo.EquipBrand (EquipBrandID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT EquipType_Equipment
FOREIGN KEY (EquipTypeID)
REFERENCES dbo.EquipType (EquipTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightLampType_Equipment
FOREIGN KEY (LightLampTypeID)
REFERENCES dbo.LightLampType (LightLampTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightType_Equipment
FOREIGN KEY (LightTypeID)
REFERENCES dbo.LightType (LightTypeID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT CoreGroup_Station
FOREIGN KEY (CoreGroupID)
REFERENCES dbo.CoreGroup (CoreGroupID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT Site_Station
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT PowerBoard_Station
FOREIGN KEY (PowerBoardID)
REFERENCES dbo.PowerBoard (PowerBoardID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT InspectionOrder_Test
FOREIGN KEY (InspectionOrderID)
REFERENCES dbo.InspectionOrder (InspectionOrderID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestResult_Test
FOREIGN KEY (TestA)
REFERENCES dbo.TestResult (TestResultID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestResult_T36
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
