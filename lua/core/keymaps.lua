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

vim.keymap.set("n", "<C-p>", function()
    require("utils.status").display()
end, { desc = "Show Buffer Status" })

map_cr("n", "<M-q>", "bdelete", "Close Buffer")
map_cr("n", "<M-Q>", "bdelete!", "Force Close Buffer")

local function diagnostic_goto(count, severity)
    return function()
        vim.diagnostic.jump({
            count = count,
            severity = vim.diagnostic.severity[severity] or nil,
        })
    end
end

vim.keymap.set("n", "[d", diagnostic_goto(-1), { desc = "Prev Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(1), { desc = "Next Diagnostics" })

vim.keymap.set("n", "[e", diagnostic_goto(-1, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]e", diagnostic_goto(1, "ERROR"), { desc = "Next Error" })

vim.keymap.set("n", "[w", diagnostic_goto(-1, "WARN"), { desc = "Prev Warning" })
vim.keymap.set("n", "]w", diagnostic_goto(1, "WARN"), { desc = "Next Warning" })
