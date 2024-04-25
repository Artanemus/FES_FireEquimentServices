object FindHR: TFindHR
  Left = 0
  Top = 0
  Caption = 'FindHR'
  ClientHeight = 576
  ClientWidth = 654
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Height = 34
  CustomTitleBar.SystemHeight = False
  CustomTitleBar.BackgroundColor = 4552068
  CustomTitleBar.ForegroundColor = clWhite
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = clWhite
  CustomTitleBar.ButtonBackgroundColor = 4552068
  CustomTitleBar.ButtonHoverForegroundColor = 65793
  CustomTitleBar.ButtonHoverBackgroundColor = 5541793
  CustomTitleBar.ButtonPressedForegroundColor = 65793
  CustomTitleBar.ButtonPressedBackgroundColor = 8170169
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Top = 34
  TextHeight = 21
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 34
    CustomButtons = <>
    ExplicitWidth = 1108
    object vimgToggleFilters: TVirtualImage
      AlignWithMargins = True
      Left = 364
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Toggle Filters ON/OFF'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 73
      ImageName = 'filter\filter_off'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 485
      ExplicitHeight = 30
    end
    object vimgSync: TVirtualImage
      AlignWithMargins = True
      Left = 472
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Syncronize and refresh.'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 150
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 43
      ImageName = 'Sync'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitHeight = 40
    end
    object vimgFilterCommon: TVirtualImage
      Tag = 1
      AlignWithMargins = True
      Left = 292
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Set Filters'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 69
      ImageName = 'filter\arrow_drop_down_circle'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 507
    end
    object vimgFindCustomer: TVirtualImage
      AlignWithMargins = True
      Left = 400
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Find a customer'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 41
      ImageName = 'record\search'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 537
      ExplicitHeight = 30
    end
    object VirtualImage1: TVirtualImage
      AlignWithMargins = True
      Left = 436
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Goto customer ID or CODE'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 55
      ImageName = 'goto'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitHeight = 39
    end
    object vimgFilterStatus: TVirtualImage
      Tag = 2
      AlignWithMargins = True
      Left = 328
      Top = 0
      Width = 32
      Height = 34
      Hint = 'Set Filters'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 69
      ImageName = 'filter\arrow_drop_down_circle'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 429
      ExplicitHeight = 30
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 34
    Width = 654
    Height = 39
    Align = alTop
    BevelEdges = [beBottom]
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 889
    object Label1: TLabel
      Left = 11
      Top = 9
      Width = 75
      Height = 21
      Alignment = taRightJustify
      Caption = ' Search for'
    end
    object edtSearch: TEdit
      Left = 92
      Top = 6
      Width = 333
      Height = 29
      Hint = 'Enter customer name,  address, site address, ID, etc.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'edtSearch'
    end
  end
  object cntrlistFindHR: TControlList
    Left = 0
    Top = 73
    Width = 654
    Height = 503
    Align = alClient
    ItemCount = 287
    ItemHeight = 40
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    TabOrder = 2
    OnBeforeDrawItem = cntrlistFindHRBeforeDrawItem
    ExplicitTop = 75
    object lblFNAME: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 3
      Width = 60
      Height = 34
      Margins.Left = 6
      Align = alLeft
      Caption = 'Tony LEE'
      Constraints.MinWidth = 60
      Layout = tlCenter
      ExplicitHeight = 21
    end
    object btnIsEnabled: TControlListButton
      AlignWithMargins = True
      Left = 591
      Top = 3
      Width = 32
      Height = 34
      Hint = 'Link Status'
      Margins.Right = 10
      Align = alRight
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      Images = FES.imgList32x32
      ImageIndex = 22
      ImageName = 'checked_box'
      Style = clbkToolButton
      ExplicitLeft = 723
      ExplicitTop = 12
      ExplicitHeight = 32
    end
    object btnEdit: TControlListButton
      Left = 556
      Top = 0
      Width = 32
      Height = 40
      Hint = 'Edit inpection order.'
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      Images = FES.imgList32x32
      ImageIndex = 13
      ImageName = 'edit'
      Style = clbkToolButton
      ExplicitLeft = 521
    end
  end
  object qryFindHR: TFDQuery
    Active = True
    Connection = FES.fesConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT [HRID]'
      '     , [EmergencyContactHRID]'
      '     , CONCAT(   [FirstName]'
      '               , '#39' '#39
      '               , CASE'
      '                     WHEN [MiddleName] IS NOT NULL THEN'
      '                         CONCAT(LEFT([MiddleName], 1), '#39' '#39')'
      '                     ELSE'
      '                         '#39#39
      '                 END'
      '               , UPPER([LastName])'
      '             ) AS FNAME'
      '     , [CreatedOn]'
      '     , [ModifiedOn]'
      '     , [IsArchived]'
      'FROM [IDFES].[dbo].[HR]')
    Left = 112
    Top = 192
  end
  object dsFindHR: TDataSource
    DataSet = qryFindHR
    Left = 176
    Top = 192
  end
  object bindsrc: TBindSourceDB
    DataSet = qryFindHR
    ScopeMappings = <>
    Left = 112
    Top = 136
  end
  object bindlist: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 172
    Top = 141
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrc
      GridControl = cntrlistFindHR
      Columns = <>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrc
      FieldName = 'FNAME'
      Component = lblFNAME
      ComponentProperty = 'Caption'
    end
  end
end
