return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                border = "single",
                icons = {
                    package_pending = "",
                    package_installed = "󰄳",
                    package_uninstalled = "󰊠",
                },
            },
        },
    },

    -- beatuiful inline diagnostics
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000, -- needs to be loaded in first
        init = function()
            vim.diagnostic.config({ virtual_text = false })
        end,
        opts = {},
    },

    --  improve lsp experience
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        event = "LspAttach",
        init = function()
            vim.diagnostic.config({ virtual_text = false })
        end,
        opts = {
            diagnostic = { diagnostic_only_current = false }, -- conflict with tiny-inline-diagnostic.nvim
        },
        keys = {
            { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "lsp: Hover doc" },

            { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "lsp: Goto Definition" },
            { "gD", "<cmd>Lspsaga peek_definition<CR>", desc = "lsp: Peek Definition" },

            { "gt", "<cmd>Lspsaga goto_type_definition<CR>", desc = "lsp: Goto Type Definition" },
            { "gT", "<cmd>Lspsaga peek_type_definition<CR>", desc = "lsp: Peek Type Definition" },

            { "gf", "<cmd>Lspsaga finder<CR>", desc = "lsp: Finder" },

            { "gr", "<cmd>Lspsaga rename<CR>", desc = "lsp: Rename" },
            { "gR", "<cmd>Lspsaga rename ++project<CR>", desc = "lsp: Rename (project)" },

            { "ga", "<cmd>Lspsaga code_action<CR>", desc = "lsp: Code action" },

            { "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "lsp: Jump to previous diagnostic" },
            { "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "lsp: Jump to next diagnostic" },

            { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "lsp: Show line diagnostics" },
            { "gb", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "lsp: Show buffer diagnostics" },
            { "gw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "lsp: Show workspace diagnostics" },
        },
    },
}
