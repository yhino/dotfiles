-- Enable auto-formatting and organize imports on save
vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }

        -- Sync organize imports
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
                else
                    vim.lsp.buf.execute_command(r.command)
                end
            end
        end

        -- Sync formatting
        vim.lsp.buf.format({ async = false })
    end,
})
