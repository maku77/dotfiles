" 指定した長さのランダム文字列を生成する
function! s:RandStr(length)
  let chars = '23456789abcdefghijkmnopqrstuvwxzy'
  let n = len(chars)
  let result = ''
  for i in range(a:length)
    let rand = reltime()[1]
    let result .= chars[rand % n]
  endfor
  return result
endfunction

" 先頭行に Hugo 用のフロントマターを挿入する
function! s:InsertHugoFrontMatter()
  let title = "title: \"\"\n"
  let linkTitle = "linkTitle: \"\"\n"
  let url = "url: \"/p/" . s:RandStr(7) . "\"\n"
  let date = "date: \"" . strftime("%Y-%m-%d") . "\"\n"
  let tags = "tags: []\n"
  execute ":normal gg"
  execute ":normal I" . "---\n" . title . linkTitle . url . date . tags . "---\n\n"
  execute ":normal gg"
endfunction

" Hugo コマンドを定義する
command! Hugo call s:InsertHugoFrontMatter()

