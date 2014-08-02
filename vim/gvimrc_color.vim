"----------------
" Color settings
" [2009-02-05]
"----------------
colorscheme torte  "カラースキームの設定
syntax enable  "Syntax highlighting On

" Color of line number [2013-04-07]
"hi LineNr guifg=#ffffff guibg=#666666 ctermfg=black ctermbg=gray
"hi CursorLineNr guifg=black guibg=#666666 ctermfg=black ctermbg=gray
hi LineNr guifg=#cc2244 guibg=#551100 ctermfg=black ctermbg=gray
hi CursorLineNr guifg=#ff2244 guibg=#551100 ctermfg=black ctermbg=gray

" Color of cursor line/column [2009-09-09]
set cursorline
hi CursorLine guibg=#0044ee ctermbg=blue
set cursorcolumn
hi CursorColumn guibg=#002299 ctermbg=blue

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

"--------------------------------------------
" Desired linebreak position [2013-05-26] OK
"--------------------------------------------
set colorcolumn=80,100
highlight ColorColumn guibg=#202020 ctermbg=lightgray
