object FESCustInspect: TFESCustInspect
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
        Control = btnTogglePinVisibility
        HorizontalPositioning = sphpLeft
        VerticalPositioning = spvpFill
      end
      item
        Control = btnClipboard
        HorizontalPositioning = sphpLeft
        VerticalPositioning = spvpFill
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
      ImageCollection = imgcollCustInspect
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 9
      ImageName = 'VisibilityOn'
      ParentShowHint = False
      ShowHint = True
    end
    object btnClipboard: TVirtualImage
      Left = 74
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = imgcollCustInspect
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 10
      ImageName = 'content_paste'
      ParentShowHint = False
      ShowHint = True
    end
    object btnNew: TVirtualImage
      Left = 114
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = imgcollCustInspect
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 4
      ImageName = 'New'
      ParentShowHint = False
      ShowHint = True
    end
    object btnDelete: TVirtualImage
      Left = 154
      Top = 0
      Width = 32
      Height = 32
      Hint = 'Toggle visibility of un-pinned items.'
      ImageCollection = imgcollCustInspect
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 3
      ImageName = 'Delete'
      ParentShowHint = False
      ShowHint = True
    end
  end
  object ctrllistCustInspect: TControlList
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
    ItemCount = 1
    ItemHeight = 80
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    OnBeforeDrawItem = ctrllistCustInspectBeforeDrawItem
    object lblInspectAddress: TLabel
      AlignWithMargins = True
      Left = 130
      Top = 3
      Width = 368
      Height = 74
      Margins.Left = 130
      Align = alClient
      Caption = '66 Learoyd Road ACACIA RIDGE, QLD 4110'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      StyleElements = [seClient, seBorder]
      ExplicitWidth = 319
      ExplicitHeight = 21
    end
    object lblInspectTech: TLabel
      Left = 7
      Top = 4
      Width = 44
      Height = 21
      Caption = 'TECH: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblInspectStatus: TLabel
      AlignWithMargins = True
      Left = 504
      Top = 3
      Width = 44
      Height = 74
      Margins.Right = 4
      Align = alRight
      Caption = 'Action'
      Layout = tlCenter
      ExplicitLeft = 543
      ExplicitHeight = 21
    end
    object lblInspectRequestedDT: TLabel
      Left = 11
      Top = 44
      Width = 107
      Height = 17
      Caption = 'REQU: 2021-06-30'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
    object lblInspectCompletedDT: TLabel
      Left = 7
      Top = 60
      Width = 44
      Height = 17
      Caption = 'COMP: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnPinInspect: TControlListButton
      AlignWithMargins = True
      Left = 555
      Top = 3
      Width = 32
      Height = 74
      Margins.Right = 4
      Align = alRight
      Images = vimglistCustInspect
      ImageIndex = 0
      ImageName = 'pin'
      LinkHotColor = clHighlight
      Style = clbkToolButton
      ExplicitLeft = 576
      ExplicitTop = 4
    end
    object btnEditInspect: TControlListButton
      AlignWithMargins = True
      Left = 594
      Top = 3
      Width = 32
      Height = 74
      Margins.Right = 10
      Align = alRight
      Images = vimglistCustInspect
      ImageIndex = 2
      ImageName = 'Edit'
      LinkHotColor = clHighlight
      Style = clbkToolButton
      ExplicitLeft = 593
      ExplicitTop = 4
      ExplicitHeight = 32
    end
  end
  object imgcollCustInspect: TImageCollection
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
      end>
    Left = 312
    Top = 152
  end
  object vimglistCustInspect: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'pin'
        Name = 'pin'
      end
      item
        CollectionIndex = 1
        CollectionName = 'unpin'
        Name = 'unpin'
      end
      item
        CollectionIndex = 2
        CollectionName = 'Edit'
        Name = 'Edit'
      end
      item
        CollectionIndex = 3
        CollectionName = 'Delete'
        Name = 'Delete'
      end
      item
        CollectionIndex = 4
        CollectionName = 'New'
        Name = 'New'
      end
      item
        CollectionIndex = 5
        CollectionName = 'filter_alt'
        Name = 'filter_alt'
      end
      item
        CollectionIndex = 6
        CollectionName = 'filter_alt_off'
        Name = 'filter_alt_off'
      end
      item
        CollectionIndex = 7
        CollectionName = 'Refresh'
        Name = 'Refresh'
      end>
    ImageCollection = imgcollCustInspect
    Width = 32
    Height = 32
    Left = 312
    Top = 208
  end
  object pumenuCustInspect: TPopupMenu
    Images = vimglistCustInspect
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
  object bindlistCustInspect: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 120
    Top = 160
    object LinkGridToDataSource1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      GridControl = ctrllistCustInspect
      Columns = <>
    end
    object LinkPropertyToField1: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      FieldName = 'FNAME'
      Component = lblInspectTech
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField2: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      FieldName = 'SiteAddrStr'
      Component = lblInspectAddress
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField3: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      FieldName = 'InspectStatusStr'
      Component = lblInspectStatus
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField5: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      FieldName = 'BookINstr'
      Component = lblInspectRequestedDT
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToField6: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = bindsrcCustInspect
      FieldName = 'BookOUTstr'
      Component = lblInspectCompletedDT
      ComponentProperty = 'Caption'
    end
  end
  object bindsrcCustInspect: TBindSourceDB
    DataSet = CustomerData.qryCustInspect
    ScopeMappings = <>
    Left = 112
    Top = 240
  end
end