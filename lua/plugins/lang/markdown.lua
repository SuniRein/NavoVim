local supported_filetypes = {
    "markdown",
    "vimdoc",
    "typst",
    "codecompanion",
}

return {
    {
        "OXY2DEV/markview.nvim",
        dependencies = {
            "folke/snacks.nvim",
        },
        ft = { "markdown" },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = supported_filetypes,
                callback = function()
                    vim.opt_local.wrap = false
                end,
            })
        end,
        opts = function()
            local mv = require("markview")

            Snacks.toggle({
                name = "Markview",
                get = function()
                    return mv.actions.__is_enabled()
                end,
                set = function(state)
                    if state then
                        mv.actions.enable()
                    else
                        mv.actions.disable()
                    end
                end,
            }):map("<leader>um")

            Snacks.toggle({
                name = "Markview Split",
                get = function()
                    return type(mv.state.splitview_source) == "number"
                end,
                set = function(state)
                    if state then
                        mv.actions.splitOpen()
                    else
                        mv.actions.splitClose()
                    end
                end,
            }):map("<leader>uM")

            return {
                preview = {
                    filetypes = supported_filetypes,
                    hybrid_modes = { "n" },
                    linewise_hybrid_mode = true,
                },
                markdown = {
                    table = {
                        use_virt_lines = true,
                    },
                },
            }
        end,
    },
}
