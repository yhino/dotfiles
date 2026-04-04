return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local treesitter = require('nvim-treesitter')
            local languages = {'markdown', 'python', 'javascript', 'typescript', 'vim'}
            treesitter.setup {}
            -- install languages
            treesitter.install(languages)
            -- enable highlight
            vim.api.nvim_create_autocmd('FileType', {
                pattern = languages,
                callback = function() vim.treesitter.start() end,
            })
            -- enable indent
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    },
}

