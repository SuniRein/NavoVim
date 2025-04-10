local function keymaps_panel()
    require("telescope.builtin").keymaps({
        lhs_filter = function(lhs)
            return not string.find(lhs, "Þ")
        end,
        layout_config = {
            width = 0.6,
            height = 0.6,
            prompt_position = "top",
        },
    })
end

return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        init = function()
            require("telescope").load_extension("fzf")
        end,
        opts = {
            defaults = {
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.85,
                    height = 0.92,
                    preview_cutoff = 120,
                },
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                file_sorter = require("telescope.sorters").get_fuzzy_file,
                generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
            },
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "telescope: Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "telescope: Live grep" },
            { "<leader>fp", "<cmd>Telescope grep_string<CR>", desc = "telescope: Grep string" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "telescope: Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "telescope: Help" },
            { "<leader>fr", "<cmd>Telescope registers<CR>", desc = "telescope: Registers" },

            {
                "<C-p>",
                function()
                    keymaps_panel()
                end,
                desc = "telescope: Keymaps",
            },
        },
    },
}
