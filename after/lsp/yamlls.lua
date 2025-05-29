-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/yamlls.lua
return {
    filetypes = {
        "yaml",
        "yaml.docker-compose",
        "yaml.ghaction",
        "yaml.gitlab",
    },
    settings = {
        yaml = {
            schemaStore = false, -- disable built-in schemaStore support
            schemas = require("schemastore").yaml.schemas(),
        },
    },
}
