local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

-- init.lua or a separate Lua file
-- -- Load plugins (assumes you're using packer/lazy/whatever)
-- local cmp = require("cmp")
-- local luasnip = require("luasnip")
--
-- -- Optional: lazy-load vscode-like snippets
-- require("luasnip.loaders.from_vscode").lazy_load()
--
-- cmp.setup({
--   completion = {
--     autocomplete = false, -- 👈 disables auto popup
--   },
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<C-Space>'] = cmp.mapping(function(fallback)
--   if cmp.visible() then
--     cmp.select_next_item()
--   else
--     cmp.complete() -- 👈 trigger manually
--   end
-- end, { "i", "s" }),
--
--     ['<S-Tab>']   = cmp.mapping.select_prev_item(),
--     ['<CR>']      = cmp.mapping.confirm({ select = true }),
--   }),
--   sources = cmp.config.sources({
--     { name = 'nvim_lsp' },
--     { name = 'buffer' },
--     { name = 'path' },
--     { name = 'luasnip' },
--   }),
--   experimental = {
--     ghost_text = true,
--   },
-- })
--
--
