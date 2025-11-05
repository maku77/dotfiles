local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- Windows かどうかの判断
local is_windows = wezterm.target_triple:find("windows") ~= nil

-- フォント名の定数
local FONT_NAME = "HackGen Console NF"

-- カラースキーム設定
-- config.color_scheme = "AdventureTime"
-- config.color_scheme = "Batman"
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Dracula"

-- フォント設定
-- Download: https://github.com/yuru7/HackGen
config.font = wezterm.font(FONT_NAME)

-- 初期ウィンドウサイズ、フォントサイズ、カラースキームの設定
config.initial_cols = 100
config.initial_rows = 25
config.font_size = 16

-- config.use_fancy_tab_bar = false  -- 立体感のないフラットなタブバーにする
-- config.hide_tab_bar_if_only_one_tab = true  -- タブが1つだけのときはタブバーを非表示
-- config.tab_bar_at_bottom = true  -- タブをウィンドウの下部に表示
config.show_new_tab_button_in_tab_bar = false  -- タブの追加ボタンを非表示（Cmd+Tで新しいタブを開けるので不要）
-- config.show_close_tab_button_in_tabs = false -- タブを閉じるボタンを非表示（Cmd+Wでタブを閉じるので不要）
-- config.window_decorations = "RESIZE"  -- タイトルバーを非表示
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE" -- タブバーとボタン類を統合する
-- config.integrated_title_button_style = "Windows"

config.default_cursor_style = "BlinkingBlock"  -- カーソルを点滅するブロックに設定
config.enable_scroll_bar = true  -- スクロールバーを表示

config.window_frame = {
  font_size = is_windows and 12 or 14,  -- タブのフォントサイズ
  font = is_windows and wezterm.font(FONT_NAME, { weight = "Regular" }) or nil,  -- Windows の場合のみ標準の太さに設定

  -- The overall background color of the tab bar when the window is focused
  -- （use_fancy_tab_bar = true [default] のときこの色が使われる）
  active_titlebar_bg = "#111",

  -- The overall background color of the tab bar when the window is not focused
  -- これは効かない？
  inactive_titlebar_bg = "#ccc",
}

config.window_background_opacity = 0.8  -- ウィンドウを透過させる
config.macos_window_background_blur = 10  -- ウィンドウの背景をぼかす（macOSのみ）

-- ウィンドウ余白はカーソル矩形の単位で調整すると分かりやすい
config.window_padding = {
  left = "0.5 cell",
  right = "0.5 cell",
  top = "0.1 cell",
  bottom = "0.1 cell",
}

config.colors = {
  cursor_bg = "#f39",
  cursor_fg = "white",
  selection_bg = "lightblue",
  selection_fg = "blue",
  scrollbar_thumb = "#66dd99",  -- スクロールバーのつまみの色
  tab_bar = {
    -- タブバー全体の背景色（none:透過）
    -- （use_fancy_tab_bar = false のときこの色が使われる）
    background = "#111",
    inactive_tab_edge = "#666", -- The color of the inactive tab bar edge/divider
    -- アクティブなタブの色
    active_tab = {
      bg_color = "#9ef",
      fg_color = "#039",
    },
    -- 非アクティブなタブの色
    inactive_tab = {
      bg_color = "#039",
      fg_color = "#79f",
    },
  },
}

-- ファイルが存在するかチェック
local function file_exists(path)
  local file = io.open(path, "r")
  if file then
    file:close()
    return true
  end
  return false
end

-- PATH環境変数から実行ファイルを探す
local function find_executable_in_path(exe_name)
  local path = os.getenv("PATH")
  if not path then
    return nil
  end

  for dir in string.gmatch(path, "[^;]+") do
    local exe_path = dir .. "\\" .. exe_name
    if file_exists(exe_path) then
      return exe_name
    end
  end

  return nil
end

-- 利用可能な PowerShell を見つける
local function find_powershell()
  -- pwsh.exe（PowerShell 7+）を優先
  if find_executable_in_path("pwsh.exe") then
    return { "pwsh.exe", "-NoLogo" }
  end

  -- 見つからなければ powershell.exe（Windows PowerShell）を使用
  return { "powershell.exe", "-NoLogo" }
end

-- Windows で cmd.exe ではなく PowerShell を使うための設定。
-- pwsh.exe（PowerShell 7+）が利用可能ならそれを使い、なければ powershell.exe（Windows PowerShell）を使う。
-- macOS/Linux ではこの設定は無視されるので全環境で設定しておいてよい。
config.default_prog = find_powershell()

return config
