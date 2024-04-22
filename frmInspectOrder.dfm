object InspectOrder: TInspectOrder
  Left = 0
  Top = 0
  Caption = 'Inspection Orders'
  ClientHeight = 739
  ClientWidth = 713
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel2
  CustomTitleBar.Height = 34
  CustomTitleBar.SystemHeight = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Top = 34
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 34
    Width = 713
    Height = 42
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object DBTextOrderNum: TDBText
      Left = 18
      Top = 6
      Width = 65
      Height = 30
      Alignment = taRightJustify
      DataField = 'InspectionOrderID'
      DataSource = InspectOrderData.dsInspectOrder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBTextInspectionStatus: TDBText
      Left = 89
      Top = 6
      Width = 101
      Height = 30
      AutoSize = True
      DataField = 'luInspectOrderStatus'
      DataSource = InspectOrderData.dsInspectOrder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 670
    Width = 713
    Height = 69
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 693
      Height = 47
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 76
    Width = 713
    Height = 594
    ActivePage = TabSheet7
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Details'
      DesignSize = (
        705
        558)
      object Label6: TLabel
        Left = 53
        Top = 46
        Width = 68
        Height = 21
        Alignment = taRightJustify
        Caption = 'Customer'
      end
      object Label8: TLabel
        Left = 95
        Top = 73
        Width = 26
        Height = 21
        Alignment = taRightJustify
        Caption = 'Site'
      end
      object Label9: TLabel
        Left = 42
        Top = 100
        Width = 79
        Height = 21
        Alignment = taRightJustify
        Caption = 'Created On'
      end
      object DBText4: TDBText
        Left = 127
        Top = 100
        Width = 158
        Height = 21
        AutoSize = True
        DataField = 'CreatedOn'
        DataSource = InspectOrderData.dsInspectOrder
      end
      object Label10: TLabel
        Left = 79
        Top = 201
        Width = 42
        Height = 21
        Alignment = taRightJustify
        Caption = 'Status'
      end
      object Label11: TLabel
        Left = 24
        Top = 236
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Caption = 'Requested for'
      end
      object Label12: TLabel
        Left = 21
        Top = 271
        Width = 101
        Height = 21
        Alignment = taRightJustify
        Caption = 'Completed On'
      end
      object Label13: TLabel
        Left = 204
        Top = 309
        Width = 36
        Height = 21
        Alignment = taRightJustify
        Caption = 'Level'
      end
      object SpeedButton5: TSpeedButton
        Left = 325
        Top = 236
        Width = 32
        Height = 32
        ImageIndex = 28
        ImageName = 'backspace'
        Images = FES.imgList32x32
        Flat = True
      end
      object SpeedButton6: TSpeedButton
        Left = 325
        Top = 271
        Width = 32
        Height = 32
        ImageIndex = 28
        ImageName = 'backspace'
        Images = FES.imgList32x32
        Flat = True
      end
      object Label15: TLabel
        Left = 19
        Top = 341
        Width = 102
        Height = 63
        Alignment = taRightJustify
        Caption = 'Office notes'#13#10'for Technicians'#13#10'eyes-only'
      end
      object DBtxtCustomerName: TDBText
        Left = 127
        Top = 46
        Width = 230
        Height = 21
        AutoSize = True
        Color = clWindow
        DataField = 'CustName'
        DataSource = InspectOrderData.dsCustomer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object DBtxtSiteName: TDBText
        Left = 127
        Top = 73
        Width = 399
        Height = 21
        AutoSize = True
        Color = clWindow
        DataField = 'SiteAddress'
        DataSource = InspectOrderData.dsInspectOrder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 34
        Top = 127
        Width = 87
        Height = 21
        Alignment = taRightJustify
        Caption = 'Modified On'
      end
      object DBtxtModifiedOn: TDBText
        Left = 127
        Top = 127
        Width = 4
        Height = 21
        AutoSize = True
        DataField = 'ModifiedOn'
        DataSource = InspectOrderData.dsInspectOrder
      end
      object Label4: TLabel
        Left = 38
        Top = 154
        Width = 83
        Height = 21
        Alignment = taRightJustify
        Caption = 'Modified By'
      end
      object DBtxtModifiedBy: TDBText
        Left = 127
        Top = 154
        Width = 4
        Height = 21
        AutoSize = True
        DataField = 'ModifiedBy'
        DataSource = InspectOrderData.dsInspectOrder
      end
      object Label7: TLabel
        Left = 16
        Top = 309
        Width = 106
        Height = 21
        Alignment = taRightJustify
        Caption = 'Service Interval'
      end
      object DBComboBox1: TDBComboBox
        Left = 127
        Top = 201
        Width = 187
        Height = 29
        DataField = 'luInspectOrderStatus'
        DataSource = InspectOrderData.dsInspectOrder
        TabOrder = 0
      end
      object DateTimePicker1: TDateTimePicker
        Left = 128
        Top = 236
        Width = 186
        Height = 29
        Date = 45278.000000000000000000
        Time = 0.602155023145314800
        TabOrder = 1
      end
      object DateTimePicker2: TDateTimePicker
        Left = 128
        Top = 271
        Width = 186
        Height = 29
        Date = 45278.000000000000000000
        Time = 0.602155023145314800
        TabOrder = 2
      end
      object DBEdit6: TDBEdit
        Left = 246
        Top = 306
        Width = 68
        Height = 29
        DataField = 'LevelNum'
        DataSource = InspectOrderData.dsInspectOrder
        TabOrder = 3
      end
      object DBMemo1: TDBMemo
        Left = 127
        Top = 341
        Width = 572
        Height = 202
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataField = 'Note'
        DataSource = InspectOrderData.dsInspectOrder
        TabOrder = 4
      end
      object StackPanel1: TStackPanel
        Left = 0
        Top = 0
        Width = 705
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = vimgPin
          end
          item
            Control = vimgActive
          end
          item
            Control = vimgArchived
          end
          item
            Control = vimgReport
          end>
        Orientation = spoHorizontal
        Padding.Left = 34
        Spacing = 8
        TabOrder = 5
        object vimgPin: TVirtualImage
          Left = 34
          Top = 0
          Width = 32
          Height = 32
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 74
          ImageName = 'pin'
        end
        object vimgActive: TVirtualImage
          Left = 74
          Top = 0
          Width = 32
          Height = 32
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 25
          ImageName = 'key_off'
        end
        object vimgArchived: TVirtualImage
          Left = 114
          Top = 0
          Width = 32
          Height = 32
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 29
          ImageName = 'unarchive'
        end
        object vimgReport: TVirtualImage
          Left = 154
          Top = 0
          Width = 32
          Height = 32
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 36
          ImageName = 'print'
        end
      end
      object DBEdit1: TDBEdit
        Left = 128
        Top = 306
        Width = 70
        Height = 29
        DataField = 'ServiceInterval'
        DataSource = InspectOrderData.dsInspectOrder
        TabOrder = 6
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Technicians'
      ImageIndex = -1
      inline FESTechHours1: TFESTechHours
        Left = 0
        Top = 0
        Width = 705
        Height = 558
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 705
        ExplicitHeight = 558
        inherited StackPanel1: TStackPanel
          Width = 705
          ControlCollection = <
            item
              Control = FESTechHours1.btnTogglePinVisibility
              HorizontalPositioning = sphpLeft
              VerticalPositioning = spvpFill
            end
            item
              Control = FESTechHours1.VirtualImage3
            end
            item
              Control = FESTechHours1.VirtualImage2
            end
            item
              Control = FESTechHours1.btnNew
            end
            item
              Control = FESTechHours1.btnDelete
            end>
          ExplicitWidth = 705
        end
        inherited ctrllistCustInspect: TControlList
          Width = 705
          Height = 485
          ExplicitWidth = 705
          ExplicitHeight = 485
          inherited lblNotes: TLabel
            Width = 420
          end
          inherited lblStationNumber: TLabel
            Height = 40
          end
          inherited btnEdit: TControlListButton
            Left = 659
            ExplicitLeft = -42
          end
          inherited Label3: TLabel
            Left = 603
            Height = 40
            ExplicitLeft = -98
          end
        end
        inherited pnlTOT: TPanel
          Top = 517
          Width = 705
          ExplicitTop = 517
          ExplicitWidth = 705
          DesignSize = (
            705
            41)
          inherited Label1: TLabel
            Left = 431
            ExplicitLeft = 431
          end
          inherited Label2: TLabel
            Left = 537
            ExplicitLeft = 537
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Link'
      ImageIndex = 1
      object Label14: TLabel
        Left = 98
        Top = 61
        Width = 77
        Height = 21
        Alignment = taRightJustify
        Caption = 'Customer#'
      end
      object DBText1: TDBText
        Left = 192
        Top = 61
        Width = 54
        Height = 21
        AutoSize = True
        Color = clWindow
        DataField = 'CustomerID'
        DataSource = InspectOrderData.dsInspectOrder
        ParentColor = False
      end
      object DBText2: TDBText
        Left = 98
        Top = 88
        Width = 230
        Height = 21
        AutoSize = True
        Color = clWindow
        DataField = 'CustName'
        DataSource = InspectOrderData.dsCustomer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label21: TLabel
        Left = 98
        Top = 195
        Width = 35
        Height = 21
        Alignment = taRightJustify
        Caption = 'Site#'
      end
      object DBText3: TDBText
        Left = 150
        Top = 195
        Width = 54
        Height = 21
        AutoSize = True
        Color = clWindow
        DataField = 'SiteID'
        DataSource = InspectOrderData.dsInspectOrder
        ParentColor = False
      end
      object DBText5: TDBText
        Left = 98
        Top = 222
        Width = 399
        Height = 21
        AutoSize = True
        Color = clWindow
        DataField = 'SiteAddress'
        DataSource = InspectOrderData.dsInspectOrder
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object VirtualImage2: TVirtualImage
        Left = 60
        Top = 61
        Width = 32
        Height = 32
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 16
        ImageName = 'Edit'
      end
      object VirtualImage3: TVirtualImage
        Left = 60
        Top = 195
        Width = 32
        Height = 32
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 16
        ImageName = 'Edit'
      end
      object VirtualImage4: TVirtualImage
        Left = 22
        Top = 195
        Width = 32
        Height = 32
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 3
        ImageName = 'bubble'
      end
      object VirtualImage10: TVirtualImage
        Left = 22
        Top = 61
        Width = 32
        Height = 32
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 3
        ImageName = 'bubble'
      end
      object Label5: TLabel
        Left = 98
        Top = 115
        Width = 60
        Height = 21
        Caption = 'Business'
      end
      object Label22: TLabel
        Left = 98
        Top = 142
        Width = 53
        Height = 21
        Caption = 'Contact'
      end
      object Label23: TLabel
        Left = 98
        Top = 249
        Width = 83
        Height = 21
        Caption = 'Site Contact'
      end
      object StackPanel2: TStackPanel
        Left = 0
        Top = 0
        Width = 705
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = VirtualImage11
          end>
        Padding.Left = 34
        TabOrder = 0
        object VirtualImage11: TVirtualImage
          Left = 34
          Top = 0
          Width = 32
          Height = 32
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 17
          ImageName = 'Delete'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Portable'
      ImageIndex = 2
    end
    object TabSheet4: TTabSheet
      Caption = 'Electrical'
      ImageIndex = 3
    end
    object TabSheet5: TTabSheet
      Caption = 'Water Base'
      ImageIndex = 4
    end
    object TabSheet6: TTabSheet
      Caption = 'Structual'
      ImageIndex = 5
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 76
    Width = 713
    Height = 0
    CustomButtons = <>
    object VirtualImage5: TVirtualImage
      AlignWithMargins = True
      Left = 531
      Top = 0
      Width = 32
      Height = 0
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 150
      Margins.Bottom = 0
      Align = alRight
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 13
      ImageName = 'Sync'
      ExplicitLeft = 0
      ExplicitHeight = 40
    end
    object VirtualImage6: TVirtualImage
      AlignWithMargins = True
      Left = 495
      Top = 0
      Width = 32
      Height = 0
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 14
      ImageName = 'filter_alt'
      ExplicitLeft = 0
      ExplicitHeight = 40
    end
    object VirtualImage7: TVirtualImage
      AlignWithMargins = True
      Left = 387
      Top = 0
      Width = 32
      Height = 0
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 3
      ImageName = 'bubble'
      ExplicitLeft = 0
      ExplicitHeight = 40
    end
    object VirtualImage8: TVirtualImage
      AlignWithMargins = True
      Left = 423
      Top = 0
      Width = 32
      Height = 0
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 0
      ImageName = 'search'
      ExplicitLeft = 0
      ExplicitHeight = 40
    end
    object VirtualImage9: TVirtualImage
      AlignWithMargins = True
      Left = 459
      Top = 0
      Width = 32
      Height = 0
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 4
      ImageName = 'arrow_drop_down_circle'
      ExplicitLeft = 0
      ExplicitHeight = 40
    end
  end
  object TitleBarPanel2: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 34
    CustomButtons = <>
    object VirtualImage1: TVirtualImage
      AlignWithMargins = True
      Left = 495
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
      ExplicitHeight = 30
    end
    object vimgFindCustomer: TVirtualImage
      AlignWithMargins = True
      Left = 459
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
      ExplicitLeft = 0
      ExplicitHeight = 39
    end
    object vimgSetFilters: TVirtualImage
      AlignWithMargins = True
      Left = 387
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
      ExplicitLeft = 367
      ExplicitHeight = 39
    end
    object vimgToggleFilters: TVirtualImage
      AlignWithMargins = True
      Left = 423
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
      ImageIndex = 72
      ImageName = 'filter\filter'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 505
      ExplicitTop = 3
      ExplicitHeight = 40
    end
    object vimgSync: TVirtualImage
      AlignWithMargins = True
      Left = 531
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
      ImageName = 'sync'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 542
      ExplicitHeight = 40
    end
  end
end
