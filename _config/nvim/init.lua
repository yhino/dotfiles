-- =============================================================================
-- basic
-- =============================================================================
vim.g.python3_host_prog = '/usr/bin/python3'

vim.o.termguicolors = true
vim.o.mouse = ''  -- disabled mouse

vim.o.cursorline = true
vim.o.number = true
vim.o.list = true
vim.opt.listchars:append { tab = '  ' }
vim.o.showcmd = true
vim.o.showmatch = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 0
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.whichwrap = '<,>,[,]'
vim.o.foldmethod = 'marker'

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = true
vim.o.incsearch = false
vim.o.hlsearch = true

-- =============================================================================
-- keymap
-- =============================================================================
vim.g.mapleader = ' '

-- 表示行単位の移動
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- 行単位の移動
vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')

-- カーソルを画面中央に置いてスクロール
vim.keymap.set('n', '<Space>', 'jzz')
vim.keymap.set('n', '<S-Space>', 'kzz')

-- 検索結果のハイライト取り消し
vim.keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>')

-- =============================================================================
-- plugins
-- =============================================================================
local lazy_path = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazy_path,
    })
end
vim.opt.rtp:prepend(lazy_path)
require("lazy").setup("plugins")
