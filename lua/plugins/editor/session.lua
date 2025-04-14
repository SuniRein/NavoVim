return {
    {
        "olimorris/persisted.nvim",
        dependencies = {
            { "nvim-telescope/telescope.nvim", optional = true }, -- telescope extension
        },
        event = "BufReadPre",
        cmd = {
            "SessionToggle",
            "SessionStart",
            "SessionStop",
            "SessionSave",
            "SessionLoad",
            "SessionLoadLast",
            "SessionLoadFromFile",
            "SessionDelete",
        },
        opts = {
            use_git_branch = true, -- include the git branch in the session file name
            should_save = function()
                return vim.bo.filetype ~= "alpha"
            end,
        },
        keys = {
            { "<leader>cs", "<cmd>SessionLoad<CR>", desc = "Load Current Session" },
        },
    },
}
