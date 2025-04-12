local servers = {
    "bashls",
    "clangd",
    "lua_ls",
    "neocmake",
}

for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end
