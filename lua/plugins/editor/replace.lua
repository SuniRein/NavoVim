local function open_grug_far(engine)
    local grug = require("grug-far")
    local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
    grug.open({
        transient = true,
        prefills = {
            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
        },
        engine = engine,
    })
end

local function open_grug_far_within(engine)
    local grug = require("grug-far")
    grug.open({
        transient = true,
        engine = engine,
        visualSelectionUsage = "operate-within-range",
    })
end

return {
    {
        "magicduck/grug-far.nvim",
        cmd = {
            "GrugFar",
        },
        opts = {},
        keys = {
            {
                "<leader>sR",
                function()
                    open_grug_far("ripgrep")
                end,
                mode = "n",
                desc = "Search and Replace (ripgrep)",
            },
            {
                "<leader>sA",
                function()
                    open_grug_far("astgrep")
                end,
                mode = "n",
                desc = "Search and Replace (astgrep)",
            },

            {
                "<leader>sR",
                function()
                    open_grug_far_within("ripgrep")
                end,
                mode = "v",
                desc = "Search and Replace (ripgrep)",
            },
            {
                "<leader>sA",
                function()
                    open_grug_far_within("astgrep")
                end,
                mode = "v",
                desc = "Search and Replace (astgrep)",
            },
        },
    },
}
