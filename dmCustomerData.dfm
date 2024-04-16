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
  object qryCustNum: TFDQuery
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
      'SELECT [CustNumberID]'
      '      ,[CustNumber].[CustomerID]'
      '      ,[CustNumber].[Number]'
      '      ,[CustNumber].[CreatedOn]'
      '      ,[CustNumber].[IsArchived]'
      '      ,[CustNumber].[NumberTypeID]'
      '      ,[NumberType].AliasCust AS NumberTypeStr'
      
        '      ,CONVERT(VARCHAR(10), [CustNumber].[CreatedOn], 103) AS Sh' +
        'ortDateStr  -- dd/MM/yyyy format'
      '  FROM [dbo].[CustNumber]'
      
        'LEFT JOIN [dbo].[NumberType] ON  [CustNumber].[NumberTypeID] = [' +
        'NumberType].[NumberTypeID]'
      ''
      ';')
    Left = 48
    Top = 128
  end
  object dsCustNum: TDataSource
    DataSet = qryCustNum
    Left = 112
    Top = 128
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
    Left = 240
    Top = 128
  end
  object dsCustAdress: TDataSource
    DataSet = qryCustAddress
    Left = 312
    Top = 128
  end
  object qryCustEmails: TFDQuery
    Tag = 1
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    DetailFields = 'CustomerID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.CustEmail'
    UpdateOptions.KeyFields = 'CustEmailID'
    SQL.Strings = (
      '  SELECT '
      #9#9' [CustEmailID]'
      #9#9',[CustEmail].[CustomerID]'
      #9#9',[CustEmail].[Email]'
      #9#9',[CustEmail].[CreatedOn]'
      #9#9',[CustEmail].[IsArchived]'
      #9#9',[CustEmail].[EmailTypeID]'
      '    ,[EmailType].AliasCust AS EmailTypeStr'
      
        '      ,CONVERT(VARCHAR(10), [CustEmail].[CreatedOn], 103) AS Sho' +
        'rtDateStr  -- dd/MM/yyyy format'
      '    '
      'FROM [IDFES].[dbo].[CustEmail] '
      
        'LEFT JOIN  EmailType ON [CustEmail].EmailTypeID = EmailType.Emai' +
        'lTypeID')
    Left = 432
    Top = 128
  end
  object dsCustEmails: TDataSource
    DataSet = qryCustEmails
    Left = 504
    Top = 128
  end
  object qryCustSite: TFDQuery
    Tag = 1
    Active = True
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    Connection = FES.fesConnection
    FormatOptions.AssignedValues = [fvFmtDisplayDateTime]
    FormatOptions.FmtDisplayDateTime = 'dd/mm/yy'
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
      '     -- ,[CustSite].[Note]'
      '      ,[SeedDate]'
      '      ,[SeedLevel]'
      '      ,[DoReseed]'
      
        '      ,[dbo].GetSiteAddrMultiLine(CustSite.SiteID) AS SiteAddrSt' +
        'r '
      
        '      ,[dbo].GetCustSiteHRSingleLine(CustSite.CustSiteID,1)  AS ' +
        'SiteContactStr'
      '  FROM [IDFES].[dbo].[CustSite]'
      '  --INNER JOIN dbo.Site ON CustSite.SiteID = Site.SiteID'
      '  --INNER JOIN dbo.HR ON CustSite.SiteContactID = HR.HRID')
    Left = 592
    Top = 128
  end
  object dsCustSite: TDataSource
    DataSet = qryCustSite
    Left = 656
    Top = 128
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
      
        '     , CONVERT(DATE, [CustContact].[CreatedOn], 102) AS CreatedO' +
        'n102'
      '     , dbo.GetHRSingleLine([CustContact].[HRID], 1) AS FName'
      '     , ContactType.AliasCust AS ContactTypeStr'
      '     --, [CustContact].[Caption]'
      '     , [CustContact].[IsArchived]'
      '     --, [CustContact].[SortList]'
      '     --, [CustContact].[ContactTypeID]'
      'FROM [IDFES].[dbo].[CustContact]'
      '    INNER JOIN HR'
      '        ON CustContact.HRID = HR.HRID'
      '    LEFT JOIN ContactType'
      '        ON CustContact.ContactTypeID = ContactType.ContactTypeID'
      'WHERE CustContact.HRID IS NOT NULL')
    Left = 736
    Top = 128
  end
  object dsCustContact: TDataSource
    DataSet = qryCustContact
    Left = 800
    Top = 128
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
      'SELECT [InspectionOrderID]'
      '     , [CustSiteID]'
      '     , [CustomerID]'
      '     --, [InspectionOrder].[CreatedOn]'
      '     , [InspectionOrder].IsPinned'
      
        '     , CONCAT('#39'CREA: '#39', CONVERT(DATE, [InspectionOrder].[Created' +
        'On], 102)) AS CreatedONstr'
      
        '     , CONCAT('#39'REQU: '#39', CONVERT(DATE, [BookIN], 102)) AS BookINs' +
        'tr'
      
        '     , CONCAT('#39'COMP: '#39', CONVERT(DATE, [BookOUT], 102)) AS BookOU' +
        'Tstr'
      '     , [ServiceInterval]'
      '     , [LevelNum]'
      '     --,[InspectionOrder].[Note]'
      '     --,[NotePortable]'
      '     --,[NoteElectrical]'
      '     --,[NoteWaterBase]'
      '     --,[NoteStructual]'
      '     , IsPinned'
      '     , [InspectionOrder].[InspectionStatusID]'
      '     , [InspectionOrder].[SiteID]'
      
        '     , dbo.GetSiteAddrSingleLine([InspectionOrder].[SiteID], 1) ' +
        'AS SiteAddrStr'
      '     , [InspectionStatus].Caption AS InspectStatusStr'
      'FROM [dbo].[InspectionOrder]'
      '    INNER JOIN [dbo].[Site]'
      '        ON [InspectionOrder].SiteID = Site.SiteID'
      '    LEFT JOIN InspectionStatus'
      
        '        ON [InspectionOrder].InspectionStatusID = InspectionStat' +
        'us.InspectionStatusID'
      '')
    Left = 904
    Top = 128
  end
  object dsCustInspect: TDataSource
    DataSet = qryCustInspect
    Left = 992
    Top = 128
  end
  object qryCustSurvey: TFDQuery
    IndexFieldNames = 'CustomerID'
    MasterSource = dsCustomer
    MasterFields = 'CustomerID'
    DetailFields = 'CustomerID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.SurveyOrder'
    UpdateOptions.KeyFields = 'SurveyOrderID'
    SQL.Strings = (
      'SELECT [SurveyOrderID]'
      '     , [SurveyOrder].[CreatedOn]'
      '     --,[RequestedDT]'
      '     --,[SurveyedOn]'
      '     --,[CompletedDT]'
      
        '     , CONCAT('#39'REQU:'#39', CONVERT(DATE, [RequestedDT], 102)) AS Req' +
        'uestedDTstr'
      
        '     , CONCAT('#39'INSP:'#39', CONVERT(DATE, [SurveyedOn], 102)) AS Surv' +
        'eyedOnstr'
      
        '     , CONCAT('#39'COMP:'#39', CONVERT(DATE, [CompletedDT], 102)) AS Com' +
        'pletedDTstr'
      '     , [SurveyOrder].[IsArchived]'
      '     , [SurveyStatusID]'
      '     , [SurveyOrder].[HRID]'
      '     , [CustSiteID]'
      '     , [CustomerID]'
      '     , [SurveyOrder].[SiteID]'
      '     , CONCAT('#39'TECH:'#39', firstname, '#39' '#39', UPPER(lastname)) AS FNAME'
      
        '     , dbo.GetSiteAddrSingleLine([SurveyOrder].[SiteID], 1) AS S' +
        'iteAddrStr'
      ''
      'FROM [dbo].[SurveyOrder]'
      '    INNER JOIN [dbo].[Site]'
      '        ON [SurveyOrder].SiteID = Site.SiteID'
      '    LEFT JOIN HR'
      '        ON SurveyOrder.HRID = HR.HRID;')
    Left = 1200
    Top = 128
  end
  object dsCustSurvey: TDataSource
    DataSet = qryCustSurvey
    Left = 1272
    Top = 128
  end
end
