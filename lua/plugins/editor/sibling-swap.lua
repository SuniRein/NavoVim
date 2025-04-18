return {
    {
        "Wansmer/sibling-swap.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            highlight_node_at_cursor = true,
            keymaps = {
                ["<C-i>"] = "swap_with_left",
                ["<C-o>"] = "swap_with_right",
            },
            interline_swaps_without_separator = true,
        },
        keys = {
            { "<C-i>" },
            { "<C-o>" },
        },
    },
}
