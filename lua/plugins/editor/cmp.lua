return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        lazy = true,
        opts = function()
            local ls = require("luasnip")

            vim.cmd(("source %s"):format(vim.fn.stdpath("config") .. "/snippets/snippet.vim"))
            require("luasnip.loaders.from_snipmate").lazy_load()
            require("luasnip.loaders.from_lua").lazy_load()

            vim.keymap.set("n", "<leader>ss", require("luasnip.loaders").edit_snippet_files, { desc = "Edit Snippets" })

            local function when_choice(action)
                return function()
                    if ls.choice_active() then
                        action()
                    end
                end
            end
            vim.keymap.set({ "i", "s" }, "<C-n>", when_choice(function() require("luasnip").change_choice(1) end))
            vim.keymap.set({ "i", "s" }, "<C-p>", when_choice(function() require("luasnip").change_choice(-1) end))
            vim.keymap.set("i", "<C-u>", when_choice(require("luasnip.extras.select_choice")))

            return {
                enable_autosnippets = true,
                update_events = "TextChanged,TextChangedI",
                ext_opts = {
                    [require("luasnip.util.types").choiceNode] = {
                        active = {
                            virt_text = { { "choiceNode", "Comment" } },
                        },
                    },
                },
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

        opts_extend = { "sources.default" },

        ---@module 'blink.cmp'
        ---@param opts blink.cmp.Config
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            opts.sources.default = opts.sources.default or {}
            vim.list_extend(opts.sources.default, { "lsp", "path", "snippets", "buffer" })
            opts.sources.providers.lsp = {
                fallbacks = {}, -- enable buffer when LSP is available
            }

            return vim.tbl_extend("force", opts, {
                snippets = { preset = "luasnip" },
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

                fuzzy = { implementation = "prefer_rust_with_warning" },
            })
        end,
    },
}
