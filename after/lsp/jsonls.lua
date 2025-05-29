-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/jsonls.lua
return {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
}
