local colorizer_filetypes = {
    "html",
    "css",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "markdown",
}

return {
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html",
            "xml",
            "javascriptreact",
            "typescriptreact",
            "vue",
            "markdown",
        },
        opts = {
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true,
            },
        },
    },

    {
        "norcalli/nvim-colorizer.lua",
        dependencies = {
            "folke/snacks.nvim",
        },
        ft = colorizer_filetypes,
        config = function()
            local colorizer = require("colorizer")

            colorizer.setup(colorizer_filetypes, {
                RGB = true,
                RRGGBB = true,
                names = true,
                RRGGBBAA = false,
                rgb_fn = true,
                hsl_fn = true,
                mode = "background",
            })

            Snacks.toggle({
                name = "Colorizer",
                get = function()
                    return colorizer.is_buffer_attached(vim.api.nvim_get_current_buf())
                end,
                set = function(state)
                    if state then
                        colorizer.attach_to_buffer(vim.api.nvim_get_current_buf())
                    else
                        colorizer.detach_from_buffer(vim.api.nvim_get_current_buf())
                    end
                end,
            }):map("<leader>uc")
        end,
    },
}
