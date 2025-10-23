return {
    {
        "hedyhli/outline.nvim",
        dependencies = {
            "folke/snacks.nvim",
        },
        cmd = { "Outline", "OutlineOpen" },
        opts = function()
            local outline = require("outline")

            Snacks.toggle({
                name = "Outline",
                get = outline.is_open,
                set = function(state)
                    if state then
                        outline.open()
                    else
                        outline.close()
                    end
                end,
            }):map("<leader>uo")

            return {
                preview_window = {
                    border = "rounded",
                },
            }
        end,
        keys = {
            { "<leader>uo", desc = "Enable Outline" },
        },
    },
}
