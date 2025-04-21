-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
    end,
})

-- filetype snippets
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.snippets",
    callback = function()
        vim.bo.filetype = "snippets"
        vim.bo.expandtab = true
    end,
})

-- filetype verilog
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.vh",
    callback = function()
        vim.bo.filetype = "verilog"
    end,
})

-- filetype systemverilog
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.svh",
    callback = function()
        vim.bo.filetype = "systemverilog"
    end,
})
