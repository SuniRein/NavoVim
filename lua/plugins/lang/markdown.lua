local supported_filetypes = {
    "markdown",
    "vimdoc",
    "typst",
    "codecompanion",
}

local disable_first_line_indent = {
    add_padding = function(_, item)
        return item.indent > 1
    end,
}

-- Reduces the `indent` by 1 level.
local reduce_indent = function(buffer, item)
    local parent_indent = math.max(1, item.indent - vim.bo[buffer].shiftwidth)
    return item.indent * (1 / (parent_indent * 2))
end

return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false, -- lazy load markview conflicts with snacks.picker
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
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
                end,
            })
        end,
        ---@module 'markview'
        ---@type markview.config
        ---@diagnostic disable: missing-fields
        opts = {
            preview = {
                filetypes = supported_filetypes,
                ignore_buftypes = {}, -- require for codecompanion
                hybrid_modes = { "n" },
                linewise_hybrid_mode = true,
            },
            markdown = {
                table = {
                    use_virt_lines = true,
                },
                list_items = {
                    shift_width = reduce_indent,
                    marker_minus = disable_first_line_indent,
                    marker_plus = disable_first_line_indent,
                    marker_dot = disable_first_line_indent,
                },
            },
            typst = {
                code_blocks = {
                    enable = false,
                },
                list_items = {
                    shift_width = reduce_indent,
                    marker_minus = disable_first_line_indent,
                    marker_plus = disable_first_line_indent,
                    marker_dot = disable_first_line_indent,
                },
            },
        },
    },
}
