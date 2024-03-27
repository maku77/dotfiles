#!/bin/bash

# このシェルスクリプトが格納されているディレクトリの絶対パス
self_dir=$(cd $(dirname $0); pwd)

###
### Alacritty 設定ファイルのシンボリックリンクを作成
###
mkdir -p ~/.config/alacritty
alacritty_link=~/.config/alacritty/alacritty.toml
alacritty_target="$self_dir/alacritty/alacritty-common.toml"

echo "Create Alacritty config: $alacritty_link"
ln -s "$alacritty_target" "$alacritty_link"

