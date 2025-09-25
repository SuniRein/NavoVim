return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*",
        cond = function()
            return vim.fn.getcwd() == vim.fn.expand("~/Obsidian")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "saghen/blink.cmp",
            "folke/snacks.nvim",
            "OXY2DEV/markview.nvim",
        },
        ---@module "obsidian"
        opts = function()
            local keymaps = {
                oo = { "quick_switch", "Search by file name" },
                oO = { "search", "Search by content" },
                on = { "new", "Create a new note" },
                of = { "follow_link", "Follow link under cursor" },
                ob = { "banklinks", "Search backlinks" },
                ol = { "links", "Search all links" },
                op = { "paste_img", "Paste image from clipboard" },
                ow = { "workspace", "Switch workspace" },
                ox = { "open", "Open in Obsidian App" },
            }
            for key, value in pairs(keymaps) do
                vim.keymap.set("n", "<localleader>" .. key, "<cmd>Obsidian " .. value[1] .. "<CR>", { desc = value[2] })
            end

            vim.treesitter.query.set(
                "markdown_inline",
                "injections",
                [[
((html_tag) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined))

((latex_block) @injection.content
  (#set! injection.language "typst")
  (#set! injection.include-children))]]
            )

            return {
                workspaces = {
                    {
                        name = "Obsidian",
                        path = "~/Obsidian",
                    },
                },
                note_id_func = function(title)
                    local suffix = ""
                    if title ~= nil then
                        suffix = vim.fn.trim(title)
                    else
                        for _ = 1, 4 do
                            suffix = suffix .. string.char(math.random(65, 90))
                        end
                    end
                    return suffix
                end,
                note_frontmatter_func = function(note)
                    local out = { aliases = note.aliases, tags = note.tags }
                    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                        for k, v in pairs(note.metadata) do
                            out[k] = v
                        end
                    end

                    return out
                end,
                completion = {
                    nvim_cmp = false,
                    blink = true,
                },
                picker = {
                    name = "snacks.pick",
                },
                legacy_commands = false,
            }
        end,
    },
}
