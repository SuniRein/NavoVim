local bufnr = vim.api.nvim_get_current_buf()

local function map_rust_lsp(key, action, desc)
    vim.keymap.set("n", key, function() vim.cmd.RustLsp(action) end, { silent = true, buffer = bufnr, desc = desc })
end

map_rust_lsp("<localleader>m", "expandMacro", "Expand Macro")
map_rust_lsp("<localleader>e", "explainError", "Explain Error")
map_rust_lsp("<localleader>d", "renderDiagnostic", "Render Diagnostic")
map_rust_lsp("<localleader>D", "relatedDiagnostics", "Jump to Related Diagnostic")
map_rust_lsp("<localleader>p", "parentModule", "Open Parent Module")
map_rust_lsp("<localleader>c", "openCargo", "Open Cargo")
map_rust_lsp("<localleader>o", "openDocs", "Open Docs")

map_rust_lsp("J", "joinLines", "Join Lines")

-- FIX: folds for rust functions is strange after move cursor
vim.keymap.set("n", "<leader>zf", [[<cmd>g/\<fn\>/norm zc<CR>]], { desc = "Close folds for all functions" })
vim.keymap.set("n", "<leader>zF", [[<cmd>g/\<fn\>/norm zo<CR>]], { desc = "Open folds for all functions" })
