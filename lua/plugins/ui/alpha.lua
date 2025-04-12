local logo = [[
███╗   ██╗ █████╗ ██╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔══██╗██║   ██║██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║███████║██║   ██║██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══██║╚██╗ ██╔╝██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║██║  ██║ ╚████╔╝ ╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝   ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

local function button(shortcut, description)
    local opts = {
        position = "center",
        shortcut = shortcut,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl = "AlphaButtons",
        hl_shortcut = "AlphaShortcut",
    }

    return {
        type = "button",
        val = description,
        opts = opts,
    }
end

local function footer()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    return "   Have Fun with neovim"
        .. "  󰀨 v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
        .. "  ⚡"
        .. stats.loaded
        .. "/"
        .. stats.count
        .. " plugins in "
        .. ms
        .. "ms"
end

return {
    {
        "goolord/alpha-nvim",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.header.opts.hl = "AlphaHeader"

            dashboard.section.buttons.val = {
                button("space f f", "  Find file"),
                button("space f g", "  Live grap"),
                button("space f h", "󰘥  Help"),
                button("space s l", "  Session load"),
                button("ctrl n", "  Yazi file manager"),
            }
            dashboard.section.buttons.opts.hl = "AlphaButtons"

            dashboard.section.footer.val = ""
            dashboard.section.footer.opts.hl = "AlphaFooter"

            local head_butt_padding = 2
            local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
            local header_padding = math.max(0, math.ceil((vim.fn.winheight(0) - occu_height) * 0.25))
            local foot_butt_padding = 1

            dashboard.config.layout = {
                { type = "padding", val = header_padding },
                dashboard.section.header,
                { type = "padding", val = head_butt_padding },
                dashboard.section.buttons,
                { type = "padding", val = foot_butt_padding },
                dashboard.section.footer,
            }

            return dashboard
        end,
        config = function(_, dashboard)
            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd("User", {
                once = true,
                pattern = "LazyVimStarted",
                callback = function()
                    dashboard.section.footer.val = footer()
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },
}
