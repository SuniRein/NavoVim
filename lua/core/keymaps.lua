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

vim.keymap.set("n", "<C-p>", "", {
    desc = "Show Buffer Status",
    callback = function()
        require("utils.status").display()
    end,
})

map_cr("n", "<M-q>", "bdelete", "Close Buffer")
map_cr("n", "<M-Q>", "bdelete!", "Force Close Buffer")
