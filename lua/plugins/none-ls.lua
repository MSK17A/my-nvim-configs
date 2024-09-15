return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
      -- TODO: Find a way to automate this (take formatters from mason and loop)
			sources = {
        null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.stylua,
			},
		})
		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code" })
	end,
}
