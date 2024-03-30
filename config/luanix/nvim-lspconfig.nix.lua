# config/luanix/nvim-lspconfig.lua.nix
# vim: ft=lua

{ pkgs }:
''
local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.jedi_language_server.setup{}
require'lspconfig'.nil_ls.setup{
  autostart = true,
  settings = {
    ['nil'] = {
      formatting = {
        command = { "alejandra" },
      },
    },
  },
  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set("n", "k", vim.lsp.buf.hover,{ buffer=0 } )
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,{ buffer=0 } )
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,{ buffer=0 } )
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>rf", "<cmd>Telescope lsp_references<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next,{ buffer=0 } )
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev,{ buffer=0 } )
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,{ buffer=0 } )
  end,
}
nvim_lsp.gopls.setup{
  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set("n", "k", vim.lsp.buf.hover,{ buffer=0 } )
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,{ buffer=0 } )
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,{ buffer=0 } )
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>rf", "<cmd>Telescope lsp_references<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next,{ buffer=0 } )
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev,{ buffer=0 } )
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,{ buffer=0 } )
  end,
  settings = {
    completeunimported = true,
    analyses = {
      unusedparams = true,
    }
  }
}
nvim_lsp.ansiblels.setup{

  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set("n", "k", vim.lsp.buf.hover,{ buffer=0 } )
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,{ buffer=0 } )
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,{ buffer=0 } )
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>rf", "<cmd>Telescope lsp_references<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next,{ buffer=0 } )
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev,{ buffer=0 } )
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,{ buffer=0 } )
  end,
}
require'lspconfig'.tsserver.setup{
  cmd = {
          "${pkgs.nodePackages_latest.typescript-language-server}/bin/typescript-language-server",
          "--stdio"
        },
          -- ,
          -- "--tsserver-path",
          -- "/nix/store/cq9s34idhmcwqiy4jb89ghlpr6x6wiz1-typescript-4.5.5/lib/" }
  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set("n", "k", vim.lsp.buf.hover,{ buffer=0 } )
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,{ buffer=0 } )
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,{ buffer=0 } )
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>rf", "<cmd>Telescope lsp_references<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next,{ buffer=0 } )
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev,{ buffer=0 } )
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,{ buffer=0 } )
  end,
}
require'lspconfig'.svelte.setup{
  cmd = {
          "${pkgs.nodePackages_latest.svelte-language-server}/bin/svelteserver",
          "--stdio"
        },
  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set("n", "k", vim.lsp.buf.hover,{ buffer=0 } )
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,{ buffer=0 } )
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,{ buffer=0 } )
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>rf", "<cmd>Telescope lsp_references<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next,{ buffer=0 } )
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev,{ buffer=0 } )
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,{ buffer=0 } )
  end,
}

require'lspconfig'.ltex.setup{
 settings = {
		ltex = {
			language = "en-GB",
		},
	},

  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set("n", "k", vim.lsp.buf.hover,{ buffer=0 } )
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,{ buffer=0 } )
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,{ buffer=0 } )
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>rf", "<cmd>Telescope lsp_references<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next,{ buffer=0 } )
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev,{ buffer=0 } )
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,{ buffer=0 } )
  end,

}

require'lspconfig'.lua_ls.setup{

  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set("n", "k", vim.lsp.buf.hover,{ buffer=0 } )
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,{ buffer=0 } )
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,{ buffer=0 } )
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>rf", "<cmd>Telescope lsp_references<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next,{ buffer=0 } )
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev,{ buffer=0 } )
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,{ buffer=0 } )
  end,

}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require("nvim-autopairs").setup {}
local cmp = require('cmp')
local luasnip = require('luasnip')

nvim_lsp.lemminx.setup{}

-- add friendly snippets to luasnip https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#add-snippets
--[[ require("luasnip.loaders.from_vscode").lazy_load({
  paths = { "${pkgs.vimPlugins.friendly-snippets}" }
  --paths = { "/nix/store/3knfdfi64h7kl62bnrx6qfpz95ja22gr-vimplugin-friendly-snippets-2024-02-17/" }
}) ]]

luasnip.config.setup {
  capabilities = capabilities,
  on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover,{ buffer=0 } )
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,{ buffer=0 } )
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,{ buffer=0 } )
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>",{ buffer=0 } )
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next,{ buffer=0 } )
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev,{ buffer=0 } )
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,{ buffer=0 } )
  end,
}


nvim_lsp.jsonls.setup {
  capabilities = capabilities,
}

nvim_lsp.yamlls.setup{}

nvim_lsp.docker_compose_language_service.setup{}

require('Comment').setup()
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-2>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

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
    ['<C-1>'] = cmp.mapping.select_next_item(),
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
    { name = 'buffer', keyword_length = 4 },
  },

  experimental = {
    ghost_text= true,
    native_menu = false,
  }
}
-- `:` cmdline setup.
-- 
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})


''
