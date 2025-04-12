local capabilities = vim.lsp.protocol.make_client_capabilities()

return {
    cmd = { "neocmakelsp", "--stdio" },
    filetypes = { "cmake" },
    root_markers = { ".git", "build", ".neocmakelint.toml", "CMakeLists.txt" },
    init_options = {
        format = {
            enable = true,
        },
        lint = {
            enable = true,
        },
    },
    capabilities = capabilities,
}
