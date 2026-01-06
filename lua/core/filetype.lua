vim.filetype.add({
    filename = {
        [".sqlfluff"] = "cfg",

        ["docker-compose.yml"] = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
    },
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
        gitconfig = "gitconfig",
    },
})
