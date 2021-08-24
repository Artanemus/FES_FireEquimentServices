USE [IDFES]
go

-- Standard Alter Table SQL

EXEC sp_rename 'dbo.Postcode_CompanyI35','Postcode_CompanyInfoPostal'
go
ALTER TABLE dbo.CustAddress ADD SortList int  NULL
go
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
ALTER TABLE dbo.EquipType ADD CoreGroupID int  NULL
go
ALTER TABLE dbo.HRAddress ADD SortList int  NULL
go
ALTER TABLE dbo.EquipType ADD CONSTRAINT CoreGroup_EquipType
FOREIGN KEY (CoreGroupID)
REFERENCES dbo.CoreGroup (CoreGroupID)
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.Station DROP CONSTRAINT Equipment_Station
go
ALTER TABLE dbo.CompanyInfo DROP CONSTRAINT Global_CompanyInfo
go
ALTER TABLE dbo.Test DROP CONSTRAINT InspectionOrder_Test
go
ALTER TABLE dbo.Test DROP CONSTRAINT Station_Test
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.CustContact.PK317','PK317_08182021040429001','INDEX'
go
EXEC sp_rename 'dbo.ContactType_CustContact','ContactTyp_08182021040429002'
go
EXEC sp_rename 'dbo.Customer_CustContact','Customer_C_08182021040429003'
go
EXEC sp_rename 'dbo.HR_CustContact','HR_CustCon_08182021040429004'
go
EXEC sp_rename 'dbo.DF__CustConta__IsArc__5629CD9C', 'DF__CustCo_08182021040429005',OBJECT
go
EXEC sp_rename 'dbo.CustContact','CustContac_08182021040429000',OBJECT
go
CREATE TABLE dbo.CustContact
(
    CustContactID int            IDENTITY,
    CustomerID    int             NOT NULL,
    HRID          int             NOT NULL,
    CreatedOn     datetime       NULL,
    Caption       nvarchar(128)  NULL,
    IsArchived    bit            CONSTRAINT DF__CustConta__IsArc__5629CD9C DEFAULT ((0)) NULL,
    SortList      int            NULL,
    ContactTypeID int            NULL
)
ON [PRIMARY]
go
EXEC sp_rename 'dbo.CustContactNum.PK812','PK812_08182021040430001','INDEX'
go
EXEC sp_rename 'dbo.ContactNumType_CustContactNum','ContactNum_08182021040430002'
go
EXEC sp_rename 'dbo.Customer_CustContactNum','Customer_C_08182021040430003'
go
EXEC sp_rename 'dbo.DF__CustConta__IsArc__59063A47', 'DF__CustCo_08182021040430004',OBJECT
go
EXEC sp_rename 'dbo.CustContactNum','CustContac_08182021040430000',OBJECT
go
CREATE TABLE dbo.CustContactNum
(
    CustContactNumID int           IDENTITY,
    CustomerID       int           NULL,
    ContactNum       nvarchar(64)  NULL,
    CreatedOn        datetime      NULL,
    IsArchived       bit           CONSTRAINT DF__CustConta__IsArc__59063A47 DEFAULT ((0)) NULL,
    SortList         int           NULL,
    ContactNumTypeID int           NULL
)
ON [PRIMARY]
go
EXEC sp_rename 'dbo.CustEmail.PK315','PK315_08182021040431001','INDEX'
go
EXEC sp_rename 'dbo.Customer_CustEmail','Customer_C_08182021040431002'
go
EXEC sp_rename 'dbo.EmailType_CustEmail','EmailType__08182021040431003'
go
EXEC sp_rename 'dbo.DF__CustEmail__IsArc__5BE2A6F2', 'DF__CustEm_08182021040431004',OBJECT
go
EXEC sp_rename 'dbo.CustEmail','CustEmail_08182021040431000',OBJECT
go
CREATE TABLE dbo.CustEmail
(
    CustEmailID int            IDENTITY,
    CustomerID  int            NULL,
    Email       nvarchar(128)  NULL,
    CreatedOn   datetime       NULL,
    IsArchived  bit            CONSTRAINT DF__CustEmail__IsArc__5BE2A6F2 DEFAULT ((0)) NULL,
    SortList    int            NULL,
    EmailTypeID int            NULL
)
ON [PRIMARY]
go
EXEC sp_rename 'dbo.Equipment.PK177','PK177_08182021040432001','INDEX'
go
EXEC sp_rename 'dbo.ChemicalType_Equipment','ChemicalTy_08182021040432002'
go
EXEC sp_rename 'dbo.EquipBrand_Equipment','EquipBrand_08182021040432003'
go
EXEC sp_rename 'dbo.EquipType_Equipment','EquipType__08182021040432004'
go
EXEC sp_rename 'dbo.LightLampType_Equipment','LightLampT_08182021040432005'
go
EXEC sp_rename 'dbo.LightType_Equipment','LightType__08182021040432006'
go
EXEC sp_rename 'dbo.DF__Equipment__UseGl__24134F1B', 'DF__Equipm_08182021040432007',OBJECT
go
EXEC sp_rename 'dbo.DF__Equipment__IsArc__36470DEF', 'DF__Equipm_08182021040432008',OBJECT
go
EXEC sp_rename 'dbo.Equipment','Equipment_08182021040432000',OBJECT
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
EXEC sp_rename 'dbo.Global.PK233','PK233_08182021040433001','INDEX'
go
EXEC sp_rename 'dbo.Global','Global_08182021040433000',OBJECT
go
CREATE TABLE dbo.[Global]
(
    GlobalID       int             NOT NULL,
    DefNumOfLevels int            NULL,
    DefStartLevel  int            NULL,
    SQLversion     int            NULL,
    SQLmajor       int            NULL,
    SQLminor       int            NULL,
    SQLbuild       int            NULL,
    Author         nvarchar(64)   NULL,
    AuthorEmail    nvarchar(256)  NULL,
    Copyright      nvarchar(128)  NULL
)
ON [PRIMARY]
go
EXEC sp_rename 'dbo.HRContactNum.PK811','PK811_08182021040434001','INDEX'
go
EXEC sp_rename 'dbo.ContactNumType_HRContactNum','ContactNum_08182021040434002'
go
EXEC sp_rename 'dbo.HR_HRContactNum','HR_HRConta_08182021040434003'
go
EXEC sp_rename 'dbo.DF__HRContact__IsArc__7B5B524B', 'DF__HRCont_08182021040434004',OBJECT
go
EXEC sp_rename 'dbo.HRContactNum','HRContactN_08182021040434000',OBJECT
go
CREATE TABLE dbo.HRContactNum
(
    HRContactNumID   int           IDENTITY,
    HRID             int           NULL,
    ContactNum       nvarchar(64)  NULL,
    CreatedOn        datetime      NULL,
    IsArchived       bit           CONSTRAINT DF__HRContact__IsArc__7B5B524B DEFAULT ((0)) NULL,
    SortList         int           NULL,
    ContactNumTypeID int           NULL
)
ON [PRIMARY]
go
EXEC sp_rename 'dbo.HREmail.PK316','PK316_08182021040435001','INDEX'
go
EXEC sp_rename 'dbo.EmailType_HREmail','EmailType__08182021040435002'
go
EXEC sp_rename 'dbo.HR_HREmail','HR_HREmail_08182021040435003'
go
EXEC sp_rename 'dbo.DF__HREmail__IsArchi__7E37BEF6', 'DF__HREmai_08182021040435004',OBJECT
go
EXEC sp_rename 'dbo.HREmail','HREmail_08182021040435000',OBJECT
go
CREATE TABLE dbo.HREmail
(
    HREmailID   int            IDENTITY,
    HRID        int            NULL,
    Email       nvarchar(128)  NULL,
    CreatedOn   datetime       NULL,
    IsArchived  bit            CONSTRAINT DF__HREmail__IsArchi__7E37BEF6 DEFAULT ((0)) NULL,
    SortList    int            NULL,
    EmailTypeID int            NULL
)
ON [PRIMARY]
go
EXEC sp_rename 'dbo.InspectionOrder.PK197','PK197_08182021040436001','INDEX'
go
EXEC sp_rename 'dbo.CustSite_InspectionOrder','CustSite_I_08182021040436002'
go
EXEC sp_rename 'dbo.HR_InspectionOrder','HR_Inspect_08182021040436003'
go
EXEC sp_rename 'dbo.InspectionStatus_InspectionOrder','Inspection_08182021040436004'
go
EXEC sp_rename 'dbo.InspectionOrder','Inspection_08182021040436000',OBJECT
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
    NoteEquip          nvarchar(128)  NULL,
    NoteLight          nvarchar(128)  NULL,
    InspectionStatusID int            NULL,
    HRID               int            NULL,
    CustSiteID         int            NULL,
    CustomerID         int            NULL,
    SiteID             int            NULL
)
ON [PRIMARY]
go
EXEC sp_rename 'dbo.Station.PK154','PK154_08182021040437001','INDEX'
go
EXEC sp_rename 'dbo.Site_Station','Site_Stati_08182021040437002'
go
EXEC sp_rename 'dbo.DF__Station__IsEmpty__1DB06A4F', 'DF__Statio_08182021040437004',OBJECT
go
EXEC sp_rename 'dbo.Station','Station_08182021040437000',OBJECT
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
    CoreGroupID   int            NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_0', 'dbo.Station.IsManaged'
