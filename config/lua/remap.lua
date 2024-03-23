vim.g.mapleader = " "

vim.opt.relativenumber = true
vim.opt.nu = true

vim.keymap.set("n", "<leader>pv", "<cmd>Oil<cr>") -- project view
vim.keymap.set("n", "<leader>nf", "<cmd>NotesFind<cr>") -- project view
vim.keymap.set("n", "<leader>ng", "<cmd>NotesGrep<cr>") -- project view
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>") -- project view
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "n", "nzzzv") -- keeps cursos in middle when searching
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>o", 'o<Esc>0"_D') -- insert blank line without going into insert mode
vim.keymap.set("n", "<leader>O", 'O<Esc>0"_D')
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace current word with
vim.opt.smartindent = true
vim.keymap.set("n", "<C-e>", "<C-d>zz")
vim.keymap.set("n", "<C-i>", "<C-u>zz")

vim.keymap.set("v", "E", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "I", ":m '<-2<CR>gv=gv")

vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
	group = lastplace,
	pattern = { "*" },
	desc = "remember last cursor place",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
