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
    UpdateOptions.UpdateTableName = 'IDFES..CustAddress'
    SQL.Strings = (
      '-- USE IDFES;'
      ''
      'SELECT '
      #9#9' [CustAddressID]'
      #9#9',[CustomerID]'
      #9#9',[AddressTypeID]'
      #9#9',[CustAddress].[PostcodeID]'
      #9#9',[Address]'
      #9#9',[CreatedOn]'
      #9#9',[IsArchived]'
      '    ,PostCode'
      '    ,Suburb'
      '    ,State'
      '    ,Zone'
      'FROM [dbo].[CustAddress]'
      
        'INNER JOIN [dbo].[PostCode] ON [CustAddress].[PostcodeID] = [Pos' +
        'tCode].[PostcodeID] '
      '; ')
    Left = 304
    Top = 136
    object qryCustAddressCustAddressID: TFDAutoIncField
      FieldName = 'CustAddressID'
      Origin = 'CustAddressID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryCustAddressCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
    end
    object qryCustAddressAddressTypeID: TIntegerField
      FieldName = 'AddressTypeID'
      Origin = 'AddressTypeID'
    end
    object qryCustAddressPostcodeID: TIntegerField
      FieldName = 'PostcodeID'
      Origin = 'PostcodeID'
    end
    object qryCustAddressAddress: TWideStringField
      FieldName = 'Address'
      Origin = 'Address'
      Size = 200
    end
    object qryCustAddressCreatedOn: TSQLTimeStampField
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
    end
    object qryCustAddressIsArchived: TBooleanField
      FieldName = 'IsArchived'
      Origin = 'IsArchived'
      Required = True
    end
    object qryCustAddressluAddressType: TStringField
      FieldKind = fkLookup
      FieldName = 'luAddressType'
      LookupDataSet = qryAddressType
      LookupKeyFields = 'AddressTypeID'
      LookupResultField = 'AliasCust'
      KeyFields = 'AddressTypeID'
      Lookup = True
    end
    object qryCustAddressPostCode: TIntegerField
      FieldName = 'PostCode'
      Origin = 'PostCode'
    end
    object qryCustAddressSuburb: TWideStringField
      FieldName = 'Suburb'
      Origin = 'Suburb'
      Size = 50
    end
    object qryCustAddressState: TWideStringField
      FieldName = 'State'
      Origin = 'State'
      Size = 50
    end
    object qryCustAddressZone: TWideStringField
      FieldName = 'Zone'
      Origin = 'Zone'
      Size = 50
    end
  end
  object dsCustAdress: TDataSource
    DataSet = qryCustAddress
    Left = 392
    Top = 136
  end
  object dsAddressType: TDataSource
    DataSet = qryAddressType
    Left = 392
    Top = 224
  end
  object qryAddressType: TFDQuery
    Tag = 2
    Active = True
    Connection = FES.fesConnection
    SQL.Strings = (
      '-- USE IDFES;'
      'SELECT '
      #9#9' [AddressTypeID]'
      #9#9',[Caption]'
      #9#9',[UsedByHR]'
      #9#9',[AliasHR]'
      #9#9',[UsedByCust]'
      #9#9',[AliasCust]'
      #9#9',[IsArchived]'
      'FROM [IDFES].[dbo].[AddressType] '
      'WHERE UsedByCust = 1 AND IsArchived = 0; -- AND IsActive = 1;')
    Left = 304
    Top = 224
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
    Left = 504
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
    Left = 592
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
    Left = 696
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
    Left = 776
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
    Left = 888
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
    Left = 968
    Top = 136
  end
end
