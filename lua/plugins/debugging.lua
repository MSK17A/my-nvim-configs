return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()
		require("dap-go").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		local wk = require("which-key")
		-- Register your key mappings
		wk.add({
			{ "<leader>d", group = "Debug" }, -- group
		})

		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "continue" })
		vim.keymap.set("n", "<Leader>dC", dap.clear_breakpoints, { desc = "Clear breakpoints" })
	end,
}
