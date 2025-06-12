return {
    {
        "olimorris/persisted.nvim",
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
        opts = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "PersistedSavePre",
                callback = function()
                    local ignored = require("utils.settings").session_ignored
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.tbl_contains(ignored, vim.bo[buf].filetype) then
                            vim.api.nvim_buf_delete(buf, { force = true })
                        end
                    end
                end,
            })

            return {
                use_git_branch = true, -- include the git branch in the session file name
            }
        end,
        keys = {
            {
                "<leader>cs",
                function()
                    local p = require("persisted")
                    local session = p.current()
                    if session and vim.fn.filereadable(session) ~= 0 then
                        p.load()
                    else
                        vim.notify("No session found", vim.log.levels.WARN)
                    end
                end,
                desc = "Load Current Session",
            },
        },
    },
}
