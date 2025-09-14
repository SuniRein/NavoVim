local M = {
    {
        "mikesmithgh/kitty-scrollback.nvim",
        cmd = {
            "KittyScrollbackGenerateKittens",
            "KittyScrollbackCheckHealth",
            "KittyScrollbackGenerateCommandLineEditing",
        },
        event = "User KittyScrollbackLaunch",
        opts = {},
    },

    {
        "saghen/blink.cmp",
        optional = true,
        dependencies = { "garyhurtz/blink_cmp_kitty" },
        opts = {
            sources = {
                default = { "blink_cmp_kitty" },
                providers = {
                    blink_cmp_kitty = {
                        name = "kitty",
                        module = "blink_cmp_kitty",
                        score_offset = -100,
                    },
                },
            },
        },
    },
}

local disable_plugins = {
    "zbirenbaum/copilot.lua",
}

if vim.env.KITTY_SCROLLBACK_NVIM == "true" then
    for _, plugin in ipairs(disable_plugins) do
        table.insert(M, { plugin, cond = false })
    end
end

return M
