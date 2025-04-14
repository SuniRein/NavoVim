local supported_filetypes = {
    "markdown",
    "vimdoc",
    "typst",
    "codecompanion",
}

return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false, -- the plugin has enabled lazy loading itself
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = supported_filetypes,
                callback = function()
                    vim.opt_local.wrap = false
                end,
            })
        end,
        opts = {
            preview = {
                filetypes = supported_filetypes,
                hybrid_modes = { "n" },
                linewise_hybrid_mode = true,
            },
            markdown = {
                table = {
                    use_virt_lines = true,
                },
            },
        },
        keys = {
            { "<leader>um", "<cmd>Markview toggle<CR>", desc = "Toggle Markdown Preview" },
            { "<leader>uM", "<cmd>Markview splitToggle<CR>", desc = "Toggle Markdown Split" },
        },
    },
}