go
EXEC sp_rename 'dbo.Test.PK217','PK217_08182021040438001','INDEX'
go
EXEC sp_rename 'dbo.TestAction_Test','TestAction_08182021040438003'
go
EXEC sp_rename 'dbo.TestLifeCycle_Test','TestLifeCy_08182021040438004'
go
EXEC sp_rename 'dbo.DF__Test__Passed__17AD7836', 'DF__Test___08182021040438006',OBJECT
go
EXEC sp_rename 'dbo.Test','Test_08182021040438000',OBJECT
go
CREATE TABLE dbo.Test
(
    TestID            int            IDENTITY,
    StationNum        float          NULL,
    Location          nvarchar(128)  NULL,
    Note              nvarchar(128)  NULL,
    Passed            bit            CONSTRAINT DF__Test__Passed__17AD7836 DEFAULT ((0)) NULL,
    EquipmentID       int            NULL,
    TestLifeCycleID   int            NULL,
    TestActionID      int            NULL,
    InspectionOrderID int            NULL,
    StationID         int            NULL,
    TestA             int            NULL,
    TestB             int            NULL
)
ON [PRIMARY]
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.CustContact ON
go
INSERT INTO dbo.CustContact(
                            CustContactID,
                            CustomerID,
                            HRID,
                            CreatedOn,
                            Caption,
                            IsArchived,
                            SortList,
                            ContactTypeID
                           )
                     SELECT 
                            CustContactID,
                            CustomerID,
                            HRID,
                            CreatedOn,
                            Caption,
                            IsArchived,
                            NULL,
                            ContactTypeID
                       FROM dbo.CustContac_08182021040429000 
