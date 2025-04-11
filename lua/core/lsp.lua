local servers = {
    "clangd",
}

for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end
