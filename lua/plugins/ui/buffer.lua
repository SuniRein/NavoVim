return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "LazyFile",
        opts = function()
            local debug_enabled = false
            vim.api.nvim_create_autocmd("User", {
                pattern = "DebugModeChanged",
                callback = function(args)
                    debug_enabled = args.data.enabled
                end,
            })

            return {
                options = {
                    separator_style = "slant",

                    always_show_bufferline = true,

                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,

                    custom_areas = {
                        right = function()
                            local result = {}

                            local reg = vim.fn.reg_recording()
                            if reg ~= "" then
                                table.insert(result, { text = " " .. reg, link = "DiagnosticInfo" })
                            end

                            if debug_enabled then
                                table.insert(result, { text = " DEBUG", link = "DiagnosticWarn" })
                            end

                            return result
                        end,
                    },
                },
            }
        end,
        keys = {
            { "<M-i>", "<cmd>BufferLineCyclePrev<CR>", silent = true, desc = "Switch to Prev (cycle)" },
            { "<M-o>", "<cmd>BufferLineCycleNext<CR>", silent = true, desc = "Switch to Next (cycle)" },

            { "<M-I>", "<cmd>BufferLineMovePrev<CR>", silent = true, desc = "Move Current to Prev" },
            { "<M-O>", "<cmd>BufferLineMoveNext<CR>", silent = true, desc = "Move Current to Next" },

            { "<leader>bc", "<cmd>BufferLinePickClose<CR>", silent = true, desc = "Close Pick One" },
            { "<leader>bC", "<cmd>BufferLineCloseOthers<CR>", silent = true, desc = "Close Others" },

            { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", silent = true, desc = "Toggle Pin" },

            { "<leader>be", "<cmd>BufferLineSortByExtension<CR>", silent = true, desc = "Sort by Extension" },
            { "<leader>bd", "<cmd>BufferLineSortByDirectory<CR>", silent = true, desc = "Sort by Directory" },
        },
    },
}
