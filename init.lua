-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.clipboard = "unnamedplus"

vim.keymap.set({ "n", "v", "o" }, "<PageUp>", "<C-y>", { desc = "Scroll up one line" })
vim.keymap.set({ "n", "v", "o" }, "<PageDown>", "<C-e>", { desc = "Scroll down one line" })
