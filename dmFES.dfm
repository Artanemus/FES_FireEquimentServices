object FES: TFES
  Height = 480
  Width = 640
  object fesConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_FES'
      'User_Name=Ben'
      'ApplicationName=FireEquipmentServices')
    LoginPrompt = False
    Left = 88
    Top = 48
  end
end
