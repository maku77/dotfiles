""""""""""""""""""""""""""""""""""
" Build with clang++ [2012-04-03]
""""""""""""""""""""""""""""""""""
command! DoClang call s:DoClang()
nmap <F5> :DoClang<CR>
function! s:DoClang()
  :w
  :!clang++ % -o %<.out && ./%<.out
endfunction

