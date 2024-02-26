local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		-- Conform will run multiple formatters sequentially
		lua = { "stylua" },
		nix = { "alejandra" },
		yaml = { "prettier" },
		json = { "prettier" },
		python = { "black" },
		xml = { "xmlformat" },
		-- Use a sub-list to run only the first available formatter
	},
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		timeout_ms = 500,
	},
	notify_on_error = true,
})
