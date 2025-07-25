local logo = [[
███╗   ██╗ █████╗ ██╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔══██╗██║   ██║██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║███████║██║   ██║██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══██║╚██╗ ██╔╝██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║██║  ██║ ╚████╔╝ ╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝   ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]

return {
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,

        ---@module "snacks"
        ---@type snacks.Config
        opts = {
            bigfile = {},
            dashboard = {
                preset = { header = logo },
            },
            dim = {},
            indent = {
                chunk = { enabled = true },
                filter = function(buf)
                    return vim.g.snacks_indent ~= false
                        and vim.b[buf].snacks_indent ~= false
                        and vim.bo[buf].buftype == ""
                        and vim.bo.filetype ~= "markdown"
                end,
            },
            input = {},
            notifier = {},
            scope = {},
        },

        keys = {
            -- stylua: ignore start

            -- top pickers
            { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
            { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },

            -- notifications
            { "<leader>nl", function() Snacks.picker.notifications() end, desc = "History List" },
            { "<leader>nh", function() Snacks.notifier.hide() end, desc = "Hide All" },

            -- find
            { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config File" },
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Files" },
            { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Git Files" },
            { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
            { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

            -- git
            { "<leader>gx", function() Snacks.gitbrowse() end, desc = "Open Browser", mode = { "n", "v" } },
            { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },

            -- search
            { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
            { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
            { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },

            { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
            { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
            { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
            { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
            { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
            { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
            { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
            { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
            { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
            { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
            { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
            { "<leader>sm", function() Snacks.picker.man() end, desc = "Man Pages" },
            { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
            { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume" },
            { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },

            { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },

            -- stylua: ignore end
        },

        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command

                    -- Create some toggle mappings
                    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>ul")
                    Snacks.toggle.line_number():map("<leader>uL")
                    Snacks.toggle.diagnostics():map("<leader>ud")
                    Snacks.toggle.treesitter():map("<leader>uT")
                    Snacks.toggle
                        .option("background", { off = "light", on = "dark", name = "Dark Background" })
                        :map("<leader>ub")
                    Snacks.toggle.inlay_hints():map("<leader>uh")
                    Snacks.toggle.indent():map("<leader>ui")
                    Snacks.toggle.dim():map("<leader>uD")
                end,
            })

            ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
            local progress = vim.defaulttable()
            vim.api.nvim_create_autocmd("LspProgress", {
                ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
                callback = function(ev)
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
                    if not client or type(value) ~= "table" then
                        return
                    end
                    local p = progress[client.id]

                    for i = 1, #p + 1 do
                        if i == #p + 1 or p[i].token == ev.data.params.token then
                            p[i] = {
                                token = ev.data.params.token,
                                msg = ("[%3d%%] %s%s"):format(
                                    value.kind == "end" and 100 or value.percentage or 100,
                                    value.title or "",
                                    value.message and (" **%s**"):format(value.message) or ""
                                ),
                                done = value.kind == "end",
                            }
                            break
                        end
                    end

                    local msg = {} ---@type string[]
                    progress[client.id] = vim.tbl_filter(function(v)
                        return table.insert(msg, v.msg) or not v.done
                    end, p)

                    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                    vim.notify(table.concat(msg, "\n"), vim.log.levels.INFO, {
                        id = "lsp_progress",
                        title = client.name,
                        opts = function(notif)
                            notif.icon = #progress[client.id] == 0 and " "
                                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                        end,
                    })
                end,
            })
        end,
    },
}
