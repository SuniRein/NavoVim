local function format_filter(client)
    local lsp_formatters = require("utils.settings").lsp_formatters
    return vim.tbl_contains(lsp_formatters, client.name)
end

return {
    {
        "stevearc/conform.nvim",
        dependencies = {
            "folke/snacks.nvim",
        },
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            { "<C-M-f>", "<cmd>Format<CR>", desc = "Format Buffer" },
            { "<M-f>" },
            { "<M-F>" },
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
                require("conform").format({
                    async = true,
                    lsp_format = "fallback",
                    range = range,
                    filter = format_filter,
                })
            end, { range = true })
        end,

        ---@module "conform"
        ---@type fun(): conform.setupOpts
        opts = function()
            Snacks.toggle({
                name = "Auto Format (buffer)",
                get = function()
                    return vim.b.autoformat ~= false
                end,
                set = function(state)
                    vim.b.autoformat = state
                end,
            }):map("<M-f>")

            Snacks.toggle({
                name = "Auto Format (global)",
                get = function()
                    return vim.g.autoformat ~= false
                end,
                set = function(state)
                    vim.g.autoformat = state
                end,
            }):map("<M-F>")

            local markers = require("utils.root_markers")

            return {
                default_format_opts = {
                    lsp_format = "fallback",
                },

                format_on_save = function(bufnr)
                    if vim.g.autoformat ~= false and vim.b.autoformat ~= false then
                        return { timeout_ms = 500, filter = format_filter }
                    end
                    return nil
                end,

                formatters_by_ft = {
                    c = { "clang-format" },
                    cpp = { "clang-format" },

                    rust = { "rustfmt" },

                    python = { "ruff_format", "ruff_organize_imports" },

                    lua = { "stylua" },

                    html = { "prettierd" },
                    css = { "prettierd" },

                    javascript = { "prettierd", lsp_format = "last" },
                    typescript = { "prettierd", lsp_format = "last" },
                    javascriptreact = { "prettierd", lsp_format = "last" },
                    typescriptreact = { "prettierd", lsp_format = "last" },
                    vue = { "prettierd", lsp_format = "last" },

                    yaml = { "prettierd" },

                    json = { "fixjson", lsp_format = "last" },
                },

                formatters = {
                    fixjson = { prepend_args = { "--indent", "4" } },
                    stylua = { prepend_args = { "--indent-type", "Spaces" } },
                    prettierd = {
                        cwd = require("conform.util").root_file(markers.prettier),
                        require_cwd = true,
                    },
                },
            }
        end,
    },
}
