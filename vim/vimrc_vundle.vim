""" Enable vundle commands
set nocompatible
"filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'

" JavaScript syntax highlight
Bundle 'JavaScript-syntax'
" JavaScript Indent
Bundle 'pangloss/vim-javascript'

""" NERDTree
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
