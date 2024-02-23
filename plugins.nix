# plugins.nix
{ pkgs }:
with pkgs.vimPlugins; [
  telescope-nvim # fuzzy search strings and files
  onedark-nvim # theme
  nvim-lspconfig # everything lsp related
  luasnip
  vim-nix
  cmp_luasnip # needed for snippets to work in auto complete
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

  nvim-treesitter.withAllGrammars # highlighting
  nvim-surround # surround words wit ( " ' or anything really
  vim-fugitive # git inside vim 
]
