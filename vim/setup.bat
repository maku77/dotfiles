@echo off
if not defined HOME (
  echo 環境変数 HOME が定義されていません
  echo 環境変数 HOME に _vimrc を配置するためのディレクトリパスを設定してください
  exit /b
)

set MY_DIR=%~dp0
@echo on
echo source %MY_DIR%vimrc >> %HOME%\_vimrc
echo source %MY_DIR%gvimrc >> %HOME%\_gvimrc
mkdir %HOME%\temp\vim_backup
