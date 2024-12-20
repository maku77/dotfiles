" File type detection is On.
filetype on

" see: https://maku77.github.io/p/rj6oatw/
" see: https://maku77.github.io/p/nwqjyx8/
augroup filetype_group
    " Remove all autocommands in this group
    autocmd!

    " Markdown
    autocmd FileType markdown  setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround

    " C/C++, Java
    autocmd FileType c,cpp,java  setl cindent
    autocmd FileType c,cpp,java  setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround

    " JavaScript
    autocmd FileType javascript  setl autoindent
    autocmd FileType javascript  setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround

    " Python
    autocmd FileType python  setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python  setl expandtab tabstop=4 shiftwidth=4 softtabstop=4 shiftround

    " Ruby, eruby (ERB)
    autocmd FileType ruby,eruby  setl smartindent
    autocmd FileType ruby,eruby  setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround

    " HTML, CSS, SCSS
    autocmd FileType html,css,scss  setl autoindent
    autocmd FileType html,css,scss  setl expandtab tabstop=2 shiftwidth=2 softtabstop=2 shiftround

    " Golang（イマイチな設定だけどとりあえず）
    autocmd FileType go  setl noexpandtab autoindent

    " <F5> key execution
    autocmd FileType java        nmap <buffer> <F5> :!javac -encoding UTF-8 % && java %<<CR>
    autocmd FileType javascript  nmap <buffer> <F5> :!node %<CR>
    autocmd FileType php         nmap <buffer> <F5> :!php %<CR>
    autocmd FileType python      nmap <buffer> <F5> :!python %<CR>
    autocmd FileType ruby        nmap <buffer> <F5> :!ruby %<CR>
    autocmd FileType go          nmap <buffer> <F5> :!go run %<CR>
    autocmd FileType groovy      nmap <buffer> <F5> :!groovy %<CR>
    autocmd FileType vim         nmap <buffer> <F5> :source %<CR>
    autocmd FileType c,cpp       nmap <buffer> <F5> :DoClang<CR>
augroup END

" C/C++ コードをコンパイル＆実行する関数
command! DoClang call s:DoClang()
function! s:DoClang()
    if has("win64")
        :!clang++ % -o %<.exe && %<.exe
    else
        :!clang++ % -o %<.out && ./%<.out
    endif
endfunction

