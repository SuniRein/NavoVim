local mappings = {
    add = "gsa",
    delete = "gsd",
    find = "gsf",
    find_left = "gsF",
    highlight = "gsh",
    replace = "gsr",
    update_n_lines = "gsn",
}

return {
    {
        "nvim-mini/mini.surround",
        version = false,
        keys = function(_, keys)
            local map = {
                { mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
                { mappings.delete, desc = "Delete Surrounding" },
                { mappings.find, desc = "Find Right Surrounding" },
                { mappings.find_left, desc = "Find Left Surrounding" },
                { mappings.highlight, desc = "Highlight Surrounding" },
                { mappings.replace, desc = "Replace Surrounding" },
                { mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
            }
            map = vim.tbl_filter(function(m) return m[1] and #m[1] > 0 end, map)
            return vim.list_extend(map, keys)
        end,
        opts = {
            mappings = mappings,
            silent = true,
        },
    },
}
