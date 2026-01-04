local M = {}


function M.setup(wezterm, config)
  -- タブのタイトル表示用のキャッシュ
  g_tab_titles = {}

  -- タブバーの右端にファイルパスを表示
  wezterm.on("update-status", function(window, pane)
    local cwd_uri = pane:get_current_working_dir()
    if cwd_uri then
      window:set_right_status(cwd_uri.file_path .. " ")

      -- タブタイトルのキャッシュとしてディレクトリ名を保存
      local full_path = cwd_uri.file_path
      local dir_name = full_path:match("([^/]+)$") or full_path
      g_tab_titles[pane:pane_id()] = dir_name
    end
  end)

  wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local prefix = "[" .. tab.tab_index + 1 .. "] "
    local title = g_tab_titles[tab.active_pane.pane_id] or tab.active_pane.title
    return prefix .. title
  end)

end

return M

