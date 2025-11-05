# WezTerm 用設定

## macOS/Linux の場合

`~/.config/wezterm` がこの `wezterm` ディレクトリの内容を参照するようにシンボリックリンクを作成します。

```console
$ cd {このディレクトリ}
$ ln -s $PWD ~/.config/wezterm
```

## Windows の場合

`%USERPROFILE%/.config/wezterm` がこの `wezterm` ディレクトリの内容を参照するようにディレクトリ・ジャンクションを作成します。

```powershell
PS> cd {このディレクトリ}
PS> New-Item -ItemType Junction -Path $env:USERPROFILE/.config/wezterm -Target $PWD
```

Windows 環境では、シェルプログラムとして `pwsh.exe` (PowerShell 7+) がインストールされていればそちらを、インストールされていなければ標準搭載の `powershell.exe` (Windows PowerShell) を使用するようにしています。
`pwsh.exe` は次のように簡単にインストールできるので、入れてしまうのがオススメ。

```powershell
PS> winget install Microsoft.PowerShell
```

