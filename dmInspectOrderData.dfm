object InspectOrderData: TInspectOrderData
  Height = 480
  Width = 946
  object qryInspectOrder: TFDQuery
    Active = True
    Connection = FES.fesConnection
    FormatOptions.AssignedValues = [fvFmtDisplayNumeric]
    FormatOptions.FmtDisplayNumeric = '000000'
    SQL.Strings = (
      'SELECT '
      #9#9' [InspectionOrderID]'
      #9#9',[CreatedOn]'
      #9#9',[BookIN]'
      #9#9',[BookOUT]'
      #9#9',[ServiceInterval]'
      #9#9',[LevelNum]'
      #9#9',[Note]'
      #9#9',[NotePortable]'
      #9#9',[NoteElectrical]'
      #9#9',[NoteWaterBase]'
      #9#9',[NoteStructual]'
      #9#9',[InspectionStatusID]'
      #9#9',[HRID]'
      #9#9',[IsArchived]'
      #9#9',[CustSiteID]'
      #9#9',[IsEnabled]'
      #9#9',[CustomerID]'
      #9#9',[IsPinned]'
      #9#9',[SiteID]'
      #9#9',[ModifiedOn]'
      #9#9',[ModifiedBy]'
      '    ,dbo.GetSiteAddrSingleLine(SiteID,1) AS SiteAddress'
      'FROM [IDFES].[dbo].[InspectionOrder] ')
    Left = 472
    Top = 40
    object qryInspectOrderInspectionOrderID: TFDAutoIncField
      FieldName = 'InspectionOrderID'
      Origin = 'InspectionOrderID'
      ProviderFlags = [pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object qryInspectOrderCustSiteID: TIntegerField
      FieldName = 'CustSiteID'
      Origin = 'CustSiteID'
      DisplayFormat = '000000'
    end
    object qryInspectOrderSiteID: TIntegerField
      FieldName = 'SiteID'
      Origin = 'SiteID'
      DisplayFormat = '000000'
    end
    object qryInspectOrderCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
      DisplayFormat = '000000'
    end
    object qryInspectOrderHRID: TIntegerField
      FieldName = 'HRID'
      Origin = 'HRID'
      DisplayFormat = '000000'
    end
    object qryInspectOrderInspectionStatusID: TIntegerField
      FieldName = 'InspectionStatusID'
      Origin = 'InspectionStatusID'
      DisplayFormat = '000000'
    end
    object qryInspectOrderCreatedOn: TSQLTimeStampField
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
    end
    object qryInspectOrderModifiedOn: TSQLTimeStampField
      FieldName = 'ModifiedOn'
      Origin = 'ModifiedOn'
    end
    object qryInspectOrderModifiedBy: TIntegerField
      FieldName = 'ModifiedBy'
      Origin = 'ModifiedBy'
      DisplayFormat = '000000'
    end
    object qryInspectOrderBookIN: TSQLTimeStampField
      FieldName = 'BookIN'
      Origin = 'BookIN'
    end
    object qryInspectOrderBookOUT: TSQLTimeStampField
      FieldName = 'BookOUT'
      Origin = 'BookOUT'
    end
    object qryInspectOrderServiceInterval: TFloatField
      FieldName = 'ServiceInterval'
      Origin = 'ServiceInterval'
    end
    object qryInspectOrderLevelNum: TIntegerField
      FieldName = 'LevelNum'
      Origin = 'LevelNum'
    end
    object qryInspectOrderIsArchived: TBooleanField
      FieldName = 'IsArchived'
      Origin = 'IsArchived'
      Required = True
    end
    object qryInspectOrderIsEnabled: TBooleanField
      FieldName = 'IsEnabled'
      Origin = 'IsEnabled'
      Required = True
    end
    object qryInspectOrderIsPinned: TBooleanField
      FieldName = 'IsPinned'
      Origin = 'IsPinned'
      Required = True
    end
    object qryInspectOrderSiteAddress: TWideStringField
      FieldName = 'SiteAddress'
      Origin = 'SiteAddress'
      ReadOnly = True
      Size = 96
    end
    object qryInspectOrderluInspectOrderStatus: TStringField
      FieldKind = fkLookup
      FieldName = 'luInspectOrderStatus'
      LookupDataSet = qryInspectOrderStatus
      LookupKeyFields = 'InspectionStatusID'
      LookupResultField = 'Caption'
      KeyFields = 'InspectionStatusID'
      Lookup = True
    end
    object qryInspectOrderNote: TWideStringField
      FieldName = 'Note'
      Origin = 'Note'
      Size = 128
    end
  end
  object dsInspectOrder: TDataSource
    DataSet = qryInspectOrder
    Left = 536
    Top = 40
  end
  object qryInspectOrderStatus: TFDQuery
    Active = True
    Connection = FES.fesConnection
    SQL.Strings = (
      'SELECT * FROM InspectionStatus ORDER BY StackOrder ASC')
    Left = 760
    Top = 40
  end
  object qryCustomer: TFDQuery
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustSite
    MasterFields = 'CustSiteID'
    DetailFields = 'CustSiteID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.Customer'
    UpdateOptions.KeyFields = 'CustomerID'
    SQL.Strings = (
      'SELECT [Customer].[CustomerID]'
      '     , [Customer].[CustName]'
      '     , [Customer].[CustCode]'
      '     , [Customer].[MYOBID]'
      '     , [Customer].[Note]'
      '     , [Customer].[CreatedBy]'
      '     , [Customer].[CreatedOn]'
      '     , [Customer].[ModifiedBy]'
      '     , [Customer].[ModifiedOn]'
      '     , [Customer].[IsArchived]'
      '     , [CustSite].[CustSiteID]'
      'FROM [IDFES].[dbo].[Customer]'
      '    INNER JOIN [CustSite]'
      '        ON [Customer].[CustomerID] = [CustSite].[CustomerID]')
    Left = 144
    Top = 304
  end
  object dsCustomer: TDataSource
    DataSet = qryCustomer
    Left = 200
    Top = 304
  end
  object qrySite: TFDQuery
    Active = True
    MasterSource = dsCustSite
    MasterFields = 'CustSiteID'
    DetailFields = 'CustSiteID'
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'IDFES.dbo.Site'
    UpdateOptions.KeyFields = 'SiteID'
    SQL.Strings = (
      'SELECT [Site].[SiteID]'
      '     , [Site].[Note]'
      '     , [Site].[Address]'
      '     , [Site].[CreatedOn]'
      '     , [Site].[IsArchived]'
      '     , [Site].[PostcodeID]'
      '     , [CustSite].[CustSiteID]'
      '     '
      'FROM [IDFES].[dbo].[Site]'
      '    INNER JOIN [CustSite]'
      '        ON [Site].[SiteID] = [CustSite].[SiteID]'
      '')
    Left = 312
    Top = 304
  end
  object dsSite: TDataSource
    Left = 368
    Top = 304
  end
  object qryCustSite: TFDQuery
    Active = True
    IndexFieldNames = 'InspectionOrderID'
    MasterSource = dsInspectOrder
    MasterFields = 'InspectionOrderID'
    DetailFields = 'InspectionOrderID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.CustSite'
    UpdateOptions.KeyFields = 'CustSiteID'
    SQL.Strings = (
      'SELECT '
      #9#9' [CustSite].[CustSiteID]'
      #9#9',[CustSite].[CustomerID]'
      #9#9',[CustSite].[SiteID]'
      #9#9',[CustSite].[CreatedOn]'
      #9#9',[CustSite].[ModifiedOn]'
      #9#9',[CustSite].[IsArchived]'
      #9#9',[CustSite].[ModifiedBy]'
      #9#9',[CustSite].[IsEnabled]'
      #9#9',[CustSite].[SiteContactID]'
      #9#9',[CustSite].[Note]'
      #9#9',[CustSite].[SeedDate]'
      #9#9',[CustSite].[SeedLevel]'
      #9#9',[CustSite].[DoReseed]'
      '        ,[InspectionOrder].[InspectionOrderID]'
      '    '
      'FROM [IDFES].[dbo].[CustSite] '
      '    INNER JOIN [InspectionOrder]'
      '        ON [CustSite].[SiteID] = [InspectionOrder].[SiteID]'
      
        '           AND [CustSite].[CustomerID] = [InspectionOrder].[Cust' +
        'omerID]')
    Left = 232
    Top = 192
  end
  object dsCustSite: TDataSource
    DataSet = qryCustSite
    Left = 288
    Top = 192
  end
end
