return {
    "mfussenegger/nvim-lint",
    event = "LazyFile",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            ghaction = { "actionlint" },
        }

        local js_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
        local eslint_markers = {
            ".eslintrc",
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            ".eslintrc.json",
            "eslint.config.js",
            "eslint.config.mjs",
            "eslint.config.cjs",
            "eslint.config.ts",
            "eslint.config.mts",
            "eslint.config.cts",
        }

        local cwd = vim.fn.getcwd()
        if require("lspconfig.util").root_pattern(eslint_markers)(cwd) then
            vim.env.ESLINT_D_PPID = vim.fn.getpid()
            for _, ft in ipairs(js_filetypes) do
                lint.linters_by_ft[ft] = { "eslint" }
            end
        end

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
