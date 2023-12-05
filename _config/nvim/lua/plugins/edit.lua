return {
    { 'scrooloose/nerdcommenter' },
    {
        'kylechui/nvim-surround',
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup {}
        end
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()
            require('nvim-autopairs').setup {}
        end,
    },
    {
        'windwp/nvim-ts-autotag',
        event = 'InsertEnter',
        config = function()
            require('nvim-treesitter.configs').setup {
                autotag = {
                    enable = true,
                },
            }
        end,
    },
    {
       'tpope/vim-endwise',
        event = 'InsertEnter',
        config = function()
            require('nvim-treesitter.configs').setup {
                endwise = {
                    enable = true,
                },
            }
        end,
    },
}
