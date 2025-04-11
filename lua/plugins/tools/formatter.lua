return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            { "<M-f>", "<cmd>Format<CR>", desc = "formatter: Format buffer" },
            { "<M-F>", "<cmd>FormatToggle!<CR>", desc = "formatter: Auto format toggle (buffer)" },
        },

        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, lsp_format = "fallback", range = range })
            end, { range = true })

            vim.api.nvim_create_user_command("FormatDisable", function(args)
                -- FormatDisable! will disable formatting just for this buffer
                if args.bang then
                    vim.notify("Autoformatting disabled (buffer)", vim.log.levels.INFO, { title = "Formatter" })
                    vim.b.disable_autoformat = true
                else
                    vim.notify("Autoformatting disabled (global)", vim.log.levels.INFO, { title = "Formatter" })
                    vim.g.disable_autoformat = true
                end
            end, {
                desc = "Disable autoformat-on-save",
                bang = true,
            })

            vim.api.nvim_create_user_command("FormatEnable", function(args)
                -- FormatEnable! will enable formatting just for this buffer
                if args.bang then
                    vim.notify("Autoformatting enabled (buffer)", vim.log.levels.INFO, { title = "Formatter" })
                    vim.b.disable_autoformat = false
                else
                    vim.notify("Autoformatting enabled (global)", vim.log.levels.INFO, { title = "Formatter" })
                    vim.g.disable_autoformat = false
                end
            end, {
                desc = "Enable autoformat-on-save",
                bang = true,
            })

            vim.api.nvim_create_user_command("FormatToggle", function(args)
                -- FormatToggle! will toggle formatting just for this buffer
                if args.bang then
                    if vim.b.disable_autoformat then
                        vim.notify("Autoformatting enabled (buffer)", vim.log.levels.INFO, { title = "Formatter" })
                        vim.b.disable_autoformat = false
                    else
                        vim.notify("Autoformatting disabled (buffer)", vim.log.levels.INFO, { title = "Formatter" })
                        vim.b.disable_autoformat = true
                    end
                else
                    if vim.g.disable_autoformat then
                        vim.notify("Autoformatting enabled (global)", vim.log.levels.INFO, { title = "Formatter" })
                        vim.g.disable_autoformat = false
                    else
                        vim.notify("Autoformatting disabled (global)", vim.log.levels.INFO, { title = "Formatter" })
                        vim.g.disable_autoformat = true
                    end
                end
            end, {
                desc = "Toggle autoformat-on-save",
                bang = true,
            })
        end,

        ---@module "conform"
        ---@type conform.setupOpts
        opts = {
            default_format_opts = {
                lsp_format = "fallback",
            },

            format_on_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return false
                end
                return { timeout_ms = 500 }
            end,

            formatters_by_ft = {
                lua = { "stylua" },
            },

            formatters = {
                stylua = { prepend_args = { "--indent-type", "Spaces" } },
            },
        },
    },
}
