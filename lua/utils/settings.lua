local settings = {}

settings["lsp_enabled"] = {
    "basedpyright",
    "bashls",
    "clangd",
    "html",
    "jsonls",
    "just",
    "lua_ls",
    "neocmake",
    "nushell",
    -- "rust_analyzer",
    "svlangserver",
    "taplo",
    "tinymist",
    "typos_lsp",
    "vtsls",
    "vue_ls",
    "yamlls",
}

-- filetypes to ignore when saving sessions
settings["session_ignored"] = {
    "grug-far",
}

return settings
