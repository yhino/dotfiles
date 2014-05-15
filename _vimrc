""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM : base
" $Id$
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" {{{ neobundle
" Load NeoBundle
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle'))

" NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

" github repos
"" Editor
if !( has('lua') && (v:version > 703 || v:version == 703 && has('patch885')) )
    NeoBundle 'Shougo/neocomplcache'
else
    NeoBundle 'Shougo/neocomplete.vim'
endif
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
"" Syntax, Indent
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'JavaScript-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'evidens/vim-twig'
"" Utility
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
"" Color Scheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'

" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'sudo.vim'
NeoBundle 'PDV--phpDocumentor-for-Vim'

filetype plugin indent on
"" }}}

"" {{{ Plugin
" matchit.vim
source $VIMRUNTIME/macros/matchit.vim

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_dictionary_filetype_lists = {
            \ }
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-u><C-u> :<C-u>Unite -buffer-name=files buffer file_mru file file/new<CR>
inoremap <silent> <C-u><C-u> <ESC>:<C-u>Unite -buffer-name=files buffer file_mru file file/new<CR>
nnoremap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru file file/new<CR>
inoremap <silent> <C-u><C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru file file/new<CR>
" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 横分割で開く
  nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  " 縦分割で開く
  nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

" unite-outline
nnoremap <silent> <C-u><C-o> :<C-u>Unite outline<CR>
inoremap <silent> <C-u><C-o> <ESC>:<C-u>Unite outline<CR>

" zencoding
let s:user_zen_settings = { 'indentation': "    " }

" syntastic
" ファイルを開いたときにsyntaxチェック
let g:syntastic_check_on_open = 1
" javascriptのsyntaxチェックツールをjshintに固定
let g:syntastic_javascript_checker = "jshint"

" markdown
let g:vim_markdown_folding_disabled = 1

" lightline
let g:lightline = {
            \   'active': {
            \       'left': [ [ 'mode', 'paste' ], ['readonly', 'filename', 'modified' ], [ 'fugitive' ] ]
            \   },
            \   'inactive': {
            \       'left': [ [ 'readonly', 'filename', 'modified' ], [ 'fugitive' ] ]
            \   },
            \   'component': {
            \       'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
            \   },
            \   'component_visible_condition': {
            \       'fugitive': '(exists("*figitive#head") && ""!=fugitive#head())'
            \   }
            \ }

"" }}}

"" {{{ Commons
" 文字コード
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932

" 改行コード
set fileformats=unix,dos,mac

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" バックアップを作成しない
set nobackup
set nowritebackup

"" 画面表示
" 行番号表示
set number
" 入力中コマンド表示
set showcmd
" 対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" ステータスライン表示設定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']['.&omnifunc.']'}%=%l,%c%V%8P
" コマンドライン補完を強化
set wildmenu
" カラー設定
if &term =~ 'xterm'
  if &term == 'xterm-256color'
    set t_Co=256
  else
    set t_Co=16
  endif
  set t_Sf=<ESC>[3%dm
  set t_Sb=<ESC>[4%dm
endif
" ハイライト
syntax on
" カラースキーム
"colorscheme hnsta
"let g:hybrid_use_iterm_colors = 1
"colorscheme hybrid
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
" 不可視文字表示
set list
set listchars=tab:\ \ ,trail:-
highlight JpSpace cterm=underline   ctermfg=7   ctermbg=88
au BufRead,BufNew * match JpSpace /　/
" 行を強調表示
set cursorline

"" 編集
" オートインデント有効
set autoindent smartindent
" タブ
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
" たたみ方
set foldmethod=marker
" Backspace
set backspace=indent,eol,start
" カーソルの回り込み設定
set whichwrap=[,],<,>

"" 検索
" 検索文字列が小文字の場合は大文字小文字区別なく検索
set ignorecase
" 検索文字列に大文字が含まれている場合は大文字小文字区別して検索
set smartcase
" 検索時に末尾に達したら先頭まで戻る
set wrapscan
" 検索文字列入力時に順次検索をしない
set noincsearch
" 検索結果文字列をハイライト
set hlsearch

"" キーバインド
" 表示行単位の移動
nnoremap j gj
nnoremap k gk
" 行単位の移動
nnoremap gj j
nnoremap gk k
" カーソルを画面中央に置いてスクロール
nnoremap <Space> jzz
nnoremap <S-Space> kzz
" 検索結果のハイライト取り消し
noremap <ESC><ESC> :nohlsearch<CR><ESC>
"" }}}

