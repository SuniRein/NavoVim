return {
    {
        "saghen/blink.cmp",
        version = "1.*", -- use a release tag to download pre-built binaries
        dependencies = { "L3MON4D3/LuaSnip" },
        event = { "InsertEnter", "CmdlineEnter" },

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "none",
                ["<CR>"] = { "select_and_accept", "fallback" },
                ["<C-space>"] = { "show", "fallback" },
                ["<ESC>"] = { "hide", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<tab>"] = { "snippet_forward", "fallback" },
                ["<S-tab>"] = { "snippet_backward", "fallback" },
            },

            appearance = {
                nerd_font_variant = "normal", -- 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    window = {
                        border = "solid",
                    },
                },

                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", "kind" },
                            -- { "source_name" },
                        },
                    },
                    scrolloff = 1,
                    border = "rounded",
                },
            },

            signature = {
                enabled = true,
                window = {
                    border = "rounded",
                },
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    lsp = { fallbacks = {} }, -- enable buffer when LSP is available
                },
            },

            snippets = { preset = "luasnip" },

            fuzzy = { implementation = "prefer_rust_with_warning" },
        },

        opts_extend = { "sources.default" },
    },
}
