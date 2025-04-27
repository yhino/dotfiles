return {
    -- colorscheme
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = function()
            vim.o.background = 'dark'
            vim.cmd([[colorscheme gruvbox]])
        end
    },
    -- highlight
    { 'Shougo/context_filetype.vim' },
    {
        'osyo-manga/vim-precious',
        dependencies = { 'Shougo/context_filetype.vim' },
    },
    {
        'miyakogi/seiya.vim',
        init = function()
            vim.g.seiya_auto_enable = 1
            vim.g.seiya_target_groups = {'guibg'}
        end,
    },
}
