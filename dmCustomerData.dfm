object CustomerData: TCustomerData
  OnCreate = DataModuleCreate
  Height = 480
  Width = 1430
  object qryCustomer: TFDQuery
    Active = True
    Connection = FES.fesConnection
    SQL.Strings = (
      '--USE IDFES;'
      ''
      'SELECT '
      #9#9' [CustomerID]'
      #9#9',[CustName]'
      #9#9',[CustCode]'
      #9#9',[MYOBID]'
      #9#9',[Note]'
      #9#9',[CreatedBy]'
      #9#9',[CreatedOn]'
      #9#9',[ModifiedBy]'
      #9#9',[ModifiedOn]'
      #9#9',[IsArchived]'
      'FROM [IDFES].[dbo].[Customer] '
      ';')
    Left = 496
    Top = 25
    object qryCustomerCustomerID: TFDAutoIncField
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object qryCustomerCustName: TWideStringField
      FieldName = 'CustName'
      Origin = 'CustName'
      Size = 64
    end
    object qryCustomerCustCode: TWideStringField
      FieldName = 'CustCode'
      Origin = 'CustCode'
      Size = 8
    end
    object qryCustomerMYOBID: TIntegerField
      FieldName = 'MYOBID'
      Origin = 'MYOBID'
    end
    object qryCustomerNote: TMemoField
      FieldName = 'Note'
      Origin = 'Note'
      OnGetText = qryCustomerNoteGetText
      OnSetText = qryCustomerNoteSetText
      BlobType = ftMemo
    end
    object qryCustomerCreatedBy: TIntegerField
      FieldName = 'CreatedBy'
      Origin = 'CreatedBy'
    end
    object qryCustomerCreatedOn: TSQLTimeStampField
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
    end
    object qryCustomerModifiedBy: TIntegerField
      FieldName = 'ModifiedBy'
      Origin = 'ModifiedBy'
    end
    object qryCustomerModifiedOn: TSQLTimeStampField
      FieldName = 'ModifiedOn'
      Origin = 'ModifiedOn'
    end
    object qryCustomerIsArchived: TBooleanField
      FieldName = 'IsArchived'
      Origin = 'IsArchived'
      Required = True
    end
  end
  object dsCustomer: TDataSource
    DataSet = qryCustomer
    Left = 624
    Top = 24
  end
  object qryCustContactNum: TFDQuery
    Tag = 1
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    Connection = FES.fesConnection
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime, fvFmtDisplayDate]
    FormatOptions.FmtDisplayDateTime = 'dd/mm/yyyy'
    FormatOptions.FmtDisplayDate = 'dd/mm/yyyy'
    SQL.Strings = (
      '-- USE [IDFES];'
      ''
      'SELECT [CustContactNumID]'
      '      ,[CustomerID]'
      '      ,[ContactNum]'
      '      ,[CreatedOn]'
      '      ,[IsArchived]'
      '      ,[ContactNumTypeID]'
      '  FROM [dbo].[CustContactNum]'
      ''
      ';')
    Left = 48
    Top = 128
    object qryCustContactNumCustContactNumID: TFDAutoIncField
      FieldName = 'CustContactNumID'
      Origin = 'CustContactNumID'
      ReadOnly = True
      Visible = False
    end
    object qryCustContactNumCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
      Visible = False
    end
    object qryCustContactNumContactNum: TWideStringField
      DisplayWidth = 16
      FieldName = 'ContactNum'
      Origin = 'ContactNum'
      Size = 16
    end
    object qryCustContactNumIsArchived: TBooleanField
      DisplayLabel = 'Archived'
      FieldName = 'IsArchived'
      Origin = 'IsArchived'
      Required = True
    end
    object qryCustContactNumluContactNumType: TStringField
      DisplayLabel = 'Contact Type'
      FieldKind = fkLookup
      FieldName = 'luContactNumType'
      LookupDataSet = tblContactNumType
      LookupKeyFields = 'ContactNumTypeID'
      LookupResultField = 'Caption'
      KeyFields = 'ContactNumTypeID'
      Size = 14
      Lookup = True
    end
    object qryCustContactNumCreatedOn: TSQLTimeStampField
      DisplayLabel = 'Created On'
      DisplayWidth = 10
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
      ReadOnly = True
      OnGetText = qryCustContactNumCreatedOnGetText
    end
    object qryCustContactNumContactNumTypeID: TIntegerField
      FieldName = 'ContactNumTypeID'
      Origin = 'ContactNumTypeID'
      Visible = False
    end
  end
  object dsCustContactNum: TDataSource
    DataSet = qryCustContactNum
    Left = 176
    Top = 128
  end
  object tblContactNumType: TFDTable
    Tag = 2
    Active = True
    IndexFieldNames = 'ContactNumTypeID'
    Connection = FES.fesConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    TableName = 'IDFES..ContactNumType'
    Left = 48
    Top = 224
  end
  object dsContactNumType: TDataSource
    DataSet = tblContactNumType
    Left = 176
    Top = 224
  end
  object qryCustAddress: TFDQuery
    Tag = 1
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.UpdateTableName = 'IDFES..CustAddress'
    SQL.Strings = (
      '-- USE IDFES;'
      ''
      'SELECT '
      '    [CustAddressID]'
      '    ,[CustomerID]'
      '    ,[CustAddress].[IsArchived]'
      '    ,[AddressType].AliasCust AS AddrTypeStr'
      '    ,[PostCode].[Zone] '
      '    ,dbo.GetCustAddrMultiLine([CustomerID]) AS AddressStr'
      'FROM [dbo].[CustAddress]'
      'INNER JOIN [dbo].[PostCode] '
      '      ON [CustAddress].[PostcodeID] = [PostCode].[PostcodeID] '
      'INNER JOIN [dbo].[AddressType] '
      
        '      ON [CustAddress].[AddressTypeID] = [AddressType].[AddressT' +
        'ypeID] '
      '; ')
    Left = 304
    Top = 136
  end
  object dsCustAdress: TDataSource
    DataSet = qryCustAddress
    Left = 392
    Top = 136
  end
  object qryCustEmails: TFDQuery
    Tag = 1
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.CustEmail'
    UpdateOptions.KeyFields = 'CustEmailID'
    SQL.Strings = (
      '  SELECT '
      #9#9' [CustEmailID]'
      #9#9',[CustomerID]'
      #9#9',[Email]'
      #9#9',[CreatedOn]'
      #9#9',[IsArchived]'
      #9#9',[EmailTypeID]'
      'FROM [IDFES].[dbo].[CustEmail] ')
    Left = 488
    Top = 136
    object qryCustEmailsCustEmailID: TFDAutoIncField
      FieldName = 'CustEmailID'
      Origin = 'CustEmailID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qryCustEmailsCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
      Visible = False
    end
    object qryCustEmailsEmail: TWideStringField
      DisplayWidth = 40
      FieldName = 'Email'
      Origin = 'Email'
      Size = 128
    end
    object qryCustEmailsCreatedOn: TSQLTimeStampField
      DisplayLabel = 'Created On'
      DisplayWidth = 10
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
    end
    object qryCustEmailsIsArchived: TBooleanField
      FieldName = 'IsArchived'
      Origin = 'IsArchived'
      Required = True
    end
    object qryCustEmailsEmailTypeID: TIntegerField
      FieldName = 'EmailTypeID'
      Origin = 'EmailTypeID'
      Visible = False
    end
    object qryCustEmailsluEmailType: TStringField
      DisplayLabel = 'Email Type'
      FieldKind = fkLookup
      FieldName = 'luEmailType'
      LookupDataSet = qryEmailType
      LookupKeyFields = 'EmailTypeID'
      LookupResultField = 'AliasCust'
      KeyFields = 'EmailTypeID'
      Lookup = True
    end
  end
  object dsCustEmails: TDataSource
    DataSet = qryCustEmails
    Left = 576
    Top = 136
  end
  object dsEmailType: TDataSource
    DataSet = qryEmailType
    Left = 592
    Top = 224
  end
  object qryEmailType: TFDQuery
    Tag = 2
    Active = True
    Connection = FES.fesConnection
    SQL.Strings = (
      'SELECT [EmailTypeID]'
      '      ,[Caption]'
      '      ,[UsedByHR]'
      '      ,[AliasHR]'
      '      ,[UsedByCust]'
      '      ,[AliasCust]'
      '      ,[IsArchived]'
      '  FROM [IDFES].[dbo].[EmailType]'
      '  WHERE [IsArchived] = 0 AND [UsedByCust] = 1')
    Left = 504
    Top = 224
  end
  object qryCustSite: TFDQuery
    Tag = 1
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'IDFES.dbo.CustSite'
    UpdateOptions.KeyFields = 'CustSiteID'
    SQL.Strings = (
      ' SELECT TOP (1000) [CustSiteID]'
      '      ,[CustomerID]'
      '      ,[CustSite].[SiteID]'
      '      ,[CustSite].[CreatedOn]'
      '      ,[CustSite].[IsArchived]'
      '      ,[CustSite].[IsEnabled]'
      '      ,[SiteContactID]'
      '      ,[CustSite].[Note]'
      '      ,[SeedDate]'
      '      ,[SeedLevel]'
      '      ,[DoReseed]'
      '--      ,[Site].Address'
      
        '      , [dbo].GetSiteAddrSingleLine(CustSite.SiteID,1) AS SiteAd' +
        'drStr '
      '  FROM [IDFES].[dbo].[CustSite]'
      '  INNER JOIN dbo.Site ON CustSite.SiteID = Site.SiteID')
    Left = 664
    Top = 136
    object qryCustSiteCustSiteID: TFDAutoIncField
      FieldName = 'CustSiteID'
      Origin = 'CustSiteID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qryCustSiteCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
      Required = True
      Visible = False
    end
    object qryCustSiteSiteID: TIntegerField
      FieldName = 'SiteID'
      Origin = 'SiteID'
      Required = True
      Visible = False
    end
    object qryCustSiteSiteAddrStr: TWideStringField
      DisplayWidth = 60
      FieldName = 'SiteAddrStr'
      Origin = 'SiteAddrStr'
      ReadOnly = True
      Size = 100
    end
    object qryCustSiteCreatedOn: TSQLTimeStampField
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
      Visible = False
    end
    object qryCustSiteIsArchived: TBooleanField
      FieldName = 'IsArchived'
      Origin = 'IsArchived'
      Required = True
    end
    object qryCustSiteIsEnabled: TBooleanField
      FieldName = 'IsEnabled'
      Origin = 'IsEnabled'
      Required = True
    end
    object qryCustSiteSiteContactID: TIntegerField
      FieldName = 'SiteContactID'
      Origin = 'SiteContactID'
      Visible = False
    end
    object qryCustSiteNote: TMemoField
      FieldName = 'Note'
      Origin = 'Note'
      OnGetText = qryCustSiteNoteGetText
      OnSetText = qryCustSiteNoteSetText
      BlobType = ftMemo
    end
    object qryCustSiteSeedDate: TSQLTimeStampField
      FieldName = 'SeedDate'
      Origin = 'SeedDate'
      Visible = False
    end
    object qryCustSiteSeedLevel: TIntegerField
      FieldName = 'SeedLevel'
      Origin = 'SeedLevel'
      Visible = False
    end
    object qryCustSiteDoReseed: TBooleanField
      FieldName = 'DoReseed'
      Origin = 'DoReseed'
      Required = True
      Visible = False
    end
  end
  object dsCustSite: TDataSource
    DataSet = qryCustSite
    Left = 744
    Top = 136
  end
  object qryCustContact: TFDQuery
    Tag = 1
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'IDFES.dbo.CustContact'
    UpdateOptions.KeyFields = 'CustContactID'
    SQL.Strings = (
      'SELECT [CustContactID]'
      '     , [CustContact].[CustomerID]'
      '     , [CustContact].[HRID]'
      '     , [CustContact].[CreatedOn]'
      '     , CONCAT(hr.FirstName, '#39' '#39', UPPER(hr.LastName)) AS FName'
      '     , ContactType.AliasCust AS ContactTypeStr'
      '     , [CustContact].[Caption]'
      '     , [CustContact].[IsArchived]'
      '     , [CustContact].[SortList]'
      '     , [CustContact].[ContactTypeID]'
      'FROM [IDFES].[dbo].[CustContact]'
      '    INNER JOIN HR'
      '        ON CustContact.HRID = HR.HRID'
      '    LEFT JOIN ContactType'
      '        ON CustContact.ContactTypeID = ContactType.ContactTypeID')
    Left = 840
    Top = 136
    object qryCustContactCustContactID: TFDAutoIncField
      FieldName = 'CustContactID'
      Origin = 'CustContactID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qryCustContactCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
      Required = True
      Visible = False
    end
    object qryCustContactHRID: TIntegerField
      FieldName = 'HRID'
      Origin = 'HRID'
      Required = True
      Visible = False
    end
    object qryCustContactCreatedOn: TSQLTimeStampField
      DisplayLabel = 'Created On'
      DisplayWidth = 10
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
    end
    object qryCustContactFName: TWideStringField
      DisplayWidth = 26
      FieldName = 'FName'
      Origin = 'FName'
      ReadOnly = True
      Required = True
      Size = 513
    end
    object qryCustContactContactTypeStr: TWideStringField
      DisplayLabel = 'Contact Type'
      DisplayWidth = 16
      FieldName = 'ContactTypeStr'
      Origin = 'ContactTypeStr'
      Size = 50
    end
    object qryCustContactCaption: TWideStringField
      DisplayLabel = 'Notes'
      DisplayWidth = 28
      FieldName = 'Caption'
      Origin = 'Caption'
      Size = 128
    end
    object qryCustContactIsArchived: TBooleanField
      DisplayLabel = 'Archived'
      FieldName = 'IsArchived'
      Origin = 'IsArchived'
      Required = True
    end
    object qryCustContactSortList: TIntegerField
      FieldName = 'SortList'
      Origin = 'SortList'
      Visible = False
    end
    object qryCustContactContactTypeID: TIntegerField
      FieldName = 'ContactTypeID'
      Origin = 'ContactTypeID'
      Visible = False
    end
  end
  object dsCustContact: TDataSource
    DataSet = qryCustContact
    Left = 920
    Top = 136
  end
  object qryCustInspect: TFDQuery
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    DetailFields = 'CustomerID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.InspectionOrder'
    UpdateOptions.KeyFields = 'InspectedOn'
    SQL.Strings = (
      'SELECT '
      #9#9' [InspectionOrderID]'
      #9#9',[InspectionOrder].[CreatedOn]'
      #9#9',[RequestedDT]'
      #9#9',[InspectedOn]'
      #9#9',[CompletedDT]'
      #9#9',[ServiceInterval]'
      #9#9',[LevelNum]'
      #9#9',[InspectionOrder].[Note]'
      #9#9',[NotePortable]'
      #9#9',[NoteElectrical]'
      #9#9',[NoteWaterBase]'
      #9#9',[NoteStructual]'
      #9#9',[InspectionOrder].[InspectionStatusID]'
      #9#9',[HRID]'
      #9#9',[CustSiteID]'
      #9#9',[CustomerID]'
      #9#9',[InspectionOrder].[SiteID]'
      '        ,[Site].Address'
      '        ,[InspectionStatus].Caption AS InspectStatusStr'
      'FROM [dbo].[InspectionOrder] '
      
        'INNER JOIN [dbo].[Site] ON [InspectionOrder].SiteID =  Site.Site' +
        'ID'
      
        'INNER JOIN InspectionStatus ON [InspectionOrder].InspectionStatu' +
        'sID = InspectionStatus.InspectionStatusID;')
    Left = 1016
    Top = 136
    object qryCustInspectInspectionOrderID: TFDAutoIncField
      FieldName = 'InspectionOrderID'
      Origin = 'InspectionOrderID'
      ReadOnly = True
      Visible = False
    end
    object qryCustInspectAddress: TWideStringField
      DisplayWidth = 40
      FieldName = 'Address'
      Origin = 'Address'
      Size = 256
    end
    object qryCustInspectInspectStatusStr: TWideStringField
      DisplayWidth = 12
      FieldName = 'InspectStatusStr'
      Origin = 'InspectStatusStr'
      Size = 50
    end
    object qryCustInspectCreatedOn: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
    end
    object qryCustInspectRequestedDT: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'RequestedDT'
      Origin = 'RequestedDT'
    end
    object qryCustInspectInspectedOn: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'InspectedOn'
      Origin = 'InspectedOn'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCustInspectCompletedDT: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'CompletedDT'
      Origin = 'CompletedDT'
    end
    object qryCustInspectServiceInterval: TFloatField
      FieldName = 'ServiceInterval'
      Origin = 'ServiceInterval'
      Visible = False
    end
    object qryCustInspectLevelNum: TIntegerField
      FieldName = 'LevelNum'
      Origin = 'LevelNum'
      Visible = False
    end
    object qryCustInspectNote: TWideStringField
      FieldName = 'Note'
      Origin = 'Note'
      Size = 128
    end
    object qryCustInspectNotePortable: TWideStringField
      FieldName = 'NotePortable'
      Origin = 'NotePortable'
      Visible = False
      Size = 128
    end
    object qryCustInspectNoteElectrical: TWideStringField
      FieldName = 'NoteElectrical'
      Origin = 'NoteElectrical'
      Visible = False
      Size = 128
    end
    object qryCustInspectNoteWaterBase: TWideStringField
      FieldName = 'NoteWaterBase'
      Origin = 'NoteWaterBase'
      Visible = False
      Size = 128
    end
    object qryCustInspectNoteStructual: TWideStringField
      FieldName = 'NoteStructual'
      Origin = 'NoteStructual'
      Visible = False
      Size = 128
    end
    object qryCustInspectInspectionStatusID: TIntegerField
      FieldName = 'InspectionStatusID'
      Origin = 'InspectionStatusID'
      Visible = False
    end
    object qryCustInspectHRID: TIntegerField
      FieldName = 'HRID'
      Origin = 'HRID'
      Visible = False
    end
    object qryCustInspectCustSiteID: TIntegerField
      FieldName = 'CustSiteID'
      Origin = 'CustSiteID'
      Visible = False
    end
    object qryCustInspectCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
      Visible = False
    end
    object qryCustInspectSiteID: TIntegerField
      FieldName = 'SiteID'
      Origin = 'SiteID'
      Visible = False
    end
  end
  object dsCustInspect: TDataSource
    DataSet = qryCustInspect
    Left = 1104
    Top = 136
  end
  object qryCustSurvey: TFDQuery
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    DetailFields = 'CustomerID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.SurveyOrder'
    UpdateOptions.KeyFields = 'SurveyOrderID'
    SQL.Strings = (
      'SELECT '
      #9#9' [SurveyOrderID]'
      #9#9',[SurveyOrder].[CreatedOn]'
      #9#9',[RequestedDT]'
      #9#9',[SurveyedOn]'
      #9#9',[CompletedDT]'
      #9#9',[SurveyOrder].[IsArchived]'
      #9#9',[SurveyStatusID]'
      #9#9',[HRID]'
      #9#9',[CustSiteID]'
      #9#9',[CustomerID]'
      #9#9',[SurveyOrder].[SiteID]'
      '        ,[Site].[Address]'
      'FROM [dbo].[SurveyOrder] '
      'INNER JOIN [dbo].[Site] ON [SurveyOrder].SiteID =  Site.SiteID')
    Left = 1232
    Top = 136
    object qryCustSurveySurveyOrderID: TFDAutoIncField
      FieldName = 'SurveyOrderID'
      Origin = 'SurveyOrderID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qryCustSurveyAddress: TWideStringField
      DisplayWidth = 40
      FieldName = 'Address'
      Origin = 'Address'
      Size = 256
    end
    object qryCustSurveyCreatedOn: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
    end
    object qryCustSurveyRequestedDT: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'RequestedDT'
      Origin = 'RequestedDT'
    end
    object qryCustSurveySurveyedOn: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'SurveyedOn'
      Origin = 'SurveyedOn'
    end
    object qryCustSurveyCompletedDT: TSQLTimeStampField
      DisplayWidth = 10
      FieldName = 'CompletedDT'
      Origin = 'CompletedDT'
    end
    object qryCustSurveyIsArchived: TBooleanField
      FieldName = 'IsArchived'
      Origin = 'IsArchived'
      Required = True
    end
    object qryCustSurveySurveyStatusID: TIntegerField
      FieldName = 'SurveyStatusID'
      Origin = 'SurveyStatusID'
      Visible = False
    end
    object qryCustSurveyHRID: TIntegerField
      FieldName = 'HRID'
      Origin = 'HRID'
      Visible = False
    end
    object qryCustSurveyCustSiteID: TIntegerField
      FieldName = 'CustSiteID'
      Origin = 'CustSiteID'
      Visible = False
    end
    object qryCustSurveyCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
      Visible = False
    end
    object qryCustSurveySiteID: TIntegerField
      FieldName = 'SiteID'
      Origin = 'SiteID'
      Visible = False
    end
  end
  object dsCustSurvey: TDataSource
    DataSet = qryCustSurvey
    Left = 1328
    Top = 136
  end
end
