" File type detection is On.
filetype on

augroup vimrc
    " Remove all autocommands in this group
    autocmd!

    " C/C++, Java
    autocmd FileType c,cpp,java setl cindent
    autocmd FileType c,cpp,java setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround

    " JavaScript
    autocmd FileType javascript setl autoindent
    autocmd FileType javascript setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround

    " Ruby, eruby (ERB)
    autocmd FileType ruby,eruby setl smartindent
    autocmd FileType ruby,eruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround
    autocmd FileType ruby,eruby inoremap # X# 

    " Python
    autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround
    autocmd FileType python inoremap # X# 

    " HTML, CSS, SCSS
    autocmd FileType html,css,scss setl autoindent
    autocmd FileType html,css,scss setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround

    " Golang（イマイチな設定だけどとりあえず）
    autocmd FileType go setl noexpandtab autoindent
augroup END

