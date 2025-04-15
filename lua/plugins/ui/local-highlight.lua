return {
    {
        "tzachar/local-highlight.nvim",
        dependencies = {
            "folke/snacks.nvim",
        },
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        opts = function()
            local lh = require("local-highlight")

            Snacks.toggle({
                name = "Local Highlight",
                get = function()
                    local bufnr = vim.fn.bufnr("%")
                    return lh.is_attached(bufnr)
                end,
                set = function(state)
                    local bufnr = vim.fn.bufnr("%")
                    if state then
                        lh.attach(bufnr)
                    else
                        lh.detach(bufnr)
                    end
                end,
            }):map("<leader>uH")

            return {
                disable_file_types = {
                    "markdown",
                },
            }
        end,
    },
}
