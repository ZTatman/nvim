require("nvim-treesitter.configs").setup({
	textobjects = {
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
	highlight = {
		enable = true,
		-- disable = {},
		-- additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		-- disable = {},
	},
	auto_install = true,
	ensure_installed = {
		"go",
		"html",
		"java",
		"javascript",
		"json",
        "jsdoc",
		"lua",
		"markdown",
		"markdown_inline",
		"norg",
		"scss",
		"tsx",
		"typescript",
		"vimdoc",
		"vue",
		"yaml"
	}
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
