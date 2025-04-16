return {
    {
        "lambdalisue/vim-suda",

        -- vim-suda must be loaded after all BufEnter events
        -- since suda_smart_edit will close the current buffer and reopen a new one
        event = "LazyFile",
        priority = 10,

        init = function()
            vim.g.suda_smart_edit = 1
        end,
    },
}
