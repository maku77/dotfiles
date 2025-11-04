local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- カラースキーム設定
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = 'Dracula'

-- フォント設定
-- Download: https://github.com/yuru7/HackGen
config.font = wezterm.font 'HackGen Console NF'

-- 初期ウィンドウサイズ、フォントサイズ、カラースキームの設定
config.initial_cols = 100
config.initial_rows = 25
config.font_size = 16

config.enable_scroll_bar = true  -- スクロールバーを表示
-- config.window_decorations = "RESIZE"  -- タイトルバーを非表示
config.use_fancy_tab_bar = false  -- 立体感のないフラットなタブバーにする
-- config.tab_bar_at_bottom = true  -- タブをウィンドウの下部に表示
config.show_new_tab_button_in_tab_bar = false  -- タブの追加ボタンを非表示（Cmd+Tで新しいタブを開けるので不要）

-- ウィンドウ装飾の設定（タブバーとボタン類を統合する）
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Windows"

config.default_cursor_style = "BlinkingBlock"  -- カーソルを点滅するブロックに設定

config.window_frame = {
  font_size = 14.0,  -- タブバーの文字サイズ
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
  scrollbar_thumb = '#66dd99',  -- スクロールバーのつまみの色
  tab_bar = {
    background = "#222",  -- タブバー全体の背景色（none:透過）
    -- アクティブなタブの色
    active_tab = {
      bg_color = '#ff99aa',
      fg_color = '#000000',
    },
    -- 非アクティブなタブの色
    inactive_tab = {
      bg_color = '#666666',
      fg_color = '#000000',
    },
    inactive_tab_edge = "none",
  },
}

return config
