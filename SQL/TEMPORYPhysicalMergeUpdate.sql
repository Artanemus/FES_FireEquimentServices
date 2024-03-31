USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.PowerBoard DROP CONSTRAINT Site_PowerBoard
go
EXEC sp_rename 'dbo.PowerBoard.PK275','PK_PowerBoard','INDEX'
go
EXEC sp_rename 'dbo.Role.PK123','PK_Role','INDEX'
go
ALTER TABLE dbo.RoleList DROP CONSTRAINT HR_RoleList
go
ALTER TABLE dbo.RoleList DROP CONSTRAINT Role_RoleList
go
EXEC sp_rename 'dbo.RoleList.PK124','PK_RoleList','INDEX'
go
ALTER TABLE dbo.Site DROP CONSTRAINT Postcode_Site
go
EXEC sp_rename 'dbo.Site.PK163','PK_Site','INDEX'
go
ALTER TABLE dbo.Station DROP CONSTRAINT Equipment_Station
go
ALTER TABLE dbo.Station DROP CONSTRAINT CoreGroup_Station
go
ALTER TABLE dbo.Station DROP CONSTRAINT Site_Station
go
ALTER TABLE dbo.Station DROP COLUMN CoreGroupID
go
EXEC sp_rename 'dbo.Station.PK154','PK_Station','INDEX'
go
ALTER TABLE dbo.SurveyOrder DROP CONSTRAINT CustSite_SurveyOrder
go
ALTER TABLE dbo.SurveyOrder DROP CONSTRAINT HR_SurveyOrder
go
ALTER TABLE dbo.SurveyOrder DROP CONSTRAINT SurveyStatus_SurveyOrder
go
EXEC sp_rename 'dbo.SurveyOrder.PK198','PK_SurveyOrder','INDEX'
go
EXEC sp_rename 'dbo.SurveyStatus.PK228','PK_SurveyStatus','INDEX'
go
ALTER TABLE dbo.Test DROP CONSTRAINT Equipment_Test
go
ALTER TABLE dbo.Test DROP CONSTRAINT InspectionOrder_Test
go
ALTER TABLE dbo.Test DROP CONSTRAINT TestResult_Test
go
ALTER TABLE dbo.Test DROP CONSTRAINT TestResult_T36
go
ALTER TABLE dbo.Test DROP CONSTRAINT TestAction_Test
go
ALTER TABLE dbo.Test DROP CONSTRAINT TestLifeCycle_Test
go
EXEC sp_rename 'dbo.Test.PK217','PK_Test','INDEX'
go
EXEC sp_rename 'dbo.TestAction.PK250','PK_TestAction','INDEX'
go
EXEC sp_rename 'dbo.TestLifeCycle.PK252','PK_TestLifeCycle','INDEX'
go
EXEC sp_rename 'dbo.TestResult.PK267','PK_TestResult','INDEX'
go
EXEC sp_rename 'dbo.AddressType.PK150','PK_AddressType','INDEX'
go
EXEC sp_rename 'dbo.ChemicalType.PK214','PK_ChemicalType','INDEX'
go
ALTER TABLE dbo.CompanyInfo DROP CONSTRAINT Postcode_CompanyInfoPostal
go
ALTER TABLE dbo.CompanyInfo DROP CONSTRAINT Postcode_CompanyInfo
go
ALTER TABLE dbo.CompanyInfo DROP CONSTRAINT Global_CompanyInfo
go
EXEC sp_rename 'dbo.CompanyInfo.PK105','PK_CompanyInfo','INDEX'
go
EXEC sp_rename 'dbo.ContactType.PK152','PK_ContactType','INDEX'
go
EXEC sp_rename 'dbo.CoreGroup.PK268','PK_CoreGroup','INDEX'
go
ALTER TABLE dbo.CustAddress DROP CONSTRAINT AddressType_CustAddress
go
ALTER TABLE dbo.CustAddress DROP CONSTRAINT Postcode_CustAddress
go
ALTER TABLE dbo.CustAddress DROP CONSTRAINT Customer_CustAddress
go
EXEC sp_rename 'dbo.CustAddress.PK142','PK_CustAddress','INDEX'
go
ALTER TABLE dbo.CustContact DROP CONSTRAINT ContactType_CustContact
go
ALTER TABLE dbo.CustContact DROP CONSTRAINT HR_CustContact
go
ALTER TABLE dbo.CustContact DROP CONSTRAINT Customer_CustContact
go
EXEC sp_rename 'dbo.CustContact.PK317','PK_CustContact','INDEX'
go
ALTER TABLE dbo.CustEmail DROP CONSTRAINT EmailType_CustEmail
go
ALTER TABLE dbo.CustEmail DROP CONSTRAINT Customer_CustEmail
go
EXEC sp_rename 'dbo.CustEmail.PK315','PK_CustEmail','INDEX'
go
ALTER TABLE dbo.CustNumber DROP CONSTRAINT NumberType_CustNumber
go
ALTER TABLE dbo.CustNumber DROP CONSTRAINT Customer_CustNumber
go
EXEC sp_rename 'dbo.CustNumber.PK812','PK_CustNumber','INDEX'
go
EXEC sp_rename 'dbo.Customer.PK100','PK_Customer','INDEX'
go
EXEC sp_rename 'dbo.EmailType.PK151','PK_EmailType','INDEX'
go
EXEC sp_rename 'dbo.EquipBrand.PK215','PK_EquipBrand','INDEX'
go
ALTER TABLE dbo.Equipment DROP CONSTRAINT ChemicalType_Equipment
go
ALTER TABLE dbo.Equipment DROP CONSTRAINT EquipBrand_Equipment
go
ALTER TABLE dbo.Equipment DROP CONSTRAINT EquipType_Equipment
go
ALTER TABLE dbo.Equipment DROP CONSTRAINT LightLampType_Equipment
go
ALTER TABLE dbo.Equipment DROP CONSTRAINT LightType_Equipment
go
ALTER TABLE dbo.Equipment DROP CONSTRAINT LightFormFactor_Equipment
go
ALTER TABLE dbo.Equipment DROP CONSTRAINT HydrantType_Equipment
go
EXEC sp_rename 'dbo.Equipment.PK177','PK_Equipment','INDEX'
go
ALTER TABLE dbo.EquipType DROP CONSTRAINT CoreGroup_EquipType
go
EXEC sp_rename 'dbo.EquipType.PK178','PK_EquipType','INDEX'
go
EXEC sp_rename 'dbo.Global.PK233','PK_Global','INDEX'
go
EXEC sp_rename 'dbo.HR.PK167','PK_HR','INDEX'
go
ALTER TABLE dbo.HRAddress DROP CONSTRAINT AddressType_HRAddress
go
ALTER TABLE dbo.HRAddress DROP CONSTRAINT HR_HRAddress
go
ALTER TABLE dbo.HRAddress DROP CONSTRAINT Postcode_HRAddress
go
EXEC sp_rename 'dbo.HRAddress.PK141','PK_HRAddress','INDEX'
go
ALTER TABLE dbo.HREmail DROP CONSTRAINT EmailType_HREmail
go
ALTER TABLE dbo.HREmail DROP CONSTRAINT HR_HREmail
go
EXEC sp_rename 'dbo.HREmail.PK316','PK_HREmail','INDEX'
go
ALTER TABLE dbo.HRNumber DROP CONSTRAINT NumberType_HRNumber
go
ALTER TABLE dbo.HRNumber DROP CONSTRAINT HR_HRNumber
go
EXEC sp_rename 'dbo.HRNumber.PK811','PK_HRNumber','INDEX'
go
ALTER TABLE dbo.HRZone DROP CONSTRAINT HR_HRZone
go
ALTER TABLE dbo.HRZone DROP CONSTRAINT Postcode_HRZone
go
EXEC sp_rename 'dbo.HRZone.PK165','PK_HRZone','INDEX'
go
EXEC sp_rename 'dbo.HydrantType.PK266','PK_HydrantType','INDEX'
go
ALTER TABLE dbo.InspectionOrder DROP CONSTRAINT CustSite_InspectionOrder
go
ALTER TABLE dbo.InspectionOrder DROP CONSTRAINT HR_InspectionOrder
go
ALTER TABLE dbo.InspectionOrder DROP CONSTRAINT InspectionStatus_InspectionOrder
go
EXEC sp_rename 'dbo.InspectionOrder.PK197','PK_InspectionOrder','INDEX'
go
EXEC sp_rename 'dbo.InspectionStatus.PK235','PK_InspectionStatus','INDEX'
go
EXEC sp_rename 'dbo.LightFormFactor.PK264','PK_LightFormFactor','INDEX'
go
EXEC sp_rename 'dbo.LightLampType.PK180','PK_LightLampType','INDEX'
go
EXEC sp_rename 'dbo.LightType.PK179','PK_LightType','INDEX'
go
ALTER TABLE dbo.Log DROP CONSTRAINT CompanyInfo_Log
go
ALTER TABLE dbo.Log DROP CONSTRAINT LogCaller_Log
go
ALTER TABLE dbo.Log DROP CONSTRAINT LogErrLevel_Log
go
EXEC sp_rename 'dbo.Log.PK241','PK_Log','INDEX'
go
EXEC sp_rename 'dbo.LogCaller.PK242','PK_LogCaller','INDEX'
go
EXEC sp_rename 'dbo.LogErrLevel.PK244','PK_LogErrLevel','INDEX'
go
EXEC sp_rename 'dbo.NumberType.PK153','PK_NumberType','INDEX'
go
EXEC sp_rename 'dbo.Postcode.PK171','PK_Postcode','INDEX'
go
ALTER TABLE dbo.PowerBoard ADD CONSTRAINT SitePowerBoard
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
go
ALTER TABLE dbo.RoleList ADD CONSTRAINT HRRoleList
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.RoleList ADD CONSTRAINT RoleRoleList
FOREIGN KEY (RoleID)
REFERENCES dbo.Role (RoleID)
go
ALTER TABLE dbo.Site ADD CONSTRAINT PostcodeSite
FOREIGN KEY (PostcodeID)
REFERENCES dbo.Postcode (PostcodeID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT EquipmentStation
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT SiteStation
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
go
ALTER TABLE dbo.SurveyOrder ADD CONSTRAINT HRSurveyOrder
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.SurveyOrder ADD CONSTRAINT SurveyStatusSurveyOrder
FOREIGN KEY (SurveyStatusID)
REFERENCES dbo.SurveyStatus (SurveyStatusID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT EquipmentTest
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT InspectionOrderTest
FOREIGN KEY (InspectionOrderID)
REFERENCES dbo.InspectionOrder (InspectionOrderID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestResultTestA
FOREIGN KEY (TestA)
REFERENCES dbo.TestResult (TestResultID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestResultTestB
FOREIGN KEY (TestB)
REFERENCES dbo.TestResult (TestResultID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestActionTest
FOREIGN KEY (TestActionID)
REFERENCES dbo.TestAction (TestActionID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestLifeCycleTest
FOREIGN KEY (TestLifeCycleID)
REFERENCES dbo.TestLifeCycle (TestLifeCycleID)
go
ALTER TABLE dbo.CompanyInfo ADD CONSTRAINT GlobalCompanyInfo
FOREIGN KEY (GlobalID)
REFERENCES dbo.[Global] (GlobalID)
go
ALTER TABLE dbo.CompanyInfo ADD CONSTRAINT PostcodeCompanyInfoPostal
FOREIGN KEY (PostalPostcodeID)
REFERENCES dbo.Postcode (PostcodeID)
go
ALTER TABLE dbo.CompanyInfo ADD CONSTRAINT PostcodeCompanyIinfo
FOREIGN KEY (PostcodeID)
REFERENCES dbo.Postcode (PostcodeID)
go
ALTER TABLE dbo.CustAddress ADD CONSTRAINT AddressTypeCustAddress
FOREIGN KEY (AddressTypeID)
REFERENCES dbo.AddressType (AddressTypeID)
go
ALTER TABLE dbo.CustAddress ADD CONSTRAINT PostcodeCustAddress
FOREIGN KEY (PostcodeID)
REFERENCES dbo.Postcode (PostcodeID)
go
ALTER TABLE dbo.CustAddress ADD CONSTRAINT CustomerCustAddress
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustContact ADD CONSTRAINT CustomerCustContact
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustContact ADD CONSTRAINT ContactTypeCustContact
FOREIGN KEY (ContactTypeID)
REFERENCES dbo.ContactType (ContactTypeID)
go
ALTER TABLE dbo.CustContact ADD CONSTRAINT HRCustContact
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.CustEmail ADD CONSTRAINT CustomerCustEmail
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustEmail ADD CONSTRAINT EmailTypeCustEmail
FOREIGN KEY (EmailTypeID)
REFERENCES dbo.EmailType (EmailTypeID)
go
ALTER TABLE dbo.CustNumber ADD CONSTRAINT CustomerCustNumber
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustNumber ADD CONSTRAINT NumberTypeCustNumber
FOREIGN KEY (NumberTypeID)
REFERENCES dbo.NumberType (NumberTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT ChemicalTypeEquipment
FOREIGN KEY (ChemicalTypeID)
REFERENCES dbo.ChemicalType (ChemicalTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT EquipBrandEquipment
FOREIGN KEY (EquipBrandID)
REFERENCES dbo.EquipBrand (EquipBrandID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT EquipTypeEquipment
FOREIGN KEY (EquipTypeID)
REFERENCES dbo.EquipType (EquipTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightLampTypeEquipment
FOREIGN KEY (LightLampTypeID)
REFERENCES dbo.LightLampType (LightLampTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightTypeEquipment
FOREIGN KEY (LightTypeID)
REFERENCES dbo.LightType (LightTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightFormFactorEquipment
FOREIGN KEY (LightFormFactorID)
REFERENCES dbo.LightFormFactor (LightFormFactorID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT HydrantTypeEquipment
FOREIGN KEY (HydrantTypeID)
REFERENCES dbo.HydrantType (HydrantTypeID)
go
ALTER TABLE dbo.EquipType ADD CONSTRAINT CoreGroupEquipType
FOREIGN KEY (CoreGroupID)
REFERENCES dbo.CoreGroup (CoreGroupID)
go
ALTER TABLE dbo.HRAddress ADD CONSTRAINT AddressTypeHRAddress
FOREIGN KEY (AddressTypeID)
REFERENCES dbo.AddressType (AddressTypeID)
go
ALTER TABLE dbo.HRAddress ADD CONSTRAINT HRHRAddress
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.HRAddress ADD CONSTRAINT PostcodeHRAddress
FOREIGN KEY (PostcodeID)
REFERENCES dbo.Postcode (PostcodeID)
go
ALTER TABLE dbo.HREmail ADD CONSTRAINT EmailTypeHREmail
FOREIGN KEY (EmailTypeID)
REFERENCES dbo.EmailType (EmailTypeID)
go
ALTER TABLE dbo.HREmail ADD CONSTRAINT HRHREmail
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.HRNumber ADD CONSTRAINT NumberTypeHRNumber
FOREIGN KEY (NumberTypeID)
REFERENCES dbo.NumberType (NumberTypeID)
go
ALTER TABLE dbo.HRNumber ADD CONSTRAINT HRHRNumber
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.HRZone ADD CONSTRAINT HRHRZone
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.HRZone ADD CONSTRAINT PostcodeHRZone
FOREIGN KEY (PostcodeID)
REFERENCES dbo.Postcode (PostcodeID)
go
ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT HRInspectionOrder
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT InspectionStatusInspectionOrder
FOREIGN KEY (InspectionStatusID)
REFERENCES dbo.InspectionStatus (InspectionStatusID)
go
ALTER TABLE dbo.Log ADD CONSTRAINT LogCallerLog
FOREIGN KEY (LogCallerID)
REFERENCES dbo.LogCaller (LogCallerID)
go
ALTER TABLE dbo.Log ADD CONSTRAINT LogErrLevelLog
FOREIGN KEY (LogErrLevelID)
REFERENCES dbo.LogErrLevel (LogErrLevelID)
go
ALTER TABLE dbo.Log ADD CONSTRAINT CompanyInfoLog
FOREIGN KEY (CompanyInfoID)
REFERENCES dbo.CompanyInfo (CompanyInfoID)
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.CustSite.PK211','PK211_03312024004504001','INDEX'
go
EXEC sp_rename 'dbo.HR_CustSite','HR_CustSit_03312024004504002'
go
EXEC sp_rename 'dbo.Site_CustSite','Site_CustS_03312024004504003'
go
EXEC sp_rename 'dbo.Customer_CustSite','Customer_C_03312024004504004'
go
EXEC sp_rename 'dbo.DF__CustSite__IsEnab__114A936A', 'DF__CustSi_03312024004504005',OBJECT
go
EXEC sp_rename 'dbo.DF__CustSite__IsArch__41B8C09B', 'DF__CustSi_03312024004504006',OBJECT
go
EXEC sp_rename 'dbo.CustSite','CustSite_03312024004504000',OBJECT
go
CREATE TABLE dbo.CustSite
(
    CustSiteID    int       IDENTITY,
    CustomerID    int        NOT NULL,
    SiteID        int        NOT NULL,
    CreatedOn     datetime  NULL,
    ModifiedOn    datetime  NULL,
    IsArchived    bit       CONSTRAINT DF__CustSite__IsArch__41B8C09B DEFAULT ((0))  NOT NULL,
    ModifiedBy    int       NULL,
    IsEnabled     bit       CONSTRAINT DF__CustSite__IsEnab__114A936A DEFAULT ((0))  NOT NULL,
    SiteContactID int       NULL,
    Note          text      NULL,
    SeedDate      datetime  NULL,
    SeedLevel     int       NULL,
    DoReseed      bit        NOT NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_0', 'dbo.CustSite.DoReseed'
go
CREATE TABLE dbo.CompanyAddress
(
    CompanyAddressID int             NOT NULL,
    CreatedOn        datetime       NULL,
    IsArchived       bit             NOT NULL,
    Address          nvarchar(200)  NULL,
    AddressTypeID    int            NULL,
    CompanyInfoID    int            NULL,
    CONSTRAINT PK_CompanyAddress
    PRIMARY KEY CLUSTERED (CompanyAddressID)
)
go
EXEC sp_bindefault 'BIT_0', 'dbo.CompanyAddress.IsArchived'
go
CREATE TABLE dbo.CompanyEmail
(
    CompanyEmailID int             NOT NULL,
    CreatedOn      datetime       NULL,
    Email          nvarchar(128)  NULL,
    IsArchived     bit             NOT NULL,
    EmailTypeID    int            NULL,
    CompanyInfoID  int            NULL,
    CONSTRAINT PK_CompanyEmail
    PRIMARY KEY CLUSTERED (CompanyEmailID)
)
go
EXEC sp_bindefault 'BIT_0', 'dbo.CompanyEmail.IsArchived'
go
CREATE TABLE dbo.CompanyNumber
(
    CompanyNumberID int            NOT NULL,
    IsArchived      bit            NOT NULL,
    Number          nvarchar(64)  NULL,
    CreatedOn       datetime      NULL,
    NumberTypeID    int           NULL,
    CompanyInfoID   int           NULL,
    CONSTRAINT PK_CompanyNumber
    PRIMARY KEY CLUSTERED (CompanyNumberID)
)
go
EXEC sp_bindefault 'BIT_0', 'dbo.CompanyNumber.IsArchived'
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.CustSite ON
go
INSERT INTO dbo.CustSite(
                         CustSiteID,
                         CustomerID,
                         SiteID,
                         CreatedOn,
                         ModifiedOn,
                         IsArchived,
                         ModifiedBy,
                         IsEnabled,
                         SiteContactID,
                         Note,
                         SeedDate,
                         SeedLevel,
                         DoReseed
                        )
                  SELECT 
                         CustSiteID,
                         CustomerID,
                         SiteID,
                         CreatedOn,
                         NULL,
                         IsArchived,
                         NULL,
                         IsEnabled,
                         SiteContactID,
                         Note,
                         SeedDate,
                         SeedLevel,
                         DoReseed
                    FROM dbo.CustSite_03312024004504000 
go
SET IDENTITY_INSERT dbo.CustSite OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.CustSite ADD CONSTRAINT PK_CustSite
PRIMARY KEY CLUSTERED (CustSiteID,CustomerID,SiteID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT CustSiteInspectionOrder
FOREIGN KEY (CustSiteID,CustomerID,SiteID)
REFERENCES dbo.CustSite (CustSiteID,CustomerID,SiteID)
go
ALTER TABLE dbo.SurveyOrder ADD CONSTRAINT CustSiteSurveyOrder
FOREIGN KEY (CustSiteID,CustomerID,SiteID)
REFERENCES dbo.CustSite (CustSiteID,CustomerID,SiteID)
go
ALTER TABLE dbo.CompanyAddress 
    ADD CONSTRAINT AddressTypeCompanyAddress
FOREIGN KEY (AddressTypeID)
REFERENCES dbo.AddressType (AddressTypeID)
go
ALTER TABLE dbo.CompanyAddress 
    ADD CONSTRAINT CompanyInfoCompanyAddress
FOREIGN KEY (CompanyInfoID)
REFERENCES dbo.CompanyInfo (CompanyInfoID)
go
ALTER TABLE dbo.CompanyEmail 
    ADD CONSTRAINT EmailTypeCompanyEmail
FOREIGN KEY (EmailTypeID)
REFERENCES dbo.EmailType (EmailTypeID)
go
ALTER TABLE dbo.CompanyEmail 
    ADD CONSTRAINT CompanyInfoCompanyEmail
FOREIGN KEY (CompanyInfoID)
REFERENCES dbo.CompanyInfo (CompanyInfoID)
go
ALTER TABLE dbo.CompanyNumber 
    ADD CONSTRAINT NumberTypeCompanyNumber
FOREIGN KEY (NumberTypeID)
REFERENCES dbo.NumberType (NumberTypeID)
go
ALTER TABLE dbo.CompanyNumber 
    ADD CONSTRAINT CompanyInfoCompanyNumber
FOREIGN KEY (CompanyInfoID)
REFERENCES dbo.CompanyInfo (CompanyInfoID)
go
ALTER TABLE dbo.CustSite ADD CONSTRAINT CustomerCustSite
FOREIGN KEY (CustomerID)
REFERENCES dbo.Customer (CustomerID)
go
ALTER TABLE dbo.CustSite ADD CONSTRAINT HRCustSite
FOREIGN KEY (SiteContactID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.CustSite ADD CONSTRAINT SiteCustSite
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
go
