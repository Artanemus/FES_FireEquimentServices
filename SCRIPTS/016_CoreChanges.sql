USE [IDFES]
go


-- BSA FIX ... NEW TABLES MUST PRECEED FK ASSIGNMENT
CREATE TABLE dbo.qfesGroup
(
    qfesGroupID int           IDENTITY,
    Caption     nvarchar(50)  NULL,
    CONSTRAINT PK268
    PRIMARY KEY CLUSTERED (qfesGroupID)
)
go

CREATE TABLE dbo.TestResult
(
    TestResultID int            NOT NULL,
    Caption      nvarchar(50)  NULL,
    ShortCaption nvarchar(50)  NULL,
    CONSTRAINT PK267
    PRIMARY KEY CLUSTERED (TestResultID)
)
go



-- Standard Alter Table SQL

ALTER TABLE dbo.StationType ADD LongCaption nvarchar(128)  NULL
go


-- BSA FIX ... ERROR
-- EXEC sp_rename 'dbo.Postcode_CompanyI35','Postcode_CompanyInfo'
-- go
-- EXEC sp_rename 'dbo.Postcode_CompanyInfo','Postcode_CompanyI32'
-- go

-- CHECK AND FIX - break-out to seperate SQL
-- ALTER TABLE dbo.CompanyInfo DROP CONSTRAINT Postcode_CompanyI35
-- go
-- ALTER TABLE dbo.CompanyInfo DROP CONSTRAINT Postcode_CompanyInfo
-- go
-- ALTER TABLE dbo.CompanyInfo ADD CONSTRAINT Postcode_CompanyInfoPostal
-- FOREIGN KEY (PostalPostcodeID)
-- REFERENCES dbo.Postcode (PostcodeID)
-- go
-- ALTER TABLE dbo.CompanyInfo ADD CONSTRAINT Postcode_CompanyInfo
-- FOREIGN KEY (PostcodeID)
-- REFERENCES dbo.Postcode (PostcodeID)
-- go



ALTER TABLE dbo.EquipType DROP COLUMN EnableRules,RuleMinorLevel,RuleMajorLevel
go
EXEC sp_rename 'dbo.EquipType.MinorInterval', 'MinorLifeCycle','COLUMN'
go
EXEC sp_rename 'dbo.EquipType.MajorInterval', 'MajorLifeCycle','COLUMN'
go
ALTER TABLE dbo.EquipType ADD NumOfLevels int  NULL
go
ALTER TABLE dbo.EquipType ADD ServiceInterval float  NULL
go
ALTER TABLE dbo.EquipType ADD qfesGroupID int  NULL
go
ALTER TABLE dbo.EquipType ADD CONSTRAINT qfesGroup_EquipType
FOREIGN KEY (qfesGroupID)
REFERENCES dbo.qfesGroup (qfesGroupID)
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.Test DROP CONSTRAINT Station_Test
go
ALTER TABLE dbo.Station DROP CONSTRAINT Equipment_Station
go
ALTER TABLE dbo.CompanyInfo DROP CONSTRAINT Global_CompanyInfo
go

-- Drop Constraint, Rename and Create Table SQL

