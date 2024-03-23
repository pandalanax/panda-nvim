require("toggleterm").setup({
	size = 20,
	open_mapping = [[<leader>a]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = false,
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = nil, -- change the default shell
	float_opts = {
		border = "rounded",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	winbar = {
		enabled = true,
		name_formatter = function(term) --  term: Terminal
			return term.count
		end,
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local htop = Terminal:new({ cmd = "htop", hidden = true })
local python = Terminal:new({ cmd = "python", hidden = true })

function _htop_toggle()
	htop:toggle()
end
function _lazygit_toggle()
	lazygit:toggle()
end

function _python_toggle()
	python:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua _htop_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua _python_toggle()<CR>", { noremap = true, silent = true })

local trim_spaces = true
vim.keymap.set("v", "<leader>ts", function()
	require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)
