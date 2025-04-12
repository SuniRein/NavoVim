return {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "zsh", "sh" },
    root_markers = { ".git" },
    settings = {
        bashIde = {
            globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.zsh|.command)",
        },
    },
}
