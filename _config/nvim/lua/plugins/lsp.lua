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
            'b0o/schemastore.nvim',
            'Shougo/ddc-source-lsp',
        },
        config = function()
            require('mason-lspconfig').setup()
            require('mason-lspconfig').setup_handlers {
                function (server_name)
                    local capabilities = require("ddc_source_lsp").make_client_capabilities()
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
                ["jsonls"] = function ()
                    require('lspconfig').jsonls.setup {
                        settings = {
                            json = {
                                schemas = require('schemastore').json.schemas(),
                                validate = { enable =true },
                            },
                        },
                    }
                end,
                ["yamlls"] = function ()
                    require('lspconfig').yamlls.setup {
                        settings = {
                            json = {
                                schemas = require('schemastore').json.schemas(),
                                validate = { enable =true },
                            },
                        },
                    }
                end,
            }
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require("ddc_source_lsp").make_client_capabilities()
            lspconfig.gopls.setup{
                capabilities = capabilities,
            }
            lspconfig.pyright.setup{
                capabilities = capabilities,
            }
            lspconfig.jsonls.setup {
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                        validate = { enable =true },
                    },
                },
            }
            lspconfig.yamlls.setup {
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
