return {
    {
        "mason-org/mason.nvim",
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

    {
        "neovim/nvim-lspconfig",
        init = function()
            local servers = require("utils.settings").lsp_enabled

            for _, lsp in ipairs(servers) do
                vim.lsp.enable(lsp)
            end
        end,
    },

    -- beatuiful inline diagnostics
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000, -- needs to be loaded in first
        init = function() vim.diagnostic.config({ virtual_text = false }) end,
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
        opts = {
            diagnostic = { diagnostic_only_current = false }, -- conflict with tiny-inline-diagnostic.nvim
        },
        keys = {
            { "<leader>id", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto Definition" },
            { "<leader>iD", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },

            { "<leader>it", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Goto Type Definition" },
            { "<leader>iT", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek Type Definition" },

            { "<leader>if", "<cmd>Lspsaga finder<CR>", desc = "Finder" },

            { "<leader>ir", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
            { "<leader>iR", "<cmd>Lspsaga rename ++project<CR>", desc = "Rename (project)" },

            { "<leader>ia", "<cmd>Lspsaga code_action<CR>", desc = "Code action" },

            { "<leader>il", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },
            { "<leader>ib", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Show buffer diagnostics" },
            { "<leader>iw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "Show workspace diagnostics" },
        },
    },
}
