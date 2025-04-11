return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                separator_style = "slant",
                always_show_bufferline = true,
            },
        },
        lazy = false,
        keys = {
            { "<M-i>", "<cmd>BufferLineCyclePrev<CR>", silent = true, desc = "buffer: Switch to prev (cycle)" },
            { "<M-o>", "<cmd>BufferLineCycleNext<CR>", silent = true, desc = "buffer: Switch to next (cycle)" },

            { "<M-I>", "<cmd>BufferLineMovePrev<CR>", silent = true, desc = "buffer: Move current to prev" },
            { "<M-O>", "<cmd>BufferLineMoveNext<CR>", silent = true, desc = "buffer: Move current to next" },

            { "<M-q>", "<cmd>bdelete<CR>", silent = true, desc = "buffer: Close current" },
            { "<M-Q>", "<cmd>bdelete!<CR>", silent = true, desc = "buffer: Close current (force)" },
            { "<leader>bc", "<cmd>BufferLinePickClose<CR>", silent = true, desc = "buffer: Close pick one" },
            { "<leader>bC", "<cmd>BufferLineCloseOthers<CR>", silent = true, desc = "buffer: Close others" },

            { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", silent = true, desc = "buffer: Toggle pin" },

            { "<leader>be", "<cmd>BufferLineSortByExtension<CR>", silent = true, desc = "buffer: Sort by extension" },
            { "<leader>bd", "<cmd>BufferLineSortByDirectory<CR>", silent = true, desc = "buffer: sort by directory" },
        },
    },
}
