vim.wo.wrap = false

local bufnr = vim.api.nvim_get_current_buf()

local mv = require("markview")

Snacks.toggle({
    name = "Markview",
    get = function() return mv.actions.__is_enabled() end,
    set = function(state)
        if state then
            mv.actions.enable()
        else
            mv.actions.disable()
        end
    end,
}):map("<localleader>m", { buffer = bufnr })

Snacks.toggle({
    name = "Markview Split",
    get = function() return type(mv.state.splitview_source) == "number" end,
    set = function(state)
        if state then
            mv.actions.splitOpen()
        else
            mv.actions.splitClose()
        end
    end,
}):map("<localleader>s", { buffer = bufnr })

require("which-key").add({
    { "<leader>m", group = "Markdown", buffer = bufnr, icon = { icon = " ", color = "orange" } },
    { "<leader>h", group = "Markdown Header", buffer = bufnr, icon = { icon = " ", color = "cyan" } },
    { "<leader>T", group = "Markdown Table", buffer = bufnr, icon = { icon = " ", color = "yellow" } },
})
