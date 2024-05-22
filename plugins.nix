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
  #friendly-snippets
  nvim-cmp
  cmp-nvim-lsp
  cmp-path
  cmp-buffer
  cmp-nvim-lua
  cmp-cmdline
  cmp-cmdline-history
  cmp-emoji
  nvim-autopairs
  colorbuddy-nvim
  cobalt
  leap-nvim
  nvimtheme
  ansible-vim
  conform-nvim
  nvim-treesitter.withAllGrammars # highlighting
  nvim-treesitter-context
  bullets-vim
  oil-nvim
  notes
  tmuxjump
  nvim-surround # surround words wit ( " ' or anything really
  nvim-ts-autotag
  vim-tmux-navigator
  vim-gitgutter
  toggleterm-nvim
  neogit
  diffview-nvim
  plenary-nvim
  nvim-web-devicons
  rustaceanvim
]
