'====================================================================
' Borland C++ Compiler 5.5 �ݒ�p WSH �X�N���v�g
'                               by M.Ohta -- Last modified 2005-05-10
'
' �T�v:
' ���L�̐ݒ�������ōs���܂��B
'   1. bin\bcc32.cfg �̎�������
'   2. bin\ilink32.cfg �̎�������
'   3. ���ϐ� PATH �̎����ݒ�
'
' �g����:
' BCC ���C���X�g�[�������f�B���N�g�����ɂ��̃X�N���v�g���R�s�[���Ď��s
'
' �g�p��:
' C:\Borland\BCC55 �ɃR�s�[���Ď��s
'====================================================================

Set objShell = WScript.CreateObject("WScript.Shell")
curDir = objShell.CurrentDirectory & "\"

'--------------------------------------------------------------------
' bin\bcc32.cfg �t�@�C�����쐬
' ���e��
'   -I"<BccDir>\include"
'   -L"<BccDir>\lib"
'--------------------------------------------------------------------
Set objFile = WScript.CreateObject("Scripting.FileSystemObject")
Set objStream = objFile.CreateTextFile(curDir & "bin\bcc32.cfg")
objStream.WriteLine("-I""" & curDir & "include""")
objStream.WriteLine("-L""" & curDir & "lib""")
objStream.Close()

'--------------------------------------------------------------------
' bin\ilink32.cfg �t�@�C�����쐬
' ���e��
'   -L"<BccDir>\lib"
'--------------------------------------------------------------------
Set objStream = objFile.CreateTextFile(curDir & "bin\ilink32.cfg")
objStream.WriteLine("-L""" & curDir & "lib""")
objStream.Close()

'--------------------------------------------------------------------
' bin �f�B���N�g���Ƀp�X��ʂ�
'--------------------------------------------------------------------
Set objEnv = objShell.Environment("USER")
strSeparator = ";"
If objEnv("PATH") = "" Then
    strSeparator = ""
End If
objEnv("PATH") = objEnv("PATH") & strSeparator & curDir & "bin"


WScript.Echo "BCC �̐ݒ肪�I�����܂����B" & vbCrLf & vbCrLf & _
    "1. bin\bcc32.cfg ���쐬���܂����B" & vbCrLf & _
    "2. bin\bcc32.cfg ���쐬���܂����B" & vbCrLf & _
    "3. ���ϐ� PATH ��ݒ肵�܂����B"
