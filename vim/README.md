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
環境変数 HOME を設定し、下記のファイルに vimrc、gvimrc を読み込む行を追加します。

 * %HOME%\\_vimrc
 * %HOME%\\_gvimrc

どのような行を追加するかは、`setup.bat` を実行すると表示されます。

プラグイン管理の Vundle は内部で git を使用するので、msysGit などをインストールし、git コマンドにパスを通しておきます。
git コマンドが使えるようになったら、Vundle をインストールします。

```
C:\> mkdir %HOME%\.vim
C:\> git clone git://github.com/gmarik/vundle.git %HOME%\.vim\bundle\vundle
```

Vim を起動したら、下記のようにプラグインをインストールして完了です。

```vim
:BundleInstall
```

### トラブルシューティング: BundleInstall で git コマンドがないといわれた場合

MinGw/msys などをインストールしてある環境で、環境変数 SHELL に bash.exe などが設定されている場合は、BundleInstall で bash から git コマンドを実行しようとします。
この場合、bash から git コマンドが参照できるようになっていないと、以下のようなエラーが出ます。

```bash
[140805 21:23:12] > /usr/bin/bash: git: command not found
```

一時的に環境変数 SHELL をクリアして vim を起動するか、%HOME%\\.bashrc などで git コマンドへのパスを通すことで BundleInstall できるようになります。

