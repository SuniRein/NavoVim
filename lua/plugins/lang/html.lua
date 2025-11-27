return {
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html",
            "xml",
            "javascriptreact",
            "typescriptreact",
            "vue",
            "markdown",
        },
        opts = {
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true,
            },
        },
    },

    {
        "brenoprata10/nvim-highlight-colors",
        event = "LazyFile",
        dependencies = {
            "folke/snacks.nvim",
        },
        opts = function()
            local hc = require("nvim-highlight-colors")

            Snacks.toggle({
                name = "Highlight Color",
                get = hc.is_active,
                set = function(state)
                    if state then
                        hc.turnOn()
                    else
                        hc.turnOff()
                    end
                end,
            }):map("<leader>uc")

            return {
                render = "virtual",

                enable_hex = true, -- #FFFFFF
                enable_short_hex = true, -- #fff
                enable_rgb = true, -- rgb(0 0 0)
                enable_hsl = true, -- hsl(150deg 30% 40%)
                enable_ansi = true, -- \033[0;34m
                enable_hsl_without_function = true, -- foreground: 0 69% 69%;
                enable_var_usage = true, -- var(--testing-color)
                enable_named_colors = true, -- 'green'
                enable_tailwind = true, -- 'bg-blue-500'
            }
        end,
    },

    {
        "saghen/blink.cmp",
        optional = true,
        opts = {
            completion = {
                menu = {
                    draw = {
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    -- default kind icon
                                    local icon = ctx.kind_icon
                                    -- if LSP source, check for color derived from documentation
                                    if ctx.item.source_name == "LSP" then
                                        local color_item = require("nvim-highlight-colors").format(
                                            ctx.item.documentation,
                                            { kind = ctx.kind }
                                        )
                                        if color_item and color_item.abbr ~= "" then
                                            icon = color_item.abbr
                                        end
                                    end
                                    return icon .. ctx.icon_gap
                                end,

                                highlight = function(ctx)
                                    -- default highlight group
                                    local highlight = "BlinkCmpKind" .. ctx.kind
                                    -- if LSP source, check for color derived from documentation
                                    if ctx.item.source_name == "LSP" then
                                        local color_item = require("nvim-highlight-colors").format(
                                            ctx.item.documentation,
                                            { kind = ctx.kind }
                                        )
                                        if color_item and color_item.abbr_hl_group then
                                            highlight = color_item.abbr_hl_group
                                        end
                                    end
                                    return highlight
                                end,
                            },
                        },
                    },
                },
            },
        },
    },
}
