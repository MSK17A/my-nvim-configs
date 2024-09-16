return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")

			-- Key binding
			local wk = require("which-key")
			wk.add({
				{ "<leader>f", group = "Find" }, -- group
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
				{ "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search current buffer", mode = "n" },
        { "<leader>fW", "<cmd>Telescope grep_string<cr>", desc = "Grep", mode = "n" }
			})
		end,
	},
}
