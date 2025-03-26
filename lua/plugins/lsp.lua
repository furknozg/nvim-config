return {
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{"neovim/nvim-lspconfig",
		},
	},
	{
		"klen/nvim-test",
		config = function()
			require('nvim-test').setup()
		end
	}
}
