require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local mason_lsp = require("mason-lspconfig")
mason_lsp.setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "gopls", "eslint", "ts_ls", "jsonls", "html", "cssls", "clangd" },
})

local mason_dap = require("mason-nvim-dap")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, cmp_caps)

mason_dap.setup({
	ensure_installed = { "delve", "python" },
	automatic_installation = true,
	automatic_setup = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

mason_lsp.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			--on_attach=on_attach,
			capabilities = capabilities,
		})
	end,

	["lua_ls"] = function()
		--print(lua_config)
		require("lspconfig").lua_ls.setup({
			--on_attach=on_attach,
			capabilities = capabilities,
			settings = require("config.lsp.lua-config"),
		})
	end,
	["gopls"] = function()
		local config = require("config.lsp.go-config")
		require("lspconfig").gopls.setup({
			--on_attach=on_attach,
			capabilities = capabilities,
			settings = config.gopls.settings,
		})
	end,
})

--require("config.lsp.lua-config")
