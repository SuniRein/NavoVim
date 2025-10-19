return {
    {
        "tzachar/highlight-undo.nvim",
        event = "LazyFile",
        init = function() vim.api.nvim_set_hl(0, "HighlightUndo", { fg = "#1E1E2E", bg = "#F5C2E7" }) end,
        opts = {
            hlgroup = "HighlightUndo",
            duration = 300,
            ignored_filetypes = {
                "lazy",
                "mason",
                "snacks_dashboard",
            },
            ignore_cb = function(buf)
                local bo = vim.bo[buf]

                -- Check for special buffer types, e.g. lazy, telescope
                if bo.buftype ~= "" then
                    return true
                end

                -- Check if buffer is modifiable
                if not bo.modifiable then
                    return true
                end

                -- Check if there is a file name
                if vim.fn.expand("%:t") == "" then
                    return true
                end

                return false
            end,
        },
    },
}
