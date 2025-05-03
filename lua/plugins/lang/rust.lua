return {
    {
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = false,
        init = function()
            ---@class rustaceanvim.Config
            vim.g.rustaceanvim = {
                tools = {
                    open_url = function(url)
                        vim.ui.open(url)
                    end,
                },
            }
        end,
    },
}