go
SET IDENTITY_INSERT dbo.CustContact OFF
go
SET IDENTITY_INSERT dbo.CustContactNum ON
go
INSERT INTO dbo.CustContactNum(
                               CustContactNumID,
                               CustomerID,
                               ContactNum,
                               CreatedOn,
                               IsArchived,
                               SortList,
                               ContactNumTypeID
                              )
                        SELECT 
                               CustContactNumID,
                               CustomerID,
                               ContactNum,
                               CreatedOn,
                               IsArchived,
                               NULL,
                               ContactNumTypeID
                          FROM dbo.CustContac_08182021040430000 
go
SET IDENTITY_INSERT dbo.CustContactNum OFF
go
SET IDENTITY_INSERT dbo.CustEmail ON
go
INSERT INTO dbo.CustEmail(
                          CustEmailID,
                          CustomerID,
                          Email,
                          CreatedOn,
                          IsArchived,
                          SortList,
                          EmailTypeID
                         )
                   SELECT 
                          CustEmailID,
                          CustomerID,
                          Email,
                          CreatedOn,
                          IsArchived,
                          NULL,
                          EmailTypeID
                     FROM dbo.CustEmail_08182021040431000 
go
SET IDENTITY_INSERT dbo.CustEmail OFF
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
                          NULL,
                          NULL
                     FROM dbo.Equipment_08182021040432000 
go
SET IDENTITY_INSERT dbo.Equipment OFF
go
INSERT INTO dbo.[Global](
                         GlobalID,
                         DefNumOfLevels,
                         DefStartLevel,
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
                         SQLversion,
                         SQLmajor,
                         SQLminor,
                         SQLbuild,
                         Author,
                         AuthorEmail,
                         Copyright
                    FROM dbo.Global_08182021040433000 
go
SET IDENTITY_INSERT dbo.HRContactNum ON
go
INSERT INTO dbo.HRContactNum(
                             HRContactNumID,
                             HRID,
                             ContactNum,
                             CreatedOn,
                             IsArchived,
                             SortList,
                             ContactNumTypeID
                            )
                      SELECT 
                             HRContactNumID,
                             HRID,
                             ContactNum,
                             CreatedOn,
                             IsArchived,
                             NULL,
                             ContactNumTypeID
                        FROM dbo.HRContactN_08182021040434000 
go
SET IDENTITY_INSERT dbo.HRContactNum OFF
go
SET IDENTITY_INSERT dbo.HREmail ON
go
INSERT INTO dbo.HREmail(
                        HREmailID,
                        HRID,
                        Email,
                        CreatedOn,
                        IsArchived,
                        SortList,
                        EmailTypeID
                       )
                 SELECT 
                        HREmailID,
                        HRID,
                        Email,
                        CreatedOn,
                        IsArchived,
                        NULL,
                        EmailTypeID
                   FROM dbo.HREmail_08182021040435000 
go
SET IDENTITY_INSERT dbo.HREmail OFF
go
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
                                NoteEquip,
                                NoteLight,
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
                                NULL,
                                LevelNum,
                                Note,
                                NoteEquip,
                                NoteLight,
                                InspectionStatusID,
                                HRID,
                                CustSiteID,
                                CustomerID,
                                SiteID
                           FROM dbo.Inspection_08182021040436000 
go
SET IDENTITY_INSERT dbo.InspectionOrder OFF
go
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
                        CoreGroupID
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
                        NULL
                   FROM dbo.Station_08182021040437000 
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
                     TestLifeCycleID,
                     TestActionID,
                     InspectionOrderID,
                     StationID,
                     TestA,
                     TestB
                    )
              SELECT 
                     TestID,
                     NULL,
                     NULL,
                     Note,
                     Passed,
                     NULL,
                     TestLifeCycleID,
                     TestActionID,
                     InspectionOrderID,
                     StationID,
                     NULL,
                     NULL
                FROM dbo.Test_08182021040438000 
