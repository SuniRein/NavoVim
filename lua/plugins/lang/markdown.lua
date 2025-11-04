local supported_filetypes = {
    "markdown",
    "vimdoc",
    "typst",
    "codecompanion",
}

local disable_first_line_indent = {
    add_padding = function(_, item) return item.indent > 1 end,
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
        priority = 49, -- assuming nvim-treesitter has priority = 50, the default
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
                tables = {
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

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            require("lazy").load({ plugins = { "markdown-preview.nvim" } })
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "yousefhadder/markdown-plus.nvim",
        ft = { "markdown" },
        opts = {
            enabled = true,
            filetypes = { "markdown" },
        },
    },
}
