Attribute VB_Name = "mdlRibbonCmd"
Option Compare Database
Option Explicit

'Macro call here from the ribbon buttons


Public Function ShowSwitchBoard()
    ' SwitchBoard
    DoCmd.OpenForm "_SwitchBoard", , , , , acWindowNormal
End Function


Public Function ShowSchedule()
    ' SwitchBoard
    DoCmd.OpenForm "_InspectSchedule", , , , , acWindowNormal
End Function

Public Function ShowCustomer()
    ' SwitchBoard
    DoCmd.OpenForm "_CustFind", , , , , acWindowNormal
End Function

Public Function ShowHR()
    ' SwitchBoard
    DoCmd.OpenForm "_HRFind", , , , , acWindowNormal
End Function

Public Function ShowSite()
    ' SwitchBoard
    DoCmd.OpenForm "_SiteFind", , , , , acWindowNormal
End Function

Public Function ShowInspect()
    ' SwitchBoard
    DoCmd.OpenForm "_InspectOrderFind", , , , , acWindowNormal
End Function



