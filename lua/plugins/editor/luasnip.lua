return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        lazy = true,
        opts = function()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
    },
}
