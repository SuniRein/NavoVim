local bufnr = vim.api.nvim_get_current_buf()

local mv = require("markview")

Snacks.toggle({
    name = "Markview",
    get = function()
        return mv.actions.__is_enabled()
    end,
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
    get = function()
        return type(mv.state.splitview_source) == "number"
    end,
    set = function(state)
        if state then
            mv.actions.splitOpen()
        else
            mv.actions.splitClose()
        end
    end,
}):map("<localleader>s", { buffer = bufnr })

Snacks.toggle({
    name = "Markview Table Border",
    get = function()
        return vim.b.noborder ~= true
    end,
    set = function(state)
        vim.b.noborder = not state
        require("markview").commands.Render()
    end,
}):map("<localleader>b", { buffer = bufnr })
