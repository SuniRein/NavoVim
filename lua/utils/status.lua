local buf = vim.api.nvim_create_buf(false, true)

local win = Snacks.win.new({
    show = false,
    width = 0.4,
    height = 0.4,
    title = "Status",
    position = "float",
    border = "rounded",
    buf = buf,
})

local function padding(str, len)
    local str_len = #str
    if str_len >= len then
        return str
    end

    local pad_len = len - str_len
    local left_pad = math.floor(pad_len / 2)
    local right_pad = pad_len - left_pad

    return string.rep(" ", left_pad) .. str .. string.rep(" ", right_pad)
end

local function show_table(tbl)
    return "[ " .. table.concat(tbl, ", ") .. " ]"
end

local function refresh()
    local filename = vim.fn.expand("%:t")
    local filetype = vim.bo.filetype

    local bufnr = vim.api.nvim_get_current_buf()

    local lsp_clients = vim.lsp.get_clients({ bufnr = bufnr })
    local lsp_names = {}
    for idx, client in ipairs(lsp_clients) do
        lsp_names[idx] = client.name
    end

    local formatters = require("conform").list_formatters_for_buffer(bufnr)

    local linters = require("lint").linters_by_ft[filetype] or {}

    local testers = require("neotest").state.adapter_ids()
    local tester_names = {}
    for idx, tester in ipairs(testers) do
        tester_names[idx] = vim.split(tester, ":")[1]
    end

    local display = {
        {
            key = "Filename",
            value = filename,
        },
        {
            key = "Filetype",
            value = filetype,
        },
        {
            key = "Lsp",
            value = show_table(lsp_names),
        },
        {
            key = "Linter",
            value = show_table(linters),
        },
        {
            key = "Formatter",
            value = show_table(formatters),
        },
        {
            key = "Tester",
            value = show_table(tester_names),
        },
    }

    local width = win:size().width - 2
    local key_width = width / 2
    local value_width = width / 2

    local content = {}
    for _, v in ipairs(display) do
        local key = padding(v.key, key_width)
        local value = padding(v.value, value_width)
        content[#content + 1] = key .. value
    end

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
end

local function display()
    refresh()
    win:show()
end

return {
    refresh = refresh,
    display = display,
}
