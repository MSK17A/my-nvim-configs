require("config.lazy")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("colorscheme catppuccin-frappe") --catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha"

vim.keymap.set('n', '<leader>T', function() vim.cmd("Telescope") end)
