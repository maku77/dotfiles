-- 同じグループのオートコマンドが定義されている場合はクリアする
local my_group = vim.api.nvim_create_augroup("my_group", { clear = true })

-- ファイルタイプ別にインデント設定
-- see: https://maku77.github.io/p/b5o6ksu/
vim.api.nvim_create_autocmd("FileType", {
  group = my_group,
  pattern = { "lua", "markdown", "ruby", "svelte" },
  callback = function()
    vim.opt_local.expandtab = true   -- タブキーでスペースを入力する
    vim.opt_local.shiftround = true  -- シフトコマンドでのインデント量を tabstop 単位に丸める
    vim.opt_local.tabstop = 2        -- タブ文字の表示幅
    vim.opt_local.shiftwidth = 2     -- シフトコマンドでのインデント量
    vim.opt_local.softtabstop = -1   -- タブキーで入力するスペース数 (-1: tabstop に合わせる)
  end,
})

-- ヤンク時に選択範囲をハイライト表示する 
-- see: https://maku77.github.io/p/9qyei4z/
vim.api.nvim_create_autocmd("TextYankPost", {
  group = my_group,
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

---- BufEnter 時に scroll 値を変えるようにしていると、
---- telescope.nvim のウィンドウを開くときにエラーになるのでコメントアウト。
---- (2025-11-04)
--
-- Number of lines to scroll with CTRL-U and CTRL-D commands.
-- scroll 値は自動的に変更されてしまうため、バッファ切替時に再設定しておく。
-- see: https://maku77.github.io/p/gu9om5z/
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = my_group,
--   pattern = "*",
--   callback = function()
--     vim.opt_local.scroll = 3
--   end,
-- })
