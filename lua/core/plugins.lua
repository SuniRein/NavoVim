-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- LazyFile event
local Event = require("lazy.core.handler.event")
Event.mappings.LazyFile = {
    id = "LazyFile",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
}
Event.mappings["User LazyFile"] = Event.mappings.LazyFile

-- Load lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins" },
        { import = "plugins.tools" },
        { import = "plugins.ui" },
        { import = "plugins.editor" },
        { import = "plugins.lang" },
    },
    install = { colorscheme = { "catppuccin" } },
    checker = {
        checker = true,
        notify = true,
        frequency = 3600 * 24 * 7, -- once a week
    },
})
