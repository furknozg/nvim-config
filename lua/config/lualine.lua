require("lualine").setup {
	options = {
		theme = 'gruvbox', -- You can change this to your preferred theme
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	}
}
