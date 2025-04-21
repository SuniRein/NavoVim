return {
    {
        "Wansmer/sibling-swap.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            keymaps = {
                ["<M-[>"] = "swap_with_left",
                ["<M-]>"] = "swap_with_right",
            },
            highlight_node_at_cursor = true,
            interline_swaps_without_separator = true,
        },
        keys = {
            { "<M-[>" },
            { "<M-]>" },
        },
    },
}
