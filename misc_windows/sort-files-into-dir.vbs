'
' �J�����g�f�B���N�g�����̃t�@�C�����g���q�ʂ̃f�B���N�g���ɐU�蕪����B
' ver.1.0 2006-07-02 (Masatoshi Ohta)
'
Set fso = CreateObject("Scripting.FileSystemObject")
Set folder = fso.GetFolder(".")

' �J�����g�f�B���N�g�����̂��ׂẴt�@�C��������
For Each file In folder.Files
	ext = fso.GetExtensionName(file.Name)
	If ext <> "" Then
		' �g���q�Ɠ������O�̃f�B���N�g�����쐬
		If Not fso.FolderExists(ext) Then
			fso.CreateFolder ext
		End If

		' �g���q�Ɠ������O�̃f�B���N�g���Ƀt�@�C�����ړ�
		Set dstDir = fso.GetFolder(ext)
		dstFileName = dstDir & "\" & file.Name
		fso.MoveFile file, dstFileName
	End If
Next
