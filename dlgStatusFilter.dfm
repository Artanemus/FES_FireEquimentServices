object StatusFilter: TStatusFilter
  Left = 0
  Top = 0
  AutoSize = True
  BorderStyle = bsNone
  Caption = 'Filter Status'
  ClientHeight = 242
  ClientWidth = 155
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object btnGroup: TButtonGroup
    Left = 0
    Top = 0
    Width = 155
    Height = 242
    Align = alClient
    ButtonHeight = 34
    ButtonWidth = 150
    Images = FES.imgList32x32
    Items = <
      item
        Action = actnXAction
      end
      item
        Action = actnSent
      end
      item
        Action = actnAwaiting
      end
      item
        Action = actnHold
      end
      item
        Action = actnIRNS
      end
      item
        Action = actnCompleted
      end
      item
        Action = actnCancelled
      end>
    TabOrder = 0
  end
  object qryStatus: TFDQuery
    Active = True
    IndexFieldNames = 'StackOrder'
    Connection = FES.fesConnection
    UpdateOptions.UpdateTableName = 'IDFES.dbo.InspectionStatus'
    UpdateOptions.KeyFields = 'InspectionStatusID'
    SQL.Strings = (
      'SELECT '
      #9#9' [InspectionStatusID]'
      #9#9',[Caption]'
      #9#9',[StackOrder]'
      #9#9',[TMSColor]'
      #9#9',[TMSSelectedColor]'
      #9#9',[TMSCaptionColor]'
      #9#9',[TMSSelectedCaptionColor]'
      #9#9',[TMSTrackColor]'
      #9#9',[TMSSelectedTrackColor]'
      #9#9',[TMSLinkColor]'
      '    ,POWER(2,[InspectionStatusID]-1) AS Layer  '
      'FROM [dbo].[InspectionStatus] '
      'ORDER BY StackOrder ASC')
    Left = 64
    Top = 64
  end
  object ActionList1: TActionList
    Images = FES.imgList32x32
    Left = 64
    Top = 136
    object actnXAction: TAction
      AutoCheck = True
      Caption = 'Action'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
      OnUpdate = actnGenericUpdate
    end
    object actnSent: TAction
      AutoCheck = True
      Caption = 'Sent'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
    end
    object actnAwaiting: TAction
      AutoCheck = True
      Caption = 'Awaiting'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
    end
    object actnHold: TAction
      AutoCheck = True
      Caption = 'HOLD'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
    end
    object actnIRNS: TAction
      AutoCheck = True
      Caption = 'IRNS'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
    end
    object actnCompleted: TAction
      AutoCheck = True
      Caption = 'Completed'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
    end
    object actnCancelled: TAction
      AutoCheck = True
      Caption = 'Cancelled'
      ImageIndex = 23
      ImageName = 'checked_boxNIL'
      OnExecute = actnGenericExecute
    end
  end
end
