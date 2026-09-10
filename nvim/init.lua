-- Leader キーをスペースキーに変更 （注: <Leader> を参照する前に設定すること）
-- see: https://maku77.github.io/p/c9kmay4/
vim.g.mapleader = " "

require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Copilot suggestion highlight
vim.api.nvim_set_hl(0, 'CopilotSuggestion', { fg = '#DDFFEE', bg = '#339966' })

