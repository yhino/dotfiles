return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
                {'<leader>ft', '<cmd>Telescope<cr>'},
                {'<leader>fd', '<cmd>Telescope file_browser<cr>'},
                {'<leader>ff', '<cmd>Telescope find_files<cr>'},
                {'<leader>fg', '<cmd>Telescope live_grep<cr>'},
                {'<leader>fb', '<cmd>Telescope buffers<cr>'},
                {'<leader>fr', '<cmd>Telescope oldfiles<cr>'},
                {'<C-]>', '<cmd>Telescope lsp_definitions jump_type=never<cr>'},
                {'<C-\\>', '<cmd>Telescope lsp_references<cr>'},
        },
        config = function()
            local actions = require('telescope.actions')
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ['<C-j>'] = actions.select_horizontal,
                            ['<esc>'] = actions.close
                        }
                    }
                }
            }
        end,
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('telescope').load_extension 'file_browser'
        end,
    },
}
