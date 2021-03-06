USE [IDFES]
GO
SET IDENTITY_INSERT [dbo].[CoreGroup] ON 

INSERT [dbo].[CoreGroup] ([CoreGroupID], [Caption]) VALUES (1, N'Portable')
INSERT [dbo].[CoreGroup] ([CoreGroupID], [Caption]) VALUES (2, N'Electrical')
INSERT [dbo].[CoreGroup] ([CoreGroupID], [Caption]) VALUES (3, N'WaterBase')
INSERT [dbo].[CoreGroup] ([CoreGroupID], [Caption]) VALUES (4, N'Structural')
SET IDENTITY_INSERT [dbo].[CoreGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[EquipType] ON 

INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (1, N'Hydrant', N'HYD', 12, 60, 2, 6, 3)
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (2, N'Fire Blanket', N'F\B', 0, 0, 2, 6, 1)
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (3, N'Fire Extinguisher', N'FX', 12, 60, 2, 6, 1)
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (4, N'Fire Hose', N'F\H', 12, 60, 2, 6, 3)
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (5, N'Light', N'Light', 0, 0, 2, 6, 2)
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (6, N'Electrical', N'ELECT', 0, 0, 2, 6, 2)
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (7, N'Booster', N'BOOSTER', 0, 0, 2, 6, 3)
INSERT [dbo].[EquipType] ([EquipTypeID], [Caption], [ShortCaption], [MinorLifeCycle], [MajorLifeCycle], [NumOfLevels], [ServiceInterval], [CoreGroupID]) VALUES (8, N'Pumpset', N'PumpSet', 0, 0, 2, 1, 3)
SET IDENTITY_INSERT [dbo].[EquipType] OFF
GO
SET IDENTITY_INSERT [dbo].[AddressType] ON 

INSERT [dbo].[AddressType] ([AddressTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (1, N'PRIMARY', 1, N'Home', 1, N'Business', 0)
INSERT [dbo].[AddressType] ([AddressTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (2, N'SECONDARY', 1, N'Postal', 1, N'Billing', 0)
INSERT [dbo].[AddressType] ([AddressTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (3, N'TERTIARY', 0, NULL, 1, N'Postal', 0)
INSERT [dbo].[AddressType] ([AddressTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (4, N'QUATERNARY', 0, NULL, 1, N'Landlord', 0)
INSERT [dbo].[AddressType] ([AddressTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (5, NULL, 0, NULL, 1, N'Real Estate', 0)
SET IDENTITY_INSERT [dbo].[AddressType] OFF
GO
SET IDENTITY_INSERT [dbo].[ChemicalType] ON 

INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (1, N'Water and Foam', N'AFF')
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (2, N'Carbon Dioxide', N'CO2')
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (3, N'Dry Chemical', N'BE')
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (4, N'Wet Chemical', N'WCH')
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (5, N'Dry Powder', N'ABE')
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (6, N'Water Mist', N'H2O')
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (7, N'Clean Agent', N'HFC')
INSERT [dbo].[ChemicalType] ([ChemicalTypeID], [Caption], [Symbol]) VALUES (8, N'Water and Foam', N'AFF ECOFF')
SET IDENTITY_INSERT [dbo].[ChemicalType] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactNumType] ON 

INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (1, N'PRIMARY', 1, N'Mobile', 1, N'Business', 0)
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (2, N'SECONDARY', 1, N'Work', 1, N'Accounts', 0)
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (3, N'TERTIARY', 1, N'Home', 1, N'General Enquires', 0)
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (4, N'QUATERNARY', 1, N'Real Estate', 1, N'Real Estate fnCOM', 0)
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (5, NULL, 0, NULL, 1, N'Landlord', 0)
INSERT [dbo].[ContactNumType] ([ContactNumTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (6, NULL, 0, NULL, 1, N'Real Estate - CPG', 0)
SET IDENTITY_INSERT [dbo].[ContactNumType] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactType] ON 

INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (1, N'PRIMARY', 0, NULL, 1, N'Contact #1', 0)
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (2, N'SECONDARY', 0, NULL, 1, N'Contact #2', 0)
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (3, N'TERTIARY', 0, NULL, 1, N'Contact #3', 0)
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (4, N'QUATERNARY', 0, NULL, 1, N'Contact #4', 0)
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (5, N'QUINARY', 0, NULL, 0, NULL, 0)
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (6, N'SENARY', 0, NULL, 0, NULL, 0)
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (7, N'SEPTENARY', 0, NULL, 0, NULL, 0)
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (8, N'OCTONARY', 0, NULL, 0, NULL, 0)
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (9, N'NONARY', 0, NULL, 0, NULL, 0)
INSERT [dbo].[ContactType] ([ContactTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (10, N'DENARY', 0, NULL, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[ContactType] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailType] ON 

INSERT [dbo].[EmailType] ([EmailTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (1, N'PRIMARY', 1, N'Work', 1, N'Seeking PO #', 0)
INSERT [dbo].[EmailType] ([EmailTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (2, N'SECONDARY', 1, N'Personal', 1, N'Accounts Department', 0)
INSERT [dbo].[EmailType] ([EmailTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (3, N'TERTIARY', 0, NULL, 1, N'Inspection Reports', 0)
INSERT [dbo].[EmailType] ([EmailTypeID], [Caption], [UsedByHR], [AliasHR], [UsedByCust], [AliasCust], [IsArchived]) VALUES (4, N'QUATERNARY', 0, NULL, 1, N'Real Estate', 0)
SET IDENTITY_INSERT [dbo].[EmailType] OFF
GO
SET IDENTITY_INSERT [dbo].[EquipBrand] ON 

INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1, N'FlameStop')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (2, N'Fire Box')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (3, N'Wormald')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (4, N'Chubb')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (5, N'Flameguard')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (6, N'IDFES Brand')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (7, N'Firex')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (8, N'Fire Sentry')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (9, N'Gem')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (10, N'F/Master')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (11, N'London')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (12, N'E/Safe')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1008, N'Spitfire')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1009, N'Clevertronic')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1010, N'Bardic')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1011, N'Stanilite')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1012, N'Ektor')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1013, N'Fluro')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1014, N'Viper')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1015, N'Cleverfit')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1016, N'Presto')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (1017, N'Quell')
INSERT [dbo].[EquipBrand] ([EquipBrandID], [Caption]) VALUES (2017, N'F/World')
SET IDENTITY_INSERT [dbo].[EquipBrand] OFF
GO
SET IDENTITY_INSERT [dbo].[HydrantType] ON 

INSERT [dbo].[HydrantType] ([HydrantTypeID], [Caption], [ShortCaption]) VALUES (1, N'Hydrant', N'HYD')
INSERT [dbo].[HydrantType] ([HydrantTypeID], [Caption], [ShortCaption]) VALUES (2, N'Double Hydrant', N'D/HYD')
INSERT [dbo].[HydrantType] ([HydrantTypeID], [Caption], [ShortCaption]) VALUES (3, N'Pillar Hydrant', N'P/HYD')
INSERT [dbo].[HydrantType] ([HydrantTypeID], [Caption], [ShortCaption]) VALUES (4, N'Ground Hydrant', N'G/HYD')
SET IDENTITY_INSERT [dbo].[HydrantType] OFF
GO
SET IDENTITY_INSERT [dbo].[InspectionStatus] ON 

INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (1, N'Action', N'system. Don''t change field No.', 1)
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (2, N'Completed', N'system. Don''t change field No.', 6)
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (3, N'Cancelled', N'system. Don''t change field No.', 7)
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (4, N'IRNS', NULL, 5)
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (5, N'HOLD', NULL, 4)
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (6, N'Sent', NULL, 2)
INSERT [dbo].[InspectionStatus] ([InspectionStatusID], [Caption], [Description], [StackOrder]) VALUES (7, N'Awaiting PO', NULL, 3)
SET IDENTITY_INSERT [dbo].[InspectionStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[LightFormFactor] ON 

INSERT [dbo].[LightFormFactor] ([LightFormFactorID], [Caption], [ShortCaption]) VALUES (1, N'Fluro Batton', N'Batton')
INSERT [dbo].[LightFormFactor] ([LightFormFactorID], [Caption], [ShortCaption]) VALUES (2, N'Bayonet Cap', N'Bayonet')
INSERT [dbo].[LightFormFactor] ([LightFormFactorID], [Caption], [ShortCaption]) VALUES (3, N'Edison Screw', N'Screw')
SET IDENTITY_INSERT [dbo].[LightFormFactor] OFF
GO
SET IDENTITY_INSERT [dbo].[LightLampType] ON 

INSERT [dbo].[LightLampType] ([LightLampTypeID], [Caption], [ShortCaption]) VALUES (1, N'LED', N'LED')
INSERT [dbo].[LightLampType] ([LightLampTypeID], [Caption], [ShortCaption]) VALUES (2, N'Fluorescent', N'FLURO')
INSERT [dbo].[LightLampType] ([LightLampTypeID], [Caption], [ShortCaption]) VALUES (3, N'Incandesant', N'INCAND')
SET IDENTITY_INSERT [dbo].[LightLampType] OFF
GO
SET IDENTITY_INSERT [dbo].[LightType] ON 

INSERT [dbo].[LightType] ([LightTypeID], [Caption], [ShortCaption]) VALUES (1, N'Emergency', N'EMERG')
INSERT [dbo].[LightType] ([LightTypeID], [Caption], [ShortCaption]) VALUES (2, N'Exit', N'EXIT')
SET IDENTITY_INSERT [dbo].[LightType] OFF
GO
SET IDENTITY_INSERT [dbo].[LogCaller] ON 

INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (1, N'mdlInspect')
INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (2, N'clsInspectOrder')
INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (3, N'xDlgInspect_Begin')
INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (4, N'mdlCheck')
INSERT [dbo].[LogCaller] ([LogCallerID], [Caption]) VALUES (5, N'mdlEnable')
SET IDENTITY_INSERT [dbo].[LogCaller] OFF
GO
SET IDENTITY_INSERT [dbo].[LogErrLevel] ON 

INSERT [dbo].[LogErrLevel] ([LogErrLevelID], [Caption]) VALUES (1, N'NONE')
INSERT [dbo].[LogErrLevel] ([LogErrLevelID], [Caption]) VALUES (2, N'WARNING')
INSERT [dbo].[LogErrLevel] ([LogErrLevelID], [Caption]) VALUES (3, N'MINOR')
INSERT [dbo].[LogErrLevel] ([LogErrLevelID], [Caption]) VALUES (4, N'MAJOR')
INSERT [dbo].[LogErrLevel] ([LogErrLevelID], [Caption]) VALUES (5, N'CRITICAL')
SET IDENTITY_INSERT [dbo].[LogErrLevel] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (1, N'IDFES Technician', N'Inspects and services customer equipment', 0)
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (2, N'IDFES Administrator', N'Customer service, accounts, office admin.', 0)
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (3, N'Cust Manager', N'A customer contact.', 0)
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (1004, N'Cust Accountant', NULL, 0)
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (1005, N'Cust Site Contact', NULL, 0)
INSERT [dbo].[Role] ([RoleID], [Caption], [Note], [IsArchived]) VALUES (1006, N'Landlord', NULL, 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[SurveyStatus] ON 

INSERT [dbo].[SurveyStatus] ([SurveyStatusID], [Caption], [Description], [StackOrder]) VALUES (1, N'Action', N'system. Don''t change field No.', NULL)
INSERT [dbo].[SurveyStatus] ([SurveyStatusID], [Caption], [Description], [StackOrder]) VALUES (2, N'Completed', N'system. Don''t change field No.', NULL)
INSERT [dbo].[SurveyStatus] ([SurveyStatusID], [Caption], [Description], [StackOrder]) VALUES (3, N'Cancelled', N'system. Don''t change field No.', NULL)
SET IDENTITY_INSERT [dbo].[SurveyStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[TestAction] ON 

INSERT [dbo].[TestAction] ([TestActionID], [Caption]) VALUES (1, N'Repair')
INSERT [dbo].[TestAction] ([TestActionID], [Caption]) VALUES (2, N'Replace')
INSERT [dbo].[TestAction] ([TestActionID], [Caption]) VALUES (3, N'Renew')
SET IDENTITY_INSERT [dbo].[TestAction] OFF
GO
SET IDENTITY_INSERT [dbo].[TestLifeCycle] ON 

INSERT [dbo].[TestLifeCycle] ([TestLifeCycleID], [Caption]) VALUES (1, N'Minor')
INSERT [dbo].[TestLifeCycle] ([TestLifeCycleID], [Caption]) VALUES (2, N'Major')
SET IDENTITY_INSERT [dbo].[TestLifeCycle] OFF
GO
SET IDENTITY_INSERT [dbo].[TestResult] ON 

INSERT [dbo].[TestResult] ([TestResultID], [Caption], [ShortCaption]) VALUES (1, N'-', N'-')
INSERT [dbo].[TestResult] ([TestResultID], [Caption], [ShortCaption]) VALUES (2, N'F', N'FAILED')
INSERT [dbo].[TestResult] ([TestResultID], [Caption], [ShortCaption]) VALUES (3, N'P', N'PASSED')
SET IDENTITY_INSERT [dbo].[TestResult] OFF
GO
