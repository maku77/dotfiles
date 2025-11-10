-- see: https://maku.blog/p/adcz2mf/
local wezterm = require "wezterm"
local config = wezterm.config_builder()

require("core").setup(wezterm, config)
require("keys").setup(wezterm, config)
require("test").setup(wezterm, config)
require("windows").setup(wezterm, config)

return config
