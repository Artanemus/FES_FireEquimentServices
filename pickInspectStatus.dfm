object InspectStatus: TInspectStatus
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Pick Inspection Status'
  ClientHeight = 257
  ClientWidth = 165
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 21
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 0
    Width = 165
    Height = 216
    Align = alClient
    ItemHeight = 21
    Items.Strings = (
      'Action'
      'Completed'
      'Cancelled')
    TabOrder = 0
    ExplicitWidth = 246
    ExplicitHeight = 352
  end
  object Panel1: TPanel
    Left = 0
    Top = 216
    Width = 165
    Height = 41
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 352
    ExplicitWidth = 246
    object btnOk: TButton
      Left = 45
      Top = 7
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object qryInspectionStatus: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Active = True
    Connection = FES.fesConnection
    SQL.Strings = (
      'SELECT TOP (1000) [InspectionStatusID]'
      '      ,[Caption]'
      '      ,[Description]'
      '      ,[StackOrder]'
      '  FROM [FES].[dbo].[InspectionStatus]'
      '  ORDER BY StackOrder')
    Left = 72
    Top = 80
  end
end
