-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 }) end,
})

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
