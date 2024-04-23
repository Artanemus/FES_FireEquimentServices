object HRData: THRData
  Height = 832
  Width = 569
  object qryHR: TFDQuery
    Active = True
    Connection = FES.fesConnection
    SQL.Strings = (
      'SELECT '
      #9#9' [HRID]'
      #9#9',[LastName]'
      #9#9',[FirstName]'
      #9#9',[Note]'
      #9#9',[DOB]'
      #9#9',[UserLoginName]'
      #9#9',[EmergencyContactHRID]'
      #9#9',[CreatedOn]'
      #9#9',[ModifiedOn]'
      #9#9',[IsArchived]'
      
        '        ,CONCAT(TRIM(FirstName), '#39' '#39', TRIM(UPPER(LastName)))  AS' +
        ' FNAME'
      'FROM [IDFES].[dbo].[HR] '
      'ORDER BY LastName')
    Left = 56
    Top = 8
  end
  object dsHR: TDataSource
    DataSet = qryHR
    Left = 152
    Top = 8
  end
  object qryRoleList: TFDQuery
    Active = True
    IndexFieldNames = 'HRID'
    MasterSource = dsHR
    MasterFields = 'HRID'
    DetailFields = 'HRID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.RoleList'
    UpdateOptions.KeyFields = 'RoleListID'
    SQL.Strings = (
      'SELECT [RoleListID]'
      '     , RoleList.[HRID]'
      '     , RoleList.[RoleID]'
      '     , RoleList.[CreatedOn]'
      '     , Role.Caption'
      'FROM [IDFES].[dbo].[RoleList]'
      'LEFT JOIN Role ON RoleList.RoleID = Role.RoleID'
      'ORDER BY CreatedOn DESC')
    Left = 56
    Top = 144
  end
  object qryRole: TFDQuery
    Active = True
    MasterSource = dsRoleList
    MasterFields = 'RoleID'
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT '
      #9#9' [RoleID]'
      #9#9',[Caption]'
      #9#9',[Note]'
      #9#9',[IsArchived]'
      'FROM [IDFES].[dbo].[Role] '
      'ORDER BY RoleID')
    Left = 64
    Top = 696
  end
  object dsRoleList: TDataSource
    DataSet = qryRoleList
    Left = 152
    Top = 144
  end
  object dsRole: TDataSource
    DataSet = qryRole
    Left = 160
    Top = 696
  end
  object qryEmergencyHR: TFDQuery
    Active = True
    IndexFieldNames = 'HRID'
    MasterSource = dsHR
    MasterFields = 'HRID'
    DetailFields = 'HRID'
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'IDFES.dbo.HR'
    UpdateOptions.KeyFields = 'EmergencyContactHRID'
    SQL.Strings = (
      'SELECT'
      '    [HR].[HRID]'
      #9',[HR].[EmergencyContactHRID]'
      '    ,[eHR].[FirstName]'
      '    ,[eHR].[LastName]'
      '    ,CONCAT(eHR.FirstName, '#39' '#39' , UPPER(eHR.[LastName])) AS FNAME'
      
        '    ,dbo.GetHRContactNum(HR.[EmergencyContactHRID]) AS Emergency' +
        'Number'
      'FROM [IDFES].[dbo].[HR] '
      'INNER JOIN HR AS eHR ON HR.[EmergencyContactHRID] = eHR.HRID'
      
        '-- INNER JOIN HRNumber ON HR.[EmergencyContactHRID] = HRNumber.H' +
        'RID')
    Left = 56
    Top = 200
  end
  object dsEmergencyHR: TDataSource
    DataSet = qryEmergencyHR
    Left = 152
    Top = 200
  end
  object pumenuHRCommon: TPopupMenu
    Left = 376
    Top = 144
    object puEdit: TMenuItem
      Caption = 'Edit'
      ImageIndex = 2
      ImageName = 'Edit'
      ShortCut = 113
    end
    object puInsert: TMenuItem
      Caption = 'Insert'
      ImageIndex = 4
      ImageName = 'New'
      ShortCut = 8237
    end
    object puDelete: TMenuItem
      Caption = 'Delete'
      ImageIndex = 3
      ImageName = 'Delete'
      ShortCut = 16430
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object puPin: TMenuItem
      Caption = 'Pin'
      ImageIndex = 0
      ImageName = 'pin'
    end
    object puFilter: TMenuItem
      Caption = 'Filter'
      ImageIndex = 6
      ImageName = 'filter_alt_off'
    end
    object puRefresh: TMenuItem
      Caption = 'Refresh'
      ImageIndex = 7
      ImageName = 'Refresh'
      ShortCut = 123
    end
  end
  object qryHRNumber: TFDQuery
    Active = True
    IndexFieldNames = 'HRID'
    MasterSource = dsHR
    MasterFields = 'HRID'
    DetailFields = 'HRID'
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'IDFES.dbo.HRNumber'
    UpdateOptions.KeyFields = 'HRNumberID'
    SQL.Strings = (
      'SELECT '
      #9#9' [HRNumberID]'
      #9#9',[HRID]'
      #9#9',[Number]'
      #9#9',[CreatedOn]'
      #9#9',HRNumber.[IsArchived]'
      #9#9',[StackOrder]'
      #9#9',HRNumber.[NumberTypeID]'
      '    ,NumberType.AliasHR'
      'FROM [IDFES].[dbo].[HRNumber] '
      
        'LEFT JOIN NumberType ON HRNumber.NumberTypeID = NumberType.Numbe' +
        'rTypeID'
      'ORDER BY [StackOrder] DESC')
    Left = 56
    Top = 256
  end
  object dsHRNumber: TDataSource
    DataSet = qryHRNumber
    Left = 152
    Top = 256
  end
  object qryHREmail: TFDQuery
    Active = True
    IndexFieldNames = 'HRID'
    MasterSource = dsHR
    MasterFields = 'HRID'
    DetailFields = 'HRID'
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'IDFES.dbo.HREmail'
    UpdateOptions.KeyFields = 'HREmailID'
    SQL.Strings = (
      'SELECT '
      #9#9' [HREmailID]'
      #9#9',HREmail.[HRID]'
      #9#9',HREmail.[Email]'
      #9#9',HREmail.[CreatedOn]'
      #9#9',HREmail.[IsArchived]'
      #9#9',HREmail.[StackOrder]'
      #9#9',HREmail.[EmailTypeID]'
      '    ,EmailType.AliasHR'
      'FROM [IDFES].[dbo].[HREmail]'
      
        'LEFT JOIN EmailType ON HREmail.[EmailTypeID] = EmailType.[EmailT' +
        'ypeID] '
      'ORDER BY StackOrder ASC')
    Left = 56
    Top = 312
  end
  object dsHREmail: TDataSource
    DataSet = qryHREmail
    Left = 152
    Top = 312
  end
  object qryAddress: TFDQuery
    Active = True
    IndexFieldNames = 'HRID'
    MasterSource = dsHR
    MasterFields = 'HRID'
    DetailFields = 'HRID'
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvLockWait]
    UpdateOptions.LockWait = True
    UpdateOptions.UpdateTableName = 'IDFES.dbo.HRAddress'
    UpdateOptions.KeyFields = 'AddressTypeID'
    SQL.Strings = (
      '   SELECT '
      #9#9' [HRAddressID]'
      #9#9',[HRID]'
      #9#9',HRAddress.[AddressTypeID]'
      #9#9',HRAddress.[CreatedOn]'
      #9#9',HRAddress.[IsArchived]'
      #9#9',[StackOrder]'
      '        , dbo.GetHRAddrSingleLine(HRID,1) AS AddrSingleLine'
      '        , AddressType.AliasHR'
      'FROM [IDFES].[dbo].[HRAddress] '
      
        'LEFT JOIN AddressType ON HRAddress.AddressTypeID = AddressType.A' +
        'ddressTypeID'
      'ORDER BY StackOrder')
    Left = 56
    Top = 368
  end
  object dsAddress: TDataSource
    DataSet = qryAddress
    Left = 152
    Top = 368
  end
  object qryCustContact: TFDQuery
    Active = True
    IndexFieldNames = 'HRID'
    MasterSource = dsHR
    MasterFields = 'HRID'
    DetailFields = 'HRID'
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'IDFES.dbo.CustContact'
    SQL.Strings = (
      '-- Drop a temporary table '
      '-- Drop the table if it already exists'
      'IF OBJECT_ID('#39'tempDB..#tempCC'#39', '#39'U'#39') IS NOT NULL'
      'DROP TABLE #tempCC;'
      ''
      '-- Create the temporary table '
      '-- Distinct calculated on integer PK'
      '-- Execution performance boost'
      'SELECT DISTINCT '
      '    HRID'
      '    ,CustomerID'
      'INTO #tempCC'
      'FROM CustContact;'
      ''
      'SELECT '
      #9#9' #tempCC.[HRID]'
      '         ,Customer.CustName -- add the string here'
      'FROM #tempcc'
      'INNER JOIN Customer ON #tempCC.CustomerID = Customer.CustomerID'
      'ORDER BY HRID')
    Left = 56
    Top = 424
  end
  object dsCustContact: TDataSource
    DataSet = qryCustContact
    Left = 152
    Top = 424
  end
end
