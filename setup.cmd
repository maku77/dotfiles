@echo off
setlocal EnableDelayedExpansion
set self_dir=%~dp0

REM ============================================
echo Create a config file for Alacritty
REM ============================================
set alacritty_link=%AppData%\alacritty\alacritty.toml
if exist "%alacritty_link%" (
    set /p confirm=%alacritty_link% already exists. Overwrite? [Y/N]
    if /i "!confirm!" neq "Y" (
        echo Setup canceled
        exit /b
    )
)
set alacritty_common=%self_dir:\=/%alacritty/alacritty-common.toml
set alacritty_win=%self_dir:\=/%alacritty/alacritty-win.toml
mkdir %AppData%\alacritty 2>nul
(
  echo import = [
  echo   "%alacritty_common%",
  echo   "%alacritty_win%",
  echo ]
) > %alacritty_link%

