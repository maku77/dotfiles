local M = {}

function M.setup(wezterm, config)
  -- Claude Code での複数行入力のため、Shift + Enter で改行シーケンスを送信
  config.keys = {
    {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
  }
end

return M
