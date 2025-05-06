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
                desc = "Open yazi in working directory",
            },
            {
                "<leader>cf",
                "<cmd>Yazi<cr>",
                desc = "Open yazi at current file",
            },
        },
        ---@module "yazi"
        ---@type YaziConfig | {}
        opts = {
            open_for_directories = true,
            integrations = {
                grep_in_directory = "snacks.picker",
                grep_in_selected_files = "snacks.picker",
                picker_add_copy_relative_path_action = "snacks.picker",
            },
        },
        init = function()
            -- 👇 if you use `open_for_directories=true`, this is recommended
            vim.g.loaded_netrwPlugin = 1
        end,
    },
}
