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
            require('mason-lspconfig').setup_handlers {
                function (server_name)
                    local capabilities = require('ddc_source_lsp').make_client_capabilities()
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
                ['jsonls'] = function ()
                    require('lspconfig').jsonls.setup {
                        settings = {
                            json = {
                                schemas = require('schemastore').json.schemas(),
                                validate = { enable = true },
                            },
                        },
                    }
                end,
                ['yamlls'] = function ()
                    require('lspconfig').yamlls.setup {
                        settings = {
                            yaml = {
                                schemaStore = {
                                    enable = false,
                                    url = '',
                                },
                                schemas = require('schemastore').yaml.schemas(),
                            },
                        },
                    }
                end,
            }
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