go
SET IDENTITY_INSERT dbo.Test OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.CustContact ADD CONSTRAINT PK317
PRIMARY KEY CLUSTERED (CustContactID,CustomerID,HRID)
go
ALTER TABLE dbo.CustContactNum ADD CONSTRAINT PK812
PRIMARY KEY CLUSTERED (CustContactNumID)
go
ALTER TABLE dbo.CustEmail ADD CONSTRAINT PK315
PRIMARY KEY CLUSTERED (CustEmailID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT PK177
PRIMARY KEY CLUSTERED (EquipmentID)
go
ALTER TABLE dbo.[Global] ADD CONSTRAINT PK233
PRIMARY KEY CLUSTERED (GlobalID)
go
ALTER TABLE dbo.HRContactNum ADD CONSTRAINT PK811
PRIMARY KEY CLUSTERED (HRContactNumID)
go
ALTER TABLE dbo.HREmail ADD CONSTRAINT PK316
PRIMARY KEY CLUSTERED (HREmailID)
go
ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT PK197
PRIMARY KEY CLUSTERED (InspectionOrderID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT PK154
PRIMARY KEY CLUSTERED (StationID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT PK217
PRIMARY KEY CLUSTERED (TestID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.Station ADD CONSTRAINT Equipment_Station
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
go
ALTER TABLE dbo.CompanyInfo ADD CONSTRAINT Global_CompanyInfo
FOREIGN KEY (GlobalID)
REFERENCES dbo.[Global] (GlobalID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT InspectionOrder_Test
FOREIGN KEY (InspectionOrderID)
REFERENCES dbo.InspectionOrder (InspectionOrderID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT Station_Test
FOREIGN KEY (StationID)
REFERENCES dbo.Station (StationID)
go
ALTER TABLE dbo.CustContact ADD CONSTRAINT ContactType_CustContact
FOREIGN KEY (ContactTypeID)
REFERENCES dbo.ContactType (ContactTypeID)
go
ALTER TABLE dbo.CustContact ADD CONSTRAINT Customer_CustContact
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustContact ADD CONSTRAINT HR_CustContact
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.CustContactNum ADD CONSTRAINT ContactNumType_CustContactNum
FOREIGN KEY (ContactNumTypeID)
REFERENCES dbo.ContactNumType (ContactNumTypeID)
go
ALTER TABLE dbo.CustContactNum ADD CONSTRAINT Customer_CustContactNum
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustEmail ADD CONSTRAINT Customer_CustEmail
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustEmail ADD CONSTRAINT EmailType_CustEmail
FOREIGN KEY (EmailTypeID)
REFERENCES dbo.EmailType (EmailTypeID)
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
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightFormFactor_Equipment
FOREIGN KEY (LightFormFactorID)
REFERENCES dbo.LightFormFactor (LightFormFactorID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT HydrantType_Equipment
FOREIGN KEY (HydrantTypeID)
REFERENCES dbo.HydrantType (HydrantTypeID)
go
ALTER TABLE dbo.HRContactNum ADD CONSTRAINT ContactNumType_HRContactNum
FOREIGN KEY (ContactNumTypeID)
REFERENCES dbo.ContactNumType (ContactNumTypeID)
go
ALTER TABLE dbo.HRContactNum ADD CONSTRAINT HR_HRContactNum
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.HREmail ADD CONSTRAINT EmailType_HREmail
FOREIGN KEY (EmailTypeID)
REFERENCES dbo.EmailType (EmailTypeID)
go
ALTER TABLE dbo.HREmail ADD CONSTRAINT HR_HREmail
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
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
ALTER TABLE dbo.Station ADD CONSTRAINT Site_Station
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT CoreGroup_Station
FOREIGN KEY (CoreGroupID)
REFERENCES dbo.CoreGroup (CoreGroupID)
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
ALTER TABLE dbo.Test ADD CONSTRAINT TestResult_TestA
FOREIGN KEY (TestA)
REFERENCES dbo.TestResult (TestResultID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestResult_TestB
FOREIGN KEY (TestB)
REFERENCES dbo.TestResult (TestResultID)
go
