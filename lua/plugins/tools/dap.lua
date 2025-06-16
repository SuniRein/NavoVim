return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local utils = require("dap.utils")

            dap.adapters.codelldb = {
                type = "executable",
                command = "codelldb",
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return utils.pick_file()
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
        end,
    },

    {
        "miroshQa/debugmaster.nvim",
        config = function()
            local dm = require("debugmaster")
            vim.keymap.set({ "n", "v" }, "<leader>d", dm.mode.toggle, { nowait = true, desc = "Debug Mode" })
            vim.keymap.set("t", "<C-/>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
        end,
    },
}
