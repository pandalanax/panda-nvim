vim.g.mapleader = " "

vim.opt.relativenumber = true
vim.opt.nu = true

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- project view 
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "n", "nzzzv") -- keeps cursos in middle when searching
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace current word with

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
