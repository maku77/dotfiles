"--------------------------------------------
" Useful key mappings (macros)
"--------------------------------------------

" Leader キー設定
" see: https://maku77.github.io/p/c9kmay4/
let mapleader = "\<Space>"

" Change the tab
" see: https://maku77.github.io/p/ksmwhv8/
nnoremap <silent> <C-l> :tabnext<CR>
nnoremap <silent> <C-k> :tabnext<CR>
nnoremap <silent> <C-j> :tabprevious<CR>
nnoremap <silent> <C-h> :tabprevious<CR>

" ノーマルモード時に F1 キーで設定ファイルを開く
" see: https://maku77.github.io/p/r5fcfgk/
nmap <F1> :tabnew $MYVIMRC<CR>

" 編集中ファイルのディレクトリを Explorer や Finder で開く
" see: https://maku77.github.io/p/tqmr4od/
if has("win64")
    nnoremap <F12> :silent ! start %:h<CR>
elseif has("macunix")
    nnoremap <F12> :silent ! open %:h<CR>
endif

" Insert a date like '2018-10-28'
" see: https://maku77.github.io/p/8xk6jnw/
inoremap <silent> <F1> <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <silent> <F2> <C-R>=strftime("%Y-%m-%d (%a)")<CR>

" NERDTree 用のキーマップ
nnoremap <Leader>nt :<C-u>NERDTreeToggle<CR>
nnoremap <Leader>nf :<C-u>NERDTreeFind<CR>

" Stay visual mode after indenting/formatting code
" see: https://maku77.github.io/p/hoihkfy/
vnoremap = =gv
vnoremap > >gv
vnoremap < <gv


"--------------------------------------------
" 編集操作
"--------------------------------------------

" インサートモード中の BS、CTRL-W、CTRL-U による文字削除を柔軟にする
set backspace=indent,eol,start

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

" Change the current working directory automatically
" see: https://maku77.github.io/p/dpccbv7/
" see: https://maku77.github.io/p/4ekh9ba/
set autochdir

" Print the line number in front of each line
set number

" OS のクリップボードと連携
" see: https://maku77.github.io/p/nnhefs3/
set clipboard=unnamed,unnamedplus  "Use the clipboard register '*' / '+'


"--------------------------------------------
" Search settings [2009-01-26]
" see: https://maku77.github.io/p/v4cuc9g/
"--------------------------------------------
set ignorecase  " Ignore case when searching.
set smartcase  " ... unless an uppercase letter is used.
set wrapscan  " Searches wrap around the end of the file.
set hlsearch  " Highlight search results.
set incsearch  " Enable incremental search.


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
" Number of lines to scroll with CTRL-U and CTRL-D commands.
" see: https://maku77.github.io/p/gu9om5z/
autocmd BufEnter  *  setlocal scroll=3
set scrolljump=1
set scrolloff=10


"--------------
" Status line
" see: https://maku77.github.io/p/oegfris/
"--------------
set laststatus=2  "常にステータスラインを表示
set statusline=%F%m%h%w\ %<[ENC=%{&fenc!=''?&fenc:&enc}]\ [FMT=%{&ff}]\ [TYPE=%Y]\ %=[CODE=0x%02B]\ [POS=%l/%L(%02v)]


"----------------------------
" Turn IME off automatically
" [2009-02-05]
"----------------------------
autocmd InsertEnter  *  set iminsert=0
autocmd InsertLeave  *  set iminsert=0


"------------------------------------------------------------------------------
" Open the QuickFix window automatically after executing commands [2010-09-13]
" see: https://maku77.github.io/p/c4q8amz/
"------------------------------------------------------------------------------
autocmd QuickfixCmdPost  grep,grepadd,vimgrep,vimgrepadd  copen


"-----------------------
" ctags search settings
"-----------------------
set tags=./tags;,tags;

