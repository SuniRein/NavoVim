local function setupMarkview()
    vim.wo.wrap = false

    local mv = require("markview")

    vim.keymap.set("n", "<localleader>m", mv.actions.toggle, { desc = "Toggle Markview", buffer = true })
    vim.keymap.set("n", "<localleader>s", mv.actions.splitToggle, { desc = "Toggle Markview Split", buffer = true })
end

local function setupObsidian()
    local ok, obsidian = pcall(require, "obsidian")
    if not ok or obsidian == nil then
        return
    end

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
        vim.keymap.set(
            "n",
            "<localleader>" .. key,
            "<cmd>Obsidian " .. value[1] .. "<CR>",
            { desc = value[2], buffer = true }
        )
    end

    require("which-key").add({
        "<localleader>o",
        group = "Obsidian",
        icon = { icon = "📝 ", color = "yellow" },
        buffer = true,
    })
end

local function setupMarkdownPlus()
    require("which-key").add({
        { "<leader>m", group = "Markdown", buffer = true, icon = { icon = " ", color = "orange" } },
        { "<leader>h", group = "Markdown Header", buffer = true, icon = { icon = " ", color = "cyan" } },
        { "<leader>T", group = "Markdown Table", buffer = true, icon = { icon = " ", color = "yellow" } },
    })
end

setupMarkview()
setupObsidian()
setupMarkdownPlus()
