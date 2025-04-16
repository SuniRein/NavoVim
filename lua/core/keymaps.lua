vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function map_cr(mode, key, cmd_string, desc)
    local opts = {
        silent = true,
        desc = desc,
    }

    local cmd = "<cmd>" .. cmd_string .. "<CR>"

    vim.keymap.set(mode, key, cmd, opts)
end

map_cr("n", "<C-s>", "w", "Save File")
