return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        lazy = true,
        opts = function()
            vim.cmd(("source %s"):format(vim.fn.stdpath("config") .. "/snippets/snippet.vim"))
            require("luasnip.loaders.from_snipmate").lazy_load()
            require("luasnip.loaders.from_lua").lazy_load()

            vim.keymap.set("n", "<leader>ss", require("luasnip.loaders").edit_snippet_files, { desc = "Edit Snippets" })

            return {
                enable_autosnippets = true,
                update_events = "TextChanged,TextChangedI",
                store_selection_keys = "<Tab>",
            }
        end,
        ft = "snippets", -- highlight snippets files
    },

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
                ["<CR>"] = { "accept", "fallback" },
                ["<C-space>"] = { "show", "fallback" },
                ["<ESC>"] = { "hide", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-h>"] = { "snippet_backward", "fallback" },
                ["<C-l>"] = { "snippet_forward", "fallback" },
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

                ghost_text = {
                    enabled = true,
                },

                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },

                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", "kind" },
                            { "source_name" },
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
