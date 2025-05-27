local settings = {}

settings["lsp_enabled"] = {
    "bashls",
    "clangd",
    "html",
    "jsonls",
    "lua_ls",
    "neocmake",
    -- "rust_analyzer",
    "svlangserver",
    "taplo",
    "tinymist",
    "ts_ls",
    "typos_lsp",
    "yamlls",
}

-- filetypes to ignore when saving sessions
settings["session_ignored"] = {
    "grug-far",
}

return settings
