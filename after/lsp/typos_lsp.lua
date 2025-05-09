return {
    -- disable in filetype `toggleterm`
    on_attach = function(client, bufnr)
        if vim.bo[bufnr].filetype == "toggleterm" then
            client:stop()
        end
    end,
}
