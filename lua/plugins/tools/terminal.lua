local lazygit = nil
local function toggle_lazygit()
    if vim.fn.executable("lazygit") == 1 then
        if not lazygit then
            lazygit = require("toggleterm.terminal").Terminal:new({
                cmd = "lazygit",
                direction = "float",
                close_on_exit = true,
                hidden = true,
                float_opts = {
                    border = "none",
                },
            })
        end
        lazygit:toggle()
    else
        vim.notify("Command [lazygit] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
    end
end

return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = false, -- disable the default mapping
            persist_mode = false, -- if set to true (default) the previous terminal mode will be remembered

            -- UI options
            direction = "float",
            float_opts = {
                border = "rounded",
            },
            shade_terminals = false, -- this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
            shade_filetypes = {},
            highlights = {
                Normal = {
                    link = "Normal",
                },
                NormalFloat = {
                    link = "NormalFloat",
                },
                FloatBorder = {
                    link = "FloatBorder",
                },
            },
        },
        cmd = {
            "ToggleTerm",
            "ToggleTermSetName",
            "ToggleTermToggleAll",
            "ToggleTermSendVisualLines",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualSelection",
        },
        keys = {
            { "<M-d>", "<cmd>ToggleTerm<CR>", mode = { "n", "t" }, desc = "terminal: Toggle" },
            {
                "<leader>gg",
                function()
                    toggle_lazygit()
                end,
                desc = "terminal: Toggle lazygit",
            },
        },
    },
}
