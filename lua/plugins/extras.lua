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
	{ -- For rainbow indent.
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = function(_, opts)
			-- Other blankline configuration here e
			require("indent-rainbowline").make_opts(opts)
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
