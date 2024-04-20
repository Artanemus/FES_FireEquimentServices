object FESTechHours: TFESTechHours
  Left = 0
  Top = 0
  Width = 640
  Height = 480
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
        Control = btnTogglePinVisibility
        HorizontalPositioning = sphpLeft
        VerticalPositioning = spvpFill
      end
      item
        Control = VirtualImage3
      end
      item
        Control = VirtualImage2
      end
      item
        Control = btnNew
      end
      item
        Control = btnDelete
      end>
    Orientation = spoHorizontal
    Padding.Left = 34
    Spacing = 8
    TabOrder = 0
    object btnTogglePinVisibility: TVirtualImage
      Left = 34
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
    object VirtualImage3: TVirtualImage
      Left = 74
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 94
      ImageName = 'calculate'
      ParentShowHint = False
      ShowHint = True
    end
    object VirtualImage2: TVirtualImage
      Left = 114
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 36
      ImageName = 'Print'
      ParentShowHint = False
      ShowHint = True
    end
    object btnNew: TVirtualImage
      Left = 154
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 14
      ImageName = 'record\New'
      ParentShowHint = False
      ShowHint = True
    end
    object btnDelete: TVirtualImage
      Left = 194
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 9
      ImageName = 'record\Delete'
      ParentShowHint = False
      ShowHint = True
    end
  end
  object ctrllistCustInspect: TControlList
    Left = 0
    Top = 32
    Width = 640
    Height = 407
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemCount = 1
    ItemHeight = 40
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object lblNotes: TLabel
      AlignWithMargins = True
      Left = 173
      Top = 3
      Width = 355
      Height = 34
      Margins.Left = 10
      Margins.Right = 10
      Align = alClient
      Caption = 'Punch IN'#13#10'Punch OUT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      StyleElements = [seClient, seBorder]
      ExplicitWidth = 64
    end
    object lblStationNumber: TLabel
      Left = 39
      Top = 0
      Width = 124
      Height = 40
      Align = alLeft
      Caption = 'Technicians Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 21
    end
    object lblInspectInspectedDT: TLabel
      Left = 17
      Top = 43
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnEdit: TControlListButton
      AlignWithMargins = True
      Left = 594
      Top = 3
      Width = 32
      Height = 34
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
    object btnCheck: TControlListButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 32
      Height = 34
      Margins.Right = 4
      Align = alLeft
      Images = FES.imgList32x32
      ImageIndex = 22
      ImageName = 'checked_box'
      Style = clbkToolButton
      ExplicitLeft = 576
      ExplicitTop = 4
      ExplicitHeight = 74
    end
    object Label3: TLabel
      Left = 538
      Top = 0
      Width = 53
      Height = 40
      Align = alRight
      Caption = 'HOURS'
      Layout = tlCenter
      ExplicitHeight = 21
    end
  end
  object pnlTOT: TPanel
    Left = 0
    Top = 439
    Width = 640
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      640
      41)
    object Label1: TLabel
      Left = 434
      Top = 6
      Width = 100
      Height = 21
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'TOTAL HOURS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 540
      Top = 6
      Width = 53
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'HH:MM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pumenuTech: TPopupMenu
    Left = 312
    Top = 264
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
    object puCopy: TMenuItem
      Caption = 'Copy'
      ShortCut = 16451
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
end
