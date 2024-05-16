local popup = require("plenary.popup")

local M = {}
local Win_id

local function ShowMenu(opts, cb)
  local height = 20
  local width = 30
  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

  Win_id = popup.create(opts, {
        title = "MyCommands",
        highlight = "MyCommandsWindow",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
        callback = cb,
  })
  local bufnr = vim.api.nvim_win_get_buf(Win_id)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { silent=false })
end

function M.CloseMenu()
  vim.api.nvim_win_close(Win_id, true)
end

function M.MyMenu()
  local opts = {
      "zz | centers cursor to middle",
      "yy | yanks the current line",
  }
  local cb = function(_, sel)
    print(sel)
  end
  ShowMenu(opts, cb)
end

return M
