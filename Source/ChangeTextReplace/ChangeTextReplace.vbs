Option Explicit

'--------------------------------------------------
'■Include Standard Software Library
'--------------------------------------------------
'FileNameには相対アドレスも指定可能
'--------------------------------------------------
'Include ".\Test\..\..\StandardSoftwareLibrary_vbs\StandardSoftwareLibrary.vbs"  
Include ".\Lib\StandardSoftwareLibrary.vbs"  

Sub Include(ByVal FileName)
    Dim fso: Set fso = WScript.CreateObject("Scripting.FileSystemObject") 
    Dim Stream: Set Stream = fso.OpenTextFile( _
        fso.GetParentFolderName(WScript.ScriptFullName) _
        + "\" + FileName, 1)
    ExecuteGlobal Stream.ReadAll() 
    Call Stream.Close
End Sub
'--------------------------------------------------

Call Main
'Call test02

Sub test01
    Dim ArgsText
    Select Case 8
    Case  1:  ArgsText = "123⇒456,ABC⇒DEF"
    Case  2:  ArgsText = "123456,ABC⇒DEF"
    Case  3:  ArgsText = "123⇒456,ABCDEF"
    Case  4:  ArgsText = "123456,ABCDEF"
    Case  5:  ArgsText = "123456⇒ABCDEF"
    Case  6:  ArgsText = "123456ABCDEF"
    Case  7:  ArgsText = "123⇒,ABC⇒DEF"
    Case  8:  ArgsText = "123⇒456,ABC⇒"
    Case  9:  ArgsText = "⇒456,ABC⇒DEF"
    Case 10:  ArgsText = "123⇒456,⇒DEF"
    Case 11:  ArgsText = "123⇒4⇒56,ABC⇒DEF"
    Case 12:  ArgsText = "123⇒456,ABC⇒D⇒EF"
    End Select

    Dim ReplaceCommand
    ReplaceCommand = Split(ArgsText, ",")
    MsgBox CheckCommand(ReplaceCommand)
End Sub

Function CheckCommand(Commands)
    Dim Result: Result = True
    Dim I
    For I = 0 To UBound(Commands) - LBound(Commands)
        Dim Index: Index = InStr(Commands(I), "⇒")
        If (Index <= 1) Then
            Result = False
        ElseIf (0 <> InStr(Index + Len("⇒"), Commands(I), "⇒")) then
            Result = False
        End If
        'MsgBox InStr(Index + Len("⇒"), Commands(I), "⇒")
    Next
    CheckCommand = Result
End Function

Sub test02
    MsgBox FirstStrFirstDelim("abc⇒def", "⇒")
    MsgBox FirstStrFirstDelim("abc⇒def,123⇒456", "⇒")
    MsgBox FirstStrLastDelim("abc⇒def,123⇒456", "⇒")
    MsgBox LastStrFirstDelim("abc⇒def,123⇒456", "⇒")
    MsgBox LastStrLastDelim("abc⇒def,123⇒456", "⇒")
End Sub

Sub Main
    Dim Args: Set Args = WScript.Arguments

    Dim ArgsText
    Dim CheckCommandFlag
    Dim ReplaceCommand
    Dim I

    Select Case Args.Count
    Case 3, 4
        If CheckEncodeName(Args(0)) = False Then
            Call WScript.Echo("Error:Args(0) No Exists Encode")
            Exit Sub
        End If

        If fso.FileExists(Args(1)) = False Then
            Call WScript.Echo("Error:Args(1) No Exists File")
            Exit Sub
        End If

        ArgsText = Args(2)
        ReplaceCommand = Split(ArgsText, ",")

        If CheckCommand(ReplaceCommand) = False Then
            Call WScript.Echo("Error:Args(2) No Correct Replacce Command")
            Exit Sub
        End If

    Case Else
        Call WScript.Echo("Error:Args Count")
        Exit Sub
    End Select

    Dim FileText
    FileText = LoadTextFile(Args(1), Args(0))
    For I = 0 To UBound(ReplaceCommand) - LBound(ReplaceCommand)
        FileText = Replace(FileText, _
            FirstStrFirstDelim(ReplaceCommand(I), "⇒"), _
            LastStrFirstDelim(ReplaceCommand(I), "⇒"))
    Next

    Select Case Args.Count
    Case 3
        Call SaveTextFile(FileText, Args(1), Args(0))
    Case 4
        Call SaveTextFile(FileText, Args(3), Args(0))
    End Select
End Sub

