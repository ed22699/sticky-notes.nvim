local UI = require("sticky-notes.UI")
local Mark = require("sticky-notes.mark")
local M = {}

function M.setup(opts)
    opts = opts or {}
    vim.keymap.set("n", "<C-m", UI.MyMenu)
    vim.keymap.set("n", "<C-y", Mark.add_command)
end

return M
