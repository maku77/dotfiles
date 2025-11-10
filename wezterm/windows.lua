local M = {}

-- フォント名の定数
local FONT_NAME = "HackGen Console NF"

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

function M.setup(wezterm, config)
  -- Windows かどうかの判断
  local is_windows = wezterm.target_triple:find("windows") ~= nil

  if not is_windows then
    return
  end

  config.font = wezterm.font(FONT_NAME, { weight = "Regular" }) -- Windows の場合のみ標準の太さに設定
  config.front_end = "WebGpu"  -- Windows でウィンドウ下部がチラつく場合
  config.font_size = 14
  config.window_frame.font_size = 12  -- タブのフォントサイズ

  -- Windows で cmd.exe ではなく PowerShell を使うための設定。
  -- pwsh.exe（PowerShell 7+）が利用可能ならそれを使い、なければ powershell.exe（Windows PowerShell）を使う。
  config.default_prog = find_powershell()
end

return M
