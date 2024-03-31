-- require("colorbuddy").colorscheme("gruvbuddy")
-- vim.cmd.colorscheme("onedark")
--vim.cmd.colorscheme("gruvbuddy")

require("everforest").setup({
	---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
	---Default is "medium".
	background = "hard",
})
vim.cmd([[colorscheme everforest]])
