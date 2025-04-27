-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/volar.lua
return {
    cmd = { "vue-language-server", "--stdio" },
    filetypes = {
        "vue",
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
    },
    root_markers = { "package.json" },
    init_options = {
        vue = {
            hybridMode = false,
        },
        typescript = {
            tsdk = require("mason-registry").get_package("vue-language-server"):get_install_path()
                .. "/node_modules/typescript/lib",
        },
    },
    before_init = function(_, config)
        local lib_path = vim.fs.find("node_modules/typescript/lib", { path = config.root_dir, upward = true })[1]
        if lib_path then
            config.init_options.typescript.tsdk = lib_path
        end
    end,
}
