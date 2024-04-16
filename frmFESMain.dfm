object FESMain: TFESMain
  Left = 0
  Top = 0
  Hint = 'A form hint'
  Caption = 'FES  v0.0.0.0'
  ClientHeight = 908
  ClientWidth = 1295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 21
  object pnlHeader: TPanel
    Left = 0
    Top = 31
    Width = 1295
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object vimageLogo: TVirtualImage
      Left = 14
      Top = 6
      Width = 32
      Height = 32
      Hint = 'Generic Logo used by FES'
      ImageCollection = FES.imgCollection
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 0
      ImageName = 'FES_512x512'
      ParentShowHint = False
      ShowHint = True
    end
    object lblCompanyName: TLabel
      Left = 52
      Top = 12
      Width = 113
      Height = 21
      Caption = 'Company Name'
    end
    object StackPanel1: TStackPanel
      Left = 1144
      Top = 0
      Width = 151
      Height = 42
      Align = alRight
      BevelOuter = bvNone
      ControlCollection = <
        item
          Control = vimgDayCountDec
        end
        item
          Control = edtDayCount
        end
        item
          Control = vimgDayCountInc
        end>
      Orientation = spoHorizontal
      TabOrder = 0
      object vimgDayCountDec: TVirtualImage
        Left = 0
        Top = 5
        Width = 32
        Height = 32
        ImageCollection = FES.imgCollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 79
        ImageName = 'arrow\arrow_circle_left_FILL'
        OnClick = vimgDayCountDecClick
      end
      object edtDayCount: TEdit
        Left = 34
        Top = 6
        Width = 40
        Height = 29
        Hint = 'Number of days to display.'
        Alignment = taCenter
        Color = clBtnFace
        NumbersOnly = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TextHint = 'Days'
        OnChange = edtDayCountChange
      end
      object vimgDayCountInc: TVirtualImage
        Left = 76
        Top = 5
        Width = 32
        Height = 32
        ImageCollection = FES.imgCollection
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 80
        ImageName = 'arrow\arrow_circle_right_FILL'
        OnClick = vimgDayCountIncClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 889
    Width = 1295
    Height = 19
    Panels = <>
  end
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 1295
    Height = 31
    UseSystemFont = False
    ActionManager = actnmanMain
    Caption = 'ActionMainMenuBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    HorzMargin = 10
    Spacing = 10
    VertMargin = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 73
    Width = 1295
    Height = 816
    Align = alClient
    Caption = 'frameFESPlanner'
    TabOrder = 3
    inline MyPlanner: TFESPlanner
      Left = 1
      Top = 1
      Width = 1293
      Height = 814
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1293
      ExplicitHeight = 814
      inherited DBPlanner1: TDBPlanner
        Width = 1293
        Height = 814
        Bands.Show = True
        Bands.NonActivePrimary = clWhite
        Bands.NonActiveSecondary = 15658734
        Display.ActiveStart = 4
        Display.ActiveEnd = 24
        Display.DisplayEnd = 40
        Items = <
          item
            BorderColor = 11250603
            CaptionBkg = 14925219
            CaptionBkgTo = 14925219
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 4474440
            CaptionFont.Height = -12
            CaptionFont.Name = 'Segoe UI'
            CaptionFont.Style = []
            CaptionType = ctText
            CaptionText = '21 Completed'
            ColorTo = clWhite
            Cursor = -1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4474440
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemBegin = 6
            ItemEnd = 22
            ItemPos = 6
            Name = 'PlannerItem0'
            SelectColor = 14925219
            SelectColorTo = 14925219
            SelectFontColor = 3881787
            Shadow = False
            Text.Strings = (
              'Meaning To Stop'
              ''
              '50 Forest Hill - Fernvale Road'
              'FOREST HILL, QLD 4342'
              ''
              'TECH:Mitchell BELL')
            TrackColor = 11565130
            TrackSelectColor = 11565130
          end
          item
            BorderColor = 11250603
            CaptionBkg = 14925219
            CaptionBkgTo = 14925219
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 4474440
            CaptionFont.Height = -12
            CaptionFont.Name = 'Segoe UI'
            CaptionFont.Style = []
            CaptionType = ctText
            CaptionText = '57 Completed'
            ColorTo = clWhite
            Cursor = -1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4474440
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemBegin = 6
            ItemEnd = 22
            ItemPos = 4
            Name = 'PlannerItem0'
            SelectColor = 14925219
            SelectColorTo = 14925219
            SelectFontColor = 3881787
            Shadow = False
            Text.Strings = (
              'Free Range Kids - Gatton'
              ''
              '5391 Warrego Highway'
              'GATTON, QLD 4343'
              '')
            TrackColor = 11565130
            TrackSelectColor = 11565130
          end
          item
            BorderColor = 11250603
            CaptionBkg = 14925219
            CaptionBkgTo = 14925219
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 4474440
            CaptionFont.Height = -12
            CaptionFont.Name = 'Segoe UI'
            CaptionFont.Style = []
            CaptionType = ctText
            CaptionText = '1036 Completed'
            ColorTo = clWhite
            Cursor = -1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4474440
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemBegin = 2
            ItemEnd = 12
            ItemPos = 4
            Name = 'PlannerItem0'
            SelectColor = 14925219
            SelectColorTo = 14925219
            SelectFontColor = 3881787
            Shadow = False
            Text.Strings = (
              'Allys Kindy'
              ''
              '68 Woodford Street'
              'ONE MILE, QLD 4305'
              '')
            TrackColor = 11565130
            TrackSelectColor = 11565130
          end
          item
            BorderColor = 11250603
            CaptionBkg = 14925219
            CaptionBkgTo = 14925219
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 4474440
            CaptionFont.Height = -12
            CaptionFont.Name = 'Segoe UI'
            CaptionFont.Style = []
            CaptionType = ctText
            CaptionText = '1043 Completed'
            ColorTo = clWhite
            Cursor = -1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4474440
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemBegin = 6
            ItemEnd = 22
            ItemPos = 5
            Name = 'PlannerItem0'
            SelectColor = 14925219
            SelectColorTo = 14925219
            SelectFontColor = 3881787
            Shadow = False
            Text.Strings = (
              'Sophia College'
              ''
              '56 Otto Road'
              'PLAINLAND, QLD 4341'
              '')
            TrackColor = 11565130
            TrackSelectColor = 11565130
          end
          item
            BorderColor = 11250603
            CaptionBkg = 14925219
            CaptionBkgTo = 14925219
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 4474440
            CaptionFont.Height = -12
            CaptionFont.Name = 'Segoe UI'
            CaptionFont.Style = []
            CaptionType = ctText
            CaptionText = '1192 Completed'
            ColorTo = clWhite
            Cursor = -1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4474440
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemBegin = 4
            ItemEnd = 20
            ItemPos = 1
            Name = 'PlannerItem0'
            SelectColor = 14925219
            SelectColorTo = 14925219
            SelectFontColor = 3881787
            Shadow = False
            Text.Strings = (
              'Savco Vegetation Services Pty Ltd'
              ''
              '134 Briggs Road'
              'RACEVIEW, QLD 4305')
            TrackColor = 11565130
            TrackSelectColor = 11565130
          end
          item
            BorderColor = 11250603
            CaptionBkg = 14925219
            CaptionBkgTo = 14925219
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 4474440
            CaptionFont.Height = -12
            CaptionFont.Name = 'Segoe UI'
            CaptionFont.Style = []
            CaptionType = ctText
            CaptionText = '1446 Action'
            ColorTo = clWhite
            Cursor = -1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4474440
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemBegin = 8
            ItemEnd = 24
            ItemPos = 0
            Name = 'PlannerItem0'
            SelectColor = 14925219
            SelectColorTo = 14925219
            SelectFontColor = 3881787
            Shadow = False
            Text.Strings = (
              'Len Russell Funeral Director'
              ''
              '238 Brisbane Street'
              'WEST IPSWICH, QLD 4305'
              '')
            TrackColor = 11565130
            TrackSelectColor = 11565130
          end
          item
            BorderColor = 11250603
            CaptionBkg = 14925219
            CaptionBkgTo = 14925219
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 4474440
            CaptionFont.Height = -12
            CaptionFont.Name = 'Segoe UI'
            CaptionFont.Style = []
            CaptionType = ctText
            CaptionText = '1448 Action'
            ColorTo = clWhite
            Cursor = -1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4474440
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemBegin = 15
            ItemEnd = 27
            ItemPos = 1
            Name = 'PlannerItem0'
            SelectColor = 14925219
            SelectColorTo = 14925219
            SelectFontColor = 3881787
            Shadow = False
            Text.Strings = (
              'Plasvacc Pty Ltd'
              ''
              '6066 Cunningham Highway'
              'KALBAR, QLD 4309')
            TrackColor = 11565130
            TrackSelectColor = 11565130
          end
          item
            BorderColor = 11250603
            CaptionBkg = 14925219
            CaptionBkgTo = 14925219
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = 4474440
            CaptionFont.Height = -12
            CaptionFont.Name = 'Segoe UI'
            CaptionFont.Style = []
            CaptionType = ctText
            CaptionText = '1449 Action'
            ColorTo = clWhite
            Cursor = -1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 4474440
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ItemBegin = 8
            ItemEnd = 24
            ItemPos = 2
            Name = 'PlannerItem0'
            SelectColor = 14925219
            SelectColorTo = 14925219
            SelectFontColor = 3881787
            Shadow = False
            Text.Strings = (
              'The Karalee Community Kindergarten Inc.'
              ''
              '56 Harold Summervilles Road'
              'KARALEE, QLD 4306'
              '')
            TrackColor = 11565130
            TrackSelectColor = 11565130
          end>
        ExplicitWidth = 1293
        ExplicitHeight = 814
        TMSStyle = 0
      end
      inherited DBDaySource1: TDBDaySource
        OnFieldsToItem = TFESPlanner1DBDaySource1FieldsToItem
        DayIncrement = 1
        Left = 504
        Top = 80
      end
    end
  end
  object actnmanMain: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = FileConnect
                Caption = '&Connect to Database'
                ImageName = 'link_off'
              end
              item
                Action = FileExit1
                ImageIndex = 6
                ImageName = 'logout'
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = actnCut
                Caption = '&Cut'
              end
              item
                Action = actnCopy
                Caption = 'C&opy'
              end
              item
                Action = actnPaste
                Caption = '&Paste'
              end
              item
                Action = actnDelete
                Caption = '&Delete'
              end
              item
                Caption = '-'
              end
              item
                Action = actnStatusPalette
                Caption = '&Status Palette...'
              end
              item
                Action = actnPrefernces
                Caption = 'P&references...'
              end>
            Caption = 'E&dit'
          end
          item
            Items = <
              item
                Action = SurveyFind
                Caption = '&Find Survey Order'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = SurveyBrowse
                Caption = '&Browse for Survey Order'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = SurveyGotoID
                Caption = '&Goto Survey Order ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Caption = '-'
              end
              item
                Action = SurveyNew
                Caption = '&Create New Survey Order'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = '&Survey'
          end
          item
            Items = <
              item
                Action = InspectSchedule
                Caption = '&Schedule'
                ImageIndex = 2
                ImageName = 'calendar_today'
              end
              item
                Action = InspectFindOrder
                Caption = '&Find Order'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = InspectBrowseOrders
                Caption = '&Browse for Order'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = InspectGotoOrderID
                Caption = '&Goto Order ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = InspectProcessOrders
                Caption = '&Process Orders'
                ImageIndex = 0
                ImageName = 'update'
              end>
            Caption = '&Inspection'
          end
          item
            Items = <
              item
                Action = SiteFind
                Caption = '&Find Site'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = SiteBrowse
                Caption = '&Browse for Site'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = SiteGotoID
                Caption = '&Goto Site ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Caption = '-'
              end
              item
                Action = actnStationEditor
                Caption = '&Edit Stations at Site'
                ImageIndex = 13
                ImageName = 'edit'
              end
              item
                Action = SiteNew
                Caption = '&Create New Site'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = 'Si&tes'
          end
          item
            Items = <
              item
                Action = CustFind
                Caption = '&Find Customer'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = CustBrowse
                Caption = '&Browse for Customer'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = CustGotoID
                Caption = '&Goto Customer ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = CustGotoCODE
                Caption = 'G&oto Customer CODE'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = CustNew
                Caption = '&Create New Customer'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = '&Customer'
          end
          item
            Items = <
              item
                Action = HRFind
                Caption = '&Find HR'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = HRBrowse
                Caption = '&Browse for HR'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = HRGotoID
                Caption = '&Goto HR ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = HRNew
                Caption = '&Create New HR'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = '&HR'
          end
          item
            Items = <
              item
                Action = EquipFind
                Caption = '&Find Equipment'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = EquipBrowse
                Caption = '&Browse Equipment'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = EquipGotoID
                Caption = '&Goto Equipment ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = EquipNew
                Caption = '&Create New Equipment'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = '&Equipment'
          end
          item
            Items = <
              item
                Action = LinkFind
                Caption = '&Find Link'
                ImageIndex = 1
                ImageName = 'search'
              end
              item
                Action = LinkBrowse
                Caption = '&Browse Links'
                ImageIndex = 18
                ImageName = 'open_in_browser'
              end
              item
                Action = LinkGotoID
                Caption = '&Goto Link ID'
                ImageIndex = 3
                ImageName = 'goto'
              end
              item
                Action = LinkNew
                Caption = '&Create New Link'
                ImageIndex = 5
                ImageName = 'new'
              end>
            Caption = '&Link'
          end
          item
            Items = <
              item
                Action = ToolsCompanySetup
                Caption = '&Company Setup'
                ImageIndex = 8
                ImageName = 'settings'
              end
              item
                Action = ToolsOptions
                Caption = '&Options'
                ImageIndex = 10
                ImageName = 'settings_applications'
              end
              item
                Action = ToolsSystemLog
                Caption = '&System Log'
                ImageIndex = 9
                ImageName = 'description'
              end>
            Caption = 'T&ools'
          end
          item
            Items = <
              item
                Action = HelpAbout
                Caption = '&About Fire Equipment Services'
                ImageIndex = 11
                ImageName = 'info'
              end
              item
                Action = HelpWebSite
                Caption = '&FES Help'
                ImageIndex = 12
                ImageName = 'help'
              end>
            Caption = 'Hel&p'
          end>
        ActionBar = ActionMainMenuBar1
      end>
    Images = FES.imgList32x32
    Left = 856
    Top = 8
    StyleName = 'Platform Default'
    object SurveyFind: TAction
      Category = 'Survey'
      Caption = 'Find Survey Order'
      ImageIndex = 1
      ImageName = 'search'
    end
    object SurveyBrowse: TAction
      Category = 'Survey'
      Caption = 'Browse for Survey Order'
      ImageIndex = 18
      ImageName = 'open_in_browser'
    end
    object SurveyGotoID: TAction
      Category = 'Survey'
      Caption = 'Goto Survey Order ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object SurveyNew: TAction
      Category = 'Survey'
      Caption = 'Create New Survey Order'
      ImageIndex = 5
      ImageName = 'new'
    end
    object InspectSchedule: TAction
      Category = 'Inspection'
      Caption = 'Schedule'
      ImageIndex = 2
      ImageName = 'calendar_today'
    end
    object InspectFindOrder: TAction
      Category = 'Inspection'
      Caption = 'Find Order'
      ImageIndex = 1
      ImageName = 'search'
      OnExecute = InspectFindOrderExecute
      OnUpdate = GenericUpdate
    end
    object InspectBrowseOrders: TAction
      Category = 'Inspection'
      Caption = 'Browse for Order'
      ImageIndex = 18
      ImageName = 'open_in_browser'
      OnExecute = InspectBrowseOrdersExecute
      OnUpdate = GenericUpdate
    end
    object InspectGotoOrderID: TAction
      Category = 'Inspection'
      Caption = 'Goto Order ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object InspectProcessOrders: TAction
      Category = 'Inspection'
      Caption = 'Process Orders'
      ImageIndex = 0
      ImageName = 'update'
    end
    object SiteFind: TAction
      Category = 'Sites'
      Caption = 'Find Site'
      ImageIndex = 1
      ImageName = 'search'
    end
    object SiteBrowse: TAction
      Category = 'Sites'
      Caption = 'Browse for Site'
      ImageIndex = 18
      ImageName = 'open_in_browser'
    end
    object SiteGotoID: TAction
      Category = 'Sites'
      Caption = 'Goto Site ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object SiteNew: TAction
      Category = 'Sites'
      Caption = 'Create New Site'
      ImageIndex = 5
      ImageName = 'new'
    end
    object CustFind: TAction
      Category = 'Customer'
      Caption = 'Find Customer'
      ImageIndex = 1
      ImageName = 'search'
    end
    object CustBrowse: TAction
      Category = 'Customer'
      Caption = 'Browse for Customer'
      Hint = 'View Customers | View, edit, create, delete and find customers. '
      ImageIndex = 18
      ImageName = 'open_in_browser'
      OnExecute = CustBrowseExecute
      OnUpdate = GenericUpdate
    end
    object CustGotoID: TAction
      Category = 'Customer'
      Caption = 'Goto Customer ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object CustGotoCODE: TAction
      Category = 'Customer'
      Caption = 'Goto Customer CODE'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object CustNew: TAction
      Category = 'Customer'
      Caption = 'Create New Customer'
      ImageIndex = 5
      ImageName = 'new'
    end
    object HRFind: TAction
      Category = 'HR'
      Caption = 'Find HR'
      ImageIndex = 1
      ImageName = 'search'
    end
    object HRBrowse: TAction
      Category = 'HR'
      Caption = 'Browse for HR'
      ImageIndex = 18
      ImageName = 'open_in_browser'
    end
    object HRGotoID: TAction
      Category = 'HR'
      Caption = 'Goto HR ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object HRNew: TAction
      Category = 'HR'
      Caption = 'Create New HR'
      ImageIndex = 5
      ImageName = 'new'
    end
    object EquipFind: TAction
      Category = 'Equipment'
      Caption = 'Find Equipment'
      ImageIndex = 1
      ImageName = 'search'
    end
    object EquipBrowse: TAction
      Category = 'Equipment'
      Caption = 'Browse Equipment'
      ImageIndex = 18
      ImageName = 'open_in_browser'
    end
    object EquipGotoID: TAction
      Category = 'Equipment'
      Caption = 'Goto Equipment ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object EquipNew: TAction
      Category = 'Equipment'
      Caption = 'Create New Equipment'
      ImageIndex = 5
      ImageName = 'new'
    end
    object FileConnect: TAction
      Category = 'File'
      Caption = 'Connect to Database'
      ImageName = 'link_off'
    end
    object FileExit1: TFileExit
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit|Quits the application'
      ImageIndex = 6
    end
    object ToolsCompanySetup: TAction
      Category = 'Tools'
      Caption = 'Company Setup'
      ImageIndex = 8
      ImageName = 'settings'
    end
    object ToolsOptions: TAction
      Category = 'Tools'
      Caption = 'Options'
      ImageIndex = 10
      ImageName = 'settings_applications'
    end
    object ToolsSystemLog: TAction
      Category = 'Tools'
      Caption = 'System Log'
      ImageIndex = 9
      ImageName = 'description'
    end
    object LinkFind: TAction
      Category = 'Link'
      Caption = 'Find Link'
      ImageIndex = 1
      ImageName = 'search'
    end
    object LinkBrowse: TAction
      Category = 'Link'
      Caption = 'Browse Links'
      ImageIndex = 18
      ImageName = 'open_in_browser'
    end
    object LinkGotoID: TAction
      Category = 'Link'
      Caption = 'Goto Link ID'
      ImageIndex = 3
      ImageName = 'goto'
    end
    object LinkNew: TAction
      Category = 'Link'
      Caption = 'Create New Link'
      ImageIndex = 5
      ImageName = 'new'
    end
    object HelpAbout: TAction
      Category = 'Help'
      Caption = 'About Fire Equipment Services'
      ImageIndex = 11
      ImageName = 'info'
    end
    object HelpWebSite: TAction
      Category = 'Help'
      Caption = 'FES Help'
      ImageIndex = 12
      ImageName = 'help'
    end
    object actnStationEditor: TAction
      Category = 'Sites'
      Caption = 'Edit Stations at Site'
      ImageIndex = 13
      ImageName = 'edit'
    end
    object actnCut: TAction
      Category = 'Edit'
      Caption = 'Cut'
    end
    object actnCopy: TAction
      Category = 'Edit'
      Caption = 'Copy'
    end
    object actnPaste: TAction
      Category = 'Edit'
      Caption = 'Paste'
    end
    object actnDelete: TAction
      Category = 'Edit'
      Caption = 'Delete'
    end
    object actnStatusPalette: TAction
      Category = 'Edit'
      Caption = 'Status Palette...'
      OnExecute = actnStatusPaletteExecute
      OnUpdate = GenericUpdate
    end
    object actnPrefernces: TAction
      Category = 'Edit'
      Caption = 'Preferences...'
    end
  end
  object BalloonHint1: TBalloonHint
    Left = 856
    Top = 64
  end
end
