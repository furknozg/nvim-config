require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

local mason_lsp = require("mason-lspconfig")
mason_lsp.setup {
	ensure_installed = { "lua_ls", "rust_analyzer" },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_caps=require('cmp_nvim_lsp').default_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, cmp_caps)



mason_lsp.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			--on_attach=on_attach,
			capabilities=capabilities
		})
	end,

	['lua_ls'] = function()
		--print(lua_config)
		require("lspconfig").lua_ls.setup({
			--on_attach=on_attach,
			capabilities=capabilities,
			settings=require("config.lsp.lua-config")

		})
	end
})

--require("config.lsp.lua-config")



