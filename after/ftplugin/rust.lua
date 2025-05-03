local bufnr = vim.api.nvim_get_current_buf()

local function map_rust_lsp(key, action, desc)
    vim.keymap.set("n", key, function()
        vim.cmd.RustLsp(action)
    end, { silent = true, buffer = bufnr, desc = desc })
end

map_rust_lsp("<leader>rm", "expandMacro", "Expand Macro")
map_rust_lsp("<leader>re", "explainError", "Explian Error")
map_rust_lsp("<leader>rd", "renderDiagnostic", "Render Diagnostic")
map_rust_lsp("<leader>rD", "relatedDiagnostics", "Jump to Related Diagnostic")
map_rust_lsp("<leader>rc", "openCargo", "Open Cargo")
map_rust_lsp("<leader>ro", "openDocs", "Open Docs")

map_rust_lsp("J", "joinLines", "Join Lines")

require("which-key").add({
    { "<leader>r", group = "Rust", buffer = bufnr },
})
