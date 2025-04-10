return {
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        dependencies = {
            "folke/snacks.nvim",
        },
        keys = {
            {
                "<C-N>",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume the last yazi session",
            },
            {
                "<leader>cw",
                "<cmd>Yazi cwd<cr>",
                desc = "Open the file manager in nvim's working directory",
            },
            {
                "<leader>cf",
                "<cmd>Yazi<cr>",
                desc = "Open yazi at the current file",
            },
        },
        opts = {
            open_for_directories = true,
        },
        init = function()
            -- 👇 if you use `open_for_directories=true`, this is recommended
            vim.g.loaded_netrwPlugin = 1
        end,
    },
}
