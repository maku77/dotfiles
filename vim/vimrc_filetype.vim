" File type detection is On.
filetype on

" C/C++, Java
autocmd FileType c,cpp,java setl cindent
autocmd FileType c,cpp,java setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround

" JavaScript
autocmd FileType javascript setl autoindent
autocmd FileType javascript setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround

" Ruby [2010-05-07]
autocmd FileType ruby setl smartindent
autocmd FileType ruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround
autocmd FileType ruby inoremap # X# 

" Python
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround
autocmd FileType python inoremap # X# 

" HTML
autocmd FileType html setl autoindent
autocmd FileType html setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround

