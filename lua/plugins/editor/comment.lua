return {
    {
        "numtostr/Comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            opts = { enable_autocmd = false },
        },
        event = "LazyFile",
        config = function()
            -- FIX: line comment for c

            ---@diagnostic disable: missing-fields
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    },
}
