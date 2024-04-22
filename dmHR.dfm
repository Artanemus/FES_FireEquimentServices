object HRData: THRData
  Height = 480
  Width = 1072
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
    Left = 296
    Top = 32
  end
  object dsHR: TDataSource
    DataSet = qryHR
    Left = 360
    Top = 32
  end
  object qryRoleList: TFDQuery
    IndexFieldNames = 'HRID'
    MasterSource = dsHR
    MasterFields = 'HRID'
    DetailFields = 'HRID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.RoleList'
    UpdateOptions.KeyFields = 'RoleListID'
    SQL.Strings = (
      'SELECT [RoleListID]'
      '     , [HRID]'
      '     , [RoleID]'
      '     , [CreatedOn]'
      'FROM [IDFES].[dbo].[RoleList]'
      'ORDER BY CreatedOn DESC')
    Left = 168
    Top = 128
  end
  object qryRole: TFDQuery
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
    Left = 96
    Top = 240
  end
  object dsRoleList: TDataSource
    DataSet = qryRoleList
    Left = 248
    Top = 128
  end
  object dsRole: TDataSource
    DataSet = qryRole
    Left = 160
    Top = 240
  end
  object qryEmergencyHR: TFDQuery
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
    Left = 432
    Top = 128
  end
  object dsEmergencyHR: TDataSource
    DataSet = qryEmergencyHR
    Left = 528
    Top = 128
  end
  object pumenuHRCommon: TPopupMenu
    Left = 552
    Top = 16
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
      #9#9',[SortList]'
      #9#9',HRNumber.[NumberTypeID]'
      '    ,NumberType.AliasHR'
      'FROM [IDFES].[dbo].[HRNumber] '
      
        'LEFT JOIN NumberType ON HRNumber.NumberTypeID = NumberType.Numbe' +
        'rTypeID'
      'ORDER BY [HRNumberID] ASC')
    Left = 728
    Top = 120
  end
  object dsHRNumber: TDataSource
    DataSet = qryHRNumber
    Left = 808
    Top = 120
  end
end
