return {
	gopls = {
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		cmd = { "gopls" },
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern("go.mod", "go.work")(fname) or
				vim.fs.dirname(fname)
		end,
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
					shadow = true,

				},
				staticcheck = true,
				completeUnimported = true,
				usePlaceholders= true
			},
		},
	},
}
