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
        init = function()
            local ok, telescope = pcall(require, "telescope")
            if ok then
                telescope.load_extension("persisted")
            end
        end,
        opts = {
            use_git_branch = true, -- include the git branch in the session file name
            should_save = function()
                return vim.bo.filetype ~= "alpha"
            end,
        },
        keys = {
            { "<leader>ss", "<cmd>SessionSave<CR>", desc = "session: Save" },
            { "<leader>sl", "<cmd>SessionLoad<CR>", desc = "session: Load current" },
            { "<leader>sd", "<cmd>SessionDelete<CR>", desc = "session: Delete" },

            { "<leader>fs", "<cmd>Telescope persisted<CR>", desc = "telescope: Session" },
        },
    },
}
