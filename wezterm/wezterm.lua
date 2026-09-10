-- see: https://maku.blog/p/adcz2mf/
local wezterm = require "wezterm"
local config = wezterm.config_builder()

require("core").setup(wezterm, config)
require("keys").setup(wezterm, config)
require("test").setup(wezterm, config)
require("windows").setup(wezterm, config)

-- ~/.config/wezterm_local.lua が存在するなら読み込む
local local_config_path = wezterm.home_dir .. "/.config/wezterm_local.lua"

local success, local_config = pcall(dofile, local_config_path)
if success and type(local_config) == "table" then
  -- ローカル設定で上書き
  for k, v in pairs(local_config) do
    config[k] = v
  end
end

return config
