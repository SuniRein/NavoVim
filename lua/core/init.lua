require("core.filetype")
require("core.options")
require("core.keymaps")
require("core.event")
require("core.commands")
require("core.plugins") -- must be loaded after options and keymaps

-- FIX: osc52 error in ssh
if vim.env.SSH_CLIENT == nil then
    require("yank")
end
