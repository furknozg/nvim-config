local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local config = {
	"jose-elias-alvarez/null-ls.nvim",
	ft = { "lua", "python", "javascript", "typescript", "html", "css", "go", "rust", "json" },
	config = function()
		require("null-ls").setup({
			sources = {
				require("null-ls").builtins.formatting.prettier,
				require("null-ls").builtins.formatting.stylua,
				require("null-ls").builtins.formatting.black,
				require("null-ls").builtins.formatting.rustfmt,
				require("null-ls").builtins.formatting.gofmt,
				require("null-ls").builtins.formatting.goimports,
				require("null-ls").builtins.formatting.golines,
			},

			-- Setup format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- Format the buffer
							print("Formatting buffer...")
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}

return config
