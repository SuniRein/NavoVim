return {
    {
        "Mythos-404/xmake.nvim",
        event = {
            "BufReadPost xmake.lua",
        },
        init = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client and client.name == "clangd" then
                        require("xmake").setup({})
                    end
                end,
            })
        end,
        config = function()
            vim.g.lazydev_enabled = false
            require("xmake").setup({})
        end,
    },
}
