# .vimrc/.gvimrc の設定

## Linux or MacOSX の場合

```bash
$ ./setup.sh
```

上記により、`vimrc` と `gvimrc` を読み込むための `~/.vimrc` と `~/.gvimrc` が作成されます。
また、Vim 用のバックアップディレクトリとして、下記のディレクトリが作成されます。

 - `~/temp/vim_backup`

次に、プラグイン管理のための Vundle をインストールします。

```bash
$ mkdir ~/.vim
$ git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
```

Vim を起動したら、下記のようにプラグインをインストールして完了です。

```vim
:BundleInstall
```

### コラム

`~/.vimrc` をシンボリックリンクとして作成する方法が紹介されていることがありますが、この方法では、`.vimrc` の中から、`source <sfile>:p:h/other.vim` というインクルードができなくなってしまいます（`<sfile>:p:h` がホームディレクトリを指してしまうしまうため）。ここでは、シンボリックリンクを使う方法は採用せず、`~/.vimrc` の中から、絶対パスで `vimrc` をインクルードするようにしています。

## Windows の場合

`setup.bat` を実行すると、下記のファイルに `vimrc`、`gvimrc` を読み込む行が追加されます（あらかじめ環境変数 `HOME` を設定しておく必要があります）。

 * `%HOME%\_vimrc`
 * `%HOME%\_gvimrc`

また、Vim 用のバックアップディレクトリとして、下記のディレクトリが作成されます。

 - `%HOME%\temp\vim_backup`

次に、プラグイン管理のための Vundle をインストールします。
Vundle は内部で `git` コマンドを必要とするので、`git` コマンドがインストールされていない場合はあらかじめインストールしておく必要があります。

```
C:\> mkdir %HOME%\.vim
C:\> git clone git://github.com/gmarik/vundle.git %HOME%\.vim\bundle\vundle
```

Vim を起動したら、下記のようにプラグインをインストールして完了です。

```vim
:BundleInstall
```

### トラブルシューティング: BundleInstall で git コマンドがないといわれた場合

MinGw/msys などをインストールしてある環境で、環境変数 `SHELL` に `bash.exe` などが設定されている場合は、BundleInstall で bash から `git` コマンドを実行しようとします。
この場合、bash から `git` コマンドが参照できるようになっていないと、以下のようなエラーが出ます。

```bash
[140805 21:23:12] > /usr/bin/bash: git: command not found
```

`git` にパスが通っていたとしても、おかしなエラーが出ることがあります。
このようなときは、下記のように一時的に環境変数 `SHELL` をクリアして Vim を起動して BundleInstall するとうまくいきます。

```doc
C:\> set SHELL=
C:\> gvim
```
