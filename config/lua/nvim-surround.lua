local surround = require("nvim-surround")
surround.setup({
	keymaps = {
		insert = "<C-g>z",
		insert_line = "gC-ggZ",
		normal = "z",
		normal_cur = "Z",
		normal_line = "gzgz",
		normal_cur_line = "gZgZ",
		visual = "z",
		visual_line = "Z",
		delete = "dz",
		change = "cz",
	},
})
