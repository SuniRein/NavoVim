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
