'
' カレントディレクトリ内のファイルを拡張子別のディレクトリに振り分ける。
' ver.1.0 2006-07-02 (Masatoshi Ohta)
'
Set fso = CreateObject("Scripting.FileSystemObject")
Set folder = fso.GetFolder(".")

' カレントディレクトリ内のすべてのファイルを処理
For Each file In folder.Files
	ext = fso.GetExtensionName(file.Name)
	If ext <> "" Then
		' 拡張子と同じ名前のディレクトリを作成
		If Not fso.FolderExists(ext) Then
			fso.CreateFolder ext
		End If

		' 拡張子と同じ名前のディレクトリにファイルを移動
		Set dstDir = fso.GetFolder(ext)
		dstFileName = dstDir & "\" & file.Name
		fso.MoveFile file, dstFileName
	End If
Next
