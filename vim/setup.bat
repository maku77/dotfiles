@echo off
if not defined HOME (
  echo ���ϐ� HOME ����`����Ă��܂���
  echo ���ϐ� HOME �� _vimrc ��z�u���邽�߂̃f�B���N�g���p�X��ݒ肵�Ă�������
  exit /b
)

set MY_DIR=%~dp0
@echo on
echo source %MY_DIR%vimrc >> %HOME%\_vimrc
echo source %MY_DIR%gvimrc >> %HOME%\_gvimrc
mkdir %HOME%\temp\vim_backup
