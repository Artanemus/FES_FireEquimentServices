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
  object ControlList1: TControlList
    Left = 0
    Top = 0
    Width = 483
    Height = 400
    Align = alClient
    ItemHeight = 44
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    TabOrder = 0
    ExplicitLeft = 40
    ExplicitTop = 8
    object shapeTrackBarColor: TShape
      Left = 397
      Top = 6
      Width = 32
      Height = 32
      Hint = 'Trackbar color'
      Anchors = [akTop, akRight]
      Brush.Color = clBlack
      ParentShowHint = False
      ShowHint = False
    end
    object shapeNotesColor: TShape
      Left = 359
      Top = 6
      Width = 32
      Height = 32
      Hint = 'Background color'
      Anchors = [akTop, akRight]
      Brush.Color = clLightpink
      ParentShowHint = False
      ShowHint = False
    end
    object shapeCaptionSelectedColor: TShape
      Left = 321
      Top = 6
      Width = 32
      Height = 32
      Hint = 'Selected color'
      Anchors = [akTop, akRight]
      Brush.Color = clLightpink
      ParentShowHint = False
      ShowHint = False
    end
    object lblCaption: TLabel
      Left = 12
      Top = 8
      Width = 5
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnTrackBarColor: TControlListButton
      Left = 396
      Top = 5
      Width = 32
      Height = 32
      Hint = 'Track bar color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      Images = FES.imgList32x32
      ImageIndex = 21
      ImageName = 'Dot'
      Style = clbkToolButton
      OnClick = btnTrackBarColorClick
    end
    object btnCaptionSelectedColor: TControlListButton
      Left = 320
      Top = 5
      Width = 32
      Height = 32
      Hint = 'Caption selected color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      Images = FES.imgList32x32
      ImageIndex = 21
      ImageName = 'Dot'
      Style = clbkToolButton
    end
    object btnNotesColor: TControlListButton
      Left = 358
      Top = 5
      Width = 32
      Height = 32
      Hint = 'Notes color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      Images = FES.imgList32x32
      ImageIndex = 21
      ImageName = 'Dot'
      Style = clbkToolButton
    end
    object shapeTrackBarSelectedColor: TShape
      Left = 436
      Top = 6
      Width = 32
      Height = 32
      Hint = 'Selected color'
      Anchors = [akTop, akRight]
      Brush.Color = clLightpink
      ParentShowHint = False
      ShowHint = False
    end
    object btnTrackBarSelectedColor: TControlListButton
      Left = 435
      Top = 5
      Width = 32
      Height = 32
      Hint = 'Track bar selected color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      Images = FES.imgList32x32
      ImageIndex = 21
      ImageName = 'Dot'
      Style = clbkToolButton
    end
    object shapeCaptionColor: TShape
      Left = 284
      Top = 6
      Width = 32
      Height = 32
      Hint = 'Selected color'
      Anchors = [akTop, akRight]
      Brush.Color = clLightpink
      ParentShowHint = False
      ShowHint = False
    end
    object btnCaptionColor: TControlListButton
      Left = 283
      Top = 6
      Width = 32
      Height = 32
      Hint = 'Caption color'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      Images = FES.imgList32x32
      ImageIndex = 21
      ImageName = 'Dot'
      Style = clbkToolButton
      OnClick = btnCaptionColorClick
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
  end
  object qryStatusPalette: TFDQuery
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
      '    TMSNotesColor,'
      '    TMSCaptionColor,'
      '    TMSSelectedCaptionColor,'
      '    TMSTrackColor,'
      '    TMSSelectedTrackColor,'
      '    TMSLinkColor'
      ' FROM InspectionStatus'
      'ORDER BY StackOrder DESC')
    Left = 152
    Top = 128
  end
  object ColorDialog1: TColorDialog
    Left = 272
    Top = 128
  end
end
