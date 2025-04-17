local function switch_source_header(bufnr)
    local method_name = "textDocument/switchSourceHeader"
    local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "clangd" })
    local uri = vim.uri_from_bufnr(bufnr)
    if #clients > 0 then
        local client = clients[1]
        client:request(method_name, { uri = uri }, function(err, res)
            if err then
                vim.notify(err.message or tostring(err), vim.log.levels.WARN)
            elseif res then
                vim.cmd.edit(vim.uri_to_fname(res))
            else
                vim.notify("Header file not found", vim.log.levels.WARN)
            end
        end, bufnr)
    else
        vim.notify(
            ("method %s is not supported by any servers active on the current buffer"):format(method_name),
            vim.log.levels.WARN
        )
    end
end

return {
    cmd = {
        "clangd",
        "-j=12",
        "--enable-config",
        "--background-index",
        "--pch-storage=memory",
        "--clang-tidy",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
        "--limit-references=3000",
        "--limit-results=350",
    },
    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        ".git",
        "compile_commands.json",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    capabilities = {
        textDocument = {
            completion = {
                editsNearCursor = true,
            },
        },
        offsetEncoding = { "utf-8", "utf-16" },
    },
    on_attach = function(_, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, "ClangdSwitchSourceHeader", function()
            switch_source_header(bufnr)
        end, { desc = "Switch between the main source file (*.cpp) and header (*.h)" })

        vim.api.nvim_buf_set_keymap(
            bufnr,
            "n",
            "gh",
            "<cmd>ClangdSwitchSourceHeader<CR>",
            { desc = "Switch between Header/Source" }
        )
    end,
}
