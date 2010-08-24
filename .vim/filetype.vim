""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM : file types
" $Id$
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect

" HTML
au! BufNewFile,BufRead *.html   setf php

" Template
au! BufNewFile,BufRead *.tpl    setf php

augroup END
