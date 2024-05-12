local M = {}

function M.setup(opts)
   opts = opts or {}

   vim.keymap.set("n", "<Leader>h", function()
      if opts.name then
         print("hello, " .. opts.name)
      else
         print("hello")
      end
   end)

   vim.keymap.set("n", "<C-a>", function()
       require("sticky-notes.mark")
   end)
end

return M
