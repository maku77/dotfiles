local utils = require("config.utils")

-- タブの切り替え
-- see: https://maku77.github.io/p/c9kmay4/
-- see: https://maku77.github.io/p/ksmwhv8/
vim.keymap.set("n", "<C-h>", ":tabprev<CR>")
vim.keymap.set("n", "<C-j>", ":tabprev<CR>")
vim.keymap.set("n", "<C-k>", ":tabnext<CR>")
vim.keymap.set("n", "<C-l>", ":tabnext<CR>")
vim.keymap.set("n", "<Leader>h", ":tabprev<CR>") 
vim.keymap.set("n", "<Leader>j", ":tabprev<CR>") 
vim.keymap.set("n", "<Leader>k", ":tabnext<CR>") 
vim.keymap.set("n", "<Leader>l", ":tabnext<CR>") 

vim.keymap.set("n", "<Tab>", ":tabnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":tabprev<CR>")

-- Stay visual mode after indenting/formatting code
-- see: https://maku77.github.io/p/hoihkfy/
vim.keymap.set("v", "=", "=gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- ノーマルモード時に F1 キーで設定ファイルを開く
-- see: https://maku77.github.io/p/r5fcfgk/
vim.keymap.set("n", "<F1>", ":tabnew $MYVIMRC<CR>")

-- F1 キーで今日の日付を挿入
vim.keymap.set("i", "<F1>", utils.insert_date, {
  silent = true,
  desc = "Insert today’s date under the cursor"
})

-- F5 キーで編集中の .lua ファイルを実行
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.keymap.set("n", "<F5>", "<cmd>luafile %<CR>", { buffer = true })
  end
})

-- F12 キーでカレントディレクトリを開く
vim.keymap.set("n", "<F12>", utils.open_current_dir, {
  silent = true,
  desc = "Open current directory in file manager"
})

