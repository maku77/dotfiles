# Neovim の設定

このフォルダでは複数の PC で共有する Neovim の設定ファイルを管理しています。

- 参考: [まくまく Vim ノート | Neovim の設定ファイル (init.lua) を GitHub や Dropbox で管理する](https://maku77.github.io/p/pzakg36/)

## 設定方法

Linux/macOS では `~/.config/nvim` というシンボリックリンク、Windows では `%LOCALAPPDATA%\nvim` というジャンクションをこの `nvim` ディレクトリに結び付ける形で作成すれば設定完了です。

下記は、このディレクトリが `~/gitwork/dotfiles/nvim` というパスで参照できることを前提としています。
適宜、Git クローン先のパスに置き換えてください。

### Linux/macOS の場合 ─ シンボリックリンクの作成

```
ln -s ~/gitwork/dotfiles/nvim ~/.config/nvim
```

### Windows (PowerShell) の場合 ─ ジャンクションの作成

```
New-Item -ItemType Junction -Path $env:LOCALAPPDATA\nvim -Target $env:USERPROFILE\gitwork\dotfiles\nvim
```

ジャンクションが作成されていることを `dir` コマンドで確認しておきます。
次のように `l` というフラグの付いた `nvim` ディレクトリができていれば成功です。

```
❯ dir $env:LOCALAPPDATA | findstr nvim
d----l        2026-09-10     20:29                nvim
```
