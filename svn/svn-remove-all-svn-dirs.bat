@REM ==========================================
@REM [2010-04-25] Masatoshi Ohta
@REM Remove all '.svn' directories.
@REM ==========================================
for /d /r %%x in (*.svn) do rmdir /q /s "%%x"

