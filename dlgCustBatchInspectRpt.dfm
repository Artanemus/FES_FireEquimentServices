object CustBatchInspectRpt: TCustBatchInspectRpt
  Left = 0
  Top = 0
  Caption = 'Customer Batch Inspection Report'
  ClientHeight = 694
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 21
  object Label2: TLabel
    Left = 24
    Top = 23
    Width = 68
    Height = 21
    Alignment = taRightJustify
    Caption = 'Customer'
  end
  object Label3: TLabel
    Left = 98
    Top = 55
    Width = 171
    Height = 21
    Caption = '(Default is all customers)'
  end
  object Label6: TLabel
    Left = 223
    Top = 229
    Width = 182
    Height = 21
    Caption = '(Default is current month.)'
  end
  object Label7: TLabel
    Left = 128
    Top = 323
    Width = 32
    Height = 21
    Caption = 'Start'
  end
  object Label8: TLabel
    Left = 128
    Top = 358
    Width = 26
    Height = 21
    Caption = 'End'
  end
  object Label9: TLabel
    Left = 400
    Top = 323
    Width = 73
    Height = 21
    Caption = '(Required)'
  end
  object Label10: TLabel
    Left = 400
    Top = 358
    Width = 121
    Height = 21
    Caption = '(Default is today.)'
  end
  object Label11: TLabel
    Left = 16
    Top = 439
    Width = 117
    Height = 21
    Caption = 'Output Directory'
  end
  object Label12: TLabel
    Left = 167
    Top = 541
    Width = 353
    Height = 21
    Caption = '(A draft email + attachments is created in Outlook.)'
  end
  object Label5: TLabel
    Left = 65
    Top = 91
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
    Left = 141
    Top = 87
    Width = 42
    Height = 46
    ImageIndex = 5
    ImageName = 'arrow_drop_down_circle'
    Images = VirtualImageList1
  end
  object SpeedButton11: TSpeedButton
    Left = 189
    Top = 87
    Width = 42
    Height = 46
    ImageIndex = 0
    ImageName = 'filter_alt_off'
    Images = VirtualImageList1
  end
  object SpeedButton1: TSpeedButton
    Left = 423
    Top = 194
    Width = 32
    Height = 32
    ImageIndex = 2
    ImageName = 'backspace'
    Images = VirtualImageList1
    Flat = True
  end
  object SpeedButton2: TSpeedButton
    Left = 359
    Top = 355
    Width = 32
    Height = 32
    ImageIndex = 2
    ImageName = 'backspace'
    Images = VirtualImageList1
    Flat = True
  end
  object SpeedButton3: TSpeedButton
    Left = 527
    Top = 20
    Width = 32
    Height = 32
    ImageIndex = 2
    ImageName = 'backspace'
    Images = VirtualImageList1
    Flat = True
  end
  object RadioGroup1: TRadioGroup
    Left = 32
    Top = 155
    Width = 553
    Height = 254
    Caption = 'Select Date Range'
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 645
    Width = 626
    Height = 49
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 642
    ExplicitWidth = 624
    object Button5: TButton
      Left = 228
      Top = 10
      Width = 75
      Height = 28
      Caption = 'Cancel'
      TabOrder = 0
    end
    object Button6: TButton
      Left = 323
      Top = 10
      Width = 75
      Height = 28
      Caption = 'OK'
      TabOrder = 1
    end
  end
  object DBComboBox1: TDBComboBox
    Left = 98
    Top = 20
    Width = 423
    Height = 29
    TabOrder = 1
  end
  object Button1: TButton
    Left = 567
    Top = 18
    Width = 34
    Height = 34
    ImageIndex = 4
    ImageName = 'search'
    Images = VirtualImageList1
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 65
    Top = 200
    Width = 152
    Height = 17
    Caption = 'A month this year'
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 223
    Top = 194
    Width = 194
    Height = 29
    TabOrder = 5
    Text = 'ComboBox1'
  end
  object RadioButton2: TRadioButton
    Left = 65
    Top = 288
    Width = 203
    Height = 17
    Caption = 'Specify a date range'
    TabOrder = 6
  end
  object Edit3: TEdit
    Left = 16
    Top = 466
    Width = 585
    Height = 29
    TabOrder = 7
    Text = 'Edit3'
  end
  object Button4: TButton
    Left = 480
    Top = 501
    Width = 121
    Height = 34
    Caption = 'Browse'
    ImageIndex = 3
    ImageName = 'open_in_browser'
    Images = VirtualImageList1
    TabOrder = 8
  end
  object CheckBox1: TCheckBox
    Left = 32
    Top = 544
    Width = 120
    Height = 17
    Caption = 'Enable EMAIL.'
    TabOrder = 9
  end
  object CheckBox2: TCheckBox
    Left = 32
    Top = 576
    Width = 321
    Height = 17
    Caption = 'Inspection order must contain test results.'
    TabOrder = 10
  end
  object CheckBox3: TCheckBox
    Left = 32
    Top = 608
    Width = 193
    Height = 17
    Caption = 'Group on year / month.'
    Checked = True
    State = cbChecked
    TabOrder = 11
  end
  object DateTimePicker1: TDateTimePicker
    Left = 166
    Top = 319
    Width = 186
    Height = 29
    Date = 45277.000000000000000000
    Time = 0.478517812502104800
    TabOrder = 12
  end
  object DateTimePicker2: TDateTimePicker
    Left = 167
    Top = 355
    Width = 186
    Height = 29
    Date = 45277.000000000000000000
    Time = 0.478517812502104800
    TabOrder = 13
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
      end>
    Left = 334
    Top = 72
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
      end>
    ImageCollection = ImageCollection1
    Width = 32
    Height = 32
    Left = 446
    Top = 72
  end
end
