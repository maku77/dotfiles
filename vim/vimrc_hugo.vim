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
  let randomId = s:RandStr(7)

  let title = "title: \"\"\n"
  let linkTitle = "linkTitle: \"\"\n"
  let url = "url: \"p/" . randomId . "/\"\n"
  let date = "date: \"" . strftime("%Y-%m-%d") . "\"\n"
  let tags = "tags: [\"\"]\n"
  let draft = "draft: true\n"
  execute ":normal gg"
  execute ":normal I" . "---\n" . title . linkTitle . url . date . tags . draft . "---\n\n"
  execute ":normal gg"
endfunction

" code ショートコードを挿入する
function! s:InsertCodeShortcode()
  execute ":normal o"
  execute ":normal I" . "{{< code lang=\"\" title=\"\" >}}\n\n{{< /code >}}"
  execute ":normal 2k"
  execute ":normal /\""
  execute ":normal 3l"
endfunction

" gamedb.org 用の JSON テンプレートを挿入する
function! s:InsertGameJson()
  execute ":normal o"
  execute ":normal I" . "    {"
  execute ":normal o"
  execute ":normal I" . "      \"id\": \"" . s:RandStr(7) . "\","
  execute ":normal o"
  execute ":normal I" . "      \"gid\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"title\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"title_en\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"retro\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"rom\": false,"
  execute ":normal o"
  execute ":normal I" . "      \"amazon\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"wikipedia\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"date\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"canonical_genre\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"genre\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"maker\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"players\": null,"
  execute ":normal o"
  execute ":normal I" . "      \"simultaneous\": null,"
  execute ":normal o"
  execute ":normal I" . "      \"serial\": \"\","
  execute ":normal o"
  execute ":normal I" . "      \"price\": null"
  execute ":normal o"
  execute ":normal I" . "    },"
  execute ":normal 14k"
  execute ":normal 11l"
endfunction

" Hugo コマンドを定義する
command! Hugo call s:InsertHugoFrontMatter()

" Code コマンドを定義する
command! Code call s:InsertCodeShortcode()

" Game コマンドを定義する
command! Game call s:InsertGameJson()

