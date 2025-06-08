vim.filetype.add({
    pattern = {
        [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
        [".*/.github/workflows/.*%.yaml"] = "yaml.ghaction",
    },
    extension = {
        snippets = "snippets",
        vh = "verilog",
        svh = "systemverilog",
    },
})
