" 0〜n-1 の範囲のランダム整数を生成する
function! s:RandNum(n)
  return reltime()[1] % (a:n)
endfunction

" 指定した長さのランダム文字列を生成する
function! s:RandStr(length)
  let chars = '23456789abcdefghijkmnopqrstuvwxzy'
  let n = len(chars)
  let result = ''
  for i in range(a:length)
    let result .= chars[s:RandNum(n)]
  endfor
  return result
endfunction

" 先頭行に Hugo 用のフロントマターを挿入する
function! s:InsertHugoFrontMatter()
  let title = "title: \"\"\n"
  let url = "url: \"/p/" . s:RandStr(7) . "\"\n"
  let date = "date: \"" . strftime("%Y-%m-%d") . "\"\n"
  let tags = "tags: []\n"
  execute ":normal gg"
  execute ":normal I" . "---\n" . title . url . date . tags . "---\n\n"
  execute ":normal gg"
endfunction

" Hugo コマンドを定義する
command! Hugo call s:InsertHugoFrontMatter()

