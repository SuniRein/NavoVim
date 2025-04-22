local servers = {
    "bashls",
    "clangd",
    "html_lsp",
    "json_lsp",
    "lua_ls",
    "neocmake",
    "svlangserver",
    "taplo",
    "volar",
}

for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end
