" config/vim/nvim-0-init.vim
let mapleader = " "

let g:ansible_unindent_after_newline = 1
let g:tmuxjump_telescope = v:true

let g:tmux_navigator_no_mappings = 1

noremap <silent> <M-n> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <M-e> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <M-i> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <M-o> :<C-U>TmuxNavigateRight<cr>

