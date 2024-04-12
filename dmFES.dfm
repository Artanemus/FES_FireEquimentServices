object FES: TFES
  Height = 480
  Width = 640
  object fesConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_FES'
      'User_Name=Ben'
      'ApplicationName=FireEquipmentServices')
    Connected = True
    LoginPrompt = False
    Left = 88
    Top = 48
  end
  object qryPlannerItem: TFDQuery
    Active = True
    Connection = fesConnection
    SQL.Strings = (
      '-- Planner Item'
      'DECLARE @MAXCUSTNAME AS INT;'
      'SET @MAXCUSTNAME = 32;'
      ''
      'SELECT [InspectionOrderID]       -- AS CreateKey'
      '     , [InspectionOrder].[CreatedOn]'
      '     , [BookIN] AS StartTime'
      '     , CASE'
      '           WHEN [BookOUT] IS NULL'
      '                OR ([BookOUT] < [BookIN]) THEN'
      '               DATEADD(hour, 4, [BookIN] + 4)'
      '           ELSE'
      '               [BookIN]'
      '       END AS EndTime'
      '     , [ServiceInterval]'
      '     , [LevelNum]'
      '     , [InspectionOrder].[Note] AS Notes'
      '     , [NotePortable]'
      '     , [NoteElectrical]'
      '     , [NoteWaterBase]'
      '     , [NoteStructual]'
      '     , [InspectionStatusID]'
      '     , [HRID]'
      '     , [InspectionOrder].[IsArchived]'
      '     , [CustSiteID]'
      '     , [IsEnabled]'
      '     , [InspectionOrder].[CustomerID]'
      '     , CONCAT(   [Customer].[CustCode]'
      '               , '#39' - '#39
      '               , CASE'
      
        '                     WHEN (LEN([Customer].[CustName]) > @MAXCUST' +
        'NAME) THEN'
      
        '                         CONCAT(LEFT([Customer].[CustName], @MAX' +
        'CUSTNAME), '#39'...'#39')'
      '                     ELSE'
      '                         [Customer].[CustName]'
      '                 END'
      '             ) AS [Subject]'
      '     , CASE'
      '           WHEN [Customer].[CustCode] IS NULL THEN'
      '               CASE'
      
        '                   WHEN (LEN([Customer].[CustName]) > @MAXCUSTNA' +
        'ME) THEN'
      
        '                       CONCAT(LEFT([Customer].[CustName], @MAXCU' +
        'STNAME), '#39'...'#39')'
      '                   ELSE'
      '                       [Customer].[CustName]'
      '               END'
      '           ELSE'
      '               [Customer].[CustCode]'
      '       END AS [Recurrency]'
      '     , [BookIN] AS MinTimeField  -- optional usedBy Recurrency'
      '     , [BookOUT] AS MaxTimeField -- optional usedBy Recurrency'
      '     , [IsPinned]'
      '     , [SiteID]'
      '     , [InspectionOrder].[ModifiedOn]'
      '     , [InspectionOrder].[ModifiedBy]'
      'FROM [IDFES].[dbo].[InspectionOrder]'
      '    LEFT JOIN [Customer]'
      
        '        ON [InspectionOrder].[CustomerID] = [Customer].[Customer' +
        'ID]'
      '        '
      '        ')
    Left = 304
    Top = 224
  end
  object dsPlannerItem: TDataSource
    DataSet = qryPlannerItem
    Left = 392
    Top = 224
  end
end
