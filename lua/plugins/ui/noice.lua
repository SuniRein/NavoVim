return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify", -- notification view
            { "nvim-telescope/telescope.nvim", optional = true }, -- telescope extension
        },
        init = function()
            local ok, telescope = pcall(require, "telescope")
            if ok then
                telescope.load_extension("noice")
            end
        end,
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
                signature = {
                    enabled = false, -- dulpicate with blink.cmp
                },
            },
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        },
        keys = {
            { "<leader>fn", "<cmd>Telescope noice<cr>", desc = "telescope: Noice" },
        },
    },
}
