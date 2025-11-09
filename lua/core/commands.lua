vim.api.nvim_create_user_command("Indent", function(opts)
    if opts.args == "tab" then
        vim.opt_local.expandtab = false
        print("Indentation set to tabs")
        return
    end

    local indent_size = tonumber(opts.args)
    vim.opt_local.shiftwidth = indent_size
    vim.opt_local.tabstop = indent_size
    vim.opt_local.softtabstop = indent_size
    vim.opt_local.expandtab = true
    print("Indentation set to " .. indent_size .. " spaces")
end, {
    nargs = 1,
})
