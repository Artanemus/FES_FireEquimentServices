object CustomerData: TCustomerData
  Height = 480
  Width = 1154
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
      '      ,[SortList]'
      '      ,[ContactNumTypeID]'
      '  FROM [dbo].[CustContactNum]'
      ''
      ';')
    Left = 216
    Top = 136
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
    object qryCustContactNumSortList: TIntegerField
      FieldName = 'SortList'
      Origin = 'SortList'
      Visible = False
    end
    object qryCustContactNumContactNumTypeID: TIntegerField
      FieldName = 'ContactNumTypeID'
      Origin = 'ContactNumTypeID'
      Visible = False
    end
  end
  object dsCustContactNum: TDataSource
    DataSet = qryCustContactNum
    Left = 344
    Top = 136
  end
  object tblContactNumType: TFDTable
    Active = True
    IndexFieldNames = 'ContactNumTypeID'
    Connection = FES.fesConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    TableName = 'IDFES..ContactNumType'
    Left = 216
    Top = 232
  end
  object dsContactNumType: TDataSource
    DataSet = tblContactNumType
    Left = 344
    Top = 232
  end
  object qryCustAddress: TFDQuery
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
      #9#9',[SortList]'
      '    ,PostCode'
      '    ,Suburb'
      '    ,State'
      '    ,Zone'
      'FROM [dbo].[CustAddress]'
      
        'INNER JOIN [dbo].[PostCode] ON [CustAddress].[PostcodeID] = [Pos' +
        'tCode].[PostcodeID] '
      '; ')
    Left = 512
    Top = 144
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
    object qryCustAddressSortList: TIntegerField
      FieldName = 'SortList'
      Origin = 'SortList'
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
    Left = 632
    Top = 144
  end
  object dsAddressType: TDataSource
    DataSet = qryAddressType
    Left = 632
    Top = 232
  end
  object qryAddressType: TFDQuery
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
    Left = 512
    Top = 232
  end
  object qryCustEmails: TFDQuery
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    Connection = FES.fesConnection
    SQL.Strings = (
      '  SELECT '
      #9#9' [CustEmailID]'
      #9#9',[CustomerID]'
      #9#9',[Email]'
      #9#9',[CreatedOn]'
      #9#9',[IsArchived]'
      #9#9',[SortList]'
      #9#9',[EmailTypeID]'
      'FROM [IDFES].[dbo].[CustEmail] ')
    Left = 816
    Top = 144
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
    object qryCustEmailsSortList: TIntegerField
      FieldName = 'SortList'
      Origin = 'SortList'
      Visible = False
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
    Left = 928
    Top = 144
  end
  object dsEmailType: TDataSource
    DataSet = qryEmailType
    Left = 928
    Top = 232
  end
  object qryEmailType: TFDQuery
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
    Left = 816
    Top = 232
  end
end
