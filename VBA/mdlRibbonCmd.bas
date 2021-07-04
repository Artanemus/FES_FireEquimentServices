Attribute VB_Name = "mdlRibbonCmd"
Option Compare Database
Option Explicit

'Macro call here from the ribbon buttons



Public Function ShowCurrentTime()
  MsgBox "The time is " & Now(), , "FES Sample Function"
End Function


Public Function Email_CustInspectReport()
  MsgBox "Email the customer an inspection report.", , "FES Email Inspection Report"
End Function


Public Function Email_CustInspectForm()
  MsgBox "Email the technician an inspection form.", , "FES Email Inspection Form"
End Function
