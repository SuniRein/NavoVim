return {
    {
        "folke/paint.nvim",
        ft = { "lua" },
        ---@module "paint"
        opts = {
            ---@type PaintHighlight[]
            highlights = {
                -- paint @something in lua comments
                {
                    filter = { filetype = "lua" },
                    pattern = "%s*%-%-%-%s*(@%w+)",
                    hl = "Constant",
                },
            },
        },
    },
}
