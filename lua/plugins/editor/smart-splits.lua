return {
    {
        "mrjones2014/smart-splits.nvim",
        lazy = true,
        event = "LazyFile",
        opts = {},
        keys = {
            { "<M-h>", "<cmd>SmartResizeLeft<CR>", desc = "window: Resize left" },
            { "<M-j>", "<cmd>SmartResizeDown<CR>", desc = "window: Resize down" },
            { "<M-k>", "<cmd>SmartResizeUp<CR>", desc = "window: Resize up" },
            { "<M-l>", "<cmd>SmartResizeRight<CR>", desc = "window: Resize right" },

            { "<C-h>", "<cmd>SmartCursorMoveLeft<CR>", desc = "window: Move left" },
            { "<C-j>", "<cmd>SmartCursorMoveDown<CR>", desc = "window: Move down" },
            { "<C-k>", "<cmd>SmartCursorMoveUp<CR>", desc = "window: Move up" },
            { "<C-l>", "<cmd>SmartCursorMoveRight<CR>", desc = "window: Move right" },
        },
    },
}
