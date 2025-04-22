---@param client vim.lsp.Client
local function build_index(client)
    client:exec_cmd({
        command = "systemverilog.build_index",
    })
end

---@param client vim.lsp.Client
local function report_hierarchy(client)
    client:exec_cmd({
        command = "systemverilog.report_hierarchy",
        arguments = { vim.fn.expand("<cword>") },
    })
end

return {
    cmd = { "svlangserver" },
    filetypes = { "verilog", "systemverilog" },
    root_markers = { ".svlangserver", ".git" },
    settings = {
        systemverilog = {
            includeIndexing = { "*.{v,vh,sv,svh}", "**/*.{v,vh,sv,svh}" },
            launchConfiguration = "verilator --lint-only --Wall +1364-2005ext+v --timing",
            formatCommand = "verible-verilog-format --indentation_spaces=4",
        },
    },
    on_attach = function(client)
        vim.api.nvim_buf_create_user_command(0, "SvlangserverBuildIndex", function()
            build_index(client)
        end, { desc = "Instructs language server to rerun indexing" })

        vim.api.nvim_buf_create_user_command(0, "SvlangserverReportHierarchy", function()
            report_hierarchy(client)
        end, { desc = "Generates hierarchy for the given module" })
    end,
}
