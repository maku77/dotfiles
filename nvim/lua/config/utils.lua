local M = {}

-- 乱数用のシードを設定する
math.randomseed(os.time())

-- 日付 (YYYY-MM-DD) を挿入する関数
function M.insert_date()
  -- NeoVim の built-in 関数を使って現在の日付を YYYY-MM-DD 形式で取得
  local date_str = vim.fn.strftime("%Y-%m-%d", vim.fn.localtime())
  -- カーソルの位置に日付を挿入
  vim.api.nvim_put({ date_str }, "", false, true)
end

-- 編集中ファイルが格納されたディレクトリを開く関数
-- see: https://maku77.github.io/p/tqmr4od/
function M.open_current_dir()
  local command
  if vim.fn.has("mac") == 1 then
    command = "open"
  elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    command = "start"
  else
    print("Could not open the directory (unsupported OS)")
    return
  end

  local dir_path = vim.fn.expand("%:p:h")
  vim.fn.system(command .. " " .. dir_path)
end

-- 指定した長さのランダム文字列を生成する
local function RandStr(length)
  local chars = "23456789abcdefghijkmnopqrstuvwxzy"
  local n = #chars
  local result = ""
  for i = 1, length do
    local rnd = math.random(n)
    result = result .. chars:sub(rnd, rnd)
  end
  return result
end

-- 7 桁のランダム ID を挿入する
function M.InsertId()
  local id = RandStr(7)
  vim.api.nvim_command("normal! i" .. id)
end

-- 先頭行に Hugo 用のフロントマターを挿入する
function M.InsertHugoFrontMatter()
  local randomId = RandStr(7)

  local title = 'title: ""\n'
  local linkTitle = 'linkTitle: ""\n'
  local url = 'url: "p/' .. randomId .. '/"\n'
  local date = 'date: "' .. os.date("%Y-%m-%d") .. '"\n'
  local tags = 'tags: [""]\n'
  local draft = 'draft: true\n'

  local frontMatter = "---\n" .. title .. linkTitle .. url .. date .. tags .. draft .. "---\n\n"

  vim.api.nvim_command("normal! gg")
  vim.api.nvim_command("normal! I" .. frontMatter)
  vim.api.nvim_command("normal! gg")
end


return M

