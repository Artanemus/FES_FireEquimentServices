object FindInspectOrders: TFindInspectOrders
  Left = 0
  Top = 0
  Caption = 'Find Inspection Order'
  ClientHeight = 847
  ClientWidth = 1502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1502
    Height = 145
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object Label5: TLabel
      Left = 505
      Top = 74
      Width = 70
      Height = 42
      Alignment = taCenter
      Caption = 'FILTER BY STATUS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object SpeedButton4: TSpeedButton
      Left = 581
      Top = 70
      Width = 42
      Height = 46
      ImageIndex = 5
      ImageName = 'arrow_drop_down_circle'
      Images = VirtualImageList1
    end
    object SpeedButton11: TSpeedButton
      Left = 629
      Top = 70
      Width = 42
      Height = 46
      ImageIndex = 0
      ImageName = 'filter_alt_off'
      Images = VirtualImageList1
    end
    object Label7: TLabel
      Left = 24
      Top = 60
      Width = 32
      Height = 21
      Caption = 'Start'
    end
    object Label8: TLabel
      Left = 30
      Top = 95
      Width = 26
      Height = 21
      Caption = 'End'
    end
    object Label10: TLabel
      Left = 292
      Top = 95
      Width = 121
      Height = 21
      Caption = '(Default is today.)'
    end
    object SpeedButton1: TSpeedButton
      Left = 254
      Top = 91
      Width = 32
      Height = 32
      ImageIndex = 2
      ImageName = 'backspace'
      Images = VirtualImageList1
      Flat = True
    end
    object SpeedButton2: TSpeedButton
      Left = 62
      Top = 8
      Width = 186
      Height = 42
      Caption = 'Current Month'
      ImageIndex = 6
      ImageName = 'calendar_month'
      Images = VirtualImageList1
    end
    object SpeedButton3: TSpeedButton
      Left = 254
      Top = 56
      Width = 32
      Height = 32
      ImageIndex = 2
      ImageName = 'backspace'
      Images = VirtualImageList1
      Flat = True
    end
    object Label1: TLabel
      Left = 1049
      Top = 25
      Width = 113
      Height = 21
      Alignment = taRightJustify
      Caption = 'Company Name'
    end
    object Label2: TLabel
      Left = 1076
      Top = 60
      Width = 86
      Height = 21
      Alignment = taRightJustify
      Caption = 'Site Address'
    end
    object Label4: TLabel
      Left = 1081
      Top = 95
      Width = 81
      Height = 21
      Alignment = taRightJustify
      Caption = 'Site Suburb'
    end
    object VirtualImage1: TVirtualImage
      Left = 999
      Top = 22
      Width = 32
      Height = 32
      ImageCollection = ImageCollection1
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 4
      ImageName = 'search'
    end
    object Bevel1: TBevel
      Left = 992
      Top = 10
      Width = 481
      Height = 123
    end
    object DateTimePicker3: TDateTimePicker
      Left = 62
      Top = 56
      Width = 186
      Height = 29
      Date = 45277.000000000000000000
      Time = 0.478517812502104800
      TabOrder = 0
    end
    object DateTimePicker4: TDateTimePicker
      Left = 62
      Top = 91
      Width = 186
      Height = 29
      Date = 45277.000000000000000000
      Time = 0.478517812502104800
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 1168
      Top = 22
      Width = 289
      Height = 29
      TabOrder = 2
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 1168
      Top = 57
      Width = 289
      Height = 29
      TabOrder = 3
      Text = 'Edit1'
    end
    object Edit3: TEdit
      Left = 1168
      Top = 92
      Width = 289
      Height = 29
      TabOrder = 4
      Text = 'Edit1'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 790
    Width = 1502
    Height = 57
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 796
    DesignSize = (
      1502
      55)
    object sbtnGotoCustomer: TSpeedButton
      Left = 967
      Top = 4
      Width = 217
      Height = 38
      Caption = 'Goto Customer'
      ImageIndex = 7
      ImageName = 'bubble'
      Images = VirtualImageList1
      Margin = 10
    end
    object sbtnGotoSite: TSpeedButton
      Left = 744
      Top = 4
      Width = 217
      Height = 38
      Caption = 'Goto Site'
      ImageIndex = 7
      ImageName = 'bubble'
      Images = VirtualImageList1
      Margin = 10
    end
    object sbtnGotoInspectOrder: TSpeedButton
      Left = 1190
      Top = 4
      Width = 217
      Height = 38
      Caption = 'Goto Inspection Order'
      ImageIndex = 7
      ImageName = 'bubble'
      Images = VirtualImageList1
      Margin = 10
    end
    object btnClose: TButton
      Left = 1413
      Top = 4
      Width = 75
      Height = 37
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Close'
      ModalResult = 2
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 145
    Width = 1502
    Height = 645
    Align = alClient
    DataSource = dsFindInspectOrder
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'InspectionOrderID'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LinkStatus'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Caption'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ServiceInterval'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustomerID'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Address'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SiteID'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'xAddress'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Suburb'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IsEnabled'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RequestedDT'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CompletedDT'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'InspectionStatusID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PostcodeID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CreatedOn'
        Visible = False
      end>
  end
  object ImageCollection1: TImageCollection
    Images = <
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
        Name = 'open_in_browser'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE90000019E494441546843ED99414E03310C45
              7F4F4325B8011B7A04167004903801ACA02B3801121C01161C0136DC0024380D
              6075228D527B12878E3D05CFA6522799FCE7EFC69D78862DBF665BAE1F01E0ED
              E09F77E00EC03E805DA748BF037805702AAD3FE4C0979368955609E01AC0F9C4
              006E005CE49A24800F003B1303F80430AF05985AFA24DD6B01971C088091D2EF
              FF3AB0FC89E8D54851951E4BEB5D66379B1D088006F7C2817ED0228522855611
              885D489B090FDD8463EDC4AEEEB8D601127FD4097F04A08570DD46FBE253F0B5
              106E009CF81608178021F15A0873801AF11A0853008DF85A08338016F1351026
              009278DA71D216DA179B7F47F7A4DDC90D8004DD0278CE8AD702C09900C6D508
              1300D2C815AC0301E04518CF156A338004419F29924300DC7877805C4009A0E6
              AF91A90301C058120EFCE69D7892BF810444E7A6D2996A3AFC2A01D41E9235BF
              D0BC357665125809808A1C8DD15CD4ADD9CB274891A4D6D289E6E9DDD83101EE
              B956D3A65B4C6302B05A4B5D4A6A351D2ABA359B06A0AECC13D75A4AD9510268
              C822DB2901601BEFF5D5C2016F07BE014ADB9D31739892E60000000049454E44
              AE426082}
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
        Name = 'calendar_today'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000142494441546843ED59C10DC2300C3C
              A6010936E0C30A2C012BC00B78C10AB0042BF0610390601AC012852A24A8BD58
              2A45975755C58ECF393B69AF83968F4ECBE307036014017D201391ED8B01B004
              B02805BC7A3CDB3B6664FB1200003FBD035B0043007D861F0E3667004700D394
              AF6F14BA3904E0E9221A6B0AC01AC0CC7375075F1B00F3D04F0AC00540D76151
              4F175700BDAA0042FA58A13631CAEDDAD6FF48786A076200D85ECF020FCF0801
              D00ED4E49228544E987521F6C65933F1AFE9765375EB426C10DE76741BF50E84
              F54703D04146A45C5D28EC423AC86AD2481412856A52269C2E0A8942A290E36D
              34E7EF1BBB112A621531CB9DA79D28240A89423A07DE1C68DD47FDA941592955
              3A26370DAAEA03A68D4D328BD0DB7C17D3CAFE56232BB2675AD9B841B9C964A5
              7D4C1B2B0264846E6F6A64F91380ACF43918DF0115AF7431CB1714DC00000000
              49454E44AE426082}
          end>
      end
      item
        Name = 'calendar_month'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
              87000000017352474200AECE1CE900000182494441546843ED59C15103310CDC
              54033349077C688126A005F282BC9216A0095AE043076126A906D0E33237C28E
              F14A9ACB31F2EBE66CC9BBB2BCF69D1698795BCC1C3F1802B705D2EF6420CCBE
              1802CF009E4680373FCFF28E69665F4900C045AFC00B801B004B263F1C6C3E01
              7C0078A8F93A97425F0E003C5D14B1D6086C013C7ACEEEE06B0760ADFDD4081C
              005C394CEAE9E208E0FAAF0474FAC8469DA28DE55AE6FF15F0DA0A9408B05ACF
              12D7674412C815E8CCA54CA171C04485D81B6767E04FC3E5A6EAA6422C086F3B
              5A46BD81B0FE6802799011214F15D22A940759671A85A79068F4B02AA5CF4A6B
              7F38017D63D51267ED4F02AD4D3C8E903CEBB3C2B37FC0623AC852852E4D853A
              F1740F0FDFC4DD883A0DC2095875BE651F4EC0AAF32DFB2490E740E7A6D5C3C3
              53C888AF699E045A7BA01942E300F71530E2A1CCE9FF42FB09CB4A35A6526E5A
              E9CEDAEF75A98DDD53318B337A2DD5CAFE6D8D6C88A3D4CAEE262C374959E9AD
              541BAB7EE1C465408C67A6521F8384F43A7B02DF9AF798313A2F628100000000
              49454E44AE426082}
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
      end>
    Left = 198
    Top = 512
  end
  object VirtualImageList1: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'filter_alt_off'
        Name = 'filter_alt_off'
      end
      item
        CollectionIndex = 1
        CollectionName = 'filter_alt'
        Name = 'filter_alt'
      end
      item
        CollectionIndex = 2
        CollectionName = 'backspace'
        Name = 'backspace'
      end
      item
        CollectionIndex = 3
        CollectionName = 'open_in_browser'
        Name = 'open_in_browser'
      end
      item
        CollectionIndex = 4
        CollectionName = 'search'
        Name = 'search'
      end
      item
        CollectionIndex = 5
        CollectionName = 'arrow_drop_down_circle'
        Name = 'arrow_drop_down_circle'
      end
      item
        CollectionIndex = 7
        CollectionName = 'calendar_month'
        Name = 'calendar_month'
      end
      item
        CollectionIndex = 8
        CollectionName = 'bubble'
        Name = 'bubble'
      end>
    ImageCollection = ImageCollection1
    Width = 32
    Height = 32
    Left = 198
    Top = 576
  end
  object qryFindInspectOrder: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Active = True
    Connection = FES.fesConnection
    SQL.Strings = (
      'USE IDFES'
      ';'
      ''
      'SELECT dbo.InspectionOrder.InspectionOrderID,'
      '       dbo.CustSite.CustomerID,'
      '       dbo.CustSite.SiteID,'
      '       dbo.CustSite.IsEnabled,'
      '       dbo.InspectionOrder.RequestedDT,'
      '       dbo.InspectionOrder.CompletedDT,'
      '       dbo.Customer.CustName,'
      '       dbo.InspectionStatus.Caption,'
      '       dbo.Site.[Address],'
      '       dbo.InspectionOrder.InspectionStatusID,'
      '       dbo.Site.PostcodeID,'
      '       dbo.Postcode.Suburb,'
      '       -- Human reable label for grid'
      '       CASE dbo.CustSite.IsEnabled'
      '           WHEN 1 THEN'
      '               '#39'ENABLED'#39
      '           ELSE'
      '               '#39'DISABLED'#39
      '       END AS LinkStatus,'
      
        '       -- Field address is a Memo type. What'#39's needed is a singl' +
        'e line without line feeds and carriage returns.'
      
        '       REPLACE(REPLACE([Address], CHAR(10), '#39#39'), CHAR(13), '#39#39') A' +
        'S xAddress,'
      '       dbo.InspectionOrder.CreatedOn,'
      '       dbo.InspectionOrder.ServiceInterval'
      'FROM dbo.InspectionOrder'
      '    LEFT JOIN dbo.InspectionStatus'
      
        '        ON dbo.InspectionOrder.InspectionStatusID = dbo.Inspecti' +
        'onStatus.InspectionStatusID'
      '    LEFT JOIN dbo.CustSite'
      
        '        ON dbo.InspectionOrder.CustSiteID = dbo.CustSite.CustSit' +
        'eID'
      '    LEFT JOIN dbo.Site'
      '        ON dbo.CustSite.SiteID = dbo.Site.SiteID'
      '    LEFT JOIN dbo.Postcode'
      '        ON dbo.Site.PostcodeID = dbo.Postcode.PostcodeID'
      '    LEFT JOIN dbo.Customer'
      '        ON dbo.CustSite.CustomerID = dbo.Customer.CustomerID'
      'ORDER BY dbo.InspectionOrder.RequestedDT DESC;'
      ''
      ''
      ''
      '')
    Left = 280
    Top = 232
    object qryFindInspectOrderInspectionOrderID: TFDAutoIncField
      DisplayLabel = 'Order#'
      DisplayWidth = 6
      FieldName = 'InspectionOrderID'
      Origin = 'InspectionOrderID'
      ReadOnly = True
    end
    object qryFindInspectOrderCustomerID: TIntegerField
      DisplayLabel = 'Cust#'
      DisplayWidth = 6
      FieldName = 'CustomerID'
      Origin = 'CustomerID'
    end
    object qryFindInspectOrderSiteID: TIntegerField
      DisplayLabel = 'Site#'
      DisplayWidth = 6
      FieldName = 'SiteID'
      Origin = 'SiteID'
    end
    object qryFindInspectOrderIsEnabled: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'Link On'
      FieldName = 'IsEnabled'
      Origin = 'IsEnabled'
    end
    object qryFindInspectOrderLinkStatus: TStringField
      Alignment = taCenter
      DisplayLabel = 'Link On'
      DisplayWidth = 9
      FieldName = 'LinkStatus'
      Origin = 'LinkStatus'
      ReadOnly = True
      Required = True
      Size = 8
    end
    object qryFindInspectOrderRequestedDT: TSQLTimeStampField
      DisplayLabel = 'Requested DT'
      DisplayWidth = 13
      FieldName = 'RequestedDT'
      Origin = 'RequestedDT'
      DisplayFormat = 'dd/mm/yy HH:NN'
    end
    object qryFindInspectOrderCompletedDT: TSQLTimeStampField
      DisplayLabel = 'Completed DT'
      DisplayWidth = 13
      FieldName = 'CompletedDT'
      Origin = 'CompletedDT'
      DisplayFormat = 'dd/mm/yy HH:NN'
    end
    object qryFindInspectOrderCustName: TWideStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 50
      FieldName = 'CustName'
      Origin = 'CustName'
      Size = 64
    end
    object qryFindInspectOrderCaption: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Status'
      DisplayWidth = 12
      FieldName = 'Caption'
      Origin = 'Caption'
      Size = 50
    end
    object qryFindInspectOrderAddress: TWideStringField
      DisplayLabel = 'Customer Address'
      DisplayWidth = 30
      FieldName = 'Address'
      Origin = 'Address'
      Size = 256
    end
    object qryFindInspectOrderInspectionStatusID: TIntegerField
      FieldName = 'InspectionStatusID'
      Origin = 'InspectionStatusID'
    end
    object qryFindInspectOrderPostcodeID: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Postcode'
      DisplayWidth = 6
      FieldName = 'PostcodeID'
      Origin = 'PostcodeID'
    end
    object qryFindInspectOrderSuburb: TWideStringField
      DisplayWidth = 18
      FieldName = 'Suburb'
      Origin = 'Suburb'
      Size = 50
    end
    object qryFindInspectOrderxAddress: TWideStringField
      DisplayLabel = 'Site Address'
      DisplayWidth = 30
      FieldName = 'xAddress'
      Origin = 'xAddress'
      ReadOnly = True
      Size = 4000
    end
    object qryFindInspectOrderCreatedOn: TSQLTimeStampField
      DisplayLabel = 'Created On'
      DisplayWidth = 13
      FieldName = 'CreatedOn'
      Origin = 'CreatedOn'
      DisplayFormat = 'dd/mm/yy HH:NN'
    end
    object qryFindInspectOrderServiceInterval: TFloatField
      Alignment = taCenter
      DisplayLabel = 'S.I.'
      DisplayWidth = 3
      FieldName = 'ServiceInterval'
      Origin = 'ServiceInterval'
    end
  end
  object dsFindInspectOrder: TDataSource
    DataSet = qryFindInspectOrder
    Left = 400
    Top = 232
  end
end
