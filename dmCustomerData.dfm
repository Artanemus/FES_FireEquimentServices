object CustomerData: TCustomerData
  Height = 480
  Width = 937
  object qryCustomer: TFDQuery
    Active = True
    Connection = FES.fesConnection
    SQL.Strings = (
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
    Left = 96
    Top = 57
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
    Left = 224
    Top = 56
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
      'USE [IDFES]'
      ';'
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
    Left = 96
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
    Left = 224
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
    Left = 664
    Top = 128
  end
  object dsContactNumType: TDataSource
    DataSet = tblContactNumType
    Left = 784
    Top = 128
  end
end
