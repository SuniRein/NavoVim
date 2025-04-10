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
            })

            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldlevel = 99
        end,
    },
}
