return {
	-- add gruvbox
	{ "sainnhe/gruvbox-material" },
	-- Configure LazyVim to load gruvbox
	{
		"goolord/alpha-nvim",
		-- dependencies = { 'echasnovski/mini.icons' },
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			local dashboard = require("alpha.themes.dashboard")
			-- available: devicons, mini, default is mini
			-- if provider not loaded and enabled is true, it will try to use another provider

			--dashboard.file_icons.provider = "devicons"
			dashboard.section.header.val = {
				"						     ",
				" ███▄    █  ▓█████ ▒█████   ██▒   █▓  ██▓ ███▄ ▄███▓",
				" ██ ▀█   █  ▓█   ▀▒██▒  ██▒▓██░   █▒▒▓██▒▓██▒▀█▀ ██▒",
				"▓██  ▀█ ██▒ ▒███  ▒██░  ██▒ ▓██  █▒░▒▒██▒▓██    ▓██░",
				"▓██▒  ▐▌██▒ ▒▓█  ▄▒██   ██░  ▒██ █░░░░██░▒██    ▒██ ",
				"▒██░   ▓██░▒░▒████░ ████▓▒░   ▒▀█░  ░░██░▒██▒   ░██▒",
				"░ ▒░   ▒ ▒ ░░░ ▒░ ░ ▒░▒░▒░    ░ ▐░   ░▓  ░ ▒░   ░  ░",
				"░ ░░   ░ ▒░░ ░ ░    ░ ▒ ▒░    ░ ░░  ░ ▒ ░░  ░      ░",
				"   ░   ░ ░     ░  ░ ░ ░ ▒        ░  ░ ▒ ░░      ░   ",
				"         ░ ░   ░      ░ ░        ░    ░         ░   ",
				"						     ",
			}

			dashboard.section.buttons.val = {
				dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
				dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
				dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
				dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
				dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
			}

			require("alpha").setup(
				dashboard.opts
			)

			vim.cmd([[
			autocmd FileType alpha setlocal nofoldenable
			]])

		end,
	},

}
