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

-- K in help
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.keymap.set("n", "K", function()
            local word = vim.fn.expand("<cword>")
            local cmd = string.format("help %s", word)
            vim.cmd(cmd)
        end, { buffer = 0 })
    end,
})

-- typst preview
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function(param)
        vim.api.nvim_buf_create_user_command(param.buf, "OpenPdf", function()
            local filepath = vim.api.nvim_buf_get_name(param.buf)
            if filepath:match("%.typ$") then
                local pdf_path = filepath:gsub("%.typ$", ".pdf")
                vim.system({ "zathura", pdf_path })
            end
        end, {})
    end,
})
