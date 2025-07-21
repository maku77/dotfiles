""" Enable vundle commands
set nocompatible  " be iMproved, required
filetype off      " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " NERDTree 本体
  Plugin 'preservim/nerdtree'

  " NERDTree tabs プラグイン
  Plugin 'jistr/vim-nerdtree-tabs'

  Plugin 'Lokaltog/vim-powerline'

  " JavaScript syntax highlight
  " Plugin 'JavaScript-syntax'

  " JavaScript Indent
  " Plugin 'pangloss/vim-javascript'
call vundle#end()            " required

filetype plugin indent on    " required



