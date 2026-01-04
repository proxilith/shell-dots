local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "pyright", "bashls" }, -- Add what you need
})

-- Include nvim-cmp capabilities for LSP
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "lua_ls", "pyright", "bashls", "cssls" }


for _, server in ipairs(servers) do
  local opts = {
    capabilities = capabilities,
  }

  if server == "lua_ls" then
    opts.settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    }
  end

  lspconfig[server].setup(opts)
end

