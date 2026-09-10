return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = "<Tab>",
        next = "<S-C-Space>",
      },
    },
    filetypes = {
      gitcommit = true,
      markdown = true,
      yaml = true,
    },
  },
}
