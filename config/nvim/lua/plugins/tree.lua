require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_root = false, -- set to true if you want cwd to follow buffer
  },
})
local api = require("nvim-tree.api")
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local api = require("nvim-tree.api")

    -- Open NvimTree only if files were passed to `nvim`
  end,
})

