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
" 折りたたみ無効
let php_folding = 0
" 括弧対応エラーハイライト
let php_parent_error_close = 1
" 対応する閉じ括弧がない開き括弧が存在する場合、php終了タグをスキップ
let php_parent_error_open = 1

"" 編集
" シンタックス設定
"setlocal syntax=php
" たたみ方
setlocal foldmethod=manual
" PHP fast folds 有効化
EnableFastPHPFolds
" エラーの箇所に飛ぶ
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

"" キーバインド
" php lint
nnoremap ,l :!php -l %<CR>
nnoremap ,r :!php %<CR>

" AutoComplete
setlocal dictionary+=~/.vim/dict/php.dict
setlocal complete+=k

" PHPDocumentor
inoremap <C-P> <ESC> :call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>
