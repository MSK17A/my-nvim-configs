require("config.lazy")

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("colorscheme catppuccin-mocha") --catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha"
vim.wo.signcolumn = "yes"
vim.cmd("set cursorline")
vim.opt.ruler = true
vim.opt.breakindent = true

-- Set absolute line numbers
vim.opt.number = true
-- Set relative line numbers
vim.opt.relativenumber = true
vim.g.maplocalleader = ','
