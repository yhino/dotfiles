""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM : base
" $Id$
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vundle
" Load Vundle
set rtp+=~/.vim/vundle/
call vundle#rc()
" Bundles
Bundle 'unite.vim'
Bundle 'neocomplcache'
Bundle 'ZenCoding.vim'

"" Plugins
" FileType
filetype plugin indent on
" matchit.vim
source $VIMRUNTIME/macros/matchit.vim
" neocomplcache
let g:neocomplcache_enable_at_startup = 1

"" Commons
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
" カラースキーム
colorscheme hnsta
" ハイライト
syntax on

"" 編集
" オートインデント有効
set autoindent
" タブ
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
" たたみ方
set foldmethod=marker

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
" 検索結果のハイライト取り消し
noremap <ESC><ESC> :nohlsearch<CR><ESC>
