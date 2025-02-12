local lspsaga = require("lspsaga")

-- Lspsaga
lspsaga.setup({
	symbol_in_winbar = {
		folder_level = 0,
	},
	diagnostic = {
		-- max_height = 0.8,
		-- max_width = 0.8,
		-- max_show_width = 0.8,
		extend_relatedInformation = true,
		keys = {
			quit = { "q", "<ESC>" },
		},
	},
})
