return {
    {
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = false,
        init = function()
            ---@class rustaceanvim.Config
            vim.g.rustaceanvim = {
                tools = {
                    open_url = function(url)
                        vim.ui.open(url)
                    end,
                },
            }
        end,
    },

    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        ---@module "crates"
        ---@type crates.UserConfig
        opts = {
            on_attach = function(bufnr)
                local crates = require("crates")

                local function map(key, func, desc)
                    vim.keymap.set("n", key, func, { buffer = bufnr, desc = "crates: " .. desc })
                end

                map("K", function()
                    if crates.popup_available() then
                        crates.show_popup()
                    else
                        vim.lsp.buf.hover()
                    end
                end, "Show popup")

                map("<localleader>t", crates.toggle, "Toggle")
                map("<localleader>r", crates.reload, "Reload")

                map("<localleader>f", crates.show_features_popup, "Show features popup")
                map("<localleader>v", crates.show_versions_popup, "Show versions popup")
                map("<localleader>d", crates.show_dependencies_popup, "Show dependencies popup")

                map("<localleader>u", crates.update_crate, "Update crate")
                map("<localleader>a", crates.update_all_crates, "Update all crates")
                map("<localleader>U", crates.upgrade_crate, "Upgrade crate")
                map("<localleader>A", crates.upgrade_all_crates, "Upgrade all crates")

                map("<localleader>x", crates.expand_plain_crate_to_inline_table, "Expand plain crate to inline table")
                map("<localleader>X", crates.extract_crate_into_table, "Extract crate into table")

                map("<localleader>H", crates.open_homepage, "Open homepage")
                map("<localleader>R", crates.open_repository, "Open repository")
                map("<localleader>D", crates.open_documentation, "Open documentation")
                map("<localleader>C", crates.open_crates_io, "Open crates.io")
                map("<localleader>L", crates.open_lib_rs, "Open lib.rs")
            end,
            popup = {
                border = "rounded",
            },
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        },
    },
}
