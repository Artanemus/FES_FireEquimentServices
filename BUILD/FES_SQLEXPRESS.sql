/*
 * ER/Studio Data Architect SQL Code Generation
 * Company :      Ambrosia
 * Project :      FES_VER1.DM1
 * Author :       Ben Ambrose
 *
 * Date Created : Friday, May 05, 2023 13:04:22
 * Target DBMS : Microsoft SQL Server 2017
 */

USE master
go
CREATE DATABASE FES
go
USE FES
go
/* 
 * TABLE: AddressType 
 */

CREATE TABLE AddressType(
    AddressTypeID    int             IDENTITY(1,1),
    Caption          nvarchar(50)    NULL,
    UsedByHR         bit             DEFAULT 0 NOT NULL,
    AliasHR          nvarchar(50)    NULL,
    UsedByCust       bit             DEFAULT 0 NOT NULL,
    AliasCust        nvarchar(50)    NULL,
    IsArchived       bit             DEFAULT 0 NOT NULL,
    CONSTRAINT PK_AddressType PRIMARY KEY CLUSTERED (AddressTypeID)
)
go



IF OBJECT_ID('AddressType') IS NOT NULL
    PRINT '<<< CREATED TABLE AddressType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE AddressType >>>'
go
SET IDENTITY_INSERT [dbo].[AddressType] ON 
GO
INSERT [dbo].[AddressType] ([AddressTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (1, N'PRIMARY', 1, N'Home', 1, N'Business', 0)
GO
INSERT [dbo].[AddressType] ([AddressTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (2, N'SECONDARY', 1, N'Postal', 1, N'Billing', 0)
GO
INSERT [dbo].[AddressType] ([AddressTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (3, N'2nd', 0, NULL, 1, N'Postal', 0)
GO
INSERT [dbo].[AddressType] ([AddressTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (4, N'3rd', 0, NULL, 1, N'Landlord', 0)
GO
INSERT [dbo].[AddressType] ([AddressTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (5, N'4th', 0, NULL, 1, N'Real Estate', 0)
GO
SET IDENTITY_INSERT [dbo].[AddressType] OFF
GO

/* 
 * TABLE: ChemicalType 
 */

CREATE TABLE ChemicalType(
    ChemicalTypeID    int             IDENTITY(1,1),
    Caption           nvarchar(50)    NULL,
    Symbol            nvarchar(50)    NULL,
    CONSTRAINT PK_ChemicalType PRIMARY KEY CLUSTERED (ChemicalTypeID)
)
go



IF OBJECT_ID('ChemicalType') IS NOT NULL
    PRINT '<<< CREATED TABLE ChemicalType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ChemicalType >>>'
go
SET IDENTITY_INSERT [dbo].[ChemicalType] ON 
GO
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (1, N'Water and Foam', N'AFF')
GO
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (2, N'Carbon Dioxide', N'CO2')
GO
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (3, N'Dry Chemical', N'BE')
GO
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (4, N'Wet Chemical', N'WCH')
GO
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (5, N'Dry Powder', N'ABE')
GO
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (6, N'Water Mist', N'H2O')
GO
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (7, N'Clean Agent', N'HFC')
GO
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (8, N'Water and Foam', N'AFF ECOFF')
GO
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (9, N'Air and Water', N'AW')
GO
SET IDENTITY_INSERT [dbo].[ChemicalType] OFF
GO

/* 
 * TABLE: CompanyInfo 
 */

CREATE TABLE CompanyInfo(
    CompanyInfoID       int              IDENTITY(1,1),
    CompanyName         nvarchar(64)     NULL,
    CompanyCode         nvarchar(6)      NULL,
    ABN                 nvarchar(50)     NULL,
    License1            nvarchar(20)     NULL,
    License2            nvarchar(20)     NULL,
    Address             nvarchar(256)    NULL,
    PostalAddress       nvarchar(256)    NULL,
    OfficeNumber        nvarchar(30)     NULL,
    MobileNumber        nvarchar(30)     NULL,
    Email               nvarchar(128)    NULL,
    CreatedOn           datetime         NULL,
    PostcodeID          int              NULL,
    PostalPostcodeID    int              NULL,
    GlobalID            int              NULL,
    CONSTRAINT PK_CompanyInfo PRIMARY KEY CLUSTERED (CompanyInfoID)
)
go



IF OBJECT_ID('CompanyInfo') IS NOT NULL
    PRINT '<<< CREATED TABLE CompanyInfo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CompanyInfo >>>'
go

/* 
 * TABLE: ContactNumType 
 */

CREATE TABLE ContactNumType(
    ContactNumTypeID    int             IDENTITY(1,1),
    Caption             nvarchar(50)    NULL,
    UsedByHR            bit             DEFAULT 0 NOT NULL,
    AliasHR             nvarchar(50)    NULL,
    UsedByCust          bit             DEFAULT 0 NOT NULL,
    AliasCust           nvarchar(50)    NULL,
    IsArchived          bit             DEFAULT 0 NOT NULL,
    CONSTRAINT PK_ContactNumType PRIMARY KEY CLUSTERED (ContactNumTypeID)
)
go



IF OBJECT_ID('ContactNumType') IS NOT NULL
    PRINT '<<< CREATED TABLE ContactNumType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ContactNumType >>>'
go
SET IDENTITY_INSERT [dbo].[ContactNumType] ON 
GO
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (1, N'PRIMARY', 1, N'Mobile', 1, N'Business', 0)
GO
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (2, N'SECONDARY', 1, N'Work', 1, N'Accounts', 0)
GO
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (3, N'3rd', 1, N'Home', 1, N'General Enquires', 0)
GO
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (4, N'4th', 1, N'Real Estate', 1, N'Real Estate fnCOM', 0)
GO
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (5, NULL, 0, NULL, 1, N'Landlord', 0)
GO
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (6, NULL, 0, NULL, 1, N'Real Estate - CPG', 0)
GO
SET IDENTITY_INSERT [dbo].[ContactNumType] OFF
GO

/* 
 * TABLE: ContactType 
 */

CREATE TABLE ContactType(
    ContactTypeID    int             IDENTITY(1,1),
    Caption          nvarchar(50)    NULL,
    UsedByHR         bit             DEFAULT 0 NOT NULL,
    AliasHR          nvarchar(50)    NULL,
    UsedByCust       bit             DEFAULT 0 NOT NULL,
    AliasCust        nvarchar(50)    NULL,
    IsArchived       bit             DEFAULT 0 NOT NULL,
    CONSTRAINT PK_ContactType PRIMARY KEY CLUSTERED (ContactTypeID)
)
go



IF OBJECT_ID('ContactType') IS NOT NULL
    PRINT '<<< CREATED TABLE ContactType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ContactType >>>'
go
SET IDENTITY_INSERT [dbo].[ContactType] ON 
GO
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (1, N'PRIMARY', 0, NULL, 1, N'Site Contact', 0)
GO
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (2, N'SECONDARY', 0, NULL, 1, N'Site 2nd Contact', 0)
GO
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (3, N'3rd', 0, NULL, 1, N'Accounts', 0)
GO
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (4, N'4th', 0, NULL, 1, N'Technician', 0)
GO
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (5, N'5th', 0, NULL, 0, N'Real Estate', 0)
GO
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (6, N'6th', 0, NULL, 0, NULL, 0)
GO
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (7, N'7th', 0, NULL, 0, NULL, 0)
GO
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (8, N'8th', 0, NULL, 0, NULL, 0)
GO
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (9, N'9th', 0, NULL, 0, NULL, 0)
GO
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (10, N'10th', 0, NULL, 0, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[ContactType] OFF
GO

/* 
 * TABLE: CoreGroup 
 */

CREATE TABLE CoreGroup(
    CoreGroupID    int             IDENTITY(1,1),
    Caption        nvarchar(50)    NULL,
    CONSTRAINT PK_CoreGroup PRIMARY KEY CLUSTERED (CoreGroupID)
)
go



IF OBJECT_ID('CoreGroup') IS NOT NULL
    PRINT '<<< CREATED TABLE CoreGroup >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CoreGroup >>>'
go
--USE [FES]
--GO
SET IDENTITY_INSERT [dbo].[CoreGroup] ON 
GO
INSERT [dbo].[CoreGroup] ([CoreGroupID], [Caption]) VALUES (1, N'Portable')
GO
INSERT [dbo].[CoreGroup] ([CoreGroupID], [Caption]) VALUES (2, N'Electrical')
GO
INSERT [dbo].[CoreGroup] ([CoreGroupID], [Caption]) VALUES (3, N'WaterBase')
GO
INSERT [dbo].[CoreGroup] ([CoreGroupID], [Caption]) VALUES (4, N'Structural')
GO
SET IDENTITY_INSERT [dbo].[CoreGroup] OFF
GO

/* 
 * TABLE: CustAddress 
 */

CREATE TABLE CustAddress(
    CustAddressID    int              IDENTITY(1,1),
    CustomerID       int              NULL,
    AddressTypeID    int              NULL,
    PostcodeID       int              NULL,
    Address          nvarchar(200)    NULL,
    CreatedOn        datetime         NULL,
    IsArchived       bit              DEFAULT 0 NOT NULL,
    SortList         int              NULL,
    CONSTRAINT PK_CustAddress PRIMARY KEY CLUSTERED (CustAddressID)
)
go



IF OBJECT_ID('CustAddress') IS NOT NULL
    PRINT '<<< CREATED TABLE CustAddress >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CustAddress >>>'
go

/* 
 * TABLE: CustContact 
 */

CREATE TABLE CustContact(
    CustContactID    int              IDENTITY(1,1),
    CustomerID       int              NOT NULL,
    HRID             int              NOT NULL,
    CreatedOn        datetime         NULL,
    Caption          nvarchar(128)    NULL,
    IsArchived       bit              DEFAULT 0 NOT NULL,
    SortList         int              NULL,
    ContactTypeID    int              NULL,
    CONSTRAINT PK_CustContact PRIMARY KEY CLUSTERED (CustContactID, CustomerID, HRID)
)
go



IF OBJECT_ID('CustContact') IS NOT NULL
    PRINT '<<< CREATED TABLE CustContact >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CustContact >>>'
go

/* 
 * TABLE: CustContactNum 
 */

CREATE TABLE CustContactNum(
    CustContactNumID    int             IDENTITY(1,1),
    CustomerID          int             NULL,
    ContactNum          nvarchar(64)    NULL,
    CreatedOn           datetime        NULL,
    IsArchived          bit             DEFAULT 0 NOT NULL,
    SortList            int             NULL,
    ContactNumTypeID    int             NULL,
    CONSTRAINT PK_CustContactNum PRIMARY KEY CLUSTERED (CustContactNumID)
)
go



IF OBJECT_ID('CustContactNum') IS NOT NULL
    PRINT '<<< CREATED TABLE CustContactNum >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CustContactNum >>>'
go

/* 
 * TABLE: CustEmail 
 */

CREATE TABLE CustEmail(
    CustEmailID    int              IDENTITY(1,1),
    CustomerID     int              NULL,
    Email          nvarchar(128)    NULL,
    CreatedOn      datetime         NULL,
    IsArchived     bit              DEFAULT 0 NOT NULL,
    SortList       int              NULL,
    EmailTypeID    int              NULL,
    CONSTRAINT PK_CustEmail PRIMARY KEY CLUSTERED (CustEmailID)
)
go



IF OBJECT_ID('CustEmail') IS NOT NULL
    PRINT '<<< CREATED TABLE CustEmail >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CustEmail >>>'
go

/* 
 * TABLE: Customer 
 */

CREATE TABLE Customer(
    CustomerID    int             IDENTITY(1,1),
    CustName      nvarchar(64)    NULL,
    CustCode      nvarchar(8)     NULL,
    MYOBID        int             NULL,
    Note          text            NULL,
    CreatedBy     int             NULL,
    CreatedOn     datetime        NULL,
    ModifiedBy    int             NULL,
    ModifiedOn    datetime        NULL,
    IsArchived    bit             DEFAULT 0 NOT NULL,
    CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (CustomerID)
)
go



IF OBJECT_ID('Customer') IS NOT NULL
    PRINT '<<< CREATED TABLE Customer >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Customer >>>'
go

/* 
 * TABLE: CustSite 
 */

CREATE TABLE CustSite(
    CustSiteID       int         IDENTITY(1,1),
    CustomerID       int         NOT NULL,
    SiteID           int         NOT NULL,
    CreatedOn        datetime    NULL,
    IsArchived       bit         DEFAULT 0 NOT NULL,
    IsEnabled        bit         DEFAULT 0 NOT NULL,
    SiteContactID    int         NULL,
    Note             text        NULL,
    SeedDate         datetime    NULL,
    SeedLevel        int         NULL,
    DoReseed         bit         DEFAULT 0 NOT NULL,
    CONSTRAINT PK_CustSite PRIMARY KEY CLUSTERED (CustSiteID, CustomerID, SiteID)
)
go



IF OBJECT_ID('CustSite') IS NOT NULL
    PRINT '<<< CREATED TABLE CustSite >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CustSite >>>'
go

/* 
 * TABLE: EmailType 
 */

CREATE TABLE EmailType(
    EmailTypeID    int             IDENTITY(1,1),
    Caption        nvarchar(50)    NULL,
    UsedByHR       bit             DEFAULT 0 NOT NULL,
    AliasHR        nvarchar(50)    NULL,
    UsedByCust     bit             DEFAULT 0 NOT NULL,
    AliasCust      nvarchar(50)    NULL,
    IsArchived     bit             DEFAULT 0 NOT NULL,
    CONSTRAINT PK_EmailType PRIMARY KEY CLUSTERED (EmailTypeID)
)
go



IF OBJECT_ID('EmailType') IS NOT NULL
    PRINT '<<< CREATED TABLE EmailType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EmailType >>>'
go
SET IDENTITY_INSERT [dbo].[EmailType] ON 
GO
INSERT [dbo].[EmailType] ([EmailTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (1, N'PRIMARY', 1, N'Work', 1, N'Seeking PO #', 0)
GO
INSERT [dbo].[EmailType] ([EmailTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (2, N'SECONDARY', 1, N'Personal', 1, N'Accounts Department', 0)
GO
INSERT [dbo].[EmailType] ([EmailTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (3, N'TERTIARY', 0, NULL, 1, N'Inspection Reports', 0)
GO
INSERT [dbo].[EmailType] ([EmailTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (4, N'QUATERNARY', 0, NULL, 1, N'Real Estate', 0)
GO
SET IDENTITY_INSERT [dbo].[EmailType] OFF
GO

/* 
 * TABLE: EquipBrand 
 */

CREATE TABLE EquipBrand(
    EquipBrandID    int             IDENTITY(1,1),
    Caption         nvarchar(50)    NULL,
    CONSTRAINT PK_EquipBrand PRIMARY KEY CLUSTERED (EquipBrandID)
)
go



IF OBJECT_ID('EquipBrand') IS NOT NULL
    PRINT '<<< CREATED TABLE EquipBrand >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EquipBrand >>>'
go

/* 
 * TABLE: Equipment 
 */

CREATE TABLE Equipment(
    EquipmentID          int             IDENTITY(1,1),
    Caption              nvarchar(64)    NULL,
    ShortCaption         nvarchar(50)    NULL,
    IsArchived           bit             DEFAULT 0 NOT NULL,
    CreatedOn            datetime        NULL,
    NetWeight            float           NULL,
    GrossWeight          float           NULL,
    Litres               float           NULL,
    Height               float           NULL,
    Width                float           NULL,
    Length               float           NULL,
    Watt                 float           NULL,
    EquipTypeID          int             NULL,
    ChemicalTypeID       int             NULL,
    EquipBrandID         int             NULL,
    LightTypeID          int             NULL,
    LightLampTypeID      int             NULL,
    LightFormFactorID    int             NULL,
    HydrantTypeID        int             NULL,
    CONSTRAINT PK_Equipment PRIMARY KEY CLUSTERED (EquipmentID)
)
go



IF OBJECT_ID('Equipment') IS NOT NULL
    PRINT '<<< CREATED TABLE Equipment >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Equipment >>>'
go

/* 
 * TABLE: EquipType 
 */

CREATE TABLE EquipType(
    EquipTypeID        int             IDENTITY(1,1),
    Caption            nvarchar(50)    NULL,
    ShortCaption       nvarchar(50)    NULL,
    MinorLifeCycle     float           NULL,
    MajorLifeCycle     float           NULL,
    NumOfLevels        int             DEFAULT 2 NULL,
    ServiceInterval    float           NULL,
    CoreGroupID        int             NULL,
    CONSTRAINT PK_EquipType PRIMARY KEY CLUSTERED (EquipTypeID)
)
go



IF OBJECT_ID('EquipType') IS NOT NULL
    PRINT '<<< CREATED TABLE EquipType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EquipType >>>'
go
--USE [FES]
--GO
SET IDENTITY_INSERT [dbo].[EquipType] ON 
GO
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (1, N'Hydrant', N'HYD', 12, 60, 2, 6, 3)
GO
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (2, N'Fire Blanket', N'F\B', 0, 0, 2, 6, 1)
GO
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (3, N'Fire Extinguisher', N'FX', 12, 60, 2, 6, 1)
GO
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (4, N'Fire Hose', N'F\H', 12, 60, 2, 6, 3)
GO
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (5, N'Light', N'Light', 0, 0, 2, 6, 2)
GO
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (6, N'Electrical', N'ELECT', 0, 0, 2, 6, 2)
GO
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (7, N'Booster', N'BOOSTER', 0, 0, 2, 6, 3)
GO
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (8, N'Pumpset', N'PumpSet', 0, 0, 2, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[EquipType] OFF
GO

/* 
 * TABLE: Global 
 */

CREATE TABLE Global(
    GlobalID                    int               NOT NULL,
    DefNumOfLevels              int               DEFAULT 2 NULL,
    DefStartLevel               int               DEFAULT 1 NULL,
    RootPathBatchReports        nvarchar(2048)    NULL,
    CustTemplateEmailAddress    nvarchar(2048)    NULL,
    SQLversion                  int               NULL,
    SQLmajor                    int               NULL,
    SQLminor                    int               NULL,
    SQLbuild                    int               NULL,
    Author                      nvarchar(64)      NULL,
    AuthorEmail                 nvarchar(256)     NULL,
    Copyright                   nvarchar(128)     NULL,
    SQLConnectStr               nvarchar(2048)    NULL,
    MaxPOS                      int               DEFAULT 5 NULL,
    CONSTRAINT PK_Global PRIMARY KEY CLUSTERED (GlobalID)
)
go



IF OBJECT_ID('Global') IS NOT NULL
    PRINT '<<< CREATED TABLE Global >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Global >>>'
go

/* 
 * TABLE: HR 
 */

CREATE TABLE HR(
    HRID                    int              IDENTITY(1,1),
    LastName                nvarchar(256)    NULL,
    FirstName               nvarchar(256)    NULL,
    Note                    text             NULL,
    DOB                     datetime         NULL,
    UserLoginName           nvarchar(256)    NULL,
    EmergencyContactHRID    int              NULL,
    CreatedOn               datetime         NULL,
    ModifiedOn              datetime         NULL,
    IsArchived              bit              DEFAULT 0 NOT NULL,
    CONSTRAINT PK_HR PRIMARY KEY CLUSTERED (HRID)
)
go



IF OBJECT_ID('HR') IS NOT NULL
    PRINT '<<< CREATED TABLE HR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE HR >>>'
go

/* 
 * TABLE: HRAddress 
 */

CREATE TABLE HRAddress(
    HRAddressID      int              IDENTITY(1,1),
    HRID             int              NULL,
    AddressTypeID    int              NULL,
    PostcodeID       int              NULL,
    Address          nvarchar(200)    NULL,
    CreatedOn        datetime         NULL,
    IsArchived       bit              DEFAULT 0 NOT NULL,
    SortList         int              NULL,
    CONSTRAINT PK_HRAddress PRIMARY KEY CLUSTERED (HRAddressID)
)
go



IF OBJECT_ID('HRAddress') IS NOT NULL
    PRINT '<<< CREATED TABLE HRAddress >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE HRAddress >>>'
go

/* 
 * TABLE: HRContactNum 
 */

CREATE TABLE HRContactNum(
    HRContactNumID      int             IDENTITY(1,1),
    HRID                int             NULL,
    ContactNum          nvarchar(64)    NULL,
    CreatedOn           datetime        NULL,
    IsArchived          bit             DEFAULT 0 NOT NULL,
    SortList            int             NULL,
    ContactNumTypeID    int             NULL,
    CONSTRAINT PK_HRContactNum PRIMARY KEY CLUSTERED (HRContactNumID)
)
go



IF OBJECT_ID('HRContactNum') IS NOT NULL
    PRINT '<<< CREATED TABLE HRContactNum >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE HRContactNum >>>'
go

/* 
 * TABLE: HREmail 
 */

CREATE TABLE HREmail(
    HREmailID      int              IDENTITY(1,1),
    HRID           int              NULL,
    Email          nvarchar(128)    NULL,
    CreatedOn      datetime         NULL,
    IsArchived     bit              DEFAULT 0 NOT NULL,
    SortList       int              NULL,
    EmailTypeID    int              NULL,
    CONSTRAINT PK_HREmail PRIMARY KEY CLUSTERED (HREmailID)
)
go



IF OBJECT_ID('HREmail') IS NOT NULL
    PRINT '<<< CREATED TABLE HREmail >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE HREmail >>>'
go

/* 
 * TABLE: HRZone 
 */

CREATE TABLE HRZone(
    HRZoneID      int    IDENTITY(1,1),
    HRID          int    NULL,
    PostcodeID    int    NULL,
    CONSTRAINT PK_HRZone PRIMARY KEY CLUSTERED (HRZoneID)
)
go



IF OBJECT_ID('HRZone') IS NOT NULL
    PRINT '<<< CREATED TABLE HRZone >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE HRZone >>>'
go

/* 
 * TABLE: HydrantType 
 */

CREATE TABLE HydrantType(
    HydrantTypeID    int             IDENTITY(1,1),
    Caption          nvarchar(50)    NULL,
    ShortCaption     nvarchar(50)    NULL,
    CONSTRAINT PK_HydrantType PRIMARY KEY CLUSTERED (HydrantTypeID)
)
go



IF OBJECT_ID('HydrantType') IS NOT NULL
    PRINT '<<< CREATED TABLE HydrantType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE HydrantType >>>'
go
SET IDENTITY_INSERT [dbo].[HydrantType] ON 
GO
INSERT [dbo].[HydrantType] ([HydrantTypeID], [Caption], [ShortCaption]) VALUES (1, N'Hydrant', N'HYD')
GO
INSERT [dbo].[HydrantType] ([HydrantTypeID], [Caption], [ShortCaption]) VALUES (2, N'Double Hydrant', N'D/HYD')
GO
INSERT [dbo].[HydrantType] ([HydrantTypeID], [Caption], [ShortCaption]) VALUES (3, N'Pillar Hydrant', N'P/HYD')
GO
INSERT [dbo].[HydrantType] ([HydrantTypeID], [Caption], [ShortCaption]) VALUES (4, N'Ground Hydrant', N'G/HYD')
GO
SET IDENTITY_INSERT [dbo].[HydrantType] OFF
GO

/* 
 * TABLE: InspectionOrder 
 */

CREATE TABLE InspectionOrder(
    InspectionOrderID     int              IDENTITY(1,1),
    CreatedOn             datetime         NULL,
    RequestedDT           datetime         NULL,
    InspectedOn           datetime         NULL,
    CompletedDT           datetime         NULL,
    ServiceInterval       float            NULL,
    LevelNum              int              NULL,
    Note                  nvarchar(128)    NULL,
    NotePortable          nvarchar(128)    NULL,
    NoteElectrical        nvarchar(128)    NULL,
    NoteWaterBase         nvarchar(128)    NULL,
    NoteStructual         nvarchar(128)    NULL,
    InspectionStatusID    int              NULL,
    HRID                  int              NULL,
    CustSiteID            int              NULL,
    CustomerID            int              NULL,
    SiteID                int              NULL,
    CONSTRAINT PK_InspectionOrder PRIMARY KEY CLUSTERED (InspectionOrderID)
)
go



IF OBJECT_ID('InspectionOrder') IS NOT NULL
    PRINT '<<< CREATED TABLE InspectionOrder >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE InspectionOrder >>>'
go

/* 
 * TABLE: InspectionStatus 
 */

CREATE TABLE InspectionStatus(
    InspectionStatusID    int              IDENTITY(1,1),
    Caption               nvarchar(50)     NULL,
    Description           nvarchar(128)    NULL,
    StackOrder            int              NULL,
    CONSTRAINT PK_InspectionStatus PRIMARY KEY CLUSTERED (InspectionStatusID)
)
go



IF OBJECT_ID('InspectionStatus') IS NOT NULL
    PRINT '<<< CREATED TABLE InspectionStatus >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE InspectionStatus >>>'
go
SET IDENTITY_INSERT [dbo].[InspectionStatus] ON 
GO
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (1, N'Action', N'system. Don''t change field No.', 1)
GO
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (2, N'Completed', N'system. Don''t change field No.', 6)
GO
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (3, N'Cancelled', N'system. Don''t change field No.', 7)
GO
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (4, N'IRNS', NULL, 5)
GO
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (5, N'HOLD', NULL, 4)
GO
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (6, N'Sent', NULL, 2)
GO
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (7, N'Awaiting PO', NULL, 3)
GO
SET IDENTITY_INSERT [dbo].[InspectionStatus] OFF
GO


/* 
 * TABLE: LightFormFactor 
 */

CREATE TABLE LightFormFactor(
    LightFormFactorID    int             IDENTITY(1,1),
    Caption              nvarchar(50)    NULL,
    ShortCaption         nvarchar(50)    NULL,
    CONSTRAINT PK_LightFormFactor PRIMARY KEY CLUSTERED (LightFormFactorID)
)
go



IF OBJECT_ID('LightFormFactor') IS NOT NULL
    PRINT '<<< CREATED TABLE LightFormFactor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LightFormFactor >>>'
go
SET IDENTITY_INSERT [dbo].[LightFormFactor] ON 
GO
INSERT [dbo].[LightFormFactor] ([LightFormFactorID], [Caption], [ShortCaption]) VALUES (1, N'Fluro Batton', N'Batton')
GO
INSERT [dbo].[LightFormFactor] ([LightFormFactorID], [Caption], [ShortCaption]) VALUES (2, N'Bayonet Cap', N'Bayonet')
GO
INSERT [dbo].[LightFormFactor] ([LightFormFactorID], [Caption], [ShortCaption]) VALUES (3, N'Edison Screw', N'Screw')
GO
SET IDENTITY_INSERT [dbo].[LightFormFactor] OFF
GO

/* 
 * TABLE: LightLampType 
 */

CREATE TABLE LightLampType(
    LightLampTypeID    int             IDENTITY(1,1),
    Caption            nvarchar(50)    NULL,
    ShortCaption       nvarchar(50)    NULL,
    CONSTRAINT PK_LightLampType PRIMARY KEY CLUSTERED (LightLampTypeID)
)
go



IF OBJECT_ID('LightLampType') IS NOT NULL
    PRINT '<<< CREATED TABLE LightLampType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LightLampType >>>'
go
--USE [FES]
--GO
SET IDENTITY_INSERT [dbo].[LightLampType] ON 
GO
INSERT [dbo].[LightLampType] ([LightLampTypeID], [Caption], [ShortCaption]) VALUES (1, N'LED', N'LED')
GO
INSERT [dbo].[LightLampType] ([LightLampTypeID], [Caption], [ShortCaption]) VALUES (2, N'Fluorescent', N'FLURO')
GO
INSERT [dbo].[LightLampType] ([LightLampTypeID], [Caption], [ShortCaption]) VALUES (3, N'Incandesant', N'INCAN')
GO
SET IDENTITY_INSERT [dbo].[LightLampType] OFF
GO

/* 
 * TABLE: LightType 
 */

CREATE TABLE LightType(
    LightTypeID     int             IDENTITY(1,1),
    Caption         nvarchar(50)    NULL,
    ShortCaption    nvarchar(50)    NULL,
    CONSTRAINT PK_LightType PRIMARY KEY CLUSTERED (LightTypeID)
)
go



IF OBJECT_ID('LightType') IS NOT NULL
    PRINT '<<< CREATED TABLE LightType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LightType >>>'
go
--USE [FES]
--GO
SET IDENTITY_INSERT [dbo].[LightType] ON 
GO
INSERT [dbo].[LightType] ([LightTypeID], [Caption], [ShortCaption]) VALUES (1, N'Emergency', N'EMERG')
GO
INSERT [dbo].[LightType] ([LightTypeID], [Caption], [ShortCaption]) VALUES (2, N'Exit', N'EXIT')
GO
SET IDENTITY_INSERT [dbo].[LightType] OFF
GO

/* 
 * TABLE: Log 
 */

CREATE TABLE Log(
    LogID            int              IDENTITY(1,1),
    Title            nvarchar(50)     NULL,
    Detail           nvarchar(256)    NULL,
    CreatedOn        datetime         NULL,
    CompanyInfoID    int              NULL,
    LogCallerID      int              NULL,
    LogErrLevelID    int              NULL,
    CONSTRAINT PK_Log PRIMARY KEY CLUSTERED (LogID)
)
go



IF OBJECT_ID('Log') IS NOT NULL
    PRINT '<<< CREATED TABLE Log >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Log >>>'
go

/* 
 * TABLE: LogCaller 
 */

CREATE TABLE LogCaller(
    LogCallerID    int             IDENTITY(1,1),
    Caption        nvarchar(50)    NULL,
    CONSTRAINT PK_LogCaller PRIMARY KEY CLUSTERED (LogCallerID)
)
go



IF OBJECT_ID('LogCaller') IS NOT NULL
    PRINT '<<< CREATED TABLE LogCaller >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LogCaller >>>'
go

/* 
 * TABLE: LogErrLevel 
 */

CREATE TABLE LogErrLevel(
    LogErrLevelID    int             IDENTITY(1,1),
    Caption          nvarchar(50)    NULL,
    CONSTRAINT PK_LogErrLevel PRIMARY KEY CLUSTERED (LogErrLevelID)
)
go



IF OBJECT_ID('LogErrLevel') IS NOT NULL
    PRINT '<<< CREATED TABLE LogErrLevel >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE LogErrLevel >>>'
go

/* 
 * TABLE: Postcode 
 */

CREATE TABLE Postcode(
    PostcodeID    int             IDENTITY(1,1),
    Postcode      int             NULL,
    Suburb        nvarchar(50)    NULL,
    State         nvarchar(50)    NULL,
    Long          float           NULL,
    Lat           float           NULL,
    sa3_Zone      int             NULL,
    Zone          nvarchar(50)    NULL,
    CONSTRAINT PK_Postcode PRIMARY KEY CLUSTERED (PostcodeID)
)
go



IF OBJECT_ID('Postcode') IS NOT NULL
    PRINT '<<< CREATED TABLE Postcode >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Postcode >>>'
go

/* 
 * TABLE: PowerBoard 
 */

CREATE TABLE PowerBoard(
    PowerBoardID     int              IDENTITY(1,1),
    Caption          nvarchar(50)     NULL,
    PowerBoardNum    float            NULL,
    Location         nvarchar(128)    NULL,
    Note             text             NULL,
    SiteID           int              NULL,
    CONSTRAINT PK_PowerBoard PRIMARY KEY CLUSTERED (PowerBoardID)
)
go



IF OBJECT_ID('PowerBoard') IS NOT NULL
    PRINT '<<< CREATED TABLE PowerBoard >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PowerBoard >>>'
go

/* 
 * TABLE: Role 
 */

CREATE TABLE Role(
    RoleID        int              IDENTITY(1,1),
    Caption       nvarchar(128)    NULL,
    Note          text             NULL,
    IsArchived    bit              DEFAULT 0 NOT NULL,
    CONSTRAINT PK_Role PRIMARY KEY CLUSTERED (RoleID)
)
go



IF OBJECT_ID('Role') IS NOT NULL
    PRINT '<<< CREATED TABLE Role >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Role >>>'
go
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (1, N'IDFES Technician', N'Inspects and services customer equipment', 0)
GO
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (2, N'IDFES Administrator', N'Customer service, accounts, office admin.', 0)
GO
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (3, N'Cust Manager', N'A customer contact.', 0)
GO
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (1004, N'Cust Accountant', NULL, 0)
GO
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (1005, N'Cust Site Contact', NULL, 0)
GO
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (1006, N'Landlord', NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO

/* 
 * TABLE: RoleList 
 */

CREATE TABLE RoleList(
    RoleListID    int         IDENTITY(1,1),
    HRID          int         NOT NULL,
    RoleID        int         NOT NULL,
    CreatedOn     datetime    NULL,
    CONSTRAINT PK_RoleList PRIMARY KEY CLUSTERED (RoleListID, HRID, RoleID)
)
go



IF OBJECT_ID('RoleList') IS NOT NULL
    PRINT '<<< CREATED TABLE RoleList >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RoleList >>>'
go

/* 
 * TABLE: Site 
 */

CREATE TABLE Site(
    SiteID        int               IDENTITY(1,1),
    Note          nvarchar(1024)    NULL,
    Address       nvarchar(256)     NULL,
    CreatedOn     datetime          NULL,
    IsArchived    bit               DEFAULT 0 NOT NULL,
    PostcodeID    int               NULL,
    CONSTRAINT PK_Site PRIMARY KEY CLUSTERED (SiteID)
)
go



IF OBJECT_ID('Site') IS NOT NULL
    PRINT '<<< CREATED TABLE Site >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Site >>>'
go

/* 
 * TABLE: Station 
 */

CREATE TABLE Station(
    StationID        int              IDENTITY(1,1),
    StationNum       float            NULL,
    CircuitBlock     nvarchar(18)     NULL,
    Location         nvarchar(128)    NULL,
    Note             text             NULL,
    CreatedOn        datetime         NULL,
    LifeCycleSeed    datetime         NULL,
    IsEmpty          bit              DEFAULT 0 NOT NULL,
    IsManaged        bit              DEFAULT 0 NOT NULL,
    SiteID           int              NULL,
    EquipmentID      int              NULL,
    CONSTRAINT PK_Station PRIMARY KEY CLUSTERED (StationID)
)
go



IF OBJECT_ID('Station') IS NOT NULL
    PRINT '<<< CREATED TABLE Station >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Station >>>'
go

/* 
 * TABLE: SurveyOrder 
 */

CREATE TABLE SurveyOrder(
    SurveyOrderID     int         IDENTITY(1,1),
    CreatedOn         datetime    NULL,
    RequestedDT       datetime    NULL,
    SurveyedOn        datetime    NULL,
    CompletedDT       datetime    NULL,
    IsArchived        bit         DEFAULT 0 NOT NULL,
    SurveyStatusID    int         NULL,
    HRID              int         NULL,
    CustSiteID        int         NULL,
    CustomerID        int         NULL,
    SiteID            int         NULL,
    CONSTRAINT PK_SurveyOrder PRIMARY KEY CLUSTERED (SurveyOrderID)
)
go



IF OBJECT_ID('SurveyOrder') IS NOT NULL
    PRINT '<<< CREATED TABLE SurveyOrder >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SurveyOrder >>>'
go

/* 
 * TABLE: SurveyStatus 
 */

CREATE TABLE SurveyStatus(
    SurveyStatusID    int              IDENTITY(1,1),
    Caption           nvarchar(50)     NULL,
    Description       nvarchar(128)    NULL,
    StackOrder        int              NULL,
    CONSTRAINT PK_SurveyStatus PRIMARY KEY CLUSTERED (SurveyStatusID)
)
go



IF OBJECT_ID('SurveyStatus') IS NOT NULL
    PRINT '<<< CREATED TABLE SurveyStatus >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SurveyStatus >>>'
go
SET IDENTITY_INSERT [dbo].[SurveyStatus] ON 
GO
INSERT [dbo].[SurveyStatus] ([SurveyStatusID], [Caption], [Description], [StackOrder]) VALUES (1, N'Action', N'system. Don''t change field No.', NULL)
GO
INSERT [dbo].[SurveyStatus] ([SurveyStatusID], [Caption], [Description], [StackOrder]) VALUES (2, N'Completed', N'system. Don''t change field No.', NULL)
GO
INSERT [dbo].[SurveyStatus] ([SurveyStatusID], [Caption], [Description], [StackOrder]) VALUES (3, N'Cancelled', N'system. Don''t change field No.', NULL)
GO
SET IDENTITY_INSERT [dbo].[SurveyStatus] OFF
GO

/* 
 * TABLE: Test 
 */

CREATE TABLE Test(
    TestID               int              IDENTITY(1,1),
    StationNum           float            NULL,
    Location             nvarchar(128)    NULL,
    Note                 nvarchar(128)    NULL,
    Passed               bit              DEFAULT 0 NOT NULL,
    IsManaged            bit              DEFAULT 0 NOT NULL,
    kPaStatic            int              NULL,
    kPaFlow              int              NULL,
    LitrePerSec          int              NULL,
    EquipmentID          int              NULL,
    TestLifeCycleID      int              NULL,
    TestActionID         int              NULL,
    InspectionOrderID    int              NULL,
    ReferenceID          int              NULL,
    TestA                int              NULL,
    TestB                int              NULL,
    CONSTRAINT PK_Test PRIMARY KEY CLUSTERED (TestID)
)
go



IF OBJECT_ID('Test') IS NOT NULL
    PRINT '<<< CREATED TABLE Test >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Test >>>'
go

/* 
 * TABLE: TestAction 
 */

CREATE TABLE TestAction(
    TestActionID    int             IDENTITY(1,1),
    Caption         nvarchar(50)    NULL,
    CONSTRAINT PK_TestAction PRIMARY KEY CLUSTERED (TestActionID)
)
go



IF OBJECT_ID('TestAction') IS NOT NULL
    PRINT '<<< CREATED TABLE TestAction >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TestAction >>>'
go
SET IDENTITY_INSERT [dbo].[TestAction] ON 
GO
INSERT [dbo].[TestAction] ([TestActionID], [Caption]) VALUES (1, N'Repair')
GO
INSERT [dbo].[TestAction] ([TestActionID], [Caption]) VALUES (2, N'Replace')
GO
INSERT [dbo].[TestAction] ([TestActionID], [Caption]) VALUES (3, N'Renew')
GO
SET IDENTITY_INSERT [dbo].[TestAction] OFF
GO

/* 
 * TABLE: TestLifeCycle 
 */

CREATE TABLE TestLifeCycle(
    TestLifeCycleID    int             IDENTITY(1,1),
    Caption            nvarchar(50)    NULL,
    CONSTRAINT PK_TestLifeCycle PRIMARY KEY CLUSTERED (TestLifeCycleID)
)
go



IF OBJECT_ID('TestLifeCycle') IS NOT NULL
    PRINT '<<< CREATED TABLE TestLifeCycle >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TestLifeCycle >>>'
go
SET IDENTITY_INSERT [dbo].[TestLifeCycle] ON 
GO
INSERT [dbo].[TestLifeCycle] ([TestLifeCycleID], [Caption]) VALUES (1, N'Minor')
GO
INSERT [dbo].[TestLifeCycle] ([TestLifeCycleID], [Caption]) VALUES (2, N'Major')
GO
SET IDENTITY_INSERT [dbo].[TestLifeCycle] OFF
GO

/* 
 * TABLE: TestResult 
 */

CREATE TABLE TestResult(
    TestResultID    int             IDENTITY(1,1),
    Caption         nvarchar(50)    NULL,
    ShortCaption    nvarchar(50)    NULL,
    CONSTRAINT PK_TestResult PRIMARY KEY CLUSTERED (TestResultID)
)
go



IF OBJECT_ID('TestResult') IS NOT NULL
    PRINT '<<< CREATED TABLE TestResult >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TestResult >>>'
go
SET IDENTITY_INSERT [dbo].[TestResult] ON 
GO
INSERT [dbo].[TestResult] ([TestResultID], [Caption], [ShortCaption]) VALUES (1, N'-', N'-')
GO
INSERT [dbo].[TestResult] ([TestResultID], [Caption], [ShortCaption]) VALUES (2, N'F', N'FAILED')
GO
INSERT [dbo].[TestResult] ([TestResultID], [Caption], [ShortCaption]) VALUES (3, N'P', N'PASSED')
GO
SET IDENTITY_INSERT [dbo].[TestResult] OFF
GO

/* 
 * TABLE: CompanyInfo 
 */

ALTER TABLE CompanyInfo ADD CONSTRAINT GlobalCompanyInfo 
    FOREIGN KEY (GlobalID)
    REFERENCES Global(GlobalID)
go

ALTER TABLE CompanyInfo ADD CONSTRAINT PostcodeCompanyI53 
    FOREIGN KEY (PostalPostcodeID)
    REFERENCES Postcode(PostcodeID)
go

ALTER TABLE CompanyInfo ADD CONSTRAINT PostcodeCompanyInfo 
    FOREIGN KEY (PostcodeID)
    REFERENCES Postcode(PostcodeID)
go


/* 
 * TABLE: CustAddress 
 */

ALTER TABLE CustAddress ADD CONSTRAINT AddressTypeCustAddress 
    FOREIGN KEY (AddressTypeID)
    REFERENCES AddressType(AddressTypeID)
go

ALTER TABLE CustAddress ADD CONSTRAINT CustomerCustAddress 
    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
go

ALTER TABLE CustAddress ADD CONSTRAINT PostcodeCustAddress 
    FOREIGN KEY (PostcodeID)
    REFERENCES Postcode(PostcodeID)
go


/* 
 * TABLE: CustContact 
 */

ALTER TABLE CustContact ADD CONSTRAINT ContactTypeCustContact 
    FOREIGN KEY (ContactTypeID)
    REFERENCES ContactType(ContactTypeID)
go

ALTER TABLE CustContact ADD CONSTRAINT CustomerCustContact 
    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
go

ALTER TABLE CustContact ADD CONSTRAINT HRCustContact 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go


/* 
 * TABLE: CustContactNum 
 */

ALTER TABLE CustContactNum ADD CONSTRAINT ContactNumTypeCustContactNum 
    FOREIGN KEY (ContactNumTypeID)
    REFERENCES ContactNumType(ContactNumTypeID)
go

ALTER TABLE CustContactNum ADD CONSTRAINT CustomerCustContactNum 
    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
go


/* 
 * TABLE: CustEmail 
 */

ALTER TABLE CustEmail ADD CONSTRAINT CustomerCustEmail 
    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
go

ALTER TABLE CustEmail ADD CONSTRAINT EmailTypeCustEmail 
    FOREIGN KEY (EmailTypeID)
    REFERENCES EmailType(EmailTypeID)
go


/* 
 * TABLE: CustSite 
 */

ALTER TABLE CustSite ADD CONSTRAINT CustomerCustSite 
    FOREIGN KEY (CustomerID)
    REFERENCES Customer(CustomerID)
go

ALTER TABLE CustSite ADD CONSTRAINT HRCustSite 
    FOREIGN KEY (SiteContactID)
    REFERENCES HR(HRID)
go

ALTER TABLE CustSite ADD CONSTRAINT SiteCustSite 
    FOREIGN KEY (SiteID)
    REFERENCES Site(SiteID)
go


/* 
 * TABLE: Equipment 
 */

ALTER TABLE Equipment ADD CONSTRAINT ChemicalTypeEquipment 
    FOREIGN KEY (ChemicalTypeID)
    REFERENCES ChemicalType(ChemicalTypeID)
go

ALTER TABLE Equipment ADD CONSTRAINT EquipBrandEquipment 
    FOREIGN KEY (EquipBrandID)
    REFERENCES EquipBrand(EquipBrandID)
go

ALTER TABLE Equipment ADD CONSTRAINT EquipTypeEquipment 
    FOREIGN KEY (EquipTypeID)
    REFERENCES EquipType(EquipTypeID)
go

ALTER TABLE Equipment ADD CONSTRAINT HydrantTypeEquipment 
    FOREIGN KEY (HydrantTypeID)
    REFERENCES HydrantType(HydrantTypeID)
go

ALTER TABLE Equipment ADD CONSTRAINT LightFormFactorEquipment 
    FOREIGN KEY (LightFormFactorID)
    REFERENCES LightFormFactor(LightFormFactorID)
go

ALTER TABLE Equipment ADD CONSTRAINT LightLampTypeEquipment 
    FOREIGN KEY (LightLampTypeID)
    REFERENCES LightLampType(LightLampTypeID)
go

ALTER TABLE Equipment ADD CONSTRAINT LightTypeEquipment 
    FOREIGN KEY (LightTypeID)
    REFERENCES LightType(LightTypeID)
go


/* 
 * TABLE: EquipType 
 */

ALTER TABLE EquipType ADD CONSTRAINT CoreGroupEquipType 
    FOREIGN KEY (CoreGroupID)
    REFERENCES CoreGroup(CoreGroupID)
go


/* 
 * TABLE: HRAddress 
 */

ALTER TABLE HRAddress ADD CONSTRAINT AddressTypeHRAddress 
    FOREIGN KEY (AddressTypeID)
    REFERENCES AddressType(AddressTypeID)
go

ALTER TABLE HRAddress ADD CONSTRAINT HRHRAddress 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE HRAddress ADD CONSTRAINT PostcodeHRAddress 
    FOREIGN KEY (PostcodeID)
    REFERENCES Postcode(PostcodeID)
go


/* 
 * TABLE: HRContactNum 
 */

ALTER TABLE HRContactNum ADD CONSTRAINT ContactNumTypeHRContactNum 
    FOREIGN KEY (ContactNumTypeID)
    REFERENCES ContactNumType(ContactNumTypeID)
go

ALTER TABLE HRContactNum ADD CONSTRAINT HRHRContactNum 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go


/* 
 * TABLE: HREmail 
 */

ALTER TABLE HREmail ADD CONSTRAINT EmailTypeHREmail 
    FOREIGN KEY (EmailTypeID)
    REFERENCES EmailType(EmailTypeID)
go

ALTER TABLE HREmail ADD CONSTRAINT HRHREmail 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go


/* 
 * TABLE: HRZone 
 */

ALTER TABLE HRZone ADD CONSTRAINT HRHRZone 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE HRZone ADD CONSTRAINT PostcodeHRZone 
    FOREIGN KEY (PostcodeID)
    REFERENCES Postcode(PostcodeID)
go


/* 
 * TABLE: InspectionOrder 
 */

ALTER TABLE InspectionOrder ADD CONSTRAINT CustSiteInspectionOrder 
    FOREIGN KEY (CustSiteID, CustomerID, SiteID)
    REFERENCES CustSite(CustSiteID, CustomerID, SiteID)
go

ALTER TABLE InspectionOrder ADD CONSTRAINT HRInspectionOrder 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE InspectionOrder ADD CONSTRAINT InspectionStatusInspectionOrder 
    FOREIGN KEY (InspectionStatusID)
    REFERENCES InspectionStatus(InspectionStatusID)
go


/* 
 * TABLE: Log 
 */

ALTER TABLE Log ADD CONSTRAINT CompanyInfoLog 
    FOREIGN KEY (CompanyInfoID)
    REFERENCES CompanyInfo(CompanyInfoID)
go

ALTER TABLE Log ADD CONSTRAINT LogCallerLog 
    FOREIGN KEY (LogCallerID)
    REFERENCES LogCaller(LogCallerID)
go

ALTER TABLE Log ADD CONSTRAINT LogErrLevelLog 
    FOREIGN KEY (LogErrLevelID)
    REFERENCES LogErrLevel(LogErrLevelID)
go


/* 
 * TABLE: PowerBoard 
 */

ALTER TABLE PowerBoard ADD CONSTRAINT SitePowerBoard 
    FOREIGN KEY (SiteID)
    REFERENCES Site(SiteID)
go


/* 
 * TABLE: RoleList 
 */

ALTER TABLE RoleList ADD CONSTRAINT HRRoleList 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID) ON DELETE CASCADE
go

ALTER TABLE RoleList ADD CONSTRAINT RoleRoleList 
    FOREIGN KEY (RoleID)
    REFERENCES Role(RoleID)
go


/* 
 * TABLE: Site 
 */

ALTER TABLE Site ADD CONSTRAINT PostcodeSite 
    FOREIGN KEY (PostcodeID)
    REFERENCES Postcode(PostcodeID)
go


/* 
 * TABLE: Station 
 */

ALTER TABLE Station ADD CONSTRAINT EquipmentStation 
    FOREIGN KEY (EquipmentID)
    REFERENCES Equipment(EquipmentID)
go

ALTER TABLE Station ADD CONSTRAINT SiteStation 
    FOREIGN KEY (SiteID)
    REFERENCES Site(SiteID)
go


/* 
 * TABLE: SurveyOrder 
 */

ALTER TABLE SurveyOrder ADD CONSTRAINT CustSiteSurveyOrder 
    FOREIGN KEY (CustSiteID, CustomerID, SiteID)
    REFERENCES CustSite(CustSiteID, CustomerID, SiteID)
go

ALTER TABLE SurveyOrder ADD CONSTRAINT HRSurveyOrder 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE SurveyOrder ADD CONSTRAINT SurveyStatusSurveyOrder 
    FOREIGN KEY (SurveyStatusID)
    REFERENCES SurveyStatus(SurveyStatusID)
go


/* 
 * TABLE: Test 
 */

ALTER TABLE Test ADD CONSTRAINT EquipmentTest 
    FOREIGN KEY (EquipmentID)
    REFERENCES Equipment(EquipmentID)
go

ALTER TABLE Test ADD CONSTRAINT InspectionOrderTest 
    FOREIGN KEY (InspectionOrderID)
    REFERENCES InspectionOrder(InspectionOrderID)
go

ALTER TABLE Test ADD CONSTRAINT TestActionTest 
    FOREIGN KEY (TestActionID)
    REFERENCES TestAction(TestActionID)
go

ALTER TABLE Test ADD CONSTRAINT TestLifeCycleTest 
    FOREIGN KEY (TestLifeCycleID)
    REFERENCES TestLifeCycle(TestLifeCycleID)
go

ALTER TABLE Test ADD CONSTRAINT TestResultT33 
    FOREIGN KEY (TestB)
    REFERENCES TestResult(TestResultID)
go

ALTER TABLE Test ADD CONSTRAINT TestResultTest 
    FOREIGN KEY (TestA)
    REFERENCES TestResult(TestResultID)
go


/* 
 * FUNCTION: GetCustAddressID 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustAddressID]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer AddressID
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetCustAddressID] (
    -- Add the parameters for the function here
    @CustomerID INT
    )
RETURNS INT
AS
BEGIN
    DECLARE @Result AS INT;
    -- DEFAULT return value
    SET @Result = NULL;

    -- TRAP BAD CUSTOMER ID
    IF @CustomerID IS NULL
        OR @CustomerID = 0
        RETURN @Result;

    -- CTE table - TmpA 
    WITH TmpA
    AS (
        SELECT Customer.CustomerID
            , CustAddress.CreatedOn
            , CustAddress.SortList
            , CustAddress.CustAddressID
			, CustAddress.AddressTypeID
        FROM Customer
        INNER JOIN CustAddress
            ON Customer.CustomerID = CustAddress.CustomerID
        WHERE Customer.CustomerID = @CustomerID
            AND CustAddress.IsArchived <> 1
            AND CustAddress.Address IS NOT NULL
        )
    -- Add the T-SQL statements to compute the return value here
    SELECT TOP 1 @Result = (TmpA.CustAddressID)
    FROM TmpA
    ORDER BY 
		-- GROUP ON CUSTOMER - REDUNDANT
		TmpA.CustomerID ASC
		-- User custom sorts the addresses by priority NULL LAST
        , CASE WHEN TmpA.SortList IS NULL THEN 0 ELSE 1 END DESC, TmpA.SortList ASC
		-- The primary address has preference NULL LAST
		, CASE WHEN TmpA.AddressTypeID IS NULL THEN 0 ELSE 1 END DESC, TmpA.AddressTypeID ASC
		-- Last resort - date created
        , TmpA.CreatedOn DESC

    -- Return the result of the function
    RETURN @Result
END
GO



go
IF OBJECT_ID('GetCustAddressID') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetCustAddressID >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetCustAddressID >>>'
go


/* 
 * FUNCTION: GetCustAddrMultiLine 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustAddrMultiLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get 'best' pretty customer address - MULTI-LINE
-- returns MAX 128 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetCustAddrMultiLine] (
	-- Add the parameters for the function here
	@CustomerID INT
	)
RETURNS NVARCHAR(128)
AS
BEGIN
	-- Used to strip-out line returns used in customer address
	DECLARE @NewLine CHAR(2);
	-- Declare the return variable here
	-- Don't forget to assign the size of ALL NVARCHARs else default is one charcter 
	DECLARE @Result NVARCHAR(128)

	SET @NewLine = CHAR(13) + CHAR(10);
	-- DEFAULT :: returns NULL string
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @CustomerID IS NULL
		OR @CustomerID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT Customer.CustomerID
			,CustAddress.CreatedOn
			,CustAddress.SortList
			,CustAddress.AddressTypeID
			,SUBSTRING(CustAddress.Address, 1, 64) AS xAddress
			,CONCAT (
				Postcode.Suburb
				,', '
				,Postcode.STATE
				,' '
				,Postcode.Postcode
				) AS xPostcode
		FROM Customer
		INNER JOIN CustAddress ON Customer.CustomerID = CustAddress.CustomerID
		INNER JOIN Postcode ON CustAddress.PostcodeID = Postcode.PostcodeID
		WHERE Customer.CustomerID = @CustomerID
			AND CustAddress.IsArchived <> 1
			AND CustAddress.Address IS NOT NULL
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (
			SUBSTRING(CONCAT (
					TmpA.xAddress
					,@NewLine
					,TmpA.xPostcode
					), 1, 128)
			)
	FROM TmpA
	ORDER BY
		-- GROUP ON CUSTOMER - REDUNDANT
		TmpA.CustomerID ASC
		-- User custom sorts the addresses by priority NULL LAST
		,CASE 
			WHEN TmpA.SortList IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.SortList DESC
		-- The primary address has preference NULL LAST
		,CASE 
			WHEN TmpA.AddressTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.AddressTypeID DESC
		-- Last resort - date created
		,TmpA.CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetCustAddrMultiLine') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetCustAddrMultiLine >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetCustAddrMultiLine >>>'
go


/* 
 * FUNCTION: GetCustAddrSingleLine 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustAddrSingleLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get 'best' pretty customer address SINGLE LINE
-- returns MAX 96 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetCustAddrSingleLine] (
	-- Add the parameters for the function here
	@CustomerID INT
	-- default : display suburb, state and postcode
	,@DoPostCode BIT = 1
	)
RETURNS NVARCHAR(96)
AS
BEGIN
	-- Used to strip-out line returns used in customer address
	DECLARE @NewLine CHAR(2);
	-- Declare the return variable here
	-- Don't forget to assign the size of the NVARCHAR else result will only hold one charcter 
	DECLARE @Result NVARCHAR(96)

	SET @NewLine = CHAR(13) + CHAR(10);
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @CustomerID IS NULL
		OR @CustomerID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT Customer.CustomerID
			,CustAddress.CreatedOn
			,CustAddress.SortList
			,CustAddress.AddressTypeID
			,SUBSTRING(REPLACE(CustAddress.Address, @NewLine, ' '), 1, 64) AS xAddress
			,CONCAT (
				Postcode.Suburb
				,', '
				,Postcode.STATE
				,' '
				,Postcode.Postcode
				) AS xPostcode
		FROM Customer
		INNER JOIN CustAddress ON Customer.CustomerID = CustAddress.CustomerID
		INNER JOIN Postcode ON CustAddress.PostcodeID = Postcode.PostcodeID
		WHERE Customer.CustomerID = @CustomerID
			AND CustAddress.IsArchived <> 1
			AND CustAddress.Address IS NOT NULL
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (
			CASE 
				WHEN @DoPostCode = 1
					THEN SUBSTRING(CONCAT (
								TmpA.xAddress
								,' '
								,TmpA.xPostcode
								), 1, 96)
				ELSE TmpA.xAddress
				END
			)
	FROM TmpA
	ORDER BY
		-- GROUP ON CUSTOMER - REDUNDANT
		TmpA.CustomerID ASC
		-- User custom sorts the addresses by priority NULL LAST
		,CASE 
			WHEN TmpA.SortList IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.SortList ASC
		-- The primary address has preference NULL LAST
		,CASE 
			WHEN TmpA.AddressTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.AddressTypeID ASC
		-- Last resort - date created
		,TmpA.CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetCustAddrSingleLine') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetCustAddrSingleLine >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetCustAddrSingleLine >>>'
go


/* 
 * FUNCTION: GetCustContactID 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustContactID]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer's HR contact
-- =============================================
CREATE OR ALTER  FUNCTION [dbo].[GetCustContactID] (
    -- Add the parameters for the function here
    @CustomerID INT
    )
RETURNS INT
AS
BEGIN
    DECLARE @Result AS INT;
    -- DEFAULT return value
    SET @Result = NULL;

    -- TRAP BAD HR ID
    IF @CustomerID IS NULL
        OR @CustomerID = 0
        RETURN @Result;

    -- CTE table - TmpA 
    WITH TmpA
    AS (
        SELECT CustContact.HRID
			, CustContact.CustomerID
            , CustContact.CreatedOn
            , CustContact.SortList
            , CustContact.CustContactID
			, CustContact.ContactTypeID
        FROM HR
        INNER JOIN CustContact
            ON HR.HRID = CustContact.HRID
        WHERE CustContact.CustomerID = @CustomerID
            AND CustContact.IsArchived <> 1
            AND CustContact.HRID IS NOT NULL
        )
    -- Add the T-SQL statements to compute the return value here
    SELECT TOP 1 @Result = (TmpA.HRID)
    FROM TmpA
    ORDER BY 
		-- GROUP ON CUSTOMER - REDUNDANT
		TmpA.CustomerID ASC
		-- User custom sorts the addresses by priority NULL LAST
        , CASE WHEN TmpA.SortList IS NULL THEN 0 ELSE 1 END DESC, TmpA.SortList ASC
		-- The primary address has preference NULL LAST
		, CASE WHEN TmpA.ContactTypeID IS NULL THEN 0 ELSE 1 END DESC, TmpA.ContactTypeID ASC
		-- Last resort - date created
        , TmpA.CreatedOn DESC

    -- Return the result of the function
    RETURN @Result
END
GO



go
IF OBJECT_ID('GetCustContactID') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetCustContactID >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetCustContactID >>>'
go


/* 
 * FUNCTION: GetCustContactNum 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustContactNum]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer AddressID
-- =============================================
CREATE OR ALTER  FUNCTION [dbo].[GetCustContactNum] (
	-- Add the parameters for the function here
	@CustomerID INT
	)
RETURNS NVARCHAR(64)
AS
BEGIN
	-- Declare the return variable here
	-- Don't forget to assign the size of the NVARCHAR else result will only hold one charcter 
	DECLARE @Result NVARCHAR(64)

	-- DEFAULT :: NULLSTRING
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @CustomerID IS NULL
		OR @CustomerID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT dbo.CustContactNum.CustContactNumID
			,dbo.CustContactNum.CustomerID
			,dbo.CustContactNum.SortList
			,dbo.CustContactNum.ContactNumTypeID
			,dbo.CustContactNum.CreatedOn
			,dbo.CustContactNum.ContactNum
			,dbo.CustContactNum.IsArchived
		FROM dbo.CustContactNum
		WHERE (
				(dbo.CustContactNum.CustomerID = @CustomerID)
				AND (dbo.CustContactNum.ContactNum IS NOT NULL)
				AND (dbo.CustContactNum.IsArchived <> 1)
				)
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (TmpA.ContactNum)
	FROM TmpA
	ORDER BY
		-- GROUP ON Cust - REDUNDANT
		CustomerID ASC
		-- User custom sorts the contact numbers by priority NULL LAST
		,CASE 
			WHEN SortList IS NULL
				THEN 0
			ELSE 1
			END DESC
		,SortList ASC
		-- The primary number has preference NULL LAST
		,CASE 
			WHEN ContactNumTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,ContactNumTypeID ASC
		-- Last resort - date created
		,CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetCustContactNum') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetCustContactNum >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetCustContactNum >>>'
go


/* 
 * FUNCTION: GetCustEmail 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustEmail]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer email Address
-- =============================================
CREATE  OR ALTER FUNCTION [dbo].[GetCustEmail] (
	-- Add the parameters for the function here
	@CustomerID INT
	)
RETURNS NVARCHAR(128)
AS
BEGIN
	DECLARE @Result NVARCHAR(128)

	-- DEFAULT :: NULLSTRING
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @CustomerID IS NULL
		OR @CustomerID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT dbo.CustEmail.CustEmailID
			,dbo.CustEmail.CustomerID
			,dbo.CustEmail.SortList
			,dbo.CustEmail.EmailTypeID
			,dbo.CustEmail.CreatedOn
			,dbo.CustEmail.Email
			,dbo.CustEmail.IsArchived
		FROM dbo.CustEmail
		WHERE (
				(dbo.CustEmail.CustomerID = @CustomerID)
				AND (dbo.CustEmail.Email IS NOT NULL)
				AND (dbo.CustEmail.IsArchived <> 1)
				)
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (TmpA.Email)
	FROM TmpA
	ORDER BY
		-- GROUP ON Cust - REDUNDANT
		CustomerID ASC
		-- User custom sorts the contact numbers by priority NULL LAST
		,CASE 
			WHEN SortList IS NULL
				THEN 0
			ELSE 1
			END DESC
		,SortList ASC
		-- The primary number has preference NULL LAST
		,CASE 
			WHEN EmailTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,EmailTypeID ASC
		-- Last resort - date created
		,CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetCustEmail') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetCustEmail >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetCustEmail >>>'
go


/* 
 * FUNCTION: GetCustSiteContactSingleLine 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustSiteContactSingleLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get the site's contact name and number
-- returns MAX 96 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetCustSiteContactSingleLine] (
	-- Add the parameters for the function here
	@CustSiteID INT
	-- default : display contact's number
	, @DoHRContactNum BIT = 1
	)
RETURNS NVARCHAR(96)
AS
BEGIN
	DECLARE @Result NVARCHAR(96);

	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @CustSiteID IS NULL
		OR @CustSiteID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT CustSite.CustSiteID
			,CustSite.SiteContactID
			,CONCAT (
				HR.FirstName
				,' '
				,UPPER(HR.LastName)
				) AS FName
			,dbo.GetHRContactNum(CustSite.SiteContactID) AS SiteContactNum
		FROM CustSite
		INNER JOIN HR ON CustSite.SiteContactID = HR.HRID
		WHERE CustSite.SiteContactID IS NOT NULL AND CustSite.CustSiteID = @CustSiteID
		)
	-- Add the T-SQL statements to compute the return value here
		SELECT TOP 1 @Result = (
				SUBSTRING(CASE 
						WHEN FName IS NULL
							THEN ''
						ELSE CASE 
								WHEN LEN(SiteContactNum) > 0
									THEN CONCAT (
											TmpA.FName
											,' '
											,IIF(@DoHRContactNum = 1, ' (' + TmpA.SiteContactNum + ')', '')
											)
								ELSE TmpA.FName
								END
						END, 1, 96)
				)

	FROM TmpA

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetCustSiteContactSingleLine') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetCustSiteContactSingleLine >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetCustSiteContactSingleLine >>>'
go


/* 
 * FUNCTION: GetHRAddressID 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHRAddressID]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' HR AddressID
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetHRAddressID] (
    -- Add the parameters for the function here
    @HRID INT
    )
RETURNS INT
AS
BEGIN
    DECLARE @Result AS INT;
    -- DEFAULT return value
    SET @Result = NULL;

    -- TRAP BAD HR ID
    IF @HRID IS NULL
        OR @HRID = 0
        RETURN @Result;

    -- CTE table - TmpA 
    WITH TmpA
    AS (
        SELECT HR.HRID
            , HRAddress.CreatedOn
            , HRAddress.SortList
            , HRAddress.HRAddressID
			, HRAddress.AddressTypeID
        FROM HR
        INNER JOIN HRAddress
            ON HR.HRID = HRAddress.HRID
        WHERE HR.HRID = @HRID
            AND HRAddress.IsArchived <> 1
            AND HRAddress.Address IS NOT NULL
        )
    -- Add the T-SQL statements to compute the return value here
    SELECT TOP 1 @Result = (TmpA.HRAddressID)
    FROM TmpA
    ORDER BY 
		-- GROUP ON CUSTOMER - REDUNDANT
		TmpA.HRID ASC
		-- User custom sorts the addresses by priority NULL LAST
        , CASE WHEN TmpA.SortList IS NULL THEN 0 ELSE 1 END DESC, TmpA.SortList ASC
		-- The primary address has preference NULL LAST
		, CASE WHEN TmpA.AddressTypeID IS NULL THEN 0 ELSE 1 END DESC, TmpA.AddressTypeID ASC
		-- Last resort - date created
        , TmpA.CreatedOn DESC

    -- Return the result of the function
    RETURN @Result
END
GO



go
IF OBJECT_ID('GetHRAddressID') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetHRAddressID >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetHRAddressID >>>'
go


/* 
 * FUNCTION: GetHRAddrMultiLine 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHRAddrMultiLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get 'best' pretty HR address - MULTI-LINE
-- returns MAX 128 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetHRAddrMultiLine] (
	-- Add the parameters for the function here
	@HRID INT
	)
RETURNS NVARCHAR(128)
AS
BEGIN
	-- Used to strip-out line returns used in HR address
	DECLARE @NewLine CHAR(2);
	-- Declare the return variable here
	-- Don't forget to assign the size of ALL NVARCHARs else default is one charcter 
	DECLARE @Result NVARCHAR(128)

	SET @NewLine = CHAR(13) + CHAR(10);
	-- DEFAULT :: returns NULL string
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @HRID IS NULL
		OR @HRID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT HR.HRID
			,HRAddress.CreatedOn
			,HRAddress.SortList
			,HRAddress.AddressTypeID
			,SUBSTRING(HRAddress.Address, 1, 64) AS xAddress
			,CONCAT (
				Postcode.Suburb
				,', '
				,Postcode.STATE
				,' '
				,Postcode.Postcode
				) AS xPostcode
		FROM HR
		INNER JOIN HRAddress ON HR.HRID = HRAddress.HRID
		INNER JOIN Postcode ON HRAddress.PostcodeID = Postcode.PostcodeID
		WHERE HR.HRID = @HRID
			AND HRAddress.IsArchived <> 1
			AND HRAddress.Address IS NOT NULL
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (
			SUBSTRING(CONCAT (
					TmpA.xAddress
					,@NewLine
					,TmpA.xPostcode
					), 1, 128)
			)
	FROM TmpA
	ORDER BY
		-- GROUP ON CUSTOMER - REDUNDANT
		TmpA.HRID ASC
		-- User custom sorts the addresses by priority NULL LAST
		,CASE 
			WHEN TmpA.SortList IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.SortList DESC
		-- The primary address has preference NULL LAST
		,CASE 
			WHEN TmpA.AddressTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.AddressTypeID DESC
		-- Last resort - date created
		,TmpA.CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetHRAddrMultiLine') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetHRAddrMultiLine >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetHRAddrMultiLine >>>'
go


/* 
 * FUNCTION: GetHRAddrSingleLine 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHRAddrSingleLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get 'best' pretty customer address SINGLE LINE
-- returns MAX 96 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetHRAddrSingleLine] (
	-- Add the parameters for the function here
	@HRID INT
	-- default : display suburb, state and postcode
	,@DoPostCode BIT = 1
	)
RETURNS NVARCHAR(96)
AS
BEGIN
	-- Used to strip-out line returns used in customer address
	DECLARE @NewLine CHAR(2);
	-- Declare the return variable here
	-- Don't forget to assign the size of the NVARCHAR else result will only hold one charcter 
	DECLARE @Result NVARCHAR(96)

	SET @NewLine = CHAR(13) + CHAR(10);
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @HRID IS NULL
		OR @HRID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT HR.HRID
			,HRAddress.CreatedOn
			,HRAddress.SortList
			,HRAddress.AddressTypeID
			,SUBSTRING(REPLACE(HRAddress.Address, @NewLine, ' '), 1, 64) AS xAddress
			,CONCAT (
				Postcode.Suburb
				,', '
				,Postcode.STATE
				,' '
				,Postcode.Postcode
				) AS xPostcode
		FROM HR
		INNER JOIN HRAddress ON HR.HRID = HRAddress.HRID
		INNER JOIN Postcode ON HRAddress.PostcodeID = Postcode.PostcodeID
		WHERE HR.HRID = @HRID
			AND HRAddress.IsArchived <> 1
			AND HRAddress.Address IS NOT NULL
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (
			CASE 
				WHEN @DoPostCode = 1
					THEN SUBSTRING(CONCAT (
								TmpA.xAddress
								,' '
								,TmpA.xPostcode
								), 1, 96)
				ELSE TmpA.xAddress
				END
			)
	FROM TmpA
	ORDER BY
		-- GROUP ON HR - REDUNDANT
		TmpA.HRID ASC
		-- User custom sorts the addresses by priority NULL LAST
		,CASE 
			WHEN TmpA.SortList IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.SortList ASC
		-- The primary address has preference NULL LAST
		,CASE 
			WHEN TmpA.AddressTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,TmpA.AddressTypeID ASC
		-- Last resort - date created
		,TmpA.CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetHRAddrSingleLine') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetHRAddrSingleLine >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetHRAddrSingleLine >>>'
go


/* 
 * FUNCTION: GetHRContactNum 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHRContactNum]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer AddressID
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetHRContactNum] (
	-- Add the parameters for the function here
	@HRID INT
	)
RETURNS NVARCHAR(64)
AS
BEGIN
	-- Declare the return variable here
	-- Don't forget to assign the size of the NVARCHAR else result will only hold one charcter 
	DECLARE @Result NVARCHAR(64)

	-- DEFAULT :: NULLSTRING
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @HRID IS NULL
		OR @HRID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT dbo.HRContactNum.HRContactNumID
			,dbo.HRContactNum.HRID
			,dbo.HRContactNum.SortList
			,dbo.HRContactNum.ContactNumTypeID
			,dbo.HRContactNum.CreatedOn
			,dbo.HRContactNum.ContactNum
			,dbo.HRContactNum.IsArchived
		FROM dbo.HRContactNum
		WHERE (
				(dbo.HRContactNum.HRID = @HRID)
				AND (dbo.HRContactNum.ContactNum IS NOT NULL)
				AND (dbo.HRContactNum.IsArchived <> 1)
				)
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (TmpA.ContactNum)
	FROM TmpA
	ORDER BY
		-- GROUP ON HR - REDUNDANT
		HRID ASC
		-- User custom sorts the contact numbers by priority NULL LAST
		,CASE 
			WHEN SortList IS NULL
				THEN 0
			ELSE 1
			END DESC
		,SortList ASC
		-- The primary number has preference NULL LAST
		,CASE 
			WHEN ContactNumTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,ContactNumTypeID ASC
		-- Last resort - date created
		,CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetHRContactNum') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetHRContactNum >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetHRContactNum >>>'
go


/* 
 * FUNCTION: GetHRContactSingleLine 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHRContactSingleLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get the FULL NAME and contact number of the HR
-- returns MAX 96 CHARs
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[GetHRContactSingleLine] (
	-- Add the parameters for the function here
	@HRID INT
	-- default : display contact's number
	, @DoHRContactNum BIT = 1
	)
RETURNS NVARCHAR(96)
AS
BEGIN
	DECLARE @Result NVARCHAR(96);

	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @HRID IS NULL
		OR @HRID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	SELECT  @Result = (
		SUBSTRING(CASE WHEN @DoHRContactNum = 1 THEN
			CONCAT (HR.FirstName,' ',UPPER(HR.LastName), iif(LEN(dbo.GetHRContactNum(HR.HRID)) = 0, '', ' ('+dbo.GetHRContactNum(HR.HRID)+ ')')	)
		ELSE
			CONCAT (HR.FirstName,' ',UPPER(HR.LastName))
		END, 1, 96)
		)

		FROM dbo.HR
		WHERE HR.HRID = @HRID

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetHRContactSingleLine') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetHRContactSingleLine >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetHRContactSingleLine >>>'
go


/* 
 * FUNCTION: GetHREmail 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetHREmail]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Returns the 'best' customer email Address
-- =============================================
CREATE  OR ALTER FUNCTION [dbo].[GetHREmail] (
	-- Add the parameters for the function here
	@HRID INT
	)
RETURNS NVARCHAR(128)
AS
BEGIN
	DECLARE @Result NVARCHAR(128)

	-- DEFAULT :: NULLSTRING
	SET @Result = '';

	-- TRAP BAD HRID
	IF @HRID IS NULL
		OR @HRID = 0
		RETURN @Result;

	-- CTE table - TmpA 
	WITH TmpA
	AS (
		SELECT dbo.HREmail.HREmailID
			,dbo.HREmail.HRID
			,dbo.HREmail.SortList
			,dbo.HREmail.EmailTypeID
			,dbo.HREmail.CreatedOn
			,dbo.HREmail.Email
			,dbo.HREmail.IsArchived
		FROM dbo.HREmail
		WHERE (
				(dbo.HREmail.HRID = @HRID)
				AND (dbo.HREmail.Email IS NOT NULL)
				AND (dbo.HREmail.IsArchived <> 1)
				)
		)
	-- Add the T-SQL statements to compute the return value here
	SELECT TOP 1 @Result = (TmpA.Email)
	FROM TmpA
	ORDER BY
		-- GROUP ON HR - REDUNDANT
		HRID ASC
		-- User custom sorts the contact numbers by priority NULL LAST
		,CASE 
			WHEN SortList IS NULL
				THEN 0
			ELSE 1
			END DESC
		,SortList ASC
		-- The primary number has preference NULL LAST
		,CASE 
			WHEN EmailTypeID IS NULL
				THEN 0
			ELSE 1
			END DESC
		,EmailTypeID ASC
		-- Last resort - date created
		,CreatedOn DESC

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetHREmail') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetHREmail >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetHREmail >>>'
go


/* 
 * FUNCTION: GetSiteAddrMultiLine 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSiteAddrMultiLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get pretty site address SINGLE LINE
-- returns MAX 96 CHARs
-- =============================================
CREATE OR ALTER  FUNCTION [dbo].[GetSiteAddrMultiLine] (
	-- Add the parameters for the function here
	@SiteID INT
	)
RETURNS NVARCHAR(96)
AS
BEGIN
	-- Used to strip-out line returns used in customer address
	DECLARE @NewLine CHAR(2);
	-- Declare the return variable here
	-- Don't forget to assign the size of the NVARCHAR else result will only hold one charcter 
	DECLARE @Result NVARCHAR(96)

	SET @NewLine = CHAR(13) + CHAR(10);
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @SiteID IS NULL
		OR @SiteID = 0
		RETURN @Result;

	SELECT TOP 1 @Result = (
		SUBSTRING(CONCAT (
					SUBSTRING(Site.Address, 1, 64)
					,@NewLine
					,Postcode.Suburb
					,', '
					,Postcode.STATE
					,' '
					,Postcode.Postcode
					), 1, 96)
	)
	FROM Site
	INNER JOIN Postcode ON Site.PostcodeID = Postcode.PostcodeID
	WHERE Site.SiteID = @SiteID
		AND Site.Address IS NOT NULL

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetSiteAddrMultiLine') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetSiteAddrMultiLine >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetSiteAddrMultiLine >>>'
go


/* 
 * FUNCTION: GetSiteAddrSingleLine 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[GetSiteAddrSingleLine]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrose
-- Create date: 25/12/2021
-- Description:	Get pretty site address SINGLE LINE
-- returns MAX 96 CHARs
-- =============================================
CREATE OR ALTER    FUNCTION [dbo].[GetSiteAddrSingleLine] (
	-- Add the parameters for the function here
	@SiteID INT
	-- default : display suburb, state and postcode
	,@DoPostCode BIT = 1
	)
RETURNS NVARCHAR(96)
AS
BEGIN
	-- Used to strip-out line returns used in customer address
	DECLARE @NewLine CHAR(2);
	-- Declare the return variable here
	-- Don't forget to assign the size of the NVARCHAR else result will only hold one charcter 
	DECLARE @Result NVARCHAR(96)

	SET @NewLine = CHAR(13) + CHAR(10);
	SET @Result = '';

	-- TRAP BAD CUSTOMER ID
	IF @SiteID IS NULL
		OR @SiteID = 0
		RETURN @Result;


	SELECT TOP 1 @Result = (
			CASE 
				WHEN @DoPostCode = 1
					THEN SUBSTRING(CONCAT (
								SUBSTRING(REPLACE(Site.Address, @NewLine, ' '), 1, 64)
								,' '
								,Postcode.Suburb
								,', '
								,Postcode.STATE
								,' '
								,Postcode.Postcode
								), 1, 96)
				ELSE SUBSTRING(REPLACE(Site.Address, @NewLine, ' '), 1, 96)
				END
			)
	FROM Site
	INNER JOIN Postcode ON Site.PostcodeID = Postcode.PostcodeID
	WHERE Site.SiteID = @SiteID
		AND Site.Address IS NOT NULL

	-- Return the result of the function
	RETURN @Result
END
GO



go
IF OBJECT_ID('GetSiteAddrSingleLine') IS NOT NULL
    PRINT '<<< CREATED FUNCTION GetSiteAddrSingleLine >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION GetSiteAddrSingleLine >>>'
go


/* 
 * FUNCTION: LastPassedInspection 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[LastPassedInspection]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Ambrose
-- Create date: 9/10/2021
-- Description:	DateTime of the last known 'passed' inspection 
--	for the equipment located at the given station.
-- PARAMS:
--	1. The station ID
--	2. MINOR or MAJOR life-cycle option. DEFAULT: find the last MAJOR DateTime.
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[LastPassedInspection] 
(
	-- Add the parameters for the function here
	@StationID int
	,@DoMajor BIT
)
-- Returns the date the equipment was inspected on. 
--	if InspectedOn is null then returns RequestedDT (the date of inspection)
RETURNS DateTime
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result DateTime;
	DECLARE @DT as DateTime;

	-- DEFAULT is return last Major LC Service
	IF @DoMajor IS NULL SET @DoMajor = 1; 


	-- =============================================
	-- Multi CTE table statements
	-- =============================================


	-- CTE table - TmpA 
	-- Retrive the EquipmentID and StationNum.
	-- Ignore stations with empty LifeCycleSeed DateTimes
	WITH TmpA AS 
	(
		SELECT StationNum
			, EquipmentID
			, SiteID
		FROM Station
		WHERE StationID = @StationID
			AND LifeCycleSeed IS NOT NULL
	)
	,
	-- CTE table - TmpB
	-- Pull TESTs for the given SITE, narrow list by station number and equipment type.
	-- NOTE: TEST and STATION are loosly paired by a Non-Specific relationship via fieldname ReferenceID
	--		This isn't used here...
	--		The inspection status was COMPLETED 
	TmpB AS 
	(
		SELECT InspectionOrder.InspectedOn
			, InspectionOrder.RequestedDT
			, InspectionOrder.SiteID
			, Test.EquipmentID
			, Test.StationNum
		FROM InspectionOrder
		INNER JOIN Test
			ON InspectionOrder.InspectionOrderID = Test.InspectionOrderID
		-- The inspection order was COMPLETED
		WHERE (InspectionOrder.InspectionStatusID = 2)
			-- The equipment passed the inspection
			-- DEPRECIATED : New criteria - they station equipment only has to be attended by the Technician
			-- for this to be the last valid inspection DateTime
			-- AND (Test.Passed = 1)
			-- PARAM 2: option MINOR or MAJOR
			AND (
				(
					TestLifeCycleID = (
						CASE @DoMajor
							WHEN 1
								THEN 2
							WHEN 0
								THEN 1
							END
						)
					)
				)
	)

	-- =============================================
	-- Computed return value here
	-- =============================================
	SELECT TOP 1 @Result = 
		(CASE 
			WHEN InspectedOn IS NULL THEN RequestedDT
			ELSE InspectedOn 
		END )
	FROM TmpB
		INNER JOIN tmpA
			ON tmpA.SiteID = TmpB.SiteID
				AND tmpA.EquipmentID = TmpB.EquipmentID
				AND tmpA.StationNum = TmpB.StationNum
		ORDER BY TmpB.RequestedDT DESC

	-- =============================================
	-- Return the result of the function
	-- =============================================
	RETURN @Result

END
GO



go
IF OBJECT_ID('LastPassedInspection') IS NOT NULL
    PRINT '<<< CREATED FUNCTION LastPassedInspection >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION LastPassedInspection >>>'
go


/* 
 * FUNCTION: NextLifeCycle 
 */

USE [IDFES]
GO
/****** Object:  UserDefinedFunction [dbo].[NextLifeCycle]    Script Date: 16/01/2022 1:04:23 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Ben Ambrose
-- Create date: 12/10/2021
-- Description:	Compute the next Life Cycle service date.
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[NextLifeCycle] 
(
	-- Add the parameters for the function here
	@StationID int
	,@DoMajor BIT
)
RETURNS DateTime
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result DateTime

	DECLARE @LastPassedInspection DATETIME;
	DECLARE @Interval FLOAT;
	DECLARE @Months INT;
	DECLARE @Count INT;
	DECLARE @SeedDate DATETIME;
	DECLARE @ComputeDate DATETIME;

	Set @Result = NULL;

	-- DEFAULT: Compute last Major LC Service
	IF @DoMajor IS NULL
		SET @DoMajor = 1;


	-- Get commission date for equipment (LifeCycle seed date).
	SELECT @SeedDate = LifeCycleSeed 
		FROM Station
		WHERE StationID = @StationID;
	-- REQUIRED.
	IF @SeedDate IS NULL GOTO Jump01

	-- Get interval used for MINOR\MAJOR life cycle services.
	SELECT @Interval = 
		iif(@DoMajor = 1, MajorLifeCycle, MinorLifeCycle)
		FROM Station
		INNER JOIN Equipment ON Station.EquipmentID = Equipment.EquipmentID
		INNER JOIN EquipType ON Equipment.EquipTypeID = EquipType.EquipTypeID
		WHERE StationID = @StationID;
	-- REQUIRED
	IF @Interval IS NULL GOTO Jump01 

	-- Get last qualified passed inspection date
    Set @LastPassedInspection = dbo.LastPassedInspection(@StationID, @DoMajor);

	-- NO INSPECTIONS DONE: NEXT LIFE CYCLE = SEED-DATE
    if @LastPassedInspection IS NULL 
		Set @Result = @SeedDate

	-- if the seed date has been assigned, then an interval adjust isn't performed
	if @Result IS NOT NULL
		GOTO Jump01

	-- Which date preseeds...
    if @LastPassedInspection < @SeedDate
		Set @Result = @SeedDate

	-- if the seed date has been assigned, then an interval adjust isn't performed
	if @Result IS NOT NULL
		GOTO Jump01

	-- Current state 
	-- LastPassedInspection is not null
	-- LastPassedInspection is greater than the SeedDate...

	-- DO AN INTERVAL ADJUST ON THE LAST PASSED INSPECTION ORDER

	-- Count life-cycle intervals between SeedDate and LastPassedInspection
	Set @Months = DATEDIFF(MONTH, @SeedDate, @LastPassedInspection);
	-- (LOWER BOUND) Count of service intervals needed to just preceed or equal the date of the LastPassedInspection 
	Set @Count = FLOOR(CAST(@Months AS FLOAT) / @Interval)
	-- FINAL LifeCycle date -  post dating the last passed inspection date.
	Set @ComputeDate = DATEADD(month,  (@Interval * (@Count+1)), @SeedDate); 

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = @ComputeDate

Jump01:
	-- Return the result of the function
	RETURN @Result

END
GO



go
IF OBJECT_ID('NextLifeCycle') IS NOT NULL
    PRINT '<<< CREATED FUNCTION NextLifeCycle >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION NextLifeCycle >>>'
go


