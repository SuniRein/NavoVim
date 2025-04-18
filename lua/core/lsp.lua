local servers = {
    "bashls",
    "clangd",
    "lua_ls",
    "neocmake",
    "volar",
}

for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end
