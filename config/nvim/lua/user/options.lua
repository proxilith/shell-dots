--
vim.g.mapleader = " "
vim.opt.number = true            -- show absolute line number on cursor line
vim.opt.relativenumber = true    -- show relative numbers on all other lines

-- NvimTree keymaps
vim.keymap.set("n", "<leader>s", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>a", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

-- telescope keymaps
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>fs", require("telescope.builtin").current_buffer_fuzzy_find)

-- LSP keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })





vim.keymap.set("n", "<leader>q", function()
  vim.ui.input({ prompt = "Save all and quit? (y/N): " }, function(input)
    if input and input:lower() == "y" then
      -- Save all modified buffers
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(buf, "modifiable") and vim.api.nvim_buf_get_option(buf, "modified") then
          vim.api.nvim_buf_call(buf, function()
            vim.cmd("silent write")
          end)
        end
      end

      -- Close NvimTree if open
      local ok, api = pcall(require, "nvim-tree.api")
      if ok then
        api.tree.close()
      end

      -- Exit Neovim
      vim.cmd("qa")
    else
      print("Aborted.")
    end
  end)
end, { desc = "Save all & quit Neovim" })

