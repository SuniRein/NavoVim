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
                notify = false,
            }):map("<leader>uo")

            return {
                preview_window = {
                    border = "rounded",
                },
                providers = {
                    lsp = {
                        blacklist_clients = { "obsidian-ls" },
                    },
                },
            }
        end,
        keys = {
            { "<leader>uo", desc = "Enable Outline" },
        },
    },
}
