Attribute VB_Name = "mdlPicker"
Option Compare Database
'@Folder "PICKER"
Option Explicit

Private mRunning As Boolean
Private vReturnValue As Variant
Private mDoCreateNewContact As Variant

Public Property Get Running() As Boolean
    Running = mRunning
End Property

Public Property Let ReturnValue(X As Variant)
    vReturnValue = X
End Property

Public Property Let DoCreateNewContact(X As Variant)
    mDoCreateNewContact = X
End Property

Public Property Get DoCreateNewContact() As Variant
    DoCreateNewContact = mDoCreateNewContact
End Property

Public Function PickCustCode() As Long
    mRunning = True
    vReturnValue = Null
    DoCmd.OpenForm "xDlgPicker_CustCode", , , , , acDialog
    DoCmd.Close acForm, "xDlgPicker_CustCode"
    mRunning = False
    PickCustCode = Nz(vReturnValue, 0)
End Function

Public Function PickEquip(Optional aEquipGroupID As Long = 0) As Long
    mRunning = True
    vReturnValue = Null
    If aEquipGroupID > 0 Then
        DoCmd.OpenForm "xDlgPicker_Equip", , , , , acDialog, CStr(aEquipGroupID)
    Else
        DoCmd.OpenForm "xDlgPicker_Equip", , , , , acDialog
    End If
    DoCmd.Close acForm, "xDlgPicker_Equip"
    mRunning = False
    PickEquip = Nz(vReturnValue, 0)
End Function


Public Function PickPostcode(Optional aPostCodeNumber As Long = 0) As Long
    mRunning = True
    vReturnValue = Null
    If aPostCodeNumber > 0 Then
        DoCmd.OpenForm "xDlgPicker_Postcode", , , , , acDialog, CStr(aPostCodeNumber)
    Else
        DoCmd.OpenForm "xDlgPicker_Postcode", , , , , acDialog
    End If
    DoCmd.Close acForm, "xDlgPicker_Postcode"
    mRunning = False
    PickPostcode = Nz(vReturnValue, 0)
End Function

Public Function PickSuburb() As Long
    mRunning = True
    vReturnValue = Null
    DoCmd.OpenForm "xDlgPicker_Suburb", , , , , acDialog
    DoCmd.Close acForm, "xDlgPicker_Suburb"
    mRunning = False
    PickSuburb = Nz(vReturnValue, 0)
End Function

Public Function PickSite() As Long
    mRunning = True
    vReturnValue = Null
    DoCmd.OpenForm "xDlgPicker_Site", , , , , acDialog
    DoCmd.Close acForm, "xDlgPicker_Site"
    mRunning = False
    PickSite = Nz(vReturnValue, 0)
End Function

Public Function PickCustomer() As Long
    mRunning = True
    vReturnValue = Null
    DoCmd.OpenForm "xDlgPicker_Customer", , , , , acDialog
    DoCmd.Close acForm, "xDlgPicker_Customer"
    mRunning = False
    PickCustomer = Nz(vReturnValue, 0)
End Function

Public Function PickHR() As Long
    mRunning = True
    vReturnValue = Null
    DoCmd.OpenForm "xDlgPicker_HR", , , , , acDialog
    DoCmd.Close acForm, "xDlgPicker_HR"
    mRunning = False
    
    PickHR = Nz(vReturnValue, 0)
End Function


Public Function PickHR_CustContact() As Long
    mRunning = True
    vReturnValue = Null
    mDoCreateNewContact = Null
    DoCmd.OpenForm "xDlgPicker_HR_CustContact", , , , , acDialog
    DoCmd.Close acForm, "xDlgPicker_HR_CustContact"
    ' ..Unload..Deactivate..Close
    DoEvents
    mRunning = False
    PickHR_CustContact = Nz(vReturnValue, 0)
End Function
