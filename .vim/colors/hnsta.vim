""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM : color file
" $Id$
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove all existing highlighting and set the defaults.
hi clear

set background=dark

" Load the syntax highlighting defaults, if it's enabled.
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'hnsta'

" Base
hi SpecialKey   term=standout   cterm=underline ctermfg=cyan      ctermbg=none
hi NonText      term=standout   cterm=none      ctermfg=darkred   ctermbg=none 
hi LineNr       term=standout   cterm=none      ctermfg=black     ctermbg=darkgray
hi Search       term=standout   cterm=none      ctermfg=black     ctermbg=yellow
hi Visual       term=reverse    cterm=none      ctermfg=black     ctermbg=gray
hi VisualNOS    term=reverse    cterm=none      ctermfg=black     ctermbg=gray
hi WildMenu     term=reverse    cterm=none      ctermfg=black     ctermbg=darkyellow
hi Folded       term=standout   cterm=none      ctermfg=darkred   ctermbg=darkgray
hi FoldedColumn term=standout   cterm=none      ctermfg=darkred   ctermbg=darkgray
hi DiffAdd      term=standout   cterm=none      ctermfg=green     ctermbg=darkgray
hi DiffChange   term=standout   cterm=bold      ctermfg=yellow    ctermbg=darkgray
hi DiffDelete   term=standout   cterm=none      ctermfg=red       ctermbg=darkgray
hi DiffText     term=standout   cterm=none      ctermfg=black     ctermbg=red

hi Comment      term=standout   cterm=none      ctermfg=darkred   ctermbg=darkgray
hi Constant     term=standout   cterm=none      ctermfg=darkgreen ctermbg=none
hi Special      term=bold       cterm=none      ctermfg=cyan      ctermbg=none
hi Identifier   term=underline  cterm=none      ctermfg=darkcyan  ctermbg=none
hi Statement    term=bold       cterm=none      ctermfg=blue      ctermbg=none
hi PreProc      term=underline  cterm=none      ctermfg=yellow    ctermbg=none
hi Type         term=underline  cterm=none      ctermfg=green     ctermbg=none
hi Todo         term=standout   cterm=none      ctermfg=gray      ctermbg=darkmagenta

" Diff
hi diffAdded    term=standout   cterm=none      ctermfg=green     ctermbg=darkgray
hi diffChanged  term=standout   cterm=bold      ctermfg=yellow    ctermbg=darkgray
hi diffRemoved  term=standout   cterm=none      ctermfg=red       ctermbg=darkgray
hi diffNewFile  term=standout   cterm=none      ctermfg=green     ctermbg=darkgray
hi diffOldFile  term=standout   cterm=none      ctermfg=red       ctermbg=darkgray

" PHP
hi phpParent    term=standout   cterm=none      ctermfg=gray      ctermbg=none
hi phpOperator  term=standout   cterm=none      ctermfg=gray      ctermbg=none
hi phpRelation  term=standout   cterm=none      ctermfg=gray      ctermbg=none
