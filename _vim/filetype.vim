""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM : file types
" $Id$
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect

" CoffeeScript 
au! BufRead,BufNewFile,BufReadPre *.coffee  setf coffee
autocmd FileType coffee     setlocal sw=2 st=2 ts=2 et

" javascript
autocmd FileType javascript setlocal sw=2 st=2 ts=2 et

" json
autocmd FileType json       setlocal sw=2 st=2 ts=2 et

augroup END
