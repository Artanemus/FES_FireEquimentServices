object FESCustNumber: TFESCustNumber
  Left = 0
  Top = 0
  Width = 598
  Height = 480
  Align = alClient
  TabOrder = 0
  object StackPanel1: TStackPanel
    Left = 0
    Top = 0
    Width = 598
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
      OnClick = vimgHideUnPinnedClick
    end
  end
  object ctrllistCustNum: TControlList
    Left = 0
    Top = 32
    Width = 598
    Height = 448
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemCount = 2
    ItemHeight = 40
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    OnBeforeDrawItem = ctrllistCustNumBeforeDrawItem
    object lblNumberType: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 143
      Height = 34
      Margins.Left = 10
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Business'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lblNumber: TLabel
      AlignWithMargins = True
      Left = 166
      Top = 3
      Width = 98
      Height = 34
      Margins.Left = 10
      Align = alLeft
      Caption = '073 273 1360'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      StyleElements = [seClient, seBorder]
      ExplicitHeight = 21
    end
    object btnEditNumber: TControlListButton
      AlignWithMargins = True
      Left = 552
      Top = 3
      Width = 32
      Height = 34
      Margins.Right = 10
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 13
      ImageName = 'edit'
      Style = clbkToolButton
      ExplicitLeft = 557
      ExplicitTop = 4
      ExplicitHeight = 32
    end
    object btnPinNumber: TControlListButton
      AlignWithMargins = True
      Left = 513
      Top = 3
      Width = 32
      Height = 34
      Margins.Right = 4
      Align = alRight
      Images = FES.imgList32x32
      ImageIndex = 14
      ImageName = 'pin'
      Style = clbkToolButton
      OnClick = btnPinNumberClick
      ExplicitLeft = 519
      ExplicitTop = 4
      ExplicitHeight = 32
    end
    object lblNumberCreatedOn: TLabel
      AlignWithMargins = True
      Left = 440
      Top = 3
      Width = 66
      Height = 34
      Margins.Right = 4
      Align = alRight
      Alignment = taRightJustify
      Caption = '28/05/2021'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 17
    end
  end
  object bindsrcCustNum: TBindSourceDB
    DataSet = CustomerData.qryCustNum
    ScopeMappings = <>
    Left = 128
    Top = 200
  end
  object bindlistCustNum: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 128
    Top = 136
    object LinkPropertyToField1: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustNum
      FieldName = 'ShortDateStr'
      Component = lblNumberCreatedOn
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustNum
      FieldName = 'NumberTypeStr'
      Component = lblNumberType
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustNum
      FieldName = 'Number'
      Component = lblNumber
      ComponentProperty = 'Caption'
    end
    object LinkGridToDataSourcebindsrcCustNum: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcCustNum
      GridControl = ctrllistCustNum
      Columns = <>
    end
  end
end
