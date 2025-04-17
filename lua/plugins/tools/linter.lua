return {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    config = function()
        local lint = require("lint")

        vim.env.ESLINT_D_PPID = vim.fn.getpid()
        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            vue = { "eslint_d" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
