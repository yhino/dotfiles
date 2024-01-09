return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'gruvbox',
                    component_separators = '|',
                    section_separators = '',
                },
                sections = {
                    lualine_x = {
                        { 'encoding' },
                        {
                            'fileformat',
                            icons_enabled = false,
                        },
                        { 'filetype' },
                    }
                },
            }
        end,
    },
}
