""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM : file types
" $Id$
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect

" Template
au! BufNewFile,BufRead *.tpl setf php

" CoffeeScript 
au! BufRead,BufNewFile,BufReadPre *.coffee  setf coffee
autocmd FileType coffee     setlocal sw=2 st=2 ts=2 et

" YAML
au! BufRead,BufNewFile,BufReadPre *.yaml,*yml setf yaml
autocmd FileType yaml     setlocal sw=2 st=2 ts=2 et

augroup END
