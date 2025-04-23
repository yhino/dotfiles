return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'nvim-lspconfig',
            'Shougo/ddc-source-lsp',
            'b0o/schemastore.nvim',
        },
        config = function()
            require('mason-lspconfig').setup()
            vim.lsp.enable(require('mason-lspconfig').get_installed_servers())
        end
    },
    {
        'neovim/nvim-lspconfig',
    },
    -- Schemas
    {
        'b0o/schemastore.nvim',
    },
}
