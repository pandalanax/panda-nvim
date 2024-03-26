# plugins.nix
{pkgs}:
with pkgs.vimPlugins; [
  telescope-nvim # fuzzy search strings and files
  onedark-nvim # theme
  kanagawa-nvim
  nvim-lspconfig # everything lsp related
  luasnip
  vim-nix
  cmp_luasnip # needed for snippets to work in auto complete
  comment-nvim
  friendly-snippets
  nvim-cmp
  cmp-nvim-lsp
  cmp-path
  cmp-buffer
  cmp-nvim-lua
  cmp-cmdline
  cmp-cmdline-history
  nvim-autopairs
  ansible-vim
  conform-nvim
  nvim-treesitter.withAllGrammars # highlighting
  nvim-treesitter-context
  oil-nvim
  notes
  nvim-surround # surround words wit ( " ' or anything really
  vim-fugitive # git inside vim
  toggleterm-nvim
]
