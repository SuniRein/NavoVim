return {
    "lewis6991/gitsigns.nvim",
    event = { "CursorHold", "CursorHoldI" },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        signs_staged = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "~" },
        },
        on_attach = function(buffer)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
            end

            map("n", "]h", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gs.nav_hunk("next")
                end
            end, "Next hunk")

            map("n", "[h", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gs.nav_hunk("prev")
                end
            end, "Prev Hunk")

            -- stylua: ignore start
            map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
            map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")

            map({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", "git: Stage hunk")
            map({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", "git: Reset hunk")
            map("n", "<leader>gS", gs.stage_buffer, "git: Stage buffer")
            map("n", "<leader>gR", gs.reset_buffer, "git: Reset buffer")
            map("n", "<leader>gu", gs.undo_stage_hunk, "git: Undo stage hunk")

            map("n", "<leader>gp", gs.preview_hunk_inline, "git: Preview hunk inline")
            map("n", "<leader>gP", gs.preview_hunk, "git: Preview hunk")

            map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "git: Blame line")
            map("n", "<leader>gB", function() gs.blame() end, "git: Blame buffer")

            map("n", "<leader>gd", gs.diffthis, "git: Diff this")
            map("n", "<leader>gD", function() gs.diffthis("~") end, "git: Diff this ~")

            map("n", "<M-g>", gs.toggle_deleted, "git: Toggle deleted")
            map("n", "<M-s>", gs.toggle_signs, "git: Toggle signs")
            map("n", "<M-w>", gs.toggle_word_diff, "git: Toggle word diff")

            map({'o', 'x'}, 'ih', gs.select_hunk, "git: Select hunk")
            -- stylua: ignore end
        end,
    },
}
