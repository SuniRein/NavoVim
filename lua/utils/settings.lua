local settings = {}

settings["lsp_enabled"] = {
    "basedpyright",
    "bashls",
    "clangd",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "html",
    "jsonls",
    "just",
    "lua_ls",
    "neocmake",
    "nushell",
    -- "rust_analyzer",
    "svlangserver",
    "tailwindcss",
    "taplo",
    "tinymist",
    "typos_lsp",
    "vtsls",
    "vue_ls",
    "yamlls",
}

settings["lsp_formatters"] = {
    "jsonls",
    "taplo",
    "tinymist",
}

-- filetypes to ignore when saving sessions
settings["session_ignored"] = {
    "grug-far",
}

return settings
