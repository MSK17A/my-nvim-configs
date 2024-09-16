return {
	{ -- Your favorite colorscheme.
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{ -- neovim healthcheck thorw an error on me becasue this is not installed.
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	{ -- Remind yourself with your Keymaps
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
			{
				"<leader>T",
				"<cmd>Telescope find_files<cr>",
				desc = "Find Files",
			},
			{
				"<leader>e",
				"<cmd>Neotree toggle<cr>",
				desc = "Explore Files",
			},
		},
	},
	{ -- For rainbow indent.
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = function(_, opts)
			-- Other blankline configuration here e
			return require("indent-rainbowline").make_opts(opts)
		end,
		dependencies = {
			"TheGLander/indent-rainbowline.nvim",
		},
	},
	{ -- For gitlens like.
		"APZelos/blamer.nvim",
		config = function()
			vim.cmd("BlamerShow")
		end,
	},
}
