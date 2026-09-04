return {
    {
        'mason-org/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = {
            'mason-org/mason.nvim',
            'nvim-lspconfig',
            'Shougo/ddc-source-lsp',
            'b0o/schemastore.nvim',
        },
        opts = {
            ensure_installed = {
                'gopls',
                'pyright',
                'ruff',
                'jsonls',
                'yamlls',
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
    },
    -- Schemas
    {
        'b0o/schemastore.nvim',
    },
}
