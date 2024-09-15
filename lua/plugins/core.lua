return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
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
        "<leader>T", "<cmd>Telescope find_files<cr>", desc = "Find Files" 
      },
      {
        "<leader>e", "<cmd>Neotree toggle<cr>", desc= "Explore Files"
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
  }
}
