return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "LazyFile",
        opts = {
            options = {
                separator_style = "slant",
                always_show_bufferline = true,
            },
        },
        keys = {
            { "<M-i>", "<cmd>BufferLineCyclePrev<CR>", silent = true, desc = "Switch to Prev (cycle)" },
            { "<M-o>", "<cmd>BufferLineCycleNext<CR>", silent = true, desc = "Switch to Next (cycle)" },

            { "<M-I>", "<cmd>BufferLineMovePrev<CR>", silent = true, desc = "Move Current to Prev" },
            { "<M-O>", "<cmd>BufferLineMoveNext<CR>", silent = true, desc = "Move Current to Next" },

            { "<leader>bc", "<cmd>BufferLinePickClose<CR>", silent = true, desc = "Close Pick One" },
            { "<leader>bC", "<cmd>BufferLineCloseOthers<CR>", silent = true, desc = "Close Others" },

            { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", silent = true, desc = "Toggle Pin" },

            { "<leader>be", "<cmd>BufferLineSortByExtension<CR>", silent = true, desc = "Sort by Extension" },
            { "<leader>bd", "<cmd>BufferLineSortByDirectory<CR>", silent = true, desc = "Sort by Directory" },
        },
    },
}
