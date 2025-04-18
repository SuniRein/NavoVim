local servers = {
    "bashls",
    "clangd",
    "html_lsp",
    "lua_ls",
    "neocmake",
    "volar",
}

for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end
