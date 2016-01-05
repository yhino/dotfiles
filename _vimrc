"" Plugins: NeoBundle {{{
"*******************************************************************************
"" NeoBundle load
"*******************************************************************************
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"*******************************************************************************
"" NeoBundle install packages
"*******************************************************************************
"" Basics
if !( has('lua') && (v:version > 703 || v:version == 703 && has('patch885')) )
    NeoBundle 'Shougo/neocomplcache.vim'
else
    NeoBundle 'Shougo/neocomplete.vim'
endif
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build': {
            \       'mac': 'make -f make_mac.mak',
            \       'unix': 'make -f make_unix.mak',
            \       },
            \ }
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'tpope/vim-surround'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'scrooloose/syntastic'
NeoBundle "majutsushi/tagbar"
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'L9'
NeoBundle 'sudo.vim'

"" Color
NeoBundle 'altercation/vim-colors-solarized'

"" Python
NeoBundle "davidhalter/jedi-vim"
NeoBundle "Yggdroot/indentLine"

"" Perl
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'c9s/perlomni.vim'

"" PHP
NeoBundle 'StanAngeloff/php.vim'
NeoBundle '2072/PHP-Indenting-for-VIm'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'evidens/vim-twig'

"" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-endwise'
NeoBundle "tpope/vim-rails"
NeoBundle "tpope/vim-rake"
NeoBundle "tpope/vim-projectionist"

"" Go Lang
NeoBundle "fatih/vim-go"

"" Javascript
NeoBundle 'pangloss/vim-javascript'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elzr/vim-json'

"" Less
NeoBundle 'groenewege/vim-less'

"" HTML
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'tpope/vim-haml'
NeoBundle 'mattn/emmet-vim'

"" Markdown
NeoBundle 'rcmdnk/vim-markdown'

if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
"" }}}

"" Basic Setup {{{
"*******************************************************************************
"" Basic
"*******************************************************************************
" Map leader to ,
let mapleader = ','

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

" ステータスラインを常に表示
set laststatus=2

" ステータスライン表示設定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']['.&omnifunc.']'}%=%l,%c%V%8P

" コマンドライン補完を強化
set wildmenu

" カラー設定
set t_Co=256

" ハイライト
syntax on

" カラースキーム
"" for solarized
set background=dark
"set background=light
colorscheme solarized
call togglebg#map("<F5>")

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

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

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

"" Plugin Setup {{{
" matchit.vim
source $VIMRUNTIME/macros/matchit.vim

if neobundle#is_installed('neocomplete.vim')
    " neocomplete
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ }
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
elseif neobundle#is_installed('neocomplcache.vim')
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
endif

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

" VimFiler
nnoremap <leader>e :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1

" zencoding
let s:user_zen_settings = { 'indentation': "    " }

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
" ファイルを開いたときにsyntaxチェック
let g:syntastic_check_on_open = 1
" javascriptのsyntaxチェックツールをjshintに固定
let g:syntastic_javascript_checkers = ['jshint']

" auto-ctags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" php
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

let g:PHP_vintage_case_default_indent = 1

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

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
let g:vim_json_syntax_conceal = 0

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

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
