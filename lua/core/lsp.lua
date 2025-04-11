local servers = {
    "clangd",
    "lua_ls",
}

for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end
