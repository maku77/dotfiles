# WezTerm 用設定

## macOS/Linux の場合

`~/.config/wezterm/` がこの `wezterm` ディレクトリの内容を参照するようにシンボリックリンクを作成します。

```console
$ ln -s $PWD ~/.config/wezterm
```

## Windows の場合

`%USERPROFILE%\.config\wezterm\` がこの `wezterm` ディレクトリの内容を参照するようにディレクトリ・ジャンクションを作成します。

```powershell
PS> New-Item -ItemType Junction -Path $env:USERPROFILE\.config\wezterm -Target $PWD
```

