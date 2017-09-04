" File type detection is On.
filetype on

augroup vimrc
    " Remove all autocommands in this group
    autocmd!

    " C/C++, Java
    autocmd FileType c,cpp,java  setl cindent
    autocmd FileType c,cpp,java  setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround

    " JavaScript
    autocmd FileType javascript  setl autoindent
    autocmd FileType javascript  setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround

    " Python
    autocmd FileType python  setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python  setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround
    autocmd FileType python  inoremap # X# 

    " Ruby, eruby (ERB)
    autocmd FileType ruby,eruby  setl smartindent
    autocmd FileType ruby,eruby  setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround
    autocmd FileType ruby,eruby  inoremap # X# 

    " HTML, CSS, SCSS
    autocmd FileType html,css,scss  setl autoindent
    autocmd FileType html,css,scss  setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround

    " Golang（イマイチな設定だけどとりあえず）
    autocmd FileType go  setl noexpandtab autoindent

    " <F5> key execution
    autocmd FileType java        nmap <buffer> <F5> :!javac %<CR>
    autocmd FileType javascript  nmap <buffer> <F5> :!node %<CR>
    autocmd FileType php         nmap <buffer> <F5> :!php %<CR>
    autocmd FileType python      nmap <buffer> <F5> :!python %<CR>
    autocmd FileType ruby        nmap <buffer> <F5> :!ruby %<CR>
    autocmd FileType go          nmap <buffer> <F5> :!go run %<CR>
    autocmd FileType groovy      nmap <buffer> <F5> :!groovy %<CR>
    autocmd FileType vim         nmap <buffer> <F5> :source %<CR>
augroup END

