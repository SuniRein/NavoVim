local cursor_pre_yank
local sync_yank = false
local timer = assert(vim.uv.new_timer())

for key, actual in pairs({ y = "y", Y = "y$" }) do
    vim.keymap.set({ "n", "x" }, key, function()
        cursor_pre_yank = vim.api.nvim_win_get_cursor(0)
        return actual
    end, { expr = true })
end

for _, key in ipairs({ "p", "P", "]p", "[p", "gp", "gP" }) do
    vim.keymap.set({ "n", "x" }, key, function()
        if timer:is_active() then
            timer:stop()
        end
        -- Cancel syncing to system clipboard if it is pasted inside Nvim.
        sync_yank = false
        return key
    end, { expr = true, remap = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Yank improvements",
    callback = function()
        if vim.v.event.operator ~= "y" then
            return
        end

        -- Restore cursor position after yanking
        if cursor_pre_yank then
            vim.api.nvim_win_set_cursor(0, cursor_pre_yank)
            cursor_pre_yank = nil
        end

        -- Yank ring
        for i = 9, 1, -1 do -- Shift all numbered registers.
            vim.fn.setreg(tostring(i), vim.fn.getreg(tostring(i - 1)))
        end

        sync_yank = true
        if timer:is_active() then
            timer:stop()
        end
        -- Cancel syncing to system clipboard if it is yanked 5 seconds before leaving Nvim.
        timer:start(5000, 0, function() sync_yank = false end)
    end,
})

vim.api.nvim_create_autocmd({ "FocusLost", "ExitPre" }, {
    desc = "Sync Neovim clipboard to system",
    callback = function()
        if sync_yank then
            sync_yank = false
            if timer:is_active() then
                timer:stop()
            end
            vim.fn.setreg("+", vim.fn.getreg('""'))
        end
    end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "VimEnter" }, {
    desc = "Sync system clipboard to Neovim",
    callback = function()
        -- In case switching from another Nvim instance.
        vim.defer_fn(function()
            local status, system_clipboard = pcall(vim.fn.getreg, "+")
            if not status and system_clipboard ~= vim.fn.getreg('""') then
                vim.fn.setreg('"', system_clipboard)
            end
        end, 200)
    end,
})
