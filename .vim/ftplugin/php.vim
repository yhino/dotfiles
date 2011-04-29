""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM : php
" $Id$
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" SQLハイライト
let php_sql_query = 1
" HTMLハイライト
let php_htmlInString = 1
" ショートタグ無効
let php_noShortTags = 1
" 括弧対応エラーハイライト
let php_parent_error_close = 1
" 対応する閉じ括弧がない開き括弧が存在する場合、php終了タグをスキップ
let php_parent_error_open = 1

"" 編集
" シンタックス設定
setlocal syntax=php

"" キーバインド
" php lint
nnoremap ,l :!php -l %<CR>
nnoremap ,r :!php %<CR>

" AutoComplete
setlocal dictionary+=~/.vim/dict/php.dict
setlocal complete+=k
