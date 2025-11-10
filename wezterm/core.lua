local M = {}

-- フォント名の定数
local FONT_NAME = "HackGen Console NF"

function M.setup(wezterm, config)
  -- カラースキーム設定 (AdventureTime, Batman, Cappuccin Mocha, Dracula, etc.)
  config.color_scheme = "Dracula"

  -- フォント設定 (Download: https://github.com/yuru7/HackGen)
  config.font = wezterm.font(FONT_NAME)

  -- 初期ウィンドウサイズ、フォントサイズ、カラースキームの設定
  config.initial_cols = 100
  config.initial_rows = 25
  config.font_size = 16

  config.show_new_tab_button_in_tab_bar = false  -- タブの追加ボタンを非表示（Cmd+Tで新しいタブを開けるので不要）
  -- config.show_close_tab_button_in_tabs = false -- タブを閉じるボタンを非表示（Cmd+Wでタブを閉じるので不要）
  -- config.use_fancy_tab_bar = false  -- 立体感のないフラットなタブバーにする
  -- config.hide_tab_bar_if_only_one_tab = true  -- タブが1つだけのときはタブバーを非表示
  -- config.tab_bar_at_bottom = true  -- タブをウィンドウの下部に表示
  -- config.window_decorations = "RESIZE"  -- タイトルバーを非表示
  config.window_decorations = "INTEGRATED_BUTTONS|RESIZE" -- タブバーとボタン類を統合する
  -- config.integrated_title_button_style = "Windows"

  config.default_cursor_style = "BlinkingBlock"  -- カーソルを点滅するブロックに設定
  config.enable_scroll_bar = true  -- スクロールバーを表示

  -- use_fancy_tab_bar = true [default] のときこの設定が使われる
  config.window_frame = {
    font_size = 16,  -- タブのフォントサイズ
    active_titlebar_bg = "#111",  -- Windowアクティブ時のタブバーの背景色
    inactive_titlebar_bg = "#ccc",  -- Window非アクティブ時のタブバーの背景色
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

    -- use_fancy_tab_bar = false のときこの色が使われる
    tab_bar = {
      background = "#111",  -- タブバー全体の背景色（none:透過）
      inactive_tab_edge = "#666",  -- The color of the inactive tab bar edge/divider
      active_tab = { bg_color = "#9ef", fg_color = "#039" },
      inactive_tab = { bg_color = "#039", fg_color = "#79f" },
    },
  }
end

return M
