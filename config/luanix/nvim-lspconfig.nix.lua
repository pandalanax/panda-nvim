# config/luanix/nvim-lspconfig.lua.nix
# vim: ft=lua

{ pkgs }:
''
local nvim_lsp = require("lspconfig")
nvim_lsp.jedi_language_server.setup{}
nvim_lsp.nil_ls.setup{}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require("nvim-autopairs").setup {}
local cmp = require('cmp')
local luasnip = require('luasnip')

nvim_lsp.lemminx.setup{}

-- add friendly snippets to luasnip https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#add-snippets
require("luasnip.loaders.from_vscode").lazy_load({
  paths = { "${pkgs.vimPlugins.friendly-snippets}" }
  --paths = { "/nix/store/3knfdfi64h7kl62bnrx6qfpz95ja22gr-vimplugin-friendly-snippets-2024-02-17/" }
})

luasnip.config.setup {}

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}


''
