local utils = require("config.utils")

-- OS のクリップボードと連動させる
-- see: https://maku77.github.io/p/nnhefs3/
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- メイン領域の背景を透過
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

-- Change the current working directory automatically.
-- 開いたファイルと同じディレクトリに自動で移動する
-- see: https://maku77.github.io/p/dpccbv7/
vim.opt.autochdir = true

-- 行番号を表示する
-- see: https://maku77.github.io/p/t8o6tum/
vim.opt.number = true

-- Number of context lines to keep above and below the cursor (default: 0).
-- see: https://maku77.github.io/p/gu9om5z/
vim.opt.scrolloff = 10

-- インデントやタブの設定
-- see: https://maku77.github.io/p/8okf7d3/
-- see: https://maku77.github.io/p/b5o6ksu/
vim.opt.expandtab = true   -- タブキーでスペースを入力する (default: noexpandtab)
vim.opt.shiftround = true  -- シフトコマンドでのインデント量を tabstop 単位に丸める
vim.opt.tabstop = 4        -- タブ文字の表示幅
vim.opt.shiftwidth = 4     -- シフトコマンドでのインデント量
vim.opt.softtabstop = -1   -- タブキーで入力するスペース数 (-1: tabstop に合わせる)

-- 検索設定
-- see: https://maku77.github.io/p/v4cuc9g/
-- see: https://maku77.github.io/p/mfcba2q/
vim.opt.ignorecase = true  -- 大文字・小文字を区別しないで検索
vim.opt.smartcase = true  -- 検索パターンに大文字を含むときは大文字・小文字を区別して検索
vim.opt.wrapscan = true  -- 折り返し検索 ON (default)
vim.opt.hlsearch = true  -- 検索結果のハイライト ON (default)
vim.opt.incsearch = true  -- インクリメンタル・サーチ ON (default)

-- ステータスラインの設定
-- see: https://maku77.github.io/p/oegfris/
vim.opt.laststatus = 3  -- 常にステータスラインを表示し、1 つに統合
-- ステータスラインは lualine.nvim で表示するのでコメントアウト
-- vim.opt.statusline = [[%F%m%h%w %<[ENC=%{&fenc != '' ? &fenc : &enc}] [FMT=%{&ff}] [TYPE=%Y] %=[CODE=0x%02B] [POS=%l/%L(%02v)] ]]

-- 制御文字の表示設定
-- see: https://maku77.github.io/p/s596qii/
vim.opt.listchars = { tab = "».", trail = "_", eol = "↵" }
vim.opt.list = true

-- カーソル行／カーソル列を強調表示
-- see: https://maku77.github.io./p/osrx94g/
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Show double byte spaces
-- see: https://maku77.github.io/p/preoa93/
vim.cmd[[
  match myDoubleByteSpace /　/
  hi myDoubleByteSpace term=underline ctermbg=blue guibg=darkgray
]]

-- カーソル行／カーソル列の背景色
-- see: https://maku77.github.io./p/osrx94g/
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#0044ee", ctermbg = "blue" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#002299", ctermbg = "blue" })

-- 指定したカラム位置に縦線を表示
-- see: https://maku77.github.io/p/ngz6n6i/
vim.opt.colorcolumn = "80,100"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#333300", ctermbg = "lightgray" })

-- 行番号の色
vim.api.nvim_set_hl(0, "LineNr", { fg = "#cc2244", bg = "#551100", ctermfg = "black", ctermbg = "gray" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#dd3355", bg = "#772211", ctermfg = "black", ctermbg = "gray" })

---- タブの色設定（仮）
-- タブライン全体の色
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#200500" })
-- アクティブでないタブの色
vim.api.nvim_set_hl(0, "TabLine", { fg = "#bb8855", bg = "#552200" })
-- アクティブなタブの色
-- vim.api.nvim_set_hl(0, "TabLineSel", { fg = "black", bg = "#99ddff" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "black", bg = "orange" })

-- タブラインの表示設定（仮）
function TabLine()
  local s = ""
  for i = 1, vim.fn.tabpagenr('$') do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    -- ファイル名だけにする
    local label = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
    -- local label = bufname ~= "" and bufname or "[No Name]"
    -- 編集されていて保存されていない場合は ● をつける
    local modified = vim.fn.getbufvar(bufnr, "&modified") == 1 and " ●" or ""

    if i == vim.fn.tabpagenr() then
      s = s .. "%#TabLineSel#《" .. i .. "》" .. label .. modified .. " %#TabLine#"
    else
      s = s .. "%#TabLine#《" .. i .. "》".. label .. modified .. " "
    end
  end
  -- 余白部分に TabLineFill を適用（色設定のため）
  s = s .. "%#TabLineFill#%="
  return s
end
vim.opt.tabline = "%!v:lua.TabLine()"
vim.opt.showtabline = 2  -- 常にタブラインを表示する

-- コマンドを登録する
vim.api.nvim_create_user_command("Hugo", utils.InsertHugoFrontMatter, {})
vim.api.nvim_create_user_command("Id", utils.InsertId, {})

--
-- GUI モード（nvim-qt など）のフォント設定
--
-- 白源 (HackGen Console NF) フォントのダウンロードは下記から。
-- https://github.com/yuru7/HackGen/releases
-- Nerd Font が組み込まれているのでリッチな UI 表示に使える。
-- see: https://maku77.github.io/p/e3xdbxe/
--
--- if vim.fn.has('gui_running') == 1 then
---   if vim.fn.has("win64") == 1 then
---     vim.o.guifont = "HackGen Console NF:h14"
---   else
---     vim.o.guifont = "HackGen Console NF:h18"
---   end
--- end

