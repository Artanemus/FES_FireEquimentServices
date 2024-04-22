object FESCustSurvey: TFESCustSurvey
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Align = alClient
  TabOrder = 0
  object StackPanel1: TStackPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    ControlCollection = <
      item
        Control = vimgHideUnPinned
      end>
    TabOrder = 0
    object vimgHideUnPinned: TVirtualImage
      Left = 0
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 77
      ImageName = 'VisibilityOn'
      ParentShowHint = False
      ShowHint = True
    end
  end
  object ctrllistCustSurvey: TControlList
    Left = 0
    Top = 32
    Width = 640
    Height = 448
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 80
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    OnBeforeDrawItem = ctrllistCustSurveyBeforeDrawItem
    object lblSurveyTech: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 4
      Height = 74
      Margins.Left = 10
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 21
    end
    object lblSurveySiteAddrStr: TLabel
      Left = 17
      Top = 0
      Width = 524
      Height = 80
      Margins.Left = 10
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      StyleElements = [seClient, seBorder]
      ExplicitWidth = 4
      ExplicitHeight = 21
    end
    object lblSurveyRequestedDT: TLabel
      AlignWithMargins = True
      Left = 628
      Top = 3
      Width = 4
      Height = 74
      Margins.Right = 4
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 17
    end
    object btnPinSurvey: TControlListButton
      AlignWithMargins = True
      Left = 544
      Top = 3
      Width = 32
      Height = 74
      Margins.Right = 4
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 14
      ImageName = 'pin'
      Style = clbkToolButton
      ExplicitLeft = 555
      ExplicitTop = 4
      ExplicitHeight = 32
    end
    object btnEditSurvey: TControlListButton
      AlignWithMargins = True
      Left = 583
      Top = 3
      Width = 32
      Height = 74
      Margins.Right = 10
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 13
      ImageName = 'edit'
      Style = clbkToolButton
      ExplicitLeft = 593
      ExplicitTop = 4
      ExplicitHeight = 32
    end
  end
  object bindlistCustSurvey: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 128
    Top = 152
    object LinkGridToDataSource1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcCustSurvey
      GridControl = ctrllistCustSurvey
      Columns = <>
    end
    object LinkPropertyToField1: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustSurvey
      FieldName = 'SiteAddrStr'
      Component = lblSurveySiteAddrStr
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustSurvey
      FieldName = 'FNAME'
      Component = lblSurveyTech
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustSurvey
      FieldName = 'RequestedDTstr'
      Component = lblSurveyRequestedDT
      ComponentProperty = 'Caption'
    end
  end
  object bindsrcCustSurvey: TBindSourceDB
    DataSet = CustomerData.qryCustSurvey
    ScopeMappings = <>
    Left = 128
    Top = 240
  end
end
