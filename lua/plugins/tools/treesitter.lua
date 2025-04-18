local Treesitter = {}

Treesitter.ensured = {
    "c",
    "cpp",
    "lua",
    "vim",
    "vimdoc",
}

Treesitter.ignored = {}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            { "OXY2DEV/markview.nvim", optional = true }, -- markview should be loaded before treesitter
            { "andymass/vim-matchup" }, -- for matchup
            { "nvim-treesitter/nvim-treesitter-context" },
            { "nvim-treesitter/nvim-treesitter-textobjects" },
        },
        lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
        event = "VeryLazy",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = Treesitter.ensured,
                ignore_install = Treesitter.ignored,
                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                    disable = function(ft, bufnr)
                        -- disable for gitcommit and large files
                        if
                            vim.tbl_contains({ "gitcommit" }, ft)
                            or (vim.api.nvim_buf_line_count(bufnr) > 7500 and ft ~= "vimdoc")
                        then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        scope_incremental = "<TAB>",
                        node_decremental = "<BS>",
                    },
                },

                -- indentation based on treesitter for the = operator
                indent = { enable = true },

                -- with vim-matchup
                matchup = { enable = true },

                -- with nvim-treesitter-textobjects
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["as"] = "@local.scope",
                        },
                        include_surrounding_whitespace = false,
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>Sa"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>SA"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]["] = "@function.outer",
                            ["]m"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]]"] = "@function.outer",
                            ["]M"] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[["] = "@function.outer",
                            ["[m"] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[]"] = "@function.outer",
                            ["[M"] = "@class.outer",
                        },
                    },
                },
            })

            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldlevel = 99
        end,
    },

    {
        "andymass/vim-matchup",
        lazy = true,
        init = function()
            vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
        end,
        opts = {},
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "folke/snacks.nvim",
        },
        lazy = true,
        opts = function()
            local tsc = require("treesitter-context")
            Snacks.toggle({
                name = "Treesitter Context",
                get = tsc.enabled,
                set = function(state)
                    if state then
                        tsc.enable()
                    else
                        tsc.disable()
                    end
                end,
            }):map("<leader>ut")

            return { max_lines = 4 }
        end,
        keys = {
            {
                "[c",
                function()
                    require("treesitter-context").go_to_context(vim.v.count1)
                end,
                desc = "Jump to Context",
            },
        },
    },
}
