"" dein.vim {{{

if &compatible
    set nocompatible
endif

augroup MyAutoCmd
    autocmd!
augroup END

" Map leader to ,
let mapleader = ','

" Load dein
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" プラグイン設定
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#load_toml('~/.vim/rc/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.vim/rc/deinlazy.toml', {'lazy': 1})
    call dein#load_toml('~/.vim/rc/ddc.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

" 未インストールのものがあったらインストール
if has('vim_starting')
    if dein#check_install()
        call dein#install()
    endif

    filetype plugin indent on
    syntax enable
endif
if !has('vim_starting')
    call dein#call_hook('source')
    call dein#call_hook('post_source')
endif
"" }}}

"" Basic Setup {{{
"*******************************************************************************
"" Basic
"*******************************************************************************
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

"*******************************************************************************
"" Visual
"*******************************************************************************
" 行番号表示
set number

" 入力中コマンド表示
set showcmd

" 対応する括弧を表示
set showmatch
" 対応する括弧にジャンプする(matchit.vim)
source $VIMRUNTIME/macros/matchit.vim

" ステータスラインを常に表示
set laststatus=2

" ステータスライン表示設定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']['.&omnifunc.']'}%=%l,%c%V%8P

" コマンドライン補完を強化
set wildmenu

" カラー設定
set t_Co=256

" 不可視文字表示
set list
set listchars=tab:\ \ ,trail:-
highlight JpSpace cterm=underline   ctermfg=7   ctermbg=88
au VimEnter,WinEnter,BufRead,BufNew * match JpSpace /　/

" 行を強調表示
set cursorline
""}}}

"" Keybinds {{{
"*******************************************************************************
"" Keybinds
"*******************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" open tag
nnoremap <C-]> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-\> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>

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
""}}}

"" Extra Setup {{{1

" php
let g:PHP_vintage_case_default_indent = 1

" Ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab
augroup END

" javascript
set conceallevel=0
let g:vim_json_syntax_conceal = 0

" markdown
let g:vim_markdown_folding_disabled = 1

" diff {{{2
function! ConfigDiffMode()
    if &diff
        set nospell
    else
        set spell
    endif
endfunction
autocmd VimEnter,FilterWritePre * call ConfigDiffMode()

" diffモードで1つしか開いていない時に自動でdiffoffする
auto WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&diff')) == 1 |diffoff |endif

"開いているファイルの初期状態から現在までの違いをdiffモードで表示
if !exists(':DiffOrig')
    command DiffOrig vert new |set bt=nofile |r # |0d_ |diffthis |wincmd p |diffthis
endif
" }}}

" colorscheme-solarized {{{2
set background=dark
colorscheme solarized
call togglebg#map("<F5>")
" }}}

"" }}}

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
