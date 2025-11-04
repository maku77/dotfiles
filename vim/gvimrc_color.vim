"----------------
" Color settings
" [2009-02-05]
"----------------
colorscheme torte  "カラースキームの設定
syntax enable  "Syntax highlighting On

" Color of line number [2013-04-07]
" see: https://maku77.github.io/p/t8o6tum/
hi LineNr guifg=#cc2244 guibg=#551100 ctermfg=black ctermbg=gray
hi CursorLineNr guifg=#dd3355 guibg=#771100 ctermfg=black ctermbg=gray

" カーソル行／カーソル列を強調表示
" see: https://maku77.github.io./p/osrx94g/
set cursorline
set cursorcolumn

" カーソル行／カーソル列の背景色
" see: https://maku77.github.io./p/osrx94g/
highlight CursorLine guibg=#0044ee ctermbg=blue
highlight CursorColumn guibg=#002299 ctermbg=blue

" Color of invisible chars such as tab and trail [2011-04-24]
exec "set listchars=tab:\uBB.,trail:_"
set list

" My colors
syntax match myDoubleSpace /　/  " 全角空白
syntax match myHeader /^!.*/  " ! で始まる見出し
syntax match myHeader /■/
syntax match myHeader /●/
syntax match myHeader /★/
syntax match myList /^\*.\+/  " * で始まるリスト
syntax match myPre /^[ \t]\+[^ \t*].*$/  " 整形リスト
hi link myDoubleSpace SpellBad
hi link myHeader Title
hi link myList Special
hi link myPre Comment

"Change cursor color according to the current IME state.
if has('multi_byte_ime')
  hi Cursor guifg=bg guibg=Green gui=NONE
  hi CursorIM guifg=NONE guibg=Red gui=NONE
endif

" Desired linebreak position [2013-05-26]
" see: https://maku77.github.io/p/ngz6n6i/
set colorcolumn=80,100
highlight ColorColumn guibg=#202020 ctermbg=lightgray
