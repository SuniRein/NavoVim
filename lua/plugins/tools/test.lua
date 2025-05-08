local function is_cpp_test_file(file)
    local elems = vim.split(file, require("neotest.lib").files.sep, { plain = true })
    local filename = elems[#elems]
    if filename == "" then -- directory
        return false
    end

    local extensions = { "cpp", "cppm", "cc", "cxx", "c++" }

    local prefix, extension = filename:match("^(.*)%.([^%.]+)$")
    return prefix
        and extension
        and vim.tbl_contains(extensions, extension)
        and (vim.startswith(prefix, "test_") or vim.endswith(prefix, "_test") or vim.endswith(prefix, ".test"))
end

return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",

            "marilari88/neotest-vitest",
            "alfaix/neotest-gtest",
        },
        event = "VeryLazy",
        opts = function()
            local adapters = {}

            local vitest = require("neotest-vitest")({})
            table.insert(adapters, vitest)

            -- gtest conflicts with rustaceanvim
            if vim.fn.filereadable(vim.fn.getcwd() .. "/Cargo.toml") == 0 then
                local gtest = require("neotest-gtest").setup({
                    is_test_file = is_cpp_test_file,
                })
                table.insert(adapters, gtest)
            end

            local rust = require("rustaceanvim.neotest")
            table.insert(adapters, rust)

            return {
                adapters = adapters,
            }
        end,
        keys = {
            {
                "<leader>tr",
                function()
                    require("neotest").run.run()
                end,
                desc = "Run Nearest Test",
            },
            {
                "<leader>tf",
                function()
                    require("neotest").run.run(vim.fn.expand("%"))
                end,
                desc = "Run Current File",
            },
            {
                "<leader>ts",
                function()
                    require("neotest").summary.toggle()
                end,
                desc = "Toggle Summary",
            },
            {
                "<leader>to",
                function()
                    require("neotest").output.open({ enter = true })
                end,
                desc = "Open Output",
            },
            {
                "<leader>tO",
                function()
                    require("neotest").output_panel.toggle()
                end,
                desc = "Toggle Output Panel",
            },
        },
    },
}
