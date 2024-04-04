return {
    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'b0o/schemastore.nvim',
            'Shougo/ddc-source-lsp',
        },
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require("ddc_source_lsp").make_client_capabilities()
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup {
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                        validate = { enable =true },
                    },
                },
            }
        end
    },
}
