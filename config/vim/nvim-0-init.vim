" config/vim/nvim-0-init.vim
let mapleader = " "

let g:ansible_unindent_after_newline = 1
let g:tmuxjump_telescope = v:true

let g:tmux_navigator_no_mappings = 1

noremap <silent> <C-n> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <C-e> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <C-i> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <C-o> :<C-U>TmuxNavigateRight<cr>

