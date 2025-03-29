return {
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"mfussenegger/nvim-dap",
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
