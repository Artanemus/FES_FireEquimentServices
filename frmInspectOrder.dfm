object InspectOrder: TInspectOrder
  Left = 0
  Top = 0
  Caption = 'Inspection Orders'
  ClientHeight = 739
  ClientWidth = 713
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel2
  CustomTitleBar.Height = 40
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Top = 40
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 713
    Height = 42
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 716
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
    ExplicitWidth = 716
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
      ExplicitWidth = 696
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 82
    Width = 713
    Height = 588
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 716
    object TabSheet1: TTabSheet
      Caption = 'Details'
      DesignSize = (
        705
        552)
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
        ImageIndex = 5
        ImageName = 'backspace'
        Images = VirtualImageList1
        Flat = True
      end
      object SpeedButton6: TSpeedButton
        Left = 325
        Top = 271
        Width = 32
        Height = 32
        ImageIndex = 5
        ImageName = 'backspace'
        Images = VirtualImageList1
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
        Height = 196
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataField = 'Note'
        DataSource = InspectOrderData.dsInspectOrder
        TabOrder = 4
        ExplicitWidth = 575
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
        ExplicitWidth = 708
        object vimgPin: TVirtualImage
          Left = 34
          Top = 0
          Width = 32
          Height = 32
          ImageCollection = ImageCollection1
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 11
          ImageName = 'keep'
        end
        object vimgActive: TVirtualImage
          Left = 74
          Top = 0
          Width = 32
          Height = 32
          ImageCollection = ImageCollection1
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 8
          ImageName = 'toggle_on'
        end
        object vimgArchived: TVirtualImage
          Left = 114
          Top = 0
          Width = 32
          Height = 32
          ImageCollection = ImageCollection1
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 10
          ImageName = 'unarchive'
        end
        object vimgReport: TVirtualImage
          Left = 154
          Top = 0
          Width = 32
          Height = 32
          ImageCollection = ImageCollection1
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 1
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
        Height = 552
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 68
        ExplicitTop = 72
        inherited StackPanel1: TStackPanel
          Width = 705
          ControlCollection = <
            item
              Control = FESTechHours1.btnTogglePinVisibility
              HorizontalPositioning = sphpLeft
              VerticalPositioning = spvpFill
            end
            item
              Control = FESTechHours1.btnClipboard
              HorizontalPositioning = sphpLeft
              VerticalPositioning = spvpFill
            end
            item
              Control = FESTechHours1.VirtualImage1
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
          ExplicitLeft = 0
          ExplicitWidth = 640
        end
        inherited ctrllistCustInspect: TControlList
          Width = 705
          Height = 479
          ExplicitLeft = 0
          ExplicitTop = 32
          ExplicitWidth = 640
          ExplicitHeight = 407
          inherited lblNotes: TLabel
            Width = 420
          end
          inherited lblStationNumber: TLabel
            ExplicitLeft = 39
            ExplicitTop = 0
            ExplicitHeight = 21
          end
          inherited btnEdit: TControlListButton
            Left = 659
          end
          inherited Label3: TLabel
            Left = 603
            ExplicitLeft = -137
          end
        end
        inherited pnlTOT: TPanel
          Top = 511
          Width = 705
          ExplicitLeft = 0
          ExplicitTop = 439
          ExplicitWidth = 640
          DesignSize = (
            705
            41)
          inherited Label1: TLabel
            Left = 431
          end
          inherited Label2: TLabel
            Left = 537
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
        ImageCollection = ImageCollection1
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
        ImageCollection = ImageCollection1
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
        ImageCollection = ImageCollection1
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
        ImageCollection = ImageCollection1
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
        ExplicitWidth = 708
        object VirtualImage11: TVirtualImage
          Left = 34
          Top = 0
          Width = 32
          Height = 32
          ImageCollection = ImageCollection1
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
    Top = 82
    Width = 713
    Height = 0
    CustomButtons = <>
    ExplicitWidth = 716
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
      ImageCollection = ImageCollection1
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
      ImageCollection = ImageCollection1
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
      ImageCollection = ImageCollection1
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
      ImageCollection = ImageCollection1
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
      ImageCollection = ImageCollection1
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
    Height = 40
    CustomButtons = <>
    ExplicitWidth = 716
    object VirtualImage1: TVirtualImage
      AlignWithMargins = True
      Left = 495
      Top = 0
      Width = 32
      Height = 40
      Hint = 'Goto customer ID or CODE'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 3
      ImageName = 'bubble'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitHeight = 39
    end
    object vimgFindCustomer: TVirtualImage
      AlignWithMargins = True
      Left = 459
      Top = 0
      Width = 32
      Height = 40
      Hint = 'Find a customer'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 0
      ImageName = 'search'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitHeight = 39
    end
    object vimgSetFilters: TVirtualImage
      AlignWithMargins = True
      Left = 423
      Top = 0
      Width = 32
      Height = 40
      Hint = 'Set Filters'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 4
      ImageName = 'arrow_drop_down_circle'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 40
      ExplicitHeight = 39
    end
    object vimgToggleFilters: TVirtualImage
      AlignWithMargins = True
      Left = 387
      Top = 0
      Width = 32
      Height = 40
      Hint = 'Toggle Filters ON/OFF'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 14
      ImageName = 'filter_alt'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 505
      ExplicitTop = 3
    end
    object vimgSync: TVirtualImage
      AlignWithMargins = True
      Left = 531
      Top = 0
      Width = 32
      Height = 40
      Hint = 'Syncronize and refresh.'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 150
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 13
      ImageName = 'Sync'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 542
    end
  end
  object ImageCollection1: TImageCollection
    Images = <
      item
        Name = 'search'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000003E7494441546843ED996BC88D5914C7
              7F6FB90FB9E45E8C5B94E432D2C4D414C61794A2318348F181DC721D93299798
              865CCA255308113393314C514C343E8C669272CB6486322EE5525226940FEC7F
              EDC3E369EFE7B29FF376CE1BAB4E6F9D77AFFF5AFFBDF65E7BAD756AA8E35253
              C7FDE73D814A47F09D8E40576020D005E801F402AE0337805BC0BFC0B9DA8E50
              4804C602E300FD6D94E2E051E007FBA9152E7908B407F6019F0578F23B30CF90
              BE14A09BA89295C000E014D0B2A00353EC26148479A39E8580CEB7CE73923C01
              CEDB3BD12C65ED746057B918A411680DDC011A3A0CEA82EEB017F542E4FFFD81
              41C0546088C7D1DEC0DFE5209144A01EF00B30DA61E827E3C017191CD80ECC70
              AC3B6D888F029E67C008BE030B81F50EED31C0AF390C77B3A935AEB208D89003
              C7B93429027F388EC01C606B805165AEDF627A67CD779F0460BDA5E22330CC66
              9DE8E243C0E7050CEEB6F7220A311CD0710A161F81B5C09218AA764BBB162ABA
              D08A6A54D6015F85024ACF47E067FBD296B0FF075A012F0A18AB0F3C32F7AA69
              04E3B07DD583617D042E027D23A86539AF3602D1D4AA97B95FB0F70911780A34
              8E006F0216143164753702F32338CF802645707D115035D929027C109858C490
              D53D004C88E0DC033A14C1F5113869C23D2202FC8F2D978BD892EE35A06704E4
              4F607011501F01D70BAABAFFBF02C63E3469F4664CFF47E0CB0298DE2C34CBF1
              602D35F742E935545C2FBBEE84BE0F165F04742EAF022D62C84301D5F679A52D
              7017507D1515D543C7F38245D72795123B816931F087809CC92B3AEB1F97FBF8
              082F89C04853161F73787AD976650F32B0D08EEF31FDC424C7DACE66836E67C0
              485C92D60FAC36AFEF320FC264D3CCEF4F401F0F2819E8058FCB4AF3C58AA2CE
              A745A0847F045009ED124D20F49AAA1B539DA37A49930ABDE2DD531CFC065853
              94445A044AF87B01F5B3E51615722AE882252B01195067A523112A2F3D774E25
              8A4A9520C9434006F4E8CC3435FCA739ACE9127F6B875E6A211B3874E7025B72
              60BE5E9A974049512951994544D4324627112A99AFD88F065B2A4B4AA2ACF418
              F8C0E1AC36E6FBBC244209C4EDB4B144EE3BCA85F85A4D38B4AE793948948B40
              DE8D5309ADBA4A639BB8CC06B66505AC1401F9A763A7EAD4554E6B0CB9390B89
              4A12907F1A556A28A657392E99B253A509C8691DA3BFEC1D8A9358EC994D15CE
              4259A29B674D3BE08CA769FADA8CF1BFF3815543044ABE7534DDD909A08FC359
              6FD9514D04E4B7FA708D2D35208ECB726055FCCB6A2320FFD4BA6A2EF551CC59
              67055B8D04E4B72A590DBD4AB3296FF95DAD0444423F1A2A129AC97A7B876A26
              2012FA2144BDB957AA9D406A2A7E4F20758B6A79419D8FC02B6B468A31E8B67D
              770000000049454E44AE426082}
          end>
      end
      item
        Name = 'print'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001E3494441546843ED98BF2E444114C6
              7FFB02A240143AA252F00644A191A848745E8006B5D58950A0904844497801D1
              F000122A055E4034849E9D646C4E263B3BE7BA77EEBA766E37996FCE39DFF7CD
              9D7F352AFED52A5E3F8940A71DEC3A07BE4A525C2DAC1A680B4F04940EAA8555
              03FFAB039B4A4543B00D07A016560DF4386008D443D505FACDF844402BA2BB0A
              2507EC148C3285C68049601C18B61699B6FC6EB4D60570BEB80FC03D700BDCB5
              8AE1FB89A78133A0AFA002F386F90456812337502B02CBC07EDE8C91C62F0017
              32B64B6004788A94BCA8B083C0CB4F3097C036B05E54A648717681351F814B60
              46247E06B680E348C584C2CE0287C090009A8563CA47E01DE811E003602594A5
              C0FE5E6000781431CF8179D1FE9035BA5328C646A5E5B708EC01FD8DE55BAADC
              F6A8F197089C004B82ED84DD032A43C0ACF33B96C02B300ABC35DA95216076E3
              39C0FC0757C0A925531902BE7F2511901716F7D0A55D61B2E2E421B150073AF1
              2A919B8054CF3DB76755568B77EFDADEFB42681FD0262C1BD7ACBBEB09C47A56
              09395A9803B12EF5BF26101A18E3B097DE8542AACBFEE4400BB5D214CA338562
              3D6CA91F9DD540CBB21367A1B602270259E65F06AC5A5835D026BFCE50441E68
              F3DD2714242B8150BCD2FB1381D225771256DE816FB7276D316F53DB48000000
              0049454E44AE426082}
          end>
      end
      item
        Name = 'build'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000004AF494441546843ED9907A825351440
              CFB2EA82A888051541ACD84545504445040B62C75EC0B2D8C02E360415C10E36
              141B288A7DEDD8602D8862EF8ABD21F68662C39E03992566336FDEBCFFE6BDFF
              612F3C76279349EE496E6EC99FC6149769535C7FE6018C7B0727BA03F3012B02
              4B02DF02DFC57F47C63508C0B6C06EC086C0CAC0FC056D2F076E059EE89AA40D
              804A1F1A94DAA28552CF0127028FB7F8A655D736000E2CC46DAD6680DF0077AD
              1388B6002588D780E7818D80357BC06972EEC850651080128400FB01DF000702
              E7D768B94C30C32F874930284009E249606FE05360B57888D7C9947D04D80EF8
              7D5810BD004E03CE6898283F132A68DB0FF13B77E2F86C8C2B80C3BA06D801B8
              274C72FA0010F703BB007F44251F06B64A14F6502F37AC7851B703D7479B76DE
              41202E058E8C4A2F0F3C032C9540E85ACF1BC62E9400164D4CA09AA309627A74
              AFAEBCF23EB04AA2E049C0D9C9F353C0265D01AC0BBC5C18DCF320482E8B44E5
              B74E5EBC09AC953CEF09DC9C3CBF15BE59A32B809D80BB6A06CF21748B378520
              B579D63FEFB71EF052D2E72B60E9AE004E00CE4D06CFBD51A59C26E2593180A5
              720C7051D6B620F04BD2F627B0405700FB03D726839F02FC9D4109B123A0B9A5
              7200705D41B1C50B5E67223168CE14A5415CD1A713256E07760F07FBA8C2CA56
              DD7E0404BFBB6655D70EAED5942395CE00CCEDBF4E664A3DCA4CE0EA4C914F00
              57FEB11E2661F4BD2F79FF22B0415726E4B81F0553D07F57723470717CD82306
              B75563BA700EF04A83320F8658B04DD2E710E0AA2E01F4427AA3542C5E3E481A
              ACC43EEC4389DC85FAC92CC085F8A78FEF7B76A9B3439331AB29CDA912933453
              804144F3CA5DAD8B24841E6960E97590F6056EC846FE3E9A82E9739338F6BF49
              A71284E74208F3A381A4C91368F7554E934E609CD03BBD9DF977FBE8ADFC7986
              F4F57F35403C10217E1E84A009C0311F0A6E354D13F2793C071629266BFE164A
              3A681E3E5799A9AF4A3B61C6EA4EE88E5B493F000E68342EE541FD4CF62BB044
              66262588D9114233ED5BFA057040018CCAA56B94A6097F0AF163D950DCA46652
              82B0CD9DB034ED4BDA0038A0AED39AD79F895C499CDC7B21772D1557D6EF5333
              2941E8FD84E8AB766E0B902A641ABD58FCF9FF4AAAEB9333C3013E358330C2AF
              1E1C436526CEFF68C1C55A2F08F159D3364C04A0696CDF9F059C9C755429D3EB
              CA4C66444791C709AB3883A0A94AAD740DE0C4BA5C53F45454CA7B22EB026561
              E0DEC24EBC1077A236E28F0240052F008ECB204C4B36033E8FED9AE31D0508AB
              43CDE9BDD2368C0AC0B92F044C0A537907D832DE25D96E95E6D5E5A6593F5371
              210C9CFF93510238F125E10AFE884C873780ED433DF1716C37DF1242134BC53A
              5BD82FD2C6510338F765A1DE383C53CE747CD724DB5D2942AC9FF59BEB62611C
              00EA7465B0FD8333E52CFAF70AD793EFC676DDAD3B91DE6E785E0C8873645C00
              2A704DB0FD83328857A3EBD4D68DFC7930ACCADB4901A0125E1E584BA7F23A70
              674179FB6C9CD5EB93E2AF94E93566EE64AA6773A87D62AC18AB17AA53F0C678
              355F7AAFD7F16F0FDE7CCF25E33C03B932B7445F9FB61BBC54FED93AF2C904A0
              8EC7023B032BC4436EF16F9CA895C906D04BD7E2BB7900AD976CC81F4CF91DF8
              0FD081DD31ABD4906C0000000049454E44AE426082}
          end>
      end
      item
        Name = 'bubble'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000472494441546843ED995B88565514C7
              7F833E7843C9104B9F347B515FD4EC22062569662A5E5FD4474D09CA04451123
              C30AB120CD0B463EDA4B8258E13551512BC3AC400D211389D442F3929722823C
              FF619FD8B367EFB3CFFECE37330C7C1B0E03337BAFF5FFAFB5F65E9769A293AF
              A64E8E9F06818EF660C303C603BD81A78071C018E001EBD3961BD6F7157008F8
              1AF8B3AA07AB7AE04960053001E89E08E6AF8CEC01602D7022F1ECFFDB6B25D0
              D30017F8AEB52A37E7FE352444E46EAAAC5A084C04DE0146A42A8BECFF1E5809
              EC4B919B4A6021B035A240A171C1FAB47DB0F5C5426D11F0615912290456036F
              04045F057698EF4844F933C06CF3F50BEC7D33FBBDF445575902CF015F04A4BD
              0EAC07EE44B5B5DCD00B780D581338371E3818935986C063C0C980A057818D31
              2591BFBF027C10D8331AF8B6E87C8C805E986F80911E218F02E72B82CF8F0F01
              7EF2C8D2C57EBAE8758A11908BDFF7087E08F8BD4EE07331FD81DF3C32DF0214
              A6DE5544E04163FD479C93CF9B045467FCCDE29410F73B829527E4056FB22B22
              E07B759601EFB505724BE652E05D47C7A7C0349FDE2202A79CD8BF6EDEF25B6D
              4CA08FC9217D2D3D7F67B9E1E1ECD5BAE9EA0E11F0BD3C1F6797769E23406FFA
              E11A0915196F7B76A9E73A72A703BBCA12D0DBBCCAD9FC22B0A79D084C02763B
              BA946B969425702C4B2263ADCD2A0F7A782CDD561E90AA7B4E857BDC5CE61630
              426E3C939505C3AC9D6781E101022261AFFFA0B955CD7FCE7264E57B634F7829
              0C212197800116AACF81A989B13E14F824005EA262043E03A6583A2F0303CB86
              90EBBE0DA66E29CBC1075EC59E8AB8B21E50CC2F8E8571C80A2ACCD4B4E46B1D
              B0BC247A1FF89DC069A79A8D79A01201D5F3832CC0DB80052508F8C0EBE99B61
              C0DBE5788C40A51052DA7EC2022C0BCE8C10F08117089D5339E066F618814A97
              58A9DBBEB46A529E2D20E003AF775C96FFC79C4B2550E919FD0898EF005651A7
              D072970FFC5E035E2540BE5208F8F28BF71E86DCF8B669B06DB0FA9D9B9D7DE0
              554D2A6CDC09430A81CDC0CB8EA5344C702BD5E05BAC89C3778E802B4E6EF081
              57DB29F0B73D9E2A4B40ADA63C6DF7CBAA04D483B41A84155D240D9DD497E64B
              77206FD87DE0356D13F8561563E21D9097DD3EB9A672FA256BBC11032F6202AF
              923BB4DC92C337BDF0F5C735373402A2865A0D4691E58F1AF0D74AE489A22DA1
              BEB8E69652CA64B522F05F1AF055FBE3503F5CB9A9CF2DE68B794D971536BADC
              5596AF0FCEE5BD101B35C6B2A104F9C06BD4A232F9D70AC8D53AAA3C71FBDF5C
              64A911638C800FBC865C02FF8BD1F438A052638BF942AF500E4CDDD69C6CE221
              EBDA7DAF6D8BBA8C167DE0951B1436178D36BD4E7A3EEDA571A0FD0F8D6E89C3
              DD5223C55C61C8033EF03F18CBFF6C0E4F06D4E8D46BC9389A7E178E125D6565
              E742AAE565797BFCA7DA4473A2AA4B06D9643EBDF9492B760794FE15EFFACE79
              24AB3E51BCEA1EA42E595C1ED470F88FD4C3B110B2E5299C7E8C281865FA57BD
              E7EED7C5B913CA2B2A0D924225A43FE6815A0DD36EE71A04DACDD401450D0F74
              B407EE03D9BCEB31836277DD0000000049454E44AE426082}
          end>
      end
      item
        Name = 'arrow_drop_down_circle'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000469494441546843ED994BA8565514C7
              7F7720A8031D682A66EA40D41C680E348C201DA8A5A2944FC841F99858A0062A
              4243415428056D52A903031F6518BEAA4106A25403B5413E70908FC4E7A0061A
              38A8F3977D2EFB6EF6EB7CE73B172FDC059B6F70F65A7BFDF7633DFE5F073D5C
              3A7AB8FFF4023027381898012C06460303ADA1297F5BE34FE008F013F0B0EE0D
              A87B022B81F966B4E2CB7780C697AD284BA75500B38B1D5D0FE8B71DF27D7162
              9F02FAAD245501BC006C05B4F34D884E6233F020D7781500D381CF813109E3B7
              0B80B700FD6A484698F192F98D99B80EAC06CEE480C805B006D8133178A70076
              00F80AF83DB1F044E05D6039303C32F703E0B314881C006F03470386E4EC5EE3
              78D588A2C825202B0AFB02E59377806F632052005E06FE08185028FC10B89FDA
              A5C4F721C06E13827D53270097433662000600A780D73CCAEB805D351D77D5D7
              023B3D36CF016F01FFF8D68B01F822106D52A75617D77F1E038A4EABAA00507C
              3FED519805FC58D7C384FECCE2D47FF0CC79D3972742BB29E7DD24B503D8D8B0
              F3A5F9EDC006672D253981E8223E004A52BA3EB65C2C6A973742F7B001507A7F
              3F03AF38B6758DBA941D3E0027CDA3B1759B78B429DCBE47ADA032C756740128
              A4DD732C2B494D6A47E598F2D8F9AE3C71C993EC86DAA1DB05F0BE494CB62DDD
              C74D15176FD7F46D9E77A7C4B7AF5CC005F035B0D0595DBB9F2A0FDAE5B06B47
              195AA760CB37C0A210805F8129D6ECBF328AAFA69C2FEDAA207CD15AE437606A
              08C05560AC3559805E0D78A8D353646A8728E2F812986CFF623B0C5C03C68500
              DC05F4484A5121A5822A247D8083893931802A1297014F239334470565290A32
              C342009E007DADC9AA4DD479C5A43F70089857F1288E1745DAD2E2913E4EE8A9
              5353182FE55FA05F2E00297F94E19812CFE10A2DA6B2EA92CCC4F889B3895100
              EE1552C9AC85726490611BC44EC4446C84D88B473946CDC6687ED615721FF1F9
              40391D5A5BEF47A1F8F5C084B32604BAC9328645E5F4346B42F411BB6154214C
              7D6C1551C8D3C3EB0C754659B61510149AAB88FA6BF5D4A544C3A8EEB17D5C52
              6A259189DC1288C966D50BC679915A55C497C8BA5C6B3713CB7981B0A5D55242
              EC45D94B6BE7C53654155F29A1372910CFC405A002CAE564EA1473E3CD3A57AA
              7A5EF4C9A1624EDC542781E02BA78F79A8C2E7A59C160DB9C0DE8CDC8646C59C
              5ABDBA0C44EE41A8AC57EBEAD22D590D8D16F1B594557242AEA3A179BE6092DD
              52CA68A8A9EF8EAB14A2572A35F502D1A3691501D06B5716F491B94DD02B213A
              45E157E49A97B14E915462A455BBF84434CB96CC822CF62654087EECA1514A1D
              D55641A63A05404662CCB4E896FD35C9DDF73CF449E97C92A1CE01206331865A
              DF9BA0D793CCB42F13C78E5A4CB51EB68FECB5F554AC95E386F930CAF4B52AF4
              ECFED6B79EDE9DE27D90914E25B2D47D5583D1E45F4C6AA0BC4CB4CFB1DC2BE4
              EAF6D83FF95C203A09F148E2EF5B115185E279BAFD6F56D759D52E73CD1899F8
              A3FB66C13D9D30A3766DD5EA156A65B71BD1E905D0C8B65630FA3FFF52D63103
              71ED470000000049454E44AE426082}
          end>
      end
      item
        Name = 'backspace'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000259494441546843ED983D6856311486
              9F8A9B74111D954EB520B5631D95769082204A5DDA599D1D04271D050747954E
              15275BE8E2AAB8087670D34117E72222B8D441D0BE90C025CDBDF7BBC909127A
              B37C1F2427F77DCE3939F999A2F23655B97E4680FF1DC131026304323D30A650
              C38197329D19337FD737676E04568175600938D1F7B184FEEFC00E70BBCD3607
              40E25F25884A35896A4D05B8E63C932A26C5EE11703F344C013805BC05E65354
              64D87C01E62C009E02778289F6806703C4FD7563E540FDF78EF4FFFDEF8360CE
              430E1F1A8135E06544E8F50229F5F000CE146006F8089C0C001E03F706787FD2
              A1E600F2BC22D06CBBC0C50E45AA545B3D8ADBC69802DC029E478468217F6A11
              A8122B71373B207C2916A4C6359B19C0F9169182DAE811EFBB6310E13E124298
              017C001603A1DBCEBB31FD37DC06772CE86C42B46D82CD312600B149F6DD42FE
              DD91DB2B0E223C5EF83489EDE06194B201E475793F6CCBC09B094AC96507A18D
              AFAFC5522C1BE047A4643E01EEF6A969F4AB42C9DB673A6CDA16791640AC647E
              05CE0D10EF872E3888D9886D57853ADA007256D5292480528BF80F70BCA3C4FA
              AEAC14EA9A24B78C0A601398EE813001D0374A6C64578017C0E90E0833805247
              093D022812671DC46B771E5284D5CC003459A9C39CD69922F1F3E0A87E15D025
              DE740D34235CEA38AD7DE217F02D4827D30868EEEA2F3482A8FA4AE9236C71A9
              9FF444627A27F61FADFE594520553F6CF94854FDB4D88450FD5629BC3069620F
              18F719785FEA7177808E724387BECC95539238F30890E83833B3310266AE4C9C
              688C40A2E3CCCCAA8FC03F65EE8C31198766BA0000000049454E44AE426082}
          end>
      end
      item
        Name = 'done_all'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001F7494441546843ED98B14A04311040
              DFF90BFE8536D6F67E8282602158081682205808A26021088285602128080AEA
              EFE8C758B9818DC45C363BBB93643D88A59BCCBE3793BB99DC8C05FF9B2D383F
              5560EA0AD60AD40A2833508F903281EAEDB502EA142A03FC870A6CB60EEF1197
              1560AB797EEEAF995AC0C0BFB55006302461E0CD9A55E0C2979852C085B789F5
              255C78BBE68FC4540221785F22043F27318540327863535A20297C6981E4F025
              05B2C09712C8065F42202BBC46600DF86EBAE357A47B66878F0998EFE02EB875
              E0A915308D27B4AE087C97806D201F81D96303780596DBCC7FB6338A2B510C3E
              24E0773FB76D7781F912666EB1039A7BC2EC9820EAB0D221D56D645D815D896D
              E02510BC4F220BBC5F0169667680E70112D9E02547C8E5742BB10B3C0A24CC51
              3223B23439D293F3BB2E340B495FB6073C0824A4F106C3F77D8DDA4B841FD8AD
              C43E701F91308F247146C1F7353269E60E80BB0E09F36F73938A2561347C9F80
              792E9538046E852473D742E1BEE032C97D402A7104DCF4C024859754C0F24825
              8E81EB0E89E4F04304861CA713E0CA93C8023F542026E1039E0297AD4436F831
              0221892EC03360A9D930F76394E643EBEF957C8843EF8B4DAC29F97A638D15B0
              95885D687A5F9E62814620C5FBD531AA803A85CA00B502CA04AAB7D70AA853A8
              0C502BA04CA07AFB0F25418C31B03250180000000049454E44AE426082}
          end>
      end
      item
        Name = 'toggle_off'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000280494441546843ED983D6B164110C7
              7F01CB281AB4510495144A94A4500B3F801689C114D11406ECB550106C04B5B0
              12D1CA2FA0A01210D4A488A40DC1C2422D62A1228A568A859601737FB895CD66
              F7B9E7B277CFB17A0357DCBECCCC7F5E7666B78FC4A92F71FD690134EDC1D603
              AD07222DD08650A401A3B7FF971ED80CEC03B6459B6F2D83EFC027E07719BEDD
              78601330957F43C09E320236B0F623B00C3CCABF954E3C8A005CCB15DFBF0145
              AAD8F20E789C31BA1E62D609C01DE062155A54C0E33930EEE3130220173665F5
              10DE6FC02E77D207E02BB0D3C3E505F00678052C025F2AB0ACCD42328F58DF71
              0F7F85D4017BDC05F02C53F0A467E379E05EC50A17B153DC2B075DBA0B5C3283
              3680D08641E04391B49AE6B7030BC0B0C3FF86496C034047E55B4FDC1F03966A
              52AE0CDB3FCE6285D22160C500380BDC7716DDCE8ACA65676C12B8921732317D
              0F3C04E4D63AE94C5E136C19D3C00303601618B56695B0271C8D4221A6657F5D
              5A238A79C04EEC3960CC00508CAB3D30743373CF55EB5FF54075A1139D06666A
              0470CB8908B51D7B05A01FF8E5083E053CB5C65E02470B94D3F17AB846006A67
              14AE366D1180837902DB132A182A1C867E000305CAFDEC624D0CBEDDC06787C1
              C83F0120F91092578A92B8D30964BCDA58124B816E8ED127C04420881B3F467D
              85CCA7D439E04203856C0C504B6DD39A42166A2576640AEBAAD734B91DF2BA56
              420AFAE2FC3530D2B0F6EA48DD1B99FE1521EB1E7743EDB48A88AE76BD24557F
              29BFD5111A6CA7CDBAA42F340644D2574A0322E94BBD01A164512FDED4053FEA
              59C58048FA61CB77EA24F7B4D8CBA3B3B4ACA2A7C5D20C7BBDA105D06B8BBBF2
              5A0FB41E88B4401B4291068CDE9EBC075601C9D382A98855CCFF000000004945
              4E44AE426082}
          end>
      end
      item
        Name = 'toggle_on'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000276494441546843ED98BF6B154110C7
              3F01CB44544CA3082A160623A6500BFF002D8C6223A6308DAD8D42C046302904
              41442B5B0B054D25FE2AD4B4412C2C120B2D5444D12AC142CB80DE176E6533D9
              7B977D77EF1DABB770C5DDCD7C77BE33B33BB33B40E2632071FB6909341DC136
              026D042A7AA04DA18A0EACACFE5F466008D80D6CAEECBED5004BC067E0570CEE
              7A22B00198C89F7DC0CE9809BA90FD04BC031EE4CF4A278C32025772C3F77661
              481D2AEF81D90C68BA08AC13819BC0853AACA801E309703284534440216CCAEB
              457CBF03DBEDCF10816FC0B600CA0B60117803CC035F6BF0AC0FA1390F79CFD1
              00BE526AC4FF6E093CCE0C3C11503C0FDCAED9E03238E5BDD6A01DB7808BEEA3
              4FA048610FF0B16CB61EFDDF0ACC01070CFE8C5BD88E80B6CAB781BC3F02BCEA
              917131B0BF8DB052693FB0E2089C05EE1AA11B5951998A99A50BD9D3C0A5BC30
              CAC80F99B71F02D70CD699BC26F89F27817B8EC053E0B8F7570BF6581706C5A8
              14A5AC305E0276113F37DF9E01E38E80725CED811B57B3F05C8EB1265256F545
              75A6D33807DCF104AE9B8C50DBB14B0406819F06E914F028D2A818F1D7C0E112
              056DD7073D19B533F78DCE461118CD17B0FF4F054385A3576319D85202FEC3C8
              EC00BE189DB17F8240F229A4A824BD884520F96D3454C8FE96EB5EAD6460BD85
              6C1C504BED8F5585ACA895180674D46B7AD80E794D2B210343957101186BD87A
              75A4F644A67765C89ACBDDA2765A454447BB7E0E556B19BFC94C5AD84E3BB9A4
              0F348E44D2474A4722E943BD23A1C5A25EBCA9037EA56B154722E98BADD0AE93
              DCD5623FB7CEE8B9CAAE16A301FBADD012E8B7C7ED7C6D04DA0854F4409B4215
              1D58593DF908FC014AB682A9217232C90000000049454E44AE426082}
          end>
      end
      item
        Name = 'archive'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000027F494441546843ED99314CD64014C7
              7F1F8B0B83244C8A0C98386B22BB46160D0913848940A2893A31100C0BCA8626
              0E2EE080D1C409080309919848747780D94417948904071727E84BDA2FA5DEF5
              AED7F6DAC6DEF27D69EFBDF7FFDDBBBB5E5F3B34BC751AAE9F16A0EA0C66CD40
              3F7019E82B49F809F00B38B6F59F05E02D306DEB3867BF77C08C8D0F5B800FC0
              5D1B8705F6D905EE99FCD9003C04564D8E4ABAFF08789DE6DB04700BF85C9238
              5BB7B7812FBACE6900578103A037612C8B6CCD36BAA2DF2974B7EFE8BFFC4A7B
              106E1271B33FC075E0BB2AA60EE002B0038C288C645ECAFC2CA3C93A93F5966C
              9F8051E06FF2860EE03930AF7024D7BE96A13CE6731878A18821D79ED8005C04
              643FAE6393E7CFEFB830550664BEEDD7513D70235C975D792A803AEC3CBAF1FB
              6747FA6F0096822179E6795A49BCA78998CE1968011CB2577906924710497F96
              563940743C88449BCE5D49B816203E222E8BB87119180B9E94DB31EA34807160
              D3B020BC4E21797A7F0C012642613A800D4000A45F1A8437809BC01630180A17
              51224E0510898F063F0DC21B802A9040C828C79BEADA3A30A9994ADE0024BE2A
              9869CF7F0F4CA574F20A9015E20D70BF4E8B38D2629309A9703C36A54793552F
              87B9348857C11BD5AC85785D46BD00E882BF04E62CC5570E9014B01C54141632
              88AF054024A20758CC28BE36000EBABB26DEB7D13C6255B62D407C545C8ED379
              33527806F20A72B177AA4A0CE92AC12E0A0AB6918AF98FB84FD57BAA54A6A5D3
              A58283E7757704C8E09EAB50EB5EB4ABFC2AA303557EAD49AB14DC0156806B79
              872EA7FDB7F0F0B7A7F2632A75C8741A00AEE414E16A7E181CBB7FAA3E6C440E
              4D00AE81BDD9B500DE865A13A8F1193803B5B9AE31BA8CC7DE0000000049454E
              44AE426082}
          end>
      end
      item
        Name = 'unarchive'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000280494441546843ED993B6815411486
              BF90C2C622012B1F4D040B6DB448AFC446491B5B4D21681A1B3108C107695410
              C422491150ACC4C22A244D447B0B6D622168A3A61292224D2ABDBFEC5CC67566
              6776F7EEE3E24EB3F7EECE9CF9BF39676667CF8C30E46564C8F5D30134EDC1BC
              1E38041C01C62B12BE03FC007EC6DACF03F00CB8126BB864BDE7C06C8C8D5880
              75E0428CC101D6D9002E86ECC5005C039643862A7A7E1D58C9B21D02380BBCAD
              485CACD973C03B5FE52C80E3C047E060AAB126D96A6CEF8E7ABFA0BF7C9BDFBA
              AA5C4D1609BBD91E701AF8E2EAD30770005803CE3B1A292E159F5514CD33CDB7
              74D904A681FDF4031FC043E096C390EEBDAF42B965731278E4E843F7E66300C6
              00ADC76D2C7AFFECDAC25C1E50BC7D68A37AE04C322FFBF25C006D58797CE3F7
              CF8AF4DF00DCEF0DC9BD9AC34AFDDD4DF559D8031D4001EFB5C20333C028F072
              180124FE5522FC32F0222744A31EB0C51BDDDAE7E4D9433506E0126F20E6726C
              CD1B01C8126F206E004F23C2A9768018F146F74DE07100A256803CE28DEEDBC0
              830C88DA005CE2B780532971AE7B777ACBECA207A23600652A94B13045422F01
              BADA45405A566DB0AC377C6D0012A989F924112DF19F7AFB18F3996820B4713C
              694184B627B50248E402F03A11AFFF2E00DD178420439BC3DA01D2A1EC038858
              41FF54E900EC910AC5AB6B543B0F741F34565C1409A1D8C9EAABD7F824EE0006
              3D07CA8E6891F685B21213BE4C701105036EA38CF957DBA62BB1A5CCB42A1D1E
              70E765CD6DF7BEAB35B87F65A87DD9E9264F657CA0CED39AAC038E2960093851
              76E84AB6FF0CE85BFA8DCB4EE88849E1741438565244D1E6DF80EFAE830D7B8F
              5ED4782BDA853CD00A9159223A80A65DF41BFEBCB031B77CE2E2000000004945
              4E44AE426082}
          end>
      end
      item
        Name = 'keep'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000015D494441546843ED58BB6EC240101C
              FF59F21120A549953A494B05742941A9D35045FC44E023E027F809BC6023C7BA
              33BB7B3E1E622C212174BB37333B7BE7A5C09D3FC59DE307095CBB829E0AFC01
              78CA047C5AE69D58729380452DC55A56402112A407EAA7DD0B2B4D82400FD571
              EB4BF440137C938CFCAEB140E810F0F4E201873BB0529104AA72BA857407B202
              FFBBDD2DA43B901560058E0AD042AD9B971799F255E4B48C16A285120F9387B6
              90CCAEE39E2CF402E0D7DAC029F740087CCA3C20B16F007EAC243C168A81DF00
              18969FED19100300CBC89A7700DF16125602A9E06B6C5D244600BEB4242C0464
              FE6D4F60B28F28BFD36ED85A17FB7FE9B97CDB55CDD77D107062EF0C2381903C
              310BB1020105B258C8A274A85A6A50968D2C4D6CC94B025AB558818852B4102D
              A45580164A548AA7102D74A316125833001F15BE3980CF44ACC1F05C3D506FB6
              A8BEBCE6002F397313C885FB94770F10CC7231FD1281490000000049454E44AE
              426082}
          end>
      end
      item
        Name = 'keep_off'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000002EB494441546843DD9937AFD4401446
              CF2BE928E828E94042A2A6819E0A891C45CE390791731039E71CC46F20881A09
              21D1D0F307282861BF271BCDBB6FC61E7B77ED59A65BAF3D738E27DC3BE32106
              BC0C0D383FFF9DC044E0FB20F58ADB03827F03BC058E9448BC07A6F558546D1E
              AE5A672E90C34FCA2A38041C2DA82C3901990BDA2D0781E3256FE44FD5375670
              7F573DA07A8F01074C03FA7DA2A0D1FBC0B21E49742D208E53C01E03B41F3819
              809C027C71FEFB102963E78F9EFBD8CD1C70DB3D0BEC3420FB32391FDF67606A
              F647CC5BF4CD9FDACB79E8C10BC03643BB1738ED31580EDC4B4D403C9780CD06
              58C3EB8CB93616F8018CCB96DFB2A5B0911EC819AF021B0CF06E40C3CC2DD780
              F5290A08F206B0D600EF02CE996B0A828AE249F540CE781B58658035D1CF9B6B
              824F52409CBE357F07A0095FA5343A072CD8236089B9B81DB858C1A05501713E
              05161AE0ADD9AA15E3D1BA80205F00F30CED16E07284411202E27CDD5975661B
              60C58D2B2512C908289F118C2D9B00C58F50495E40E01B3B9159C1CD57064240
              E08AE0D73D06C90AFCEEE449630CB0D20B4572B72862CF32D77A9E8D462C26C3
              11D7DDC57DEA2CB11380F1E6E175C0CD1289C6057C5BD09F19FC5760B201562E
              75AB40A251011FBCD8BE39E0BE71BE06504EE51B4E8D0984E0357C6600BF1CBA
              77C04C03BC1AB8E391B0F12466080FDF53C53CB4EE97ED83EDFE5759EDDD68C2
              921B7B21508765A5B30DADF3FCBF67DA1210C08A2C451F580181EB40E0413706
              6DF640CEAD83B1877525AA085469C337E1A7770E8435E17D917829F0B84A03F9
              BD6D08A86D9F84767A4FAA4AB4251092589CEDF8A23DDA1408492C029EC51AB4
              2D1092D09EFB798C440A02218905D9DEBBD023158190C47CE06591414A022109
              9D7EBC0A49A4261092989B9D828CF24851202431278B1F23245215084968DFA0
              CFC0B5B2D198552DBFA72895A8528F1BB147C1ABA27EF580EA76BFF0E8C85147
              8F754AFEF17DC49BCF2BEAA780DAC8731BA5087D29FD16E80BB45BE95FFAAAA4
              31ABB5C8520000000049454E44AE426082}
          end>
      end
      item
        Name = 'Sync'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000002A8494441546843ED98EB71D5400C46
              BF54405201A48240054005241524540054005410A8005241E800A820A102A002
              A00232676637A3ECD896B43663EE8CF5EF5EEF6A75F45AD97BDA71D9DB71FBB5
              01AC1DC12D025B04667A604BA10E077E91F438B8EFABA427536B978A0087BC96
              F45612064EC97F057026E9D478E9E92E017C2CC65B6FF7025C4B62EFEF606ADD
              2EEB4DA1D6F83F925E4AE27F4FC652E893A4136F73FBBC07A0359EBC7F97F09E
              05B868A288EEE719882C005E7A660EE0B088D7AD4D1680B47920E98359F0BE44
              33C49101A060ED413DC663540BC0EF37A58B55A31F49A22E5CC900FC9074BF68
              246D38B4478600D063A3CB1AA2E34A14C07AFF6709BBAB7C64C118C0BE249C74
              AFEC0B45380A60BD1F523C413706C0169B4AA410A9342911006ED9CF450BED92
              A24BF76B6305D144074203C03956D05DA37038F0FCCEE20880F54AAA4378DE1B
              796EDBB45B6B11007AFC8B4C5E761A5EB71D4BBA2C3F1619E6A67276A6AD83DB
              1F4ABA2A4FDC3A8844C0E6E4C1CCFC8F02FF350B276D8C00849545AD73D6D14E
              7F99A6C1EF518900D816EA768505206CD7DBC91AB097A6DBF52211B057FCAB32
              792EE0E85115B6EBB9E74500AC4786BA0297126F65086346763A6D496CCABA2F
              4811005B541CD6D6412A679DD0A567AE0800674E4D8A4B02A467AE280069F2DD
              78CF0E744B01F04A7A6E52B1CE4B93418B02A0C4CE445C6EE42735B10440F7CB
              520600080C3E2A2E01A2BE84D769D5EDDB03EE6C8DFF268971222459000A9AD9
              A8427008BFEBD7B30C00BA1812499D7ADB623CBAC2E37A1600838720AAB7A200
              789D2F7936CFD3C673680F4085A0DFDB2F14FC1F01B03553C1BB8C8F022CFA2D
              B3297A2E3E9A43F7E51789C0BF00C0E05986D7D0AD01400D858BD46B4511004F
              C7AACF378055DD3FA38DAE6DF7EDF95B0AAD1D8A2D026B47E006AE729D31BCFD
              6DDE0000000049454E44AE426082}
          end>
      end
      item
        Name = 'filter_alt'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000002C2494441546843ED974BA84F411CC7
              3F57B1B151C24249B9521E2BC5C6C2B3AE2E91D786052122F25ABAEEC55D7A45
              2884051BCF4251F22A3B8F8DE74216CA86D8D950383FCDD169FA9D3373CE9CEB
              FCFF9AA9DB3DFF99DF7C7FDFEFFC7EF39B990EDABC75B4397FA280A6231823D0
              0E11180BC85F13ED3DF0A1C8B12B85CE01AB9B609EF1790AD890C7A148403770
              AB61F2A9FB45C00D8D4B91804DC0F11611B01D385256C062E07A8B0858055C2C
              2B6018F004E8B4267E024E9614F60BFE1E9AE9B7FC9796CD828D09F6280BFB1D
              301DF85A5680D82F006E2A13EF01734B8A7099DFCDC15C58B4175D55489CEE04
              0E28DE25272537EB688772B076010743CA683AF734B04E015A0B9C0D54B02607
              E30CB0DE85ED1301C1180ADC01662880D3CC5E71F9D2C6A72669FA5419780C74
              01DF5CA0BE0204479CDD4E4AEB0865934D02BEBB9C59E34380974975196FF57F
              06E603CF7CF0CA0810BC954955BAA0004BB95DE2E33063730558AACCC92D991A
              7E590182B11FD8AD80ED037A3D45EC49CAE75EC5B61FE8F1C4F863564580CCBB
              042C571C2D03AE3A08E41D9097811565C88708186DF6C314CBE18F44DC44400E
              1FAD8D03DE0083ADC11726EF3FFE2B01E267B6A94C3699E766C36B5CA4E24831
              C836112D15E77E59F22111487DE55DF8CE0352DFB34DCE0BBB4FC6370327AA90
              AF4380601C05B628047600874DFFB6CC77D6F45872C7D95A957C5D020699549A
              A7109963FAE4EE6437B9FB48EAFC6C5A80F8978D2B87DC188BCC17F37BB8D52F
              CF4439AC5E8790AF2B02290739C85C2534B59503EC5A28F9BA05CC041E78929A
              053CF4B42D34AB7A9069A051409588C40864562DA6504CA12A2B10532870D562
              15FA9F526802F0D633235AF22A21DCB51797ADE91530D953A8D3ACCE3D903ACB
              7BF0CBB85CE01E251F7D4E669E060321207D1F8C5438D47203CDE20E9400CFF5
              0B378B02C2D7300C2146206CFDC267B77D047E0338D57031C5D986A900000000
              49454E44AE426082}
          end>
      end
      item
        Name = 'filter_alt_off'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000286494441546843DD993B6B16411486
              9F14FE009B6017AC94D869829DA808E9140B2D2C2460C0548A8DA64C17ED8C58
              89161636DA88366263BA8089A5124104B5130B1BC12EEE811D5866CFECCEEDFB
              66D76976616767DE67CE656E338CBCCC8C5C3FFF1DC07C6D914F63B14CD30222
              FE792DFC32300A080360C41FAB013E5600A3807001088706717ACAAEF515F8DE
              D5A7E642C60A2E0871B34B530479045C77F5676721DB958602710178A5416869
              748810B780FBBE00526F681017819721002110EB11F1B05FFF231E20EFE6B90A
              1CB2DAFB022C02BF4301422022185ABFBC01969486CE03AF7D8358ABE7EB4E29
              10F780DB4A036B807C7316DFB5D02421AE00CF14854F81E5BE51F10598943B9D
              A8DC661B386009DD014E017F7302E4863808BC05162C917F80B3C0FB3EF1F23D
              C402A6BD5CEEF418B8A6885C019EF8888F05C861893BC05D45A44C5632697997
              180BA45A42D65166D9DE142AEEA4A5D14E981480184B48D0BE000E5BAA7E546B
              9DE3C02FEFA1AF2BA602844048D0CAC89F53444AD0BE0B159F1203765FBE812D
              B9FDAAF5F34DE0418CF89C00D2966C76EC51D436459BC08D5AB0641BC93AD125
              870B99CE3500F9A6416CD4B9FE64B4F28C31D007E0829803BE8D05C00591AA3F
              6A267675EA72A166FDECA71DD388011B382B440980ACEE540A201B4449802C10
              A50192214A014820F79D007AA5D8520067808739204A02FCAC57A749962809B0
              157002E874A7D20021FB09152227C01160CF2BF2E028F0B951D7773FD16A3E27
              8034BE5B1D03CAB6B1AB7C508E52A22D911B4084745D80C87E58AEAE5C25D812
              930030A3396BA994ACE373711804312900CF5048B7C45001BC6362C8001A446B
              2F3174802684BCB7EEAEC7006020E4D94A0263017046FB3FA2CCBB31D318A017
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'Edit'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000033F494441546843ED9879C80D511887
              9F2F9148241259229125916489105992C8CE67DFF77DDF65DFF77DDF77591289
              1059924824125922914824129D7AA7DEE6BBF7CE9D7B67FBEACE7FBF3BB799E7
              79CF7B66CE992C72F99195CBF9C908843D829911F061049A00738079C035A7EB
              4769040A01BB818E0AFA38D02591445404CA024780FA3160134A444560AEB44D
              BC62C795888A8001779268079CB51B862960EEDD0930D5B58E44126642378D8A
              401EE979236026693212063EC753298C11C82BF01D54359D244ECA68E5982341
              0BE4038E02ED63CCD67812B78196C0F758333C4881FC52793319ADE30950CD61
              2476016FE23D9E82122820F06D158879DB9E008E3948247C1907215050DAA68D
              2299052C905C351D09BF05CCF2C0F47C6B053F0358A4F26C59F7583F995131F3
              E19FD33AC89CF753A0B0B44D2B05320D58A2F24C60BECAA704FE6F32F07E0A14
              91CAB750205381A52A4F0716AA7C5AE0FF240BEF974051816FAE402603CB6D32
              8B553E23F0BFDDC0FB21504CDAA699029908AC54798AAD8DCE09FC2FB7F05E0B
              1497CAEBF5CA7860B5029B042C53F9BCC0FF4C05DE4B811202DF58818C05D6AA
              3C0158A1F205A033F0235578AF044A0A7C2305321A58AFF2386095CA17A5F231
              97076E84D27D8C9612F886EAA623818D2A8F01D6A87C49E0BFB9018DF7DF7404
              4A0B7C0375F1E1C066954701EB54BE2C6DF3D50BF8745AA88CBCFEEB2990A1C0
              569547001B54BE2295FFE2157CAA02E5A4F27515C86060BBCAC3804D2A5F15F8
              CF5EC2A722505EE0EB289081C04E9587005B54BE2E6DF3C96B78B70215A46D6A
              2B90FEF22DC7FA6910B04D9DBF21F01FFD8077235051E06B29907EC01E950700
              3B54BE296DF3C12FF864052A49DBD454207D807D3619B373B28E5B52F9F77EC2
              272350592A5F4381F4020EA8DCD7D6467704FE9DDFF04E025504BEBA02C9060E
              A9DC1BD8ABF25D817F1B04BC93C063DB5EB5BBAC342DB69EC07E057A4FE05F07
              05EF24A0B7745D65342CB61EC041057A5FE05F0509EF46402F39BA018715E803
              F9E8F43268F85404CC66DB6CD2ADE3A154FE4518F06E0462F13D12F8E761C1A7
              236026B8F930FB2C4CF85405CCE740B3937A1A36BC934014F81C19D2D9D0385E
              3C883F640482A872A27B644620EC11F80FD4919C3180B038370000000049454E
              44AE426082}
          end>
      end
      item
        Name = 'Delete'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000164494441546843ED99E14D03310C85
              BF4E40376004D8A06513468009A01B74846ED2B2016C001BB413802CE5A4A84D
              9338BD501D3C4BF7E32E4EECE7E738C965C6C4653671FF11806B332806FE0A03
              AFC08B13CC0AB07E17494D0AD538B604ECF1C80EB0A72406F4ACD400F82E59E8
              DC9EF5F15F0018F2344EA52CAD173092B2919D27350C0CFEC4A9E4E9E7C1E3B6
              E171C43DB8C7F3A0EBB621005194EF819BF0FE01EC8F18980377E1DB01784F30
              745506ACA62F82530F891A6FEBC436B4BF9D5937042037EF4AD1110340294827
              011EB30A8901315058394BF9A914520A2985B495D042969D052AA3DA4E271244
              9BB9282893DF4AAC013B179B3C25CEBCD6663A26761E369D6329158AAEE78186
              BF2802E0BA6272D3DB4089DBC69855A8C1DFDF4DA14FE0760C2F2BC6B01F6343
              41C8AA7B1868B985A9F035A9F21C55ACD100D84006E2B123135FC0C673F5E461
              A0359A5DFB0940D7F0560C2E062A82D45565F20CFC0062799D311B6C0DDD0000
              000049454E44AE426082}
          end>
      end
      item
        Name = 'New'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001FC494441546843ED986151C4301085
              DF29001480034001380007E0001C000E90000A1814000E90C0290014C07C37C9
              CD12D2F47A6D4A7A2433FDD1C936D9F7DE66779B99263E6613F75F15C05F2B58
              15A80AF46460E342E84AD2A5A4ED9EC4E4FAFC43D2ADA41BBF8155E05A1200A6
              300080BF3FEAC07BC1CC87A4A2C44E08E0CB58957A367EF9681DAD0046383C55
              8111484E6EF1BF14D893B42BE953D26B8497D8FC51823FBB0E8572DFD9BE24BE
              3990B425692EE94D5227056C613B8C80F0F33870EC9CB01B847E593BEC9F9C41
              2A653F4B82145FB8D606800280B0635200707C59BE1D8A14807B49770160AAA7
              0FC59802B1F5065180D8250E193694520042B061388D0A80D885BD13C7A00FA5
              490138755900253CBB439F816C21E4B307201E4C28F14EFB3D5416CA0E00DF39
              98674E8D4749170D008A3AC496610A10998402C7B9E03DA6407187D8172A54B0
              1984F7BE00FCDAE792782088DF5A06BF8F54E35E85CC3AE8D3210B133E4D0062
              DD4153254E7412CBA9C101D8505AE710F33D45CAF7432910D4215442994EAD04
              CD1A8FADA076A3D8BC0DB5D0A9D83A8447DB0D0840FDE804601569C7B6A900C6
              663CDCAF2A5015E8C94032844873BEEFEFB94FF6CFA90D8BF4BB5197BB00A2A5
              A51FA1592B71C03C6DCCE2663A54A044875B7D2AF516BAD5F1AAC0CA146536AC
              219499E0D6E5AB02AD146536F806EE4BDA31C8F8688A0000000049454E44AE42
              6082}
          end>
      end>
    Left = 264
    Top = 40
  end
  object VirtualImageList1: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'search'
        Name = 'search'
      end
      item
        CollectionIndex = 1
        CollectionName = 'print'
        Name = 'print'
      end
      item
        CollectionIndex = 2
        CollectionName = 'build'
        Name = 'build'
      end
      item
        CollectionIndex = 3
        CollectionName = 'bubble'
        Name = 'bubble'
      end
      item
        CollectionIndex = 4
        CollectionName = 'arrow_drop_down_circle'
        Name = 'arrow_drop_down_circle'
      end
      item
        CollectionIndex = 5
        CollectionName = 'backspace'
        Name = 'backspace'
      end
      item
        CollectionIndex = 6
        CollectionName = 'done_all'
        Name = 'done_all'
      end
      item
        CollectionIndex = 7
        CollectionName = 'toggle_off'
        Name = 'toggle_off'
      end
      item
        CollectionIndex = 8
        CollectionName = 'toggle_on'
        Name = 'toggle_on'
      end
      item
        CollectionIndex = 9
        CollectionName = 'archive'
        Name = 'archive'
      end
      item
        CollectionIndex = 10
        CollectionName = 'unarchive'
        Name = 'unarchive'
      end>
    ImageCollection = ImageCollection1
    Width = 32
    Height = 32
    Left = 336
    Top = 40
  end
end
