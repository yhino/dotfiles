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
hi Normal       term=standout   cterm=none        ctermfg=246   ctermbg=none
hi SpecialKey   term=standout   cterm=underline   ctermfg=6     ctermbg=none
hi NonText      term=standout   cterm=none        ctermfg=8     ctermbg=none 
hi LineNr       term=standout   cterm=none        ctermfg=15    ctermbg=none
hi Search       term=standout   cterm=none        ctermfg=0     ctermbg=11
hi Visual       term=reverse    cterm=none        ctermfg=0     ctermbg=7
hi VisualNOS    term=reverse    cterm=none        ctermfg=0     ctermbg=7
hi WildMenu     term=reverse    cterm=none        ctermfg=15    ctermbg=5
hi Folded       term=standout   cterm=bold        ctermfg=31    ctermbg=235
hi FoldedColumn term=standout   cterm=none        ctermfg=125   ctermbg=235
hi DiffAdd      term=standout   cterm=none        ctermfg=40    ctermbg=238
hi DiffChange   term=standout   cterm=bold        ctermfg=202   ctermbg=238
hi DiffDelete   term=standout   cterm=none        ctermfg=1     ctermbg=238
hi DiffText     term=standout   cterm=none        ctermfg=0     ctermbg=1

hi Comment      term=standout   cterm=none        ctermfg=237   ctermbg=none
hi Constant     term=standout   cterm=none        ctermfg=30    ctermbg=none
hi Special      term=bold       cterm=none        ctermfg=126   ctermbg=none
hi Identifier   term=underline  cterm=none        ctermfg=130   ctermbg=none
hi Statement    term=bold       cterm=bold        ctermfg=25    ctermbg=none
hi PreProc      term=underline  cterm=none        ctermfg=88    ctermbg=none
hi Type         term=underline  cterm=none        ctermfg=94    ctermbg=none
hi Todo         term=standout   cterm=none        ctermfg=7     ctermbg=88

hi Pmenu        term=standout   cterm=none        ctermfg=7     ctermbg=23
hi PmenuSel     term=standout   cterm=none        ctermfg=23    ctermbg=7

" Diff
hi diffAdded    term=standout   cterm=none        ctermfg=40    ctermbg=238
hi diffChanged  term=standout   cterm=bold        ctermfg=202   ctermbg=238
hi diffRemoved  term=standout   cterm=none        ctermfg=1     ctermbg=238
hi diffNewFile  term=standout   cterm=none        ctermfg=40    ctermbg=none
hi diffOldFile  term=standout   cterm=none        ctermfg=1     ctermbg=none

" PHP
hi phpParent          term=standout cterm=none    ctermfg=178   ctermbg=none
hi phpOperator        term=standout cterm=none    ctermfg=100   ctermbg=none
hi phpRelation        term=standout cterm=none    ctermfg=100   ctermbg=none
hi phpIdentifier      term=standout cterm=none    ctermfg=24    ctermbg=none
hi phpVarSelector     term=standout cterm=none    ctermfg=100   ctermbg=none
hi phpMemberSelector  term=standout cterm=none    ctermfg=100   ctermbg=none
hi phpStatement       term=standout cterm=none    ctermfg=88    ctermbg=none

hi link phpFold           Folded
hi link phpFoldFunction   phpFold
hi link phpFoldClass      phpFold
hi link phpFoldInterface  phpFold
hi link phpFoldTry        phpFold
hi link phpFoldCatch      phpFold
hi link phpFoldHtmlInside phpFold
