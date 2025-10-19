return {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            ghaction = { "actionlint" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
            callback = function() lint.try_lint() end,
        })
    end,
}
