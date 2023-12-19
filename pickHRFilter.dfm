object HRFilter: THRFilter
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'HRFilter'
  ClientHeight = 198
  ClientWidth = 221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 21
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 0
    Width = 221
    Height = 157
    Align = alClient
    ItemHeight = 21
    Items.Strings = (
      'Hide Archived'
      'Hide Customer Contacts'
      'Hide FES Staff'
      'Hide Suppliers'
      'Hide Site Contacts')
    TabOrder = 0
    ExplicitWidth = 246
    ExplicitHeight = 352
  end
  object Panel1: TPanel
    Left = 0
    Top = 157
    Width = 221
    Height = 41
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 352
    ExplicitWidth = 246
    object btnOk: TButton
      Left = 73
      Top = 7
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
    end
  end
end
