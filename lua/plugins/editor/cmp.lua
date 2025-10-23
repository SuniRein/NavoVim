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
            opts.sources.providers.lsp = { fallbacks = {} } -- enable buffer when LSP is available

            return vim.tbl_extend("force", opts, {
                appearance = {
                    nerd_font_variant = "normal", -- 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                },
                completion = {
                    list = {
                        selection = {
                            preselect = true,
                            auto_insert = false,
                        },
                    },
                    menu = {
                        border = "rounded",
                        scrolloff = 1,
                        draw = { -- TODO: more beatuiful
                            columns = {
                                { "my_kind_icon" },
                                { "label", "label_description", gap = 1 },
                                { "source_name" },
                            },
                            components = {
                                my_kind_icon = {
                                    text = function(ctx)
                                        local icon = ctx.kind_icon

                                        -- use nvim-web-devicons for path icons
                                        if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                            local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                            if dev_icon then
                                                icon = dev_icon
                                            end
                                        end

                                        return icon .. ctx.icon_gap
                                    end,
                                    highlight = function(ctx)
                                        local hl = ctx.kind_hl

                                        -- use nvim-web-devicons for path icons
                                        if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                            local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                            if dev_icon then
                                                hl = dev_hl
                                            end
                                        end

                                        return hl
                                    end,
                                },
                            },
                        },
                        -- avoid overlapping with multi-line ghost text
                        direction_priority = function()
                            local ctx = require("blink.cmp").get_context()
                            local item = require("blink.cmp").get_selected_item()
                            if ctx == nil or item == nil then
                                return { "s", "n" }
                            end

                            local item_text = item.textEdit ~= nil and item.textEdit.newText
                                or item.insertText
                                or item.label
                            local is_multi_line = item_text:find("\n") ~= nil

                            -- after showing the menu upwards, we want to maintain that direction
                            -- until we re-open the menu, so store the context id in a global variable
                            if is_multi_line or vim.g.blink_cmp_upwards_ctx_id == ctx.id then
                                vim.g.blink_cmp_upwards_ctx_id = ctx.id
                                return { "n", "s" }
                            end
                            return { "s", "n" }
                        end,
                    },
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
                },
                fuzzy = {
                    implementation = "prefer_rust_with_warning",
                },
                keymap = {
                    preset = "none",
                    ["<C-o>"] = { "accept" },
                    ["<C-space>"] = { "show" },
                    ["<ESC>"] = { "hide", "fallback" },
                    ["<C-k>"] = { "select_prev" },
                    ["<C-j>"] = { "select_next" },
                    ["<C-h>"] = { "snippet_backward" },
                    ["<C-l>"] = { "snippet_forward" },
                    ["<C-b>"] = { "scroll_documentation_up" },
                    ["<C-f>"] = { "scroll_documentation_down" },

                    ["<C-1>"] = { function(cmp) cmp.accept({ index = 1 }) end },
                    ["<C-2>"] = { function(cmp) cmp.accept({ index = 2 }) end },
                    ["<C-3>"] = { function(cmp) cmp.accept({ index = 3 }) end },
                    ["<C-4>"] = { function(cmp) cmp.accept({ index = 4 }) end },
                    ["<C-5>"] = { function(cmp) cmp.accept({ index = 5 }) end },
                    ["<C-6>"] = { function(cmp) cmp.accept({ index = 6 }) end },
                    ["<C-7>"] = { function(cmp) cmp.accept({ index = 7 }) end },
                    ["<C-8>"] = { function(cmp) cmp.accept({ index = 8 }) end },
                    ["<C-9>"] = { function(cmp) cmp.accept({ index = 9 }) end },
                    ["<C-0>"] = { function(cmp) cmp.accept({ index = 0 }) end },
                },
                signature = {
                    enabled = true,
                    window = {
                        border = "rounded",
                    },
                },
                snippets = {
                    preset = "luasnip",
                },

                cmdline = {
                    keymap = { preset = "inherit" },
                    completion = { menu = { auto_show = true } },
                },
            })
        end,
    },
}
