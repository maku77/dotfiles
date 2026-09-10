return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    -- キーマップで簡単に Neotree をトグルできるようにする
    vim.keymap.set("n", "<Leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })
    vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })
  end,
}
