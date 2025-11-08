-- see: https://maku.blog/p/adcz2mf/
local wezterm = require "wezterm"
local config = wezterm.config_builder()

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local has_unseen_output = false
  for _, pane in ipairs(tab.panes) do
    if pane.has_unseen_output then
      has_unseen_output = true
      break
    end
  end
  local title = tab.active_pane.title
  if has_unseen_output then
    title = title .. " 💡"
  end
  return title
end)

wezterm.on('update-status', function(window, pane)
  -- Each element holds the text for a cell in a "powerline" style << fade
  local cells = {}

  -- Figure out the cwd and host of the current pane.
  -- This will pick up the hostname for the remote host if your
  -- shell is using OSC 7 on the remote host.
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    local cwd = ''
    local hostname = ''

    if type(cwd_uri) == 'userdata' then
      -- Running on a newer version of wezterm and we have
      -- a URL object here, making this simple!

      cwd = cwd_uri.file_path
      hostname = cwd_uri.host or wezterm.hostname()
    else
      -- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
      -- which doesn't have the Url object
      cwd_uri = cwd_uri:sub(8)
      local slash = cwd_uri:find '/'
      if slash then
        hostname = cwd_uri:sub(1, slash - 1)
        -- and extract the cwd from the uri, decoding %-encoding
        cwd = cwd_uri:sub(slash):gsub('%%(%x%x)', function(hex)
          return string.char(tonumber(hex, 16))
        end)
      end
    end

    -- Remove the domain name portion of the hostname
    local dot = hostname:find '[.]'
    if dot then
      hostname = hostname:sub(1, dot - 1)
    end
    if hostname == '' then
      hostname = wezterm.hostname()
    end

    table.insert(cells, cwd)
    table.insert(cells, hostname)
  end

  -- I like my date/time in this style: "Wed Mar 3 08:14"
  local date = wezterm.strftime '%a %b %-d %H:%M'
  table.insert(cells, date)

  -- An entry for each battery (typically 0 or 1 battery)
  for _, b in ipairs(wezterm.battery_info()) do
    table.insert(cells, string.format('%.0f%%', b.state_of_charge * 100))
  end

  -- The powerline < symbol
  local LEFT_ARROW = utf8.char(0xe0b3)
  -- The filled in variant of the < symbol
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Color palette for the backgrounds of each cell
  local colors = {
    '#3c1361',
    '#52307c',
    '#663a82',
    '#7c5295',
    '#b491c8',
  }

  -- Foreground color for the text across the fade
  local text_fg = '#c0c0c0'

  -- The elements to be formatted
  local elements = {}
  -- How many cells have been formatted
  local num_cells = 0

  -- Translate a cell into elements
  function push(text, is_last)
    local cell_no = num_cells + 1
    table.insert(elements, { Foreground = { Color = text_fg } })
    table.insert(elements, { Background = { Color = colors[cell_no] } })
    table.insert(elements, { Text = ' ' .. text .. ' ' })
    if not is_last then
      table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
      table.insert(elements, { Text = SOLID_LEFT_ARROW })
    end
    num_cells = num_cells + 1
  end

  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, #cells == 0)
  end

  window:set_right_status(wezterm.format(elements))
end)

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
config.font_size = is_windows and 14 or 16

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

-- Claude Code での複数行入力のため、Shift + Enter で改行シーケンスを送信
config.keys = {
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
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
if is_windows then
  config.default_prog = find_powershell()
end

return config
