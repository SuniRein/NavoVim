vim.filetype.add({
    pattern = {
        [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
        [".*/.github/workflows/.*%.yaml"] = "yaml.ghaction",

        [".*/kitty/.*%.conf"] = "kitty",
        [".*/kitty/.*%.session"] = "kitty-session",
    },
    extension = {
        snippets = "snippets",
        vh = "verilog",
        svh = "systemverilog",
    },
})
