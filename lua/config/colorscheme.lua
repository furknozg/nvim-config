--local utils = require("utils")

local M = {}


M.colorscheme_conf = {
	gruvbox_material = function()
		-- foreground option can be material, mix, or original
		vim.g.gruvbox_material_foreground = "original"
		--background option can be hard, medium, soft
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_better_performance = 1

		vim.cmd([[colorscheme gruvbox-material]])
	end,
}

M.colorscheme = function()
	local colorscheme = "gruvbox_material"

	if not vim.tbl_contains(vim.tbl_keys(M.colorscheme_conf), colorscheme) then
		local msg = "Invalid colorscheme: " .. colorscheme
		vim.notify(msg, vim.log.levels.ERROR, { title = "nvim-config" })

		return
	end

	-- Load the colorscheme and its settings
	M.colorscheme_conf[colorscheme]()

	if vim.g.logging_level == "debug" then
		local msg = "Colorscheme: " .. colorscheme

		vim.notify(msg, vim.log.levels.DEBUG, { title = "nvim-config" })
	end
end

M.colorscheme()
