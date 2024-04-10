object Customer: TCustomer
  Left = 0
  Top = 0
  Caption = 'FES Customer'
  ClientHeight = 638
  ClientWidth = 782
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Height = 40
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
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  GlassFrame.Top = 40
  Position = poDesigned
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 39
    Width = 782
    Height = 42
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 40
    ExplicitWidth = 783
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
    Top = 86
    Width = 772
    Height = 478
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = TabSheet1
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 1
    ExplicitTop = 87
    ExplicitWidth = 773
    ExplicitHeight = 481
    object TabSheet1: TTabSheet
      Caption = 'Details'
      DesignSize = (
        764
        442)
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
      object vimgHideUnPinned: TVirtualImage
        Left = 79
        Top = 17
        Width = 32
        Height = 32
        Hint = 'Archive or un-archive'
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 15
        ImageName = 'unarchive'
        ParentShowHint = False
        ShowHint = True
      end
      object VirtualImage1: TVirtualImage
        Left = 41
        Top = 17
        Width = 32
        Height = 32
        Hint = 'Make active or in-active'
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 17
        ImageName = 'toggle_on'
        ParentShowHint = False
        ShowHint = True
      end
      object VirtualImage2: TVirtualImage
        Left = 3
        Top = 17
        Width = 32
        Height = 32
        Hint = 'Pin/un-pin.'
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 18
        ImageName = 'keep'
        ParentShowHint = False
        ShowHint = True
      end
      object VirtualImage3: TVirtualImage
        Left = 131
        Top = 144
        Width = 32
        Height = 32
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 1
        ImageName = 'pin'
        ParentShowHint = False
        ShowHint = True
        OnClick = actnGenerateCustCodeExecute
      end
      object VirtualImage4: TVirtualImage
        Left = 117
        Top = 17
        Width = 32
        Height = 32
        Hint = 'Print a detailed report.'
        ImageCollection = ImageCollection1
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 20
        ImageName = 'BatchPrint'
        ParentShowHint = False
        ShowHint = True
      end
      object dbedtCustName: TDBEdit
        Left = 1
        Top = 82
        Width = 760
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
        Width = 758
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
        Width = 754
        Height = 432
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 755
        ExplicitHeight = 435
        inherited StackPanel1: TStackPanel
          Width = 754
          ControlCollection = <
            item
              Control = FESCustNumber1.vimgHideUnPinned
            end>
          ExplicitWidth = 755
        end
        inherited ctrllistCustNum: TControlList
          Width = 754
          Height = 400
          ExplicitTop = 32
          ExplicitWidth = 755
          ExplicitHeight = 403
          inherited lblNumberType: TLabel
            ExplicitHeight = -6
          end
          inherited lblNumber: TLabel
            Height = 34
          end
          inherited btnEditNumber: TControlListButton
            Left = 708
            ExplicitLeft = 709
            ExplicitHeight = -6
          end
          inherited btnPinNumber: TControlListButton
            Left = 669
            ExplicitLeft = 670
            ExplicitHeight = -6
          end
          inherited lblNumberCreatedOn: TLabel
            Left = 596
            Height = 34
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
        Width = 754
        Height = 432
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 755
        ExplicitHeight = 435
        inherited StackPanel1: TStackPanel
          Width = 754
          ControlCollection = <
            item
              Control = FESCustAddress1.vimgHideUnPinned
            end>
          ExplicitWidth = 755
        end
        inherited ctrllistCustAddress: TControlList
          Width = 754
          Height = 400
          ExplicitTop = 32
          ExplicitWidth = 755
          ExplicitHeight = 403
          inherited lblAddress: TLabel
            Width = 507
            Height = 0
            ExplicitWidth = 507
            ExplicitHeight = 0
          end
          inherited btnEditAddress: TControlListButton
            Left = -42
            Height = -6
            ExplicitLeft = 715
            ExplicitHeight = -6
          end
          inherited btnPinAddress: TControlListButton
            Left = -78
            Height = -6
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
        Width = 754
        Height = 432
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 755
        ExplicitHeight = 435
        inherited StackPanel1: TStackPanel
          Width = 754
          ControlCollection = <
            item
              Control = FESCustEmail1.vimgHideUnPinned
            end>
          ExplicitWidth = 755
        end
        inherited ctrllistCustEmail: TControlList
          Width = 754
          Height = 400
          ExplicitTop = 32
          ExplicitWidth = 755
          ExplicitHeight = 403
          inherited lblEmailType: TLabel
            Height = -6
            ExplicitHeight = -6
          end
          inherited lblEmail: TLabel
            Height = 0
          end
          inherited lblEmailCreatedDT: TLabel
            Left = -154
            Height = -6
            ExplicitLeft = -154
          end
          inherited btnPinEmail: TControlListButton
            Left = -81
            Height = -6
            ExplicitLeft = 670
            ExplicitHeight = -6
          end
          inherited btnEditEmail: TControlListButton
            Left = -42
            Height = -6
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
        Width = 754
        Height = 432
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 755
        ExplicitHeight = 435
        inherited StackPanel1: TStackPanel
          Width = 754
          ControlCollection = <
            item
              Control = FESCustContact1.vimgHideUnPinned
            end>
          ExplicitWidth = 755
        end
        inherited ctrllistCustEmail: TControlList
          Width = 754
          Height = 400
          ExplicitTop = 32
          ExplicitWidth = 755
          ExplicitHeight = 403
          inherited lblContactType: TLabel
            Height = -6
            ExplicitHeight = -6
          end
          inherited lblContactName: TLabel
            Height = -6
          end
          inherited btnEditContact: TControlListButton
            Left = -42
            Height = -6
            ExplicitLeft = 709
            ExplicitHeight = -6
          end
          inherited btnPinContact: TControlListButton
            Left = -78
            Height = -6
            ExplicitLeft = 673
            ExplicitHeight = -6
          end
          inherited lblContactCreatedDT: TLabel
            Left = -134
            Height = -6
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
        Width = 754
        Height = 432
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 755
        ExplicitHeight = 435
        inherited StackPanel1: TStackPanel
          Width = 754
          ControlCollection = <
            item
              Control = FESCustSite1.vimgHideUnPinned
            end>
          ExplicitWidth = 755
        end
        inherited ctrllistCustSite: TControlList
          Width = 754
          Height = 400
          ExplicitTop = 32
          ExplicitWidth = 755
          ExplicitHeight = 403
          inherited lblSiteContact_ss: TLabel
            Left = 3
            Top = -20
            Width = -13
            ExplicitLeft = -133
            ExplicitTop = -20
          end
          inherited btnPinSite: TControlListButton
            Left = -81
            ExplicitLeft = 670
          end
          inherited btnEditSite: TControlListButton
            Left = -42
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
        Width = 754
        Height = 432
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 755
        ExplicitHeight = 435
        inherited StackPanel1: TStackPanel
          Width = 754
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
          ExplicitWidth = 755
        end
        inherited ctrllistCustInspect: TControlList
          Width = 754
          Height = 400
          ExplicitWidth = 755
          ExplicitHeight = 403
          inherited lblInspectAddress: TLabel
            Width = 482
            Height = 74
          end
          inherited lblInspectStatus: TLabel
            Left = 618
            Height = 74
            ExplicitLeft = 658
          end
          inherited btnPinInspect: TControlListButton
            Left = 669
            ExplicitLeft = 683
          end
          inherited btnEditInspect: TControlListButton
            Left = 708
            ExplicitLeft = 709
          end
        end
        inherited imgcollCustInspect: TImageCollection
          Images = <
            item
              Name = 'pin'
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
              Name = 'unpin'
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
              Name = 'Refresh'
              SourceImages = <
                item
                  Image.Data = {
                    89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
                    87000000017352474200AECE1CE9000002A6494441546843ED98814D1C311045
                    3F1540074005810A800A48072415845400A900E8002A002A002A805490A40242
                    05A01779A491757B3BBEB55956594BA7D3CA5EEFFFF3FF786CAF69E26D6DE2F8
                    3513185BC1598159818111982DE402B821694FD267495BEEC79027497F25FD96
                    742FE9363D77C5FFD5752C0D720D05007B22E94B811B207323E92A11CA5F7D17
                    02441CE0C705C0170D3D97F42353A43901C0DF49DAC910FD4C91C526D8851F6D
                    DFFDA3D466F61E16FB9AAC4657530280063C24AC3D24250012691042B9433718
                    5B1D2412CD0800FA9703FF92805C46502F18831A58683DF51989C716499CDB06
                    F044321AF52E8E284A429BAD20E1D5ADB60A11A96F09452DF0468A958C409812
                    9E6C15027C00EB5823E156B54D9712A8496EE5AD0A01C01EA59949585B554AAD
                    8F5D1645D9E62127F27A3298007E7C76487707F89EE5956A5DD20613606B709D
                    BEC83A9FAFFD25604621E0ED43C53C2D419C8D6521280DC052BB46F6423E6A14
                    1A9E3F4C8B10603B606BF4B6DB1E7C08121102E1B23E06A3FF82C0E42D34F924
                    AEB98C564F93480EF842C6868B4ADCB2512B3EA50F5CA49D6AE7F72204F2AD44
                    CB5A906FE87A97ED0801D87B1B91139068D17CBE717381FA4B5B94C018DBE990
                    D2510244C11F68FCF9B52F4891FEFC9CCD754BE89AA68400B980C49660B548E4
                    E039EDA138F3F7B612024C06090A9B3F847F1F703AE366E2CCA12C3EAA9612E0
                    5B440C25FCC98A67B6DAD19D2AF6E0528C485B033C491B9DE3DF7BAB103025BC
                    9D0C0475821B06FAFE24B5500DDBD97D29E03D70DE2D8EBC7D7055024682C38D
                    DD54F4FAB56300C58A79429ECFE71842C0E6229A00B0437F94082B0D2BDBA07B
                    A51A040C3056A192DAF5BA59C72C0250FB61B39522DE428168C49B8CABA94013
                    807D93CE04FA22D4BA7F56A07584FBE69F15E88B50EBFE37192485314CB78CD4
                    0000000049454E44AE426082}
                end>
            end
            item
              Name = 'VisibilityOff'
              SourceImages = <
                item
                  Image.Data = {
                    89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
                    87000000017352474200AECE1CE9000003BC494441546843ED9881B14D410C86
                    F32AA00354800A50012A4005A80015A00254800A50012A400754C07C6673262F
                    7693ECB967E69E3B6367EEBC7BDFDD93CD9FFCF993BD6772E2EBECC4FD97FF00
                    8E9DC15E062E8AC8CF633B563DDF03C0F90F22F245441E548D1C739F05A0CE5F
                    6B0EBD3E05103E03387DCF4474F7207A35B00604D9BB2122648F179F6F3A6A7D
                    6C9FA127EFBF8AC8F743E93792D10A089CBC2D22F73BCE56FD02CC0B1179BF56
                    38A23E908120D244F242D5DB601FAAC779CF6681648D6C06C4A7A65E80C221A2
                    AB727C594478597AF1DE8367FF531179590D4A06003B19081C63CDF2190A42BF
                    472272C9390CF85B956C540010A9CFEE80ADD5092044DE02211B8000CC706500
                    709EC646B4FC8A4090155489BF4A2728962D80BC729B68A89CD55D11006410E7
                    75217B4423EB13EF9A3AF50EA43E7028A29B1787301323003EF2C81CD151B588
                    4064EA5429546C1008A5D410C4689823F23A52907ADF94B2C2E6598A93487338
                    9FEF38D579DC7AC0881DD0968C5D352271DD17760F008DE5617B08DAE07C6F3A
                    CD4078C7A8076CD3FC58D8C4A1884E80E07B955BE495C02CCB03B0BCFFD59C8F
                    5460160407DB6788304A132D32F7D66C60BF8E25FFDCC8904BA54E96626C12D5
                    6FEEF48AC41255E577A68498C761544DDF2FA0EDC316E98FE65C129CBF85ED65
                    4FA31CDD272C4DCF457470208182094AA5E5190B80C2D5620DB5D71C42F37932
                    3834CA043C7EDE9EAB649AADF6AC857A16804D53D5A875A4876304C23EC70087
                    73D9B2D95E94D102B0055C51080EF4CDAE0AC236BBBB4DF33300D49ACE5D5D0A
                    F962E1108C67EB77B6A1298FAD09DBECAE1406419BB1737D299251FCAA44C752
                    2FC2E2E90408A8837844CB0F93A18C62C82A04542242D1CF2C5E21664064C9F3
                    3F34A48D4C0D2259DAC22BB3F9484EAB35D1DBE79DEF4E05D13067AF8B95D91C
                    9E4289CA15336B76384F7F517A0DA782A80BF6C65AE475389B3795E07BED9A6B
                    E8E4231F8E34591BEF8DC644BA72674562F50ECCE84046C950769FB06306CE93
                    8565F6F111C900B0DFCFE6FC8F4390C5A1E120F4D900A841D33E73D09552FD20
                    ADF4054F0D8CE3D09BCA05DC80AA80D0BB44A854950C5803BDCBB77E4F3600C4
                    8BC31908EDAC4F10503664177A61CBAEACB0BB406601600447A8035E15C5C9B4
                    FE20106B00585A516044B2A23A3D209A25FBFC54260E01601DD21F7329401DC9
                    FD2F6FEAAC2A92D20D3B594D0CB3B81580199A8CF6AE02B12700AB32B13700D3
                    20F608600AC45E01F44074AF9E7B0660410C7F60DB3B004070C142A1BA33D129
                    00D87416DA42EF37B571F219F8031D3DFD310C1B9D900000000049454E44AE42
                    6082}
                end>
            end
            item
              Name = 'VisibilityOn'
              SourceImages = <
                item
                  Image.Data = {
                    89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
                    87000000017352474200AECE1CE90000039B494441546843ED9981910D411086
                    FB2220034480081001224004880011200264702240048800191001F555F5FFAA
                    5FBF99E9D9B77775AE6AA74ADDDA9BEEE9BFFF7F7A7AE74EEC928F934B1EBF6D
                    002E9AC18D818D819519D824E409BC6A6677CCEC9699DDF5773CF39EF1DBCCBE
                    F9F3677FFEE2EF5771B096814766F63804BD3418C0BC37B30F4B0D35FF58002F
                    CCEC59C8F0B1EBCB0E86DE98D9ABA58E9602401EEFCCEC7A63212421794832FC
                    642025494A32437279FC34B327EE670ACB1200048E5CE2F8E59943060A766A61
                    4FC20367F25A32C21F40CA310380EC7DF20CCA2181BF74FD968B4C4C2031F88B
                    40D8F4F7AAC45400A09BE0554D88850D87FEAB8CAB2A614330486C3458837D40
                    61D0600D40A8821DD88F00A0F3AF29786885DEDEC006A9A994E679EC117CA0F5
                    DE2039AF13881BBD84F50064D9FC71FD9F0E167EEA32886CB5A69355E4F276E0
                    0B49C1C6159FD395530F00B25116099EE72E8D2EA998356C54918841954701F1
                    EEB907D9C3810D3E64C33372DA1B2D00914202C1D188F22CB58FCE56DE233083
                    FCEE7B04FCFE76E19BB591B1C601E80CA03468A42BB245F094C6D1408602D1CC
                    6A32466E1C9C1A80DEA9210388C150357A9B31AEF1D7FF035BB0515527988051
                    49A3AA84B827E09BBECE1EE8684CB00060CC488779D16626FB021E5940D70435
                    1A59193B9B082066BFDA605A2CEE17FA18E89E195116B36B459B1D0B11002FD5
                    9FCC3ABD28003B79F724345321FE3B0911506461A64260A34D0CE8EE891974C5
                    26FE114EF8994D4C29651F30F68ACB5994D1089ACDF9B0D8044B2BDDA232CADA
                    51D73352A27452E654160141BFD33AC8E893744ECC54BAF25CEAD117B35A7684
                    8D56029B562B11FBA4AA31CC9D70F35C1A357304A0C383805870D4CCC11C74C7
                    7EA7A52632CFDC51574B33476F25C0DFFDCC393824AB763A4A43F21A7591C889
                    C05A9F8BDA800437EAADE86AE9443586277C55017247885302E49CA85A064E69
                    550E12519DB6649BACC7CFD6B213AE0010308EA39C78470691CBD1D721495B7C
                    85E12F5E167465136D6700683E998F9F7B0202DDF4412359B4F602C1D295B21F
                    F22D0789C91708CDEABC04804E5E80E45B041D82F15A850CC66B150A82AE5790
                    57ABD3E5B280C02BB9EDC02C052043E8267355C59969EC9883D66172B6195C0D
                    400EC816FF7A55A702406D87D151491DFA389681EC1469A8EAC4CB5D314486F3
                    E52E32A92A599580ED6F646586CE7BC25949E8BCE3ECFADF005C58EA7DE18D81
                    8D819519D824B43281ABCDFF018921E03192487AFD0000000049454E44AE4260
                    82}
                end>
            end
            item
              Name = 'content_paste'
              SourceImages = <
                item
                  Image.Data = {
                    89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
                    87000000017352474200AECE1CE900000208494441546843ED9ABB3204411885
                    BF8D3C81C42D40092584AA5084A4220F8012C9154A2EC40B48A4520A55421255
                    1285C02DF10422F6A89935667B765B77AF40FD1DEDEEFCB7D37DFA9FD93E53A3
                    33A31B9800FAB2F0CFC005F0963A5D2D754060055803864AB1EF811D603765CE
                    D40036818D36056ED5AFCB2EC94809600E38F2AC6A1138F0B46D69D60E4017D0
                    0B0C7824136DE63DEC647203AC7AD83E022FC07B956D2B004BC03AD0E391C865
                    22AA1C6617163CA85595E615D806F65D06550066EA5DE438B0F0DC6D1A38CBBE
                    4C01A791F1668193720C1700D1E61A18894C385EA7D45516630CB88C8C770B8C
                    96E9E402A0F67717994CEE9A7DD148439D49AB103B8601B5E3C67001702D775E
                    881C271315E30223D0E7850BE5965CA4E597D96F00E4BD5B5C4E319B550054A4
                    86EB9E62003433B6022D76B2F640C729F49BE7988FAC58D75ED3B5FCF7E2E73C
                    7EC7F6406C2BF4F53700C5994AFA08ECB904B602B6029E54A932330A19858C42
                    CD271C499E462327D6DBDD36B16D626FB2B80D8D424621A390DD07BE39607F68
                    02F683B5D17FD746035810ED1274B83B583EC28E2E235D001DFD3F14C355091C
                    320A9596D295FB3392A4264DEE0FBDAC4A62923EB6D7A94A02E32EBB74B25622
                    9F743289D2B1525360BD0D37494B12CF9BF43159F8C8AC7A5DA03FB68A40FF27
                    40AF2904C9AC8139FFD6ADDD0AFC6D3501D90C40C0A42575F904AEDBB2315E69
                    67F60000000049454E44AE426082}
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
            end>
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
        Width = 754
        Height = 432
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 755
        ExplicitHeight = 435
        inherited StackPanel1: TStackPanel
          Width = 754
          ControlCollection = <
            item
              Control = FESCustSurvey1.vimgHideUnPinned
            end>
          ExplicitWidth = 755
        end
        inherited ctrllistCustSurvey: TControlList
          Width = 754
          Height = 400
          ExplicitWidth = 755
          ExplicitHeight = 403
          inherited lblSurveyTech: TLabel
            Height = -6
          end
          inherited lblSurveySiteAddrStr: TLabel
            Height = 0
          end
          inherited lblSurveyRequestedDT: TLabel
            Left = -92
            Height = -6
            ExplicitLeft = -92
          end
          inherited btnPinSurvey: TControlListButton
            Left = -81
            Height = -6
            ExplicitLeft = 670
            ExplicitHeight = -6
          end
          inherited btnEditSurvey: TControlListButton
            Left = -42
            Height = -6
            ExplicitLeft = 709
            ExplicitHeight = -6
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 569
    Width = 782
    Height = 69
    Align = alBottom
    BevelEdges = []
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 573
    ExplicitWidth = 783
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 762
      Height = 49
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      DataSource = CustomerData.dsCustomer
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 763
    end
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 39
    CustomButtons = <>
    ExplicitWidth = 774
    object vimgToggleFilters: TVirtualImage
      AlignWithMargins = True
      Left = 528
      Top = 0
      Width = 32
      Height = 39
      Hint = 'Toggle Filters ON/OFF'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 4
      ImageName = 'filter_alt'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 505
      ExplicitTop = 3
      ExplicitHeight = 40
    end
    object vimgGotoID: TVirtualImage
      AlignWithMargins = True
      Left = 564
      Top = 0
      Width = 32
      Height = 39
      Hint = 'Goto customer'#39's ID or CODE'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 0
      ImageName = 'bubble'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 439
      ExplicitTop = 3
      ExplicitHeight = 40
    end
    object vimgSync: TVirtualImage
      AlignWithMargins = True
      Left = 600
      Top = 0
      Width = 32
      Height = 39
      Hint = 'Syncronize and refresh.'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 150
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 9
      ImageName = 'Sync'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
      ExplicitHeight = 40
    end
    object vimgSetFilters: TVirtualImage
      AlignWithMargins = True
      Left = 492
      Top = 0
      Width = 32
      Height = 39
      Hint = 'Set Filters'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 2
      ImageName = 'arrow_drop_down_circle'
      ParentShowHint = False
      ShowHint = True
      OnClick = vimgSetFiltersClick
      ExplicitLeft = 40
    end
    object vimgFindCustomer: TVirtualImage
      AlignWithMargins = True
      Left = 456
      Top = 0
      Width = 32
      Height = 39
      Hint = 'Find a customer'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alRight
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 6
      ImageName = 'search'
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 0
    end
  end
  object ImageCollection1: TImageCollection
    Images = <
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
        Name = 'pin'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000002CB494441546843ED994BC80F5118C6
              7FDF82582814255624B7B022F74B2C90854B48CA424A590891DB022B97050B2B
              94151189902C148A5C4AA2C8251B258A145B0BCE53EFE838CD31A7CCFC67FE5F
              737633E7CCCCF3BCCF73CEFB9E333D7479EBE972FCB404EA56B055A0E90ACCAB
              1BA07DFF6E0C47CC422781E5C0908610F8025C01368578F208FC6A08E8A4A087
              040E01BB1B4EE030B027C31812780D8C69388137C0D81881D03E071B42667F80
              E34FE04305F2081CA89984BEDF12A8538456815E370706B9AC38B928C503A381
              7EC007E07B8107FB0233002D919F82B1A55A680DB00F9808A83E999F03EC3CB0
              2028438E02BB22242E024B81FED67F1D3805DCB0EB520828E25B5C34377820F2
              08EC040436AF1D07B6071D02BF2A67F0370BCE0BD7570A81C7C054CF36AA5243
              02C38CA0227D1538632AA8285C6BCF6ACC670FB0C86E0436BBEC7AC1596D1B70
              CCFA33D54A2120C04780BDC06C4B2C310BF57136FBE9815CE12C77D9AEA7038F
              82882F046E7BF79E03938C90889742C0FF66F6C21881D0115B01D9476D28A0D2
              38AF0D30E0F7AD733170AB09046E0202A3C84B81BCA652215BAEE57FCDB77336
              B056051EBA284E332013805711023EC81F6E02DF0376006FEB54E009302501BC
              86688E69826BF95D090C04B437D19CEBB802236C851A65E0952BA27B5A6038F0
              D153465BC76580F626E33A4D608EED5D071BA0D5C0A5886D96D8B2FB3E4872A7
              6D69FD6ACB704715C8F613CF806B065CF7B27D8794C8D410C97796816515F97D
              2470C29E7BE096D7599D56A0E84020B4D33AE06C8E424F81F536E92B5160AEE7
              6FFFFB772276C96E6B8B1ACE074DE045C0782BE4045EB550D64A275080B1F4EE
              9640AFDBD094EE918217B616FA9F88FB3920F53DE152AC1C927C2ED4F5478B5D
              7FB82B998BB269AA15AA1AF7D771E8BF7E70CC7485986AF826B497806AA3A41F
              1C4D009C8CA1FD4B991CAA8A06B60A5414D8E4D7B60A2487AAA281BF011AFBC8
              31367428550000000049454E44AE426082}
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
        Name = 'fiber_new'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000227494441546843ED99BB2F444114C6
              7FFB2FA875242A894E4B4121125110891A9544A512CF4A146AA226A1A0202211
              4429116AA2D2AA742AEED9CCC864DCC7DEB9B3EB4E32B7D9DD797EDFF9CE3973
              EE6C83C09F46E0F88904FE5BC1A8405D1518FA6F6019FBDFD9EDB60BAD038B40
              574D09BC00470936C1D97C4C0257C0684D81DBB04E806993C03CB01708780D73
              1638D40A1C03538111B804C634816F0BFC866732B2BE4BCAD6F3F4E79A85AB91
              47E037503C93715D4EF04402AED6F3312F2AE0C38A55D67052C02C29FE1CE380
              DD5F5482E8358AD615A2F61827023ABD7E003DC0A76542DD3F9C6C28E0EC746C
              0E977E1927CFAD0268B6D9EA9880255B5622208B1F0073211310ECE3C0854122
              4B013908D35C4EB7D90A88BB489B59DE7855E01918005E817EE04B6D964720EF
              20EC388149E05481DE0196432320C137012C29E023C0B511B45583B8ED2E2400
              1F817BE54A0FC06068042400458533A5C226B0AABEDB0AD42E883540C1BB6BB8
              924E4869046A15C4260101FDA45C298F40AB6954BF7BE834AA0F3B890B5D3E57
              3EC86C02F2FBC6380F5C83B8D5DAC83B01D9780B58C98881346066D9B06DA4E2
              2212FBC0826B29515474B9167302BA37294FBA0BD0BF036F6A8C532D54649D4E
              F647029DB476DA5E5181E01448BB8CCABAA02A33B68A2132EF8582BF5A0CFE72
              57640DFA7A5DFBA5A4AA99E44F84BE2A8EDAC6B9F24E72AECA8AE6362E37C66D
              C4577EE948A0BCCDFCCE880AF8B567F9D5A202E56DE677C60F65DEEC31AE9C6A
              CB0000000049454E44AE426082}
          end>
      end
      item
        Name = 'filter_alt'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000002C1494441546843ED984DA88E4114C7
              7F7741968AB29312E92A1BA594421461717D2C45B2F0B5C1821DB163810DD74A
              283B1F0B842464251F1B4AC9C2C64658FB58F0FCF5DC9A4EF3BC33F3CCBCDDDE
              9AB37A7BE69CFF39FF9973CE9C79C71871191BF1F8A904A6FB04EB098CCA09AC
              99A6409F85FC8652682330092C08010D69FD23701078D2853F88C06CE035B070
              48C1C5C28AC44AE087CF60108109E04EAC9721EBED046EA4125805BC187260B1
              F09B8007A904A47F1BD86A0CBFB67511EBDCEAFD05EF05AAEF071AEC79C64059
              B0AD4F0DC846C5FB08586C005454EBFB32E8B07BECC154FE6F003EF72520BBCD
              C03D0FC005E0482112E73AB0B600F707F908B5D129DB63C0190FD05EE04A2689
              3D1D18C781B321EC5802C2B906ECF200AE684EE955C851C7FAF2B655DBE5EBC0
              EE18CC1402738187809CBAF209580AFC8E71E8E8CC04DE37ED7191B17B03E802
              FD168397424078AB5B12B3523A4547203781ED66ED671BFCF398E0A5934A4036
              BADA2F7A1C9C064E463A3ED1F83EE5D13D045C8AC4F8AFD68780EC444044ACEC
              006E0502E8BAE115B80824495F024A21D58352CA953FC038A0BAF089E6AA0FC0
              0CB3A89451DE2B8592A42F013951318B848ADB95B79E429F5AD770689B808A55
              C1AB78932587809CA9ADAABD5AB90AA8BFBBA2FBC27ED3BADAA5DA662FC92520
              A7BAE074D159390A9C6F3F1E767EBB7ABAA87461F5961204E45CA386460E2BEB
              DA0FBE078946048D0A59528A80863D0D7DF6E5F6BD8D6E8E8952C39986340D6B
              59528A8082D0D8ADF13B46341E17792C9524A087FFD398E881B540F0C11E8355
              0938BB544F202665AC4E4DA19A427DF2C6B1A9295453A8A650E60E38E6FA97E1
              5724DCB2E641FF2E5277A05AC92296A3CBC0BE40609A81340B1591D204E603FB
              DBC9748989F04B336EEBA5F6B27956DE2D127DC6BF12A5FC67E3943E81EC8052
              012A81D41D2BAD5F4FA0F48EA6E28DFC09FC03583F6F3155184EC60000000049
              454E44AE426082}
          end>
      end
      item
        Name = 'filter_alt_off'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000002E9494441546843DD99CFAB4D5114C7
              3FAFFC4822444F5292C20025D28B081149243F0628038A943751181818323160
              26068A094529910903E50F1061224365606260C4F96A1D6DBB7DEFDEE79C7DEF
              B9C79EBCDE3DEBACBD3E7BFDD86B9F3D46C7C758C7EDE7BF03580ACC00DE77C5
              33AE07E6034F80D905C091AE409400D38107C03E5BF9775D812801F45700879C
              D009416C1D7268BD8ACDE786D01483381081B80A5C8C29CEF4FC13701978D84B
              9F5F85A619C4FE08C40DE05C262353D4EC025E84044365545548E1B43702711B
              3899327B069949E0662A80E4661AC49E08C43DE0580603632A3603AFAB004876
              96C59EDC578E50625F89CD6ECF7FC13F1BA7FEF7C71960A1F7E323E0606A0EF8
              7273CC133B2310890C7DC59E03EE6249F803B01BF8521740EFCD334F6C1F20C4
              35E042C04885F0B37ED8A9BDD002F384BB0FE4DAEC8E02F703469E2FBA82EB31
              D7A60248CFB8794209D52F276273BACFD71561F30698EABD74073895A2A80A80
              F42D324F6CCA0031D76AFB7ACF50016D4C315E325501F4CE62F3C4444388D03E
              F21DD852549DB7830490EE25E6890D3521D48AA825F1C7F11EF9D093A78E074A
              653A3BA847511C57C989C306EF1BA54A742975E54BB92600D2B1CC20D6264208
              56D08277C753AF7549E6680AA089969B516B22104A5AF5583B3CEB3E03AB811F
              C9563B823900A46EA541AC8A40084021E40E551C559E5A23178026D726F7D2B3
              22B4D9B910A78BD27CAB96E5F6D2A001344D2F88AF39CE14C300E805D164E1FF
              BE3B2C8081410C13602010C306C80ED106405688B600B241B4099005A26D80C6
              106D01A8A1735B8ADAC7D3B600B601677340B409A00FB77E7357D9136D032807
              1A418C024023889C002BEC4B5A4A93A6F3C3474FB096277202C81E9D07629720
              8A7D2571685486C80D202F9C007449A2557687BE733E2ECEC37703ABEFCA5582
              C80D90123E2932C910A30A909CD8A30C900431EA003E84BE5EE846489F62FE8C
              2E009410BACBD69DDC373789BA02209B05F0D3AF005D020856AFDF45B8B931F4
              B949000000000049454E44AE426082}
          end>
      end
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
        Name = 'link'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000210494441546843ED984B2B455114C7
              7F778A3211069432F4CA40C2803030F50D3C924C8C5046184A31309128E50B30
              321325034518280365A03C46062423EED2B9B5DB9D73F6D9F7DC433B7BD7E99E
              7BF77AFDD77FADFDB8391C1F39C7E3C703F86B063D039E819419F025943281A9
              D53D03A95398D2C0BF65A011A83724EF489BEF33C8DF03F2588DA40CB401FD40
              57F0D425F0A2DBFE4AA0230004F839700A5C98749200980056810A93316DBE18
              00AA894F600D988FF31B07A00AD807BA2D032F88A70550B073070C4695571480
              4AE0B5C8C04B0DA060AF0CF8D0638A0220B5D71E02E01DB801AE810703C0456D
              5EFFAEABD700ADC11356AE7BC0701200E2682124B8596017784EC98C49BD21F0
              3F1222380AECA8BFEB0C48D64F00A12B4ECE1444A9E6F5954BCA5A96E3ABA83A
              1DCBAFEFDB9A77412CC8FF62CC002B9AE34960330AC03230A728BC012DC56C30
              25422B7D21AB50B9626F1D988E0270000C29C2B299F4C40423FDD29B32D8E3BC
              7E5C839F011D8A8F4360200AC02350AB086FE49B76CA0020ACE16D302D19006C
              01E38AC1174098F9197A133B0FC0F91272BE899D5F469DDFC8A4B19D3E4A1456
              27A70F7302C2F9E3B48070FA42A3EEA4CE5E29551072A9EF049A81A6E0B3DA70
              5EB0BD523E0197C165E936782FC9A5DEE65CF3EBB249FE95F8F5A06C1C7A0036
              D9CA42D6339045566D6C7A066CB29585AC67208BACDAD8F40CD8642B0B59E719
              F80614A370317476AC0F0000000049454E44AE426082}
          end>
      end
      item
        Name = 'link_off'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000003EE494441546843ED984BCC4D5714C7
              7FD2C4A8031DA0C480480CBC220648181053130304F5AA57BDABF57EBFD5AB2A
              55F5A6412B24D2C6B0921A8988848A5444D31A340D893488C7D4F9CB395FB66D
              EDC755720FB1929BFB7D77AFB3D6FAEDB5F7DA6B9F56BCE5D2EA2D8F9FF700CD
              CEE03B9B8111C0E966CF6E8E7F2B03478089C028E0548E9166EAF800DB812F9D
              804603279B1960CAB70FB00658ED3D3406F82965A859E3D612B220C6023F362B
              C898DF5015B2203E014ED40D2256462D8871C0F13A41A4CE010B623C70AC2E10
              2900C56941A8CCFED0208465C7357107B80A5C036E0257CA4FD44D0AA013300F
              980BB4F62C4D028E36009102F04D3D01B6951318741303E85E1E643D22417E0A
              E8E0CB9146012A9BCAC410E081E5240490137C656F32703883E055012AD36D81
              7BBE1F0BA003F06BD10B5933FF14F8CB189B021C4A40082026ED81DEE5E74343
              F14211D7C01C80D04C2D2CABCFDDC0C69E0A1CCCC8444AA50BB0015007E0CB34
              E080FBA39F01CDFE65A0A3F764EE893DBD78767F2AC2CC711D9C7EB97E040C02
              7EAF6CE4F442AA34AA389658D9FA0CD89719644A4DED8B1A4A573E07768500CE
              1474C31D6D11F72ADAEBDB114F16C40C606F2ABA8CF1FEC0454F4FED8CB2F35C
              FC0CFC5BCC9E965125E6C671C6073BDDABFE766526F0BDF34368139F07F409C9
              75AF68DC2A1ACB6E1640D782EC4FCF8A6651B3191205FD5B647C16B0C71957AB
              EE83A8C6C70074A9D20DD1958F8BB8544C5EC84067E0EFD70C2073B381EFBC4C
              B8778E14C0666089179796D6251F40FF0B40209534B2845C1FFE729A03EC0E40
              A400D4FDEA3EE24A9BEA64F6F740751FAE947336B1B582AC8DAD7EEADBC8720B
              0D9D03863A83C13D50A5DB77122BA3B1782C88174A60068C6543854105E2B9F8
              19E85BAEAD0F3CE3A9AE35148B15C07CE09B8CE0B56F5A022DF51F02038A3726
              374200FA5DC6D542FBE2B61219FE5B542C882F809D01232A916A25FCCA23F58D
              C00AF7B9D0CCFE579C761F190E1E037F94978E7F12146EB9B420F4FAE66BC786
              74B4D6D52A58A2176D23FD8110C030E06C23D3ECE9AAAEABBAB862412C007638
              4ADAE82D6D82F3BB19BCB5075C87DA0FBF141DA66E658D8A05201B168496A65E
              A855A2AED66D08B5A4B56F4CC9D99CAA1C5B8C2B650C2A04108258545E1F2B9B
              EA75269407E0CF314739007ABE0FD00FE859F625FA6E17311C0308412C06B63A
              367558DD4FA53E172065E755C6ADE5B414F8AA1163CD0408656219A0FE274B9A
              0D1082585EECB94D390475000841E8C0D2C11595BA0084205696A77210A24E00
              218855C0FAFF730EA4B2F8BAC7ADEAA40BD03ACB51DD3250C56841AC2D065FBA
              57D715C05F4E66F052AA334005E17EBFB48AEA0E90DC5FEF019253F486159E01
              BA8AB231A699E7B70000000049454E44AE426082}
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
        Name = 'cancel'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000045A494441546843DD994BC856551486
              1F470D121CA4995D9C6B2828A4140935494428D02C4CA814BC444DAC0C1AA50E
              EDE2A0FBC454C2C0CBA08186821814DE8204ED322F29CD1482121A25AF9CF3B3
              BFC5DA7BAF73FEEF0CFE361C3E38DF5A6BBFEFD967EFB5D67BA631C5C7B4298E
              9F2108DC09CC482E3DA3BF92EB9F713EB471115800AC063602F756005E030E01
              C78053C0CDC9109A0C813B80178155C0133D4188CC11E043E0873E31FA1098D5
              005F0FCCEB33A9E3A35510890F805FBAC4EC4A40A07702F77799A483ED55E04D
              E0B3A84F1702DB81B702812F03BF02FAD5A53137B9660762EC00345F754409D4
              C07F0DEC03F6566784BB81E79AEBA1827D884484C016E0E3CC445F001F01DF06
              807B268F019B80B519FF97804F4AB16B04D600073301DE055EEF09DCBABD03BC
              9689F54C73ECBA7F970894C01783F624D56BBE1C011D95DF674E9BDAAAF5C43F
              E1F69F1340A7D312EF88CD81D906EC72022D05CE4F1661C55F40CF39366F036F
              D8FB1E0165D80B4E927AA5493636C6FCE6C64F1D8995FC5E6E925A1A52C94E0F
              7024637B04363B3B7F3FF082035020DA4DAE7D112511F1D3B1FCBC995327924E
              A689E1115091B5C2382E074E987B2D88079BFB3F021112513FD557C7CD9C379A
              843851D15A024A32DA30E9B8042C2C3CFD96804C6A242CF89ACF4540956E3A9E
              4D8F764B40B5CE1EE350CA885D0075B16D217815C0C8EB6C091C6EEAFA9483EA
              FBDF0B1B34022C62E34D3107F8CDFC711D98D9DEB304B409D31259AFD33D81D3
              A50450EEDAE85D5EB574CA2B802D00A703B7F78125F037A096B01DDF350924C0
              811C09F9F6052F5FE51D5BF4DDD7AE4C4AE02EE04F8354DDD2D311F48D8D4722
              75AF6D726F2AEFB5D63C3FDB1558D4940F6990DDC0AB1D08C83447A20F78C57B
              0FD86A303C0C9CFDDF11F05E21A9074A4ED131C42BA40340956A3ADC57480676
              139F011E09A21F6A139F06F4CAA4C3DDC432B0C7A87ADA070204863C46D55F5B
              11217B8C7ACB55ABFF23492A62937B4EB63F5062D30ADC1E169CD715A9BCC835
              EB5D8075B16DF14938B312CB4869630928454B2D4B871487C79DC7D30750571F
              498F6AFCD3A1C25205A6BB02BAF925F0A4715AE6280FD1B2D8728FFA3D0A7C63
              9C55D2ABB49F18D18646F289B49C1C18DD8FF402AD7FA4A139E0C82D92783EAD
              11C8B5943919658896D29359543AA85AF8B74640FFE79AFA21E414BBAA397945
              0DBD1AFB9131556415E5A3C5CE0153FC42E375672DFB21E4959C9CA23937E414
              EB5A922A89BA3999C5D9EBD55B9E8CD23A1545DE1A01052991507FAAEB6415A2
              6F20E5619D239F84C0CB2842407625855AFFAB6BFA1C783F40447DAEB4277D9A
              B28A43EA5E55A6BB10906D497C4D271EC7078EF069175D8116A048A8431AEA13
              93C8AB03541F121A5D0928E8101FF994A454B4A968B4B55891481F026DC0F633
              EB538E14197A7AC0574DED25E02319361A603204D2392449AE6C2E9516FAA897
              CA33B2958EA34FA86A9A8E36D71F51A039BB7111F0E2ABC716110D0197A236F6
              312481B183F5024E7902B700B3171340987A79AB0000000049454E44AE426082}
          end>
      end
      item
        Name = 'checked_circle'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000049E494441546843D5995BC8555510C7
              7F9F2F3E24F860DEBABD272414642805F9524460D0950ACB82CACCA2F2020952
              8914A415D11D4C2DA244EBC18794025128BA182894E57B8976B12048A127E5FF
              B1F7617DAB99B567EF73F6C319D81C387BD6ACF9AFCBCC7F664F30E63231E6FE
              D307800B8099C9A335FA2779CE8C72D14605E00AE036E021E0A20607FF04F600
              FB8083C0D961000D03603AB002B815B8A1A31302F329F02670AC8B8D2E006657
              8E3F005CDE6552638C764120DE007E6963B32D0039BD09B8A4CD242D747F079E
              017644C7B401F01CF06CC0F009E05740BF7A249725CFDC808DE701CDD7285100
              4DCE1F02DE077636CE0873807BAAE7EA827E084404C04AE06D67A28F81B780AF
              028E5B2AD7030F03773BE31F05DE29D96E027007B0DB31F032B0B6A3E3F9B0AD
              C01AC7D69D55D8355F9700949C2F1AED08AAD37C1E0085CA234EB469DAB58EFE
              0F869D330C283A2DB242ACE7CC3AE025C3D035C0E1613D6C182F47BF3374B600
              EBF3FF2D00CAB0478D24B5BA4A363DFB3F69FEB12AA9A57329D96901A7646C0B
              C023C6CDFF00B8BF27CF17003F1BB61596EFCBFE574452641A88054024EBA66C
              E08DC0173D00D808DC052828E420C4AF3ECFE6FCBB4A8803469B035092D18549
              E54760610FCE8B32BC50D9FDC901F10320A69B8A000F427B0E405C677B362094
              115B02B4828405C26200538E730EE0938AD7A7FE88DF9F6AE96049FD29E01547
              410E6BC16A990F9CCC74FF022EACFFCB01E81CA61459C769DE089D7F0278CDB1
              A7FBB0D978F71B9013C019C0E43DC801FC0BA824ACE5FB2A817818943D555D45
              6455210C6F005E748C28EFE4A4EFE27A675200B380D39911554BB73B86EBD41F
              A115226CEF3A76949C94A43CB18EB542EFF17C07AEACE8436AE855E069C372CE
              5B4A201E04DE73BC1381F3EE433D44EF756F52590C7CDB158047BA2C104A444A
              48963C59B80FA97E1880758474BEE5582A51D6782FF0A1E3FCE30655F08E9062
              BEE64CC53C4252C82FF137C092C0114A5504781AB0CBF1483C47455054BE0674
              6452312FB114F230AA9AF65267A6D24E78CEA9BAF32EB33746F575DE4470C3A8
              B55D5D8B9EDC2135BDB645973DD1CBEB032536EDC0A4E4CE59AB2A7A512AD623
              3BA148146E9524CEAB71968F9B426D72004AD1EA96A5A28EC3D286952B819013
              5E246ADA10B51E55F8A72262298269EE80FEDC0B2CCB065D17E83C5820961722
              5193F3D7025F664AA2F4A2F6038916346A9FA897D3242908E96B5C57F9C868B7
              FC2F08B42929A36D1481905DAF1D130164B559441DC416FE6BDA01BDF78AFA08
              EF893858D2F1EE93C999C6A5ADA27C749511608A5F68ACEAAC5EB93EDA2B5E3B
              4573BA61B8A949556AEA8EB2CD62B551EAC52A96B44D0064A40442F5A99E031D
              0FBE3A0F227D79FB24E4BC942200A457EA50EBBDAA2631CFD7034054E7AAF7A4
              4F5379C7211DDED8996E0340BA11CA20BD517CE00847BBE80ED42B23102A30FA
              FAC424F0AA00A37576F808A55BDBC7473E2529913691C69C8B154F65DB1D488D
              D59F596F315A9181AB30A9B2BFE25E727C4A868D1A1806403A875A9237578FCA
              3D7DD44BDB33D2551F479F5055347D563D7F441DF5F44605C0B2AF1A5B402472
              5C1DB5914B9F0046EEAC6570EC019C0759CEE931C28834D00000000049454E44
              AE426082}
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
        Name = 'BatchPrint'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE9000001BA494441546843ED57C151C4300CDC
              EB002A810E800E68810A800A800A0E3AA0034A003A804AA003989DB1199D51E2
              93621392915E993B59DAD5AE1D678385C766E1F81104E656301458A2025F9D41
              9B5C614A4EC083404541D3504DC98A029EF51A7EA9AAA9A62939080C7B2714B0
              9C8CEE698D3471D75CFD1E38007004E018009F19B76292F2D9A26299ABD5FC04
              F006E01D009FD51853E0A6003B05E0D4B52478A7151922F00CE0746AD7C6EB5F
              009C953535025700B622911272F1A08C8D81E672B42C87480BE7B806702FFB69
              0408F6242551B6563EF7F2647FDA99F15A3A4323F02136ECE11F4F9E53BF4C3D
              1F1268FE464C0CBA80987E4223E03E93BD2316EBA47D2F003CA6FF0631FD3702
              E7009E12686E58DA99B1180204CB770E83EF801C8B22A0393108C8A9E423ADC1
              9E554B686FDCA60ACCF14D1C04A4D6721AEA05CBE12D694BD3D15E4BCEE7B0C4
              242F799EEF89DA2963EA5923501B660F02A69EAB2450FB0EE0B7428E1E0AFCBA
              F31792EC58CC03A0C765CF5D3308D476DC9EFF87027B0E6AFC6E6E2952E4CEA6
              C004CC834B4DFBD2949C5ACE71996BC3762D047AD8C65DD3632177B31E0B8340
              8FA95A6A86029669F5C8FD06433F5C313B573EE40000000049454E44AE426082}
          end>
      end>
    Left = 472
    Top = 290
  end
  object VirtualImageList1: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'bubble'
        Name = 'bubble'
      end
      item
        CollectionIndex = 2
        CollectionName = 'arrow_drop_down_circle'
        Name = 'arrow_drop_down_circle'
      end
      item
        CollectionIndex = 4
        CollectionName = 'filter_alt'
        Name = 'filter_alt'
      end
      item
        CollectionIndex = 6
        CollectionName = 'search'
        Name = 'search'
      end
      item
        CollectionIndex = 9
        CollectionName = 'Sync'
        Name = 'Sync'
      end
      item
        CollectionIndex = 14
        CollectionName = 'archive'
        Name = 'archive'
      end
      item
        CollectionIndex = 15
        CollectionName = 'unarchive'
        Name = 'unarchive'
      end
      item
        CollectionIndex = 16
        CollectionName = 'toggle_off'
        Name = 'toggle_off'
      end
      item
        CollectionIndex = 17
        CollectionName = 'toggle_on'
        Name = 'toggle_on'
      end
      item
        CollectionIndex = 1
        CollectionName = 'pin'
        Name = 'pin'
      end
      item
        CollectionIndex = 18
        CollectionName = 'keep'
        Name = 'keep'
      end
      item
        CollectionIndex = 19
        CollectionName = 'keep_off'
        Name = 'keep_off'
      end
      item
        CollectionIndex = 20
        CollectionName = 'BatchPrint'
        Name = 'BatchPrint'
      end>
    ImageCollection = ImageCollection1
    Width = 32
    Height = 32
    Left = 592
    Top = 290
  end
  object actnmanCustomer: TActionManager
    Left = 348
    Top = 290
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
