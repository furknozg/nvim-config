return {
	"folke/neodev.nvim",
	{'rcarriga/nvim-notify',
		config = function ()
			require("notify").setup {
				stages = 'fade_in_slide_out',
				background_colour = 'FloatShadow',
				timeout = 2000,
			}
			vim.notify = require('notify')
		end

	},
	"folke/which-key.nvim",
	"lewis6991/gitsigns.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = { on_attach = on_attach_change }
	},
	{ 'jokajak/keyseer.nvim', version = '*' },
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" }, -- Change from LazyFile
		lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treesitter** module to be loaded in time.
			-- Luckily, the only things that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<c-space>", desc = "Increment Selection" },
			{ "<bs>", desc = "Decrement Selection", mode = "x" },
		},
		opts_extend = { "ensure_installed" },
		---@type TSConfig
		---@diagnostic disable-next-line: missing-fields
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"diff", "html", "javascript", "jsdoc", "json", "jsonc", "lua", "luadoc", "luap", "markdown", "markdown_inline", "printf", "python", "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "xml", "yaml", }, incremental_selection = { enable = true, keymaps = { init_selection = "<C-space>", node_incremental = "<C-space>", scope_incremental = false, node_decremental = "<bs>", }, }, textobjects = { move = { enable = true, goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" }, goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" }, goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" }, goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
			},
			},
		},
		---@param opts TSConfig
		config = function(_, opts) 
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'ThePrimeagen/harpoon',
		dependencies = { 'nvim-lua/plenary.nvim'},
		config = function()
			require('harpoon').setup()
		end
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",         -- required
			"sindrets/diffview.nvim",        -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua",              -- optional
			"echasnovski/mini.pick",         -- optional
		},
		config = true
	},

}
