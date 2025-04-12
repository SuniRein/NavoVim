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
            { "<leader>go", "<cmd>Outline<cr>", desc = "outline: Toggle" },
        },
    },
}
