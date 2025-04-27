return {
    { 'scrooloose/nerdcommenter' },
    {
        'kylechui/nvim-surround',
        event = "VeryLazy",
        opts = {},
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
    },
    {
        'windwp/nvim-ts-autotag',
        opts = {},
    },
    {
       'RRethy/nvim-treesitter-endwise',
    },
    {
        'junegunn/vim-easy-align',
        keys = {
            { 'ga', '<Plug>(EasyAlign)', mode = { 'n', 'x' } },
        },
    },
}
