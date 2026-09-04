return {
    capabilities = (function()
        local caps = vim.lsp.protocol.make_client_capabilities()
        -- disable formatting capabilities for pyright to avoid conflicts with ruff
        caps.textDocument.formatting = false
        caps.textDocument.rangeFormatting = false
        return caps
    end)(),
    settings = {
        python = {
            analysis = {
                typeCheckingMode = 'strict',
            }
        }
    },
}
