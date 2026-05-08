return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
            { "OXY2DEV/markview.nvim", optional = true }, -- markview should be loaded before treesitter
        },
        lazy = false,
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "python",
                    "lua",
                    "vue",
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "c",
                    "cpp",
                    "rust",
                    "go",
                    "json",
                    "yaml",
                    "toml",
                    "sql",
                    "Dockerfile",
                },
                callback = function() vim.treesitter.start() end,
            })

            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true
        end,
        config = function()
            require("nvim-treesitter-textobjects").setup({})

            local select = require("nvim-treesitter-textobjects.select")

            local function set_textobject(key, query)
                vim.keymap.set({ "x", "o" }, key, function() select.select_textobject(query, "textobjects") end)
            end

            set_textobject("af", "@function.outer")
            set_textobject("if", "@function.inner")
            set_textobject("ac", "@class.outer")
            set_textobject("ic", "@class.inner")
        end,
    },

    {
        "andymass/vim-matchup",
        event = "LazyFile",
        init = function() vim.g.matchup_matchparen_offscreen = { method = "status_manual" } end,
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
                function() require("treesitter-context").go_to_context(vim.v.count1) end,
                desc = "Jump to Context",
            },
        },
    },
}
