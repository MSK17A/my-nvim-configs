return {
	-- Remind yourself with your Keymaps
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
			"<leader>e",
			"<cmd>Neotree toggle<cr>",
			desc = "Explore Files",
		},
	},

	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>c", group = "Code" }, -- group
		})
	end,
}
