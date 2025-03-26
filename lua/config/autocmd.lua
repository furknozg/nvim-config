vim.opt.number = true        -- Show line numbers
vim.opt.relativenumber = true -- Enable relative line numbers (optional)

vim.api.nvim_create_autocmd("BufHidden", {
	pattern = "*.lua",
	command = "execute 'normal! mzgg=G`z'"
})


