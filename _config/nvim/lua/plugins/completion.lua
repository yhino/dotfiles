return {
    -- LSP
    { 'neovim/nvim-lspconfig' },
    -- ddc
    {
        'Shougo/ddc.vim',
        dependencies = {
            'vim-denops/denops.vim',
            'Shougo/ddc-around',
            'Shougo/ddc-source-lsp',
            'Shougo/ddc-matcher_head',
            'Shougo/ddc-sorter_rank',
            'Shougo/pum.vim',
        },
        config = function()
            vim.fn['ddc#custom#patch_global']('ui', 'pum')
            vim.fn['ddc#custom#patch_global']('sources', {'lsp', 'around'})
            vim.fn['ddc#custom#patch_global']('sourceOptions', {
                _ = {
                    matchers = {'matcher_head'},
                    sorters = {'sorter_rank'},
                },
                around = { mark = 'A' },
                vsnip = { mark = 'vsnip' },
                lsp = {
                    mark = 'lsp',
                    forceCompletionPattern = '\\.\\w*|:\\w*|->\\w*',
                    minAutoCompleteLength = 1,
                },
            })
            vim.fn['ddc#custom#patch_global']('sourceParams', {
                lsp = {
                    snippetEngine = vim.fn['denops#callback#register'](function(body)
                        vim.fn['vsnip#anonymous'](body)
                    end),
                    enableResolveItem = true,
                    enableAdditionalTextEdit = true,
                },
            })
            vim.fn['ddc#enable']({context_filetype = 'treesitter'})
        end,
    },
    -- ddc:ui
    {
        'Shougo/ddc-ui-pum',
        dependencies = {'Shougo/pum.vim'},
    },
    -- ddc:source
    { 'Shougo/ddc-around', lazy = true },
    {
        'Shougo/ddc-source-lsp',
        dependencies = {'neovim/nvim-lspconfig'},
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require("ddc_source_lsp").make_client_capabilities()
            lspconfig.gopls.setup {
                capabilities = capabilities,
            }
            lspconfig.pyright.setup {
                capabilities = capabilities,
            }
        end
    },
    -- ddc:filter
    { 'Shougo/ddc-matcher_head', lazy = true },
    { 'Shougo/ddc-sorter_rank', lazy = true },
    -- pum
    {
        'Shougo/pum.vim',
        event = { 'VeryLazy' },
        keys = {
            {'<C-n>', function() vim.fn['pum#map#insert_relative'](1) end, mode = 'i'},
            {'<C-p>', function() vim.fn['pum#map#insert_relative'](-1) end, mode = 'i'},
            {'<C-l>', function() vim.fn['pum#map#confirm']() end, mode = 'i'},
            {'<C-e>', function() vim.fn['pum#map#cancel']() end, mode = 'i'},
        },
    },
    {
        'matsui54/denops-popup-preview.vim',
        dependencies = {'Shougo/pum.vim'},
        config = function()
            vim.fn['popup_preview#enable']()
        end,
    },
    {
        'matsui54/denops-signature_help',
        dependencies = {'Shougo/pum.vim'},
        config = function()
            vim.fn['signature_help#enable']()
        end,
    },
}
