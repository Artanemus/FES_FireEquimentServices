object Customer: TCustomer
  Left = 0
  Top = 0
  Caption = 'FES Customer'
  ClientHeight = 610
  ClientWidth = 791
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Height = 34
  CustomTitleBar.SystemHeight = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
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
    Width = 791
    Height = 42
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object dbtxtCustomerID: TDBText
      Left = 16
      Top = 6
      Width = 65
      Height = 30
      Alignment = taRightJustify
      DataField = 'CustomerID'
      DataSource = CustomerData.dsCustomer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object dbtxtCustName: TDBText
      Left = 95
      Top = 6
      Width = 246
      Height = 30
      AutoSize = True
      DataField = 'CustName'
      DataSource = CustomerData.dsCustomer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 5
    Top = 81
    Width = 781
    Height = 455
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = TabSheet5
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Details'
      DesignSize = (
        773
        419)
      object Label2: TLabel
        Left = 3
        Top = 117
        Width = 41
        Height = 21
        Alignment = taRightJustify
        Caption = 'CODE'
      end
      object Label1: TLabel
        Left = 1
        Top = 55
        Width = 179
        Height = 21
        Caption = 'Business/Company Name'
      end
      object Label3: TLabel
        Left = 3
        Top = 179
        Width = 143
        Height = 21
        Alignment = taRightJustify
        Caption = 'Internal Office Notes'
      end
      object VirtualImage3: TVirtualImage
        Left = 131
        Top = 144
        Width = 32
        Height = 32
        ImageCollection = FES.imgCollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 93
        ImageName = 'pin_number'
        ParentShowHint = False
        ShowHint = True
        OnClick = GenerateCustCode
      end
      object StackPanel1: TStackPanel
        Left = 0
        Top = 0
        Width = 773
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ControlCollection = <
          item
            Control = VirtualImage2
          end
          item
            Control = VirtualImage1
          end
          item
            Control = vimgArchive
          end
          item
            Control = VirtualImage4
          end>
        Orientation = spoHorizontal
        Padding.Left = 34
        Spacing = 8
        TabOrder = 3
        object VirtualImage2: TVirtualImage
          Left = 34
          Top = 4
          Width = 32
          Height = 32
          Hint = 'Pin/un-pin.'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 74
          ImageName = 'pin'
          ParentShowHint = False
          ShowHint = True
        end
        object VirtualImage1: TVirtualImage
          Left = 74
          Top = 4
          Width = 32
          Height = 32
          Hint = 'Make active or in-active'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 25
          ImageName = 'key_off'
          ParentShowHint = False
          ShowHint = True
        end
        object vimgArchive: TVirtualImage
          Left = 114
          Top = 4
          Width = 32
          Height = 32
          Hint = 'Archive or un-archive'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 29
          ImageName = 'unarchive'
          ParentShowHint = False
          ShowHint = True
        end
        object VirtualImage4: TVirtualImage
          Left = 154
          Top = 4
          Width = 32
          Height = 32
          Hint = 'Print a detailed report.'
          ImageCollection = FES.imgCollection
          ImageWidth = 0
          ImageHeight = 0
          ImageIndex = 36
          ImageName = 'Print'
          ParentShowHint = False
          ShowHint = True
        end
      end
      object dbedtCustName: TDBEdit
        Left = 1
        Top = 82
        Width = 769
        Height = 29
        Anchors = [akLeft, akTop, akRight]
        DataField = 'CustName'
        DataSource = CustomerData.dsCustomer
        TabOrder = 0
      end
      object dbedtCustCode: TDBEdit
        Left = 3
        Top = 144
        Width = 122
        Height = 29
        DataField = 'CustCode'
        DataSource = CustomerData.dsCustomer
        TabOrder = 1
      end
      object DBMemo1: TDBMemo
        Left = 3
        Top = 206
        Width = 767
        Height = 230
        Anchors = [akLeft, akTop, akRight]
        DataField = 'Note'
        DataSource = CustomerData.dsCustomer
        TabOrder = 2
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Business Numbers'
      ImageIndex = -1
      inline FESCustNumber1: TFESCustNumber
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 763
        Height = 409
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 763
        ExplicitHeight = 409
        inherited StackPanel1: TStackPanel
          Width = 763
          ControlCollection = <
            item
              Control = FESCustNumber1.vimgHideUnPinned
            end>
          ExplicitWidth = 763
        end
        inherited ctrllistCustNum: TControlList
          Width = 763
          Height = 377
          ExplicitWidth = 763
          ExplicitHeight = 377
          inherited lblNumberType: TLabel
            ExplicitHeight = -6
          end
          inherited btnEditNumber: TControlListButton
            Left = 717
            ExplicitLeft = 709
            ExplicitHeight = -6
          end
          inherited btnPinNumber: TControlListButton
            Left = 678
            ExplicitLeft = 670
            ExplicitHeight = -6
          end
          inherited lblNumberCreatedOn: TLabel
            Left = 605
            ExplicitLeft = -154
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Business Address'
      ImageIndex = 1
      inline FESCustAddress1: TFESCustAddress
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 763
        Height = 409
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 763
        ExplicitHeight = 409
        inherited StackPanel1: TStackPanel
          Width = 763
          ControlCollection = <
            item
              Control = FESCustAddress1.vimgHideUnPinned
            end>
          ExplicitWidth = 763
        end
        inherited ctrllistCustAddress: TControlList
          Width = 763
          Height = 377
          ExplicitWidth = 763
          ExplicitHeight = 377
          inherited lblAddress: TLabel
            Width = 515
            ExplicitWidth = 507
            ExplicitHeight = 0
          end
          inherited btnEditAddress: TControlListButton
            Left = 717
            ExplicitLeft = 715
            ExplicitHeight = -6
          end
          inherited btnPinAddress: TControlListButton
            Left = 681
            ExplicitLeft = 673
            ExplicitHeight = -6
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Business Emails'
      ImageIndex = 2
      inline FESCustEmail1: TFESCustEmail
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 763
        Height = 409
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 763
        ExplicitHeight = 409
        inherited StackPanel1: TStackPanel
          Width = 763
          ControlCollection = <
            item
              Control = FESCustEmail1.vimgHideUnPinned
            end>
          ExplicitWidth = 763
        end
        inherited ctrllistCustEmail: TControlList
          Width = 763
          Height = 377
          ExplicitTop = 32
          ExplicitWidth = 763
          ExplicitHeight = 377
          inherited lblEmailType: TLabel
            ExplicitHeight = -6
          end
          inherited lblEmail: TLabel
            Width = 414
            ExplicitHeight = 40
          end
          inherited lblEmailCreatedDT: TLabel
            Left = 605
            ExplicitLeft = -154
          end
          inherited btnPinEmail: TControlListButton
            Left = 678
            ExplicitLeft = 670
            ExplicitHeight = -6
          end
          inherited btnEditEmail: TControlListButton
            Left = 717
            ExplicitLeft = 709
            ExplicitHeight = -6
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Contacts'
      ImageIndex = 4
      inline FESCustContact1: TFESCustContact
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 763
        Height = 409
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 763
        ExplicitHeight = 409
        inherited StackPanel1: TStackPanel
          Width = 763
          ControlCollection = <
            item
              Control = FESCustContact1.vimgHideUnPinned
            end>
          ExplicitWidth = 763
        end
        inherited ctrllistCustEmail: TControlList
          Width = 763
          Height = 377
          ExplicitWidth = 763
          ExplicitHeight = 377
          inherited lblContactType: TLabel
            ExplicitHeight = -6
          end
          inherited btnEditContact: TControlListButton
            Left = 717
            ExplicitLeft = 709
            ExplicitHeight = -6
          end
          inherited btnPinContact: TControlListButton
            Left = 681
            ExplicitLeft = 673
            ExplicitHeight = -6
          end
          inherited lblContactCreatedDT: TLabel
            Left = 625
            ExplicitLeft = -134
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Sites'
      ImageIndex = 3
      inline FESCustSite1: TFESCustSite
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 763
        Height = 409
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 763
        ExplicitHeight = 409
        inherited StackPanel1: TStackPanel
          Width = 763
          ControlCollection = <
            item
              Control = FESCustSite1.vimgHideUnPinned
            end>
          ExplicitWidth = 763
        end
        inherited ctrllistCustSite: TControlList
          Width = 763
          Height = 377
          ExplicitWidth = 763
          ExplicitHeight = 377
          inherited lblSiteContact_ss: TLabel
            Width = 746
            ExplicitLeft = -133
            ExplicitTop = -20
          end
          inherited lblSiteAddress: TLabel
            Width = 662
          end
          inherited btnPinSite: TControlListButton
            Left = 678
            ExplicitLeft = 670
          end
          inherited btnEditSite: TControlListButton
            Left = 717
            ExplicitLeft = 709
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Inspections'
      ImageIndex = 5
      inline FESCustInspect1: TFESCustInspect
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 763
        Height = 409
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 763
        ExplicitHeight = 409
        inherited StackPanel1: TStackPanel
          Width = 763
          ControlCollection = <
            item
              Control = FESCustInspect1.btnTogglePinVisibility
              HorizontalPositioning = sphpLeft
              VerticalPositioning = spvpFill
            end
            item
              Control = FESCustInspect1.btnClipboard
              HorizontalPositioning = sphpLeft
              VerticalPositioning = spvpFill
            end
            item
              Control = FESCustInspect1.btnNew
            end
            item
              Control = FESCustInspect1.btnDelete
            end>
          ExplicitWidth = 763
        end
        inherited ctrllistCustInspect: TControlList
          Width = 763
          Height = 377
          ExplicitWidth = 763
          ExplicitHeight = 377
          inherited lblInspectAddress: TLabel
            Width = 504
          end
          inherited lblInspectStatus: TLabel
            Left = 640
            ExplicitLeft = -119
          end
          inherited btnPinInspect: TControlListButton
            Left = 678
            ExplicitLeft = 683
            ExplicitHeight = -6
          end
          inherited btnEditInspect: TControlListButton
            Left = 717
            ExplicitLeft = 709
            ExplicitHeight = -6
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Surveys'
      ImageIndex = 6
      inline FESCustSurvey1: TFESCustSurvey
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 763
        Height = 409
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 763
        ExplicitHeight = 409
        inherited StackPanel1: TStackPanel
          Width = 763
          ControlCollection = <
            item
              Control = FESCustSurvey1.vimgHideUnPinned
            end>
          ExplicitWidth = 763
        end
        inherited ctrllistCustSurvey: TControlList
          Width = 763
          Height = 377
          ExplicitWidth = 763
          ExplicitHeight = 377
          inherited lblSurveySiteAddrStr: TLabel
            Width = 647
          end
          inherited lblSurveyRequestedDT: TLabel
            Left = 667
            ExplicitLeft = 667
          end
          inherited btnPinSurvey: TControlListButton
            Left = 678
            ExplicitLeft = 670
            ExplicitHeight = -6
          end
          inherited btnEditSurvey: TControlListButton
            Left = 717
            ExplicitLeft = 709
            ExplicitHeight = -6
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 541
    Width = 791
    Height = 69
    Align = alBottom
    BevelEdges = []
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 771
      Height = 49
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      DataSource = CustomerData.dsCustomer
      Align = alClient
      TabOrder = 0
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 791
    Height = 34
    CustomButtons = <>
    object vimgToggleFilters: TVirtualImage
      AlignWithMargins = True
      Left = 501
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
      Left = 609
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
    object vimgSetFilters: TVirtualImage
      AlignWithMargins = True
      Left = 465
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
      OnClick = vimgSetFiltersClick
      ExplicitLeft = 429
      ExplicitHeight = 30
    end
    object vimgFindCustomer: TVirtualImage
      AlignWithMargins = True
      Left = 537
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
      ExplicitHeight = 30
    end
    object VirtualImage5: TVirtualImage
      AlignWithMargins = True
      Left = 573
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
  end
  object actnmanCustomer: TActionManager
    Left = 604
    Top = 378
    StyleName = 'Platform Default'
    object actnFilterSelect: TAction
      Caption = 'Filter'
      ImageIndex = 4
      ImageName = 'filter_alt'
    end
    object actnpuInsert: TAction
      Category = 'PopupMenu'
      Caption = 'Insert'
      ShortCut = 8237
    end
    object actnpuDelete: TAction
      Category = 'PopupMenu'
      Caption = 'Delete'
      ImageIndex = 12
      ImageName = 'Delete'
      ShortCut = 16430
    end
    object actnpuEdit: TAction
      Category = 'PopupMenu'
      Caption = 'Edit'
      ImageIndex = 13
      ImageName = 'Edit'
      ShortCut = 113
    end
    object actnpuPost: TAction
      Category = 'PopupMenu'
      Caption = 'Post'
      ImageIndex = 11
      ImageName = 'checked_circle'
      ShortCut = 16397
    end
    object actnpuCancel: TAction
      Category = 'PopupMenu'
      Caption = 'Cancel'
      ImageIndex = 10
      ImageName = 'cancel'
      ShortCut = 27
    end
    object actpuRefresh: TAction
      Category = 'PopupMenu'
      Caption = 'Refresh'
      ImageIndex = 9
      ImageName = 'Sync'
      ShortCut = 123
    end
    object actnpuGotoContact: TAction
      Category = 'PopupMenu'
      Caption = 'Goto Contact...'
      ImageIndex = 0
      ImageName = 'bubble'
    end
    object actnpuGotoSiteContact: TAction
      Category = 'PopupMenu'
      Caption = 'Goto Site Contact...'
      ImageIndex = 0
      ImageName = 'bubble'
    end
    object actnpuGotoSite: TAction
      Category = 'PopupMenu'
      Caption = 'Goto Site...'
      ImageIndex = 0
      ImageName = 'bubble'
    end
    object actnpuGotoInspectOrder: TAction
      Category = 'PopupMenu'
      Caption = 'Goto Inspect Order...'
      ImageIndex = 0
      ImageName = 'bubble'
    end
    object actnpuFindContact: TAction
      Category = 'PopupMenu'
      Caption = 'Find Contact...'
      ImageIndex = 6
      ImageName = 'search'
    end
    object actnpuToggleLink: TAction
      Category = 'PopupMenu'
      Caption = 'Enable/Disable Link'
      ImageIndex = 7
      ImageName = 'link'
    end
    object actnpuPostcode: TAction
      Category = 'PopupMenu'
      Caption = 'Postcode...'
    end
    object actnSuburb: TAction
      Category = 'PopupMenu'
      Caption = 'Suburb...'
    end
    object actnpuClearPostcodeSuburb: TAction
      Category = 'PopupMenu'
      Caption = 'Clear Postcode/Suburb'
    end
  end
end
