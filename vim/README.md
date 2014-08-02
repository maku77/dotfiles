# .vimrc/.gvimrc の設定

## Linux or MacOSX の場合

```bash
$ ./setup.sh
```

上記により、vimrc と gvimrc を読み込むための ~/.vimrc、~/.gvimrc が作成されます。
また、Vim 用のバックアップディレクトリとして、下記のディレクトリが作成されます。


 - ~/temp/vim_backup

次に、プラグイン管理のための Vundle をインストールします。

```bash
$ mkdir ~/.vim
$ git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

Vim を起動したら、下記のようにプラグインをインストールして完了です。

```vim
:BundleInstall
```

### コラム
~/.vimrc をシンボリックリンクとして作成する方法が紹介されていることがありますが、この方法では、.vimrc の中から、`source <sfile>:p:h/other.vim` というインクルードができなくなってしまいます（`<sfile>:p:h` がホームディレクトリを指してしまうしまうため）。ここでは、シンボリックリンクを使う方法は採用せず、~/.vimrc の中から、絶対パスで vimrc をインクルードするようにしています。

## Windows の場合

TBD.
