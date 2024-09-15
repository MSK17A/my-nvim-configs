local wk = require("which-key")

-- Register your key mappings
wk.register({
  ["<leader>T"] = { "<cmd>Telescope find_files<cr>", "󰱼 Find Files" }, -- Add an icon to the description
})

