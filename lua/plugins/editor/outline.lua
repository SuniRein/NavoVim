return {
    {
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        opts = {
            preview_window = {
                auto_preview = true,
                border = "rounded",
            },
        },
        keys = {
            { "<leader>uo", "<cmd>Outline<cr>", desc = "Toggle Outline" },
        },
    },
}