ALTER TABLE dbo.[Global] DROP CONSTRAINT Unit_Global
go
EXEC sp_rename 'dbo.Station.PK154','PK154_08052021014353001','INDEX'
go
EXEC sp_rename 'dbo.Site_Station','Site_Stati_08052021014353002'
go
EXEC sp_rename 'dbo.StationType_Station','StationTyp_08052021014353003'
go
EXEC sp_rename 'dbo.DF__Station__IsEmpty__1DB06A4F', 'DF__Statio_08052021014353005',OBJECT
go
EXEC sp_rename 'dbo.Station','Station_08052021014353000',OBJECT
go
CREATE TABLE dbo.Station
(
    StationID     int            IDENTITY,
    StationNum    float          NULL,
    Location      nvarchar(128)  NULL,
    Note          text           NULL,
    CreatedOn     datetime       NULL,
    LifeCycleSeed datetime       NULL,
    IsEmpty       bit            CONSTRAINT DF__Station__IsEmpty__1DB06A4F DEFAULT ((0)) NULL,
    IsManaged     bit            NULL,
    SiteID        int            NULL,
    EquipmentID   int            NULL,
    StationTypeID int            NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_0', 'dbo.Station.IsManaged'
go
EXEC sp_rename 'dbo.Test.PK217','PK217_08052021014354001','INDEX'
go
EXEC sp_rename 'dbo.InspectionOrder_Test','Inspection_08052021014354003'
go
EXEC sp_rename 'dbo.TestAction_Test','TestAction_08052021014354004'
go
EXEC sp_rename 'dbo.TestLifeCycle_Test','TestLifeCy_08052021014354005'
go
EXEC sp_rename 'dbo.DF__Test__Passed__17AD7836', 'DF__Test___08052021014354006',OBJECT
go
EXEC sp_rename 'dbo.Test','Test_08052021014354000',OBJECT
go
CREATE TABLE dbo.Test
(
    TestID            int            IDENTITY,
    StationNum        float          NULL,
    Location          nvarchar(128)  NULL,
    Note              nvarchar(128)  NULL,
    Passed            bit            CONSTRAINT DF__Test__Passed__17AD7836 DEFAULT ((0)) NULL,
    EquipmentID       int            NULL,
    TestA             int            NULL,
    TestB             int            NULL,
    TestLifeCycleID   int            NULL,
    TestActionID      int            NULL,
    InspectionOrderID int            NULL,
    StationID         int            NULL
)
ON [PRIMARY]
go
DROP TABLE dbo.Unit
go
EXEC sp_rename 'dbo.Equipment.PK177','PK177_08052021014355001','INDEX'
go
EXEC sp_rename 'dbo.ChemicalType_Equipment','ChemicalTy_08052021014355002'
go
EXEC sp_rename 'dbo.EquipBrand_Equipment','EquipBrand_08052021014355003'
go
EXEC sp_rename 'dbo.EquipType_Equipment','EquipType__08052021014355004'
go
EXEC sp_rename 'dbo.LightLampType_Equipment','LightLampT_08052021014355005'
go
EXEC sp_rename 'dbo.LightType_Equipment','LightType__08052021014355006'
go
EXEC sp_rename 'dbo.StationType_Equipment','StationTyp_08052021014355007'
go
EXEC sp_rename 'dbo.LightFormFactor_Equipment','LightFormF_08052021014355008'
go
EXEC sp_rename 'dbo.DF__Equipment__UseGl__24134F1B', 'DF__Equipm_08052021014355009',OBJECT
go
EXEC sp_rename 'dbo.DF__Equipment__IsArc__36470DEF', 'DF__Equipm_08052021014355010',OBJECT
go
EXEC sp_rename 'dbo.Equipment','Equipment_08052021014355000',OBJECT
go
CREATE TABLE dbo.Equipment
(
    EquipmentID       int           IDENTITY,
    Caption           nvarchar(64)  NULL,
    ShortCaption      nvarchar(50)  NULL,
    NetWeight         float         NULL,
    GrossWeight       float         NULL,
    Litres            float         NULL,
    Height            float         NULL,
    Width             float         NULL,
    Power             float         NULL,
    IsArchived        bit           CONSTRAINT DF__Equipment__IsArc__36470DEF DEFAULT ((0)) NULL,
    CreatedOn         datetime      NULL,
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
EXEC sp_rename 'dbo.Global.PK233','PK233_08052021014356001','INDEX'
go
EXEC sp_rename 'dbo.Global','Global_08052021014356000',OBJECT
go
CREATE TABLE dbo.[Global]
(
    GlobalID           int             NOT NULL,
    DefNumOfLevels     int            NULL,
    DefStartLevel      int            NULL,
    DefServiceInterval float          NULL,
    SQLversion         int            NULL,
    SQLmajor           int            NULL,
    SQLminor           int            NULL,
    SQLbuild           int            NULL,
    Author             nvarchar(64)   NULL,
    AuthorEmail        nvarchar(256)  NULL,
    Copyright          nvarchar(128)  NULL
)
ON [PRIMARY]
go
CREATE TABLE dbo.HydrantType
(
    HydrantTypeID int           IDENTITY,
    Caption       nvarchar(50)  NULL,
    ShortCaption  nvarchar(50)  NULL,
    CONSTRAINT PK266
    PRIMARY KEY CLUSTERED (HydrantTypeID)
)
go
-- Insert Data SQL

SET IDENTITY_INSERT dbo.Station ON
go
INSERT INTO dbo.Station(
                        StationID,
                        StationNum,
                        Location,
                        Note,
                        CreatedOn,
                        LifeCycleSeed,
                        IsEmpty,
                        IsManaged,
                        SiteID,
                        EquipmentID,
                        StationTypeID
                       )
                 SELECT 
                        StationID,
                        StationNum,
                        Location,
                        Note,
                        CreatedOn,
                        LifeCycleSeed,
                        IsEmpty,
                        IsManaged,
                        SiteID,
                        EquipmentID,
                        StationTypeID
                   FROM dbo.Station_08052021014353000 
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
                     EquipmentID,
                     TestA,
                     TestB,
                     TestLifeCycleID,
                     TestActionID,
                     InspectionOrderID,
                     StationID
                    )
              SELECT 
                     TestID,
                     NULL,
                     NULL,
                     Note,
                     Passed,
                     NULL,
                     NULL,
                     NULL,
                     TestLifeCycleID,
                     TestActionID,
                     InspectionOrderID,
                     StationID
                FROM dbo.Test_08052021014354000 
go
SET IDENTITY_INSERT dbo.Test OFF
go
SET IDENTITY_INSERT dbo.Equipment ON
go
INSERT INTO dbo.Equipment(
                          EquipmentID,
                          Caption,
                          ShortCaption,
                          NetWeight,
                          GrossWeight,
                          Litres,
                          Height,
                          Width,
                          Power,
                          IsArchived,
                          CreatedOn,
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
                          NetWeight,
                          GrossWeight,
                          Litres,
                          Height,
                          Width,
                          Power,
                          IsArchived,
                          CreatedOn,
                          EquipTypeID,
                          ChemicalTypeID,
                          EquipBrandID,
                          LightTypeID,
                          LightLampTypeID,
                          LightFormFactorID,
                          NULL
                     FROM dbo.Equipment_08052021014355000 
go
SET IDENTITY_INSERT dbo.Equipment OFF
go
INSERT INTO dbo.[Global](
                         GlobalID,
                         DefNumOfLevels,
                         DefStartLevel,
                         DefServiceInterval,
                         SQLversion,
                         SQLmajor,
                         SQLminor,
                         SQLbuild,
                         Author,
                         AuthorEmail,
                         Copyright
                        )
                  SELECT 
                         GlobalID,
                         NULL,
                         DefStartLevel,
                         InspectOrderInterval,
                         SQLversion,
                         SQLmajor,
                         SQLminor,
                         SQLbuild,
                         Author,
                         AuthorEmail,
                         Copyright
                    FROM dbo.Global_08052021014356000 
go

-- Add Constraint SQL

ALTER TABLE dbo.Station ADD CONSTRAINT PK154
PRIMARY KEY CLUSTERED (StationID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT PK217
PRIMARY KEY CLUSTERED (TestID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT PK177
PRIMARY KEY CLUSTERED (EquipmentID)
go
ALTER TABLE dbo.[Global] ADD CONSTRAINT PK233
PRIMARY KEY CLUSTERED (GlobalID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.Test ADD CONSTRAINT Station_Test
FOREIGN KEY (StationID)
REFERENCES dbo.Station (StationID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT Equipment_Station
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
go
ALTER TABLE dbo.CompanyInfo ADD CONSTRAINT Global_CompanyInfo
FOREIGN KEY (GlobalID)
REFERENCES dbo.[Global] (GlobalID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT Site_Station
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT StationType_Station
FOREIGN KEY (StationTypeID)
REFERENCES dbo.StationType (StationTypeID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT InspectionOrder_Test
FOREIGN KEY (InspectionOrderID)
REFERENCES dbo.InspectionOrder (InspectionOrderID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestAction_Test
FOREIGN KEY (TestActionID)
REFERENCES dbo.TestAction (TestActionID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestLifeCycle_Test
FOREIGN KEY (TestLifeCycleID)
REFERENCES dbo.TestLifeCycle (TestLifeCycleID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT Equipment_Test
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
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
