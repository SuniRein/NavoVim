-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/svlangserver.lua
return {
    settings = {
        systemverilog = {
            launchConfiguration = "verilator --lint-only --Wall +1364-2005ext+v --timing",
            formatCommand = "verible-verilog-format --indentation_spaces=4",
        },
    },
}
