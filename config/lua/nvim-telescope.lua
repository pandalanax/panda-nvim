-- config/lua/nvim-telescope.lua
local opt = { noremap = true }
local telescope = require("telescope")
telescope.setup({})
vim.api.nvim_set_keymap("n", "<leader>sg", ":lua require('telescope.builtin').live_grep()<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>sf", ":lua require('telescope.builtin').find_files()<CR>", opt)

