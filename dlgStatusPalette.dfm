object StatusPalette: TStatusPalette
  Left = 0
  Top = 0
  Anchors = [akTop, akRight]
  BorderStyle = bsDialog
  Caption = 'Inspection Order Status : color palette'
  ClientHeight = 441
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poOwnerFormCenter
  OnKeyUp = FormKeyUp
  TextHeight = 15
  object clistInspectStatus: TControlList
    Left = 0
    Top = 81
    Width = 483
    Height = 319
    Align = alClient
    ItemCount = 7
    ItemHeight = 44
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    TabOrder = 0
    OnAfterDrawItem = clistInspectStatusAfterDrawItem
    ExplicitTop = 0
    ExplicitHeight = 400
    object lblCaption: TLabel
      Left = 12
      Top = 8
      Width = 54
      Height = 25
      Caption = 'Action'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnTrackColor: TControlListButton
      Left = 365
      Top = 4
      Width = 32
      Height = 32
      Hint = 'Track bar color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      OnClick = btnTrackColorClick
      ExplicitLeft = 348
    end
    object btnSelectedCaptionColor: TControlListButton
      Left = 327
      Top = 4
      Width = 32
      Height = 32
      Hint = 'Caption selected color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSelectedCaptionColorClick
      ExplicitLeft = 310
    end
    object btnColor: TControlListButton
      Tag = 1
      Left = 213
      Top = 4
      Width = 32
      Height = 32
      Hint = 'Notes color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      OnClick = btnColorClick
    end
    object btnSelectedTrackColor: TControlListButton
      Left = 403
      Top = 4
      Width = 32
      Height = 32
      Hint = 'Track bar selected color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      ImageName = 'Dot'
      OnClick = btnSelectedTrackColorClick
      ExplicitLeft = 386
    end
    object btnCaptionColor: TControlListButton
      Left = 289
      Top = 5
      Width = 32
      Height = 32
      Hint = 'Caption color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      ImageName = 'Dot'
      OnClick = btnCaptionColorClick
    end
    object btnSelectedColor: TControlListButton
      Left = 251
      Top = 5
      Width = 32
      Height = 32
      Hint = 'Notes color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSelectedColorClick
    end
    object btnLinkColor: TControlListButton
      Left = 441
      Top = 5
      Width = 32
      Height = 32
      Hint = 'Link color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      ImageName = 'Dot'
      OnClick = btnLinkColorClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 483
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      483
      41)
    object btnClose: TButton
      Left = 394
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Close'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object Button1: TButton
      Left = 313
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Preview'
      ModalResult = 1
      TabOrder = 1
    end
    object Button2: TButton
      Left = 232
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Default'
      ModalResult = 1
      TabOrder = 2
    end
    object Button3: TButton
      Left = 151
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Paste'
      ModalResult = 1
      TabOrder = 3
    end
    object Button4: TButton
      Left = 70
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Copy'
      ModalResult = 1
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 483
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 2
    object lblColor: TLabel
      Left = 215
      Top = 40
      Width = 35
      Height = 35
      Caption = 'Color'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Orientation = 450
      Font.Style = []
      ParentFont = False
    end
    object lblSelectColor: TLabel
      Left = 250
      Top = 18
      Width = 57
      Height = 57
      Caption = 'Select Color'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Orientation = 450
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblxCaption: TLabel
      Left = 291
      Top = 32
      Width = 43
      Height = 43
      Caption = 'Caption'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Orientation = 450
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblxSelectCaption: TLabel
      Left = 322
      Top = 9
      Width = 66
      Height = 66
      Caption = 'Select Caption'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Orientation = 450
      Font.Style = []
      ParentFont = False
    end
    object lblTrack: TLabel
      Left = 366
      Top = 42
      Width = 33
      Height = 33
      Caption = 'Track'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Orientation = 450
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblbSelectTrack: TLabel
      Left = 405
      Top = 19
      Width = 56
      Height = 56
      Caption = 'Select Track'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Orientation = 450
      Font.Style = []
      ParentFont = False
    end
    object lblLink: TLabel
      Left = 443
      Top = 47
      Width = 28
      Height = 28
      Caption = 'Link'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Orientation = 450
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
  end
  object qryStatusPalette: TFDQuery
    Active = True
    IndexFieldNames = 'InspectionStatusID'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.InspectionStatus'
    UpdateOptions.KeyFields = 'InspectionStatusID'
    SQL.Strings = (
      'SELECT '
      'InspectionStatusID ,'
      '    Caption,'
      '    Description,'
      '    StackOrder,'
      '    TMSColor,'
      '    TMSSelectedColor,'
      '    TMSCaptionColor,'
      '    TMSSelectedCaptionColor,'
      '    TMSTrackColor,'
      '    TMSSelectedTrackColor,'
      '    TMSLinkColor'
      ' FROM InspectionStatus'
      'ORDER BY StackOrder DESC')
    Left = 392
    Top = 152
  end
  object ColorDLG: TColorDialog
    Left = 272
    Top = 128
  end
  object bindlist: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 176
    Top = 224
    object LinkGridToDataSource1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrc
      GridControl = clistInspectStatus
      Columns = <>
    end
    object LinkPropertyToField1: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrc
      FieldName = 'Caption'
      Component = lblCaption
      ComponentProperty = 'Caption'
    end
  end
  object bindsrc: TBindSourceDB
    DataSet = qryStatusPalette
    ScopeMappings = <>
    Left = 176
    Top = 280
  end
end
