"--------------------------------------------
" Useful key mappings (macros)
"--------------------------------------------

" Open ~/.vimrc
nmap <F1> :tabnew $MYVIMRC<CR>

" ファイルのディレクトリを Windows のエクスプローラーで開く
nmap <F12> :silent ! start %:h<CR>

" Insert a date like '2018-10-28'
imap <silent> <F1> <C-R>=strftime("%Y-%m-%d")<CR>
imap <silent> <F2> <C-R>=strftime("%Y-%m-%d (%a)")<CR>


"--------------------------------------------
" 編集操作
"--------------------------------------------

" インサートモード中の BS、CTRL-W、CTRL-U による文字削除を柔軟にする
set backspace=indent,eol,start

" Reselect visual block after indent/outdent
vnoremap > >gv
vnoremap < <gv

" Stay visual mode after formatting code
vnoremap = =gv

" Desired linebreak position
"set textwidth=79

" Indent settings
set autoindent
set expandtab  "Use the appropriate number of spaces to insert a <Tab>.
set tabstop=4  "Number of spaces that a <Tab> in the file counts for.
set softtabstop=4
set shiftwidth=4  "Number of spaces to use for each step of (auto)indent.
set shiftround  "Round indent to multiple of 'shiftwidth'

" Auto formatting
set formatoptions=tcqro


"--------------------------------------------
" Change the tab (some terminal cannot handle C-Tab)
"--------------------------------------------
nmap <C-Tab> :tabnext<CR>
nmap <C-l> :tabnext<CR>
nmap <C-k> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
nmap <C-j> :tabprevious<CR>
nmap <C-h> :tabprevious<CR>


"---------------------------------------------
" 開いたファイルのあるディレクトリをカレントディレクトリに [2013-06-16] OK
"---------------------------------------------

"au BufEnter * execute ":lcd " . expand("%:p:h")

" Last update: 2009-01-26
set number  "Print the line number in front of each line.
set hlsearch  "When there is a previous search pattern, highlight all its matches.
set incsearch  "Inclemental search On
set clipboard+=unnamed  "Use the clipboard register '*' for all yank.


"--------------------------------
" Backup/Swap/Undo file settings
"--------------------------------
set backup
set backupdir=~/temp/vim_backup
set swapfile
set directory=~/temp/vim_backup
set noundofile
set undodir=~/temp/vim_backup


"----------------------
" Encoding, EOL format
"----------------------
set encoding=utf-8 "Internal character encoding.
"set fileencoding=utf-8  "Encoding for a new file.
set fileencodings=ucs-bom,utf-8,euc-jp,cp932,latin1  "Encoding for opening a file.
set fileformats=unix,dos,mac
set fileformat=unix


"-----------------
" Scroll settings
"-----------------
au BufEnter * set scroll=3  "Number of lines to scroll with CTRL-U and CTRL-D commands.
set scrolljump=1
set scrolloff=5


"--------------
" Status line
" [2009-02-06]
"--------------
set laststatus=2  "常にステータスラインを表示
set statusline=%F%m%h%w\ %<[ENC=%{&fenc!=''?&fenc:&enc}]\ [FMT=%{&ff}]\ [TYPE=%Y]\ %=[CODE=0x%02B]\ [POS=%l/%L(%02v)]


"----------------------------
" Turn IME off automatically
" [2009-02-05]
"----------------------------
autocmd InsertEnter * set iminsert=0
autocmd InsertLeave * set iminsert=0


"-----------------------
" Auto copen after grep
" [2010-09-13]
"-----------------------
au QuickfixCmdPost make,grep,grepadd,vimgrep copen


"-----------------------
" ctags search settings
"-----------------------
set tags=./tags;,tags;

