local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "elkowar/yuck.vim",
  "nvim-lua/plenary.nvim",
  "akinsho/toggleterm.nvim",
  "nvim-treesitter/nvim-treesitter",
  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = true,
    priority = 1000,
    opts = {},
},

  -- Mason & LSP
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  "neovim/nvim-lspconfig",        -- core LSP plugin

  -- Completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",         -- 🔥 Required for LSP completion
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  'rktjmp/fwatch.nvim',
  "saadparwaiz1/cmp_luasnip",

  -- UI
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "nvim-telescope/telescope.nvim",
  "nvim-lualine/lualine.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
})
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "bash", "cpp", "json" }, -- or "all"
  highlight = { enable = true },
})

