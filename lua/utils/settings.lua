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
    "typos_lsp",
    "vue_ls",
}

-- filetypes to ignore when saving sessions
settings["session_ignored"] = {
    "grug-far",
}

return settings
