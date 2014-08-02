@REM [2010-01-12]
@REM p4-download.pl と一緒に PATH の通ったディレクトリに置いておく。
@REM これで、コマンドプロンプトから p4-download と打てるようになる。
set script=%~dp0%p4-download.pl
perl %script% %*
