'====================================================================
' Borland C++ Compiler 5.5 設定用 WSH スクリプト
'                               by M.Ohta -- Last modified 2005-05-10
'
' 概要:
' 下記の設定を自動で行います。
'   1. bin\bcc32.cfg の自動生成
'   2. bin\ilink32.cfg の自動生成
'   3. 環境変数 PATH の自動設定
'
' 使い方:
' BCC をインストールしたディレクトリ内にこのスクリプトをコピーして実行
'
' 使用例:
' C:\Borland\BCC55 にコピーして実行
'====================================================================

Set objShell = WScript.CreateObject("WScript.Shell")
curDir = objShell.CurrentDirectory & "\"

'--------------------------------------------------------------------
' bin\bcc32.cfg ファイルを作成
' 内容は
'   -I"<BccDir>\include"
'   -L"<BccDir>\lib"
'--------------------------------------------------------------------
Set objFile = WScript.CreateObject("Scripting.FileSystemObject")
Set objStream = objFile.CreateTextFile(curDir & "bin\bcc32.cfg")
objStream.WriteLine("-I""" & curDir & "include""")
objStream.WriteLine("-L""" & curDir & "lib""")
objStream.Close()

'--------------------------------------------------------------------
' bin\ilink32.cfg ファイルを作成
' 内容は
'   -L"<BccDir>\lib"
'--------------------------------------------------------------------
Set objStream = objFile.CreateTextFile(curDir & "bin\ilink32.cfg")
objStream.WriteLine("-L""" & curDir & "lib""")
objStream.Close()

'--------------------------------------------------------------------
' bin ディレクトリにパスを通す
'--------------------------------------------------------------------
Set objEnv = objShell.Environment("USER")
strSeparator = ";"
If objEnv("PATH") = "" Then
    strSeparator = ""
End If
objEnv("PATH") = objEnv("PATH") & strSeparator & curDir & "bin"


WScript.Echo "BCC の設定が終了しました。" & vbCrLf & vbCrLf & _
    "1. bin\bcc32.cfg を作成しました。" & vbCrLf & _
    "2. bin\bcc32.cfg を作成しました。" & vbCrLf & _
    "3. 環境変数 PATH を設定しました。"
