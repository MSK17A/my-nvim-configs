return {
  {
    "mg979/vim-visual-multi",
  },
  { -- neovim healthcheck thorw an error on me becasue this is not installed.
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  -- { -- For rainbow indent.
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   opts = function(_, opts)
  --     -- Other blankline configuration here e
  --     require("indent-rainbowline").make_opts(opts)
  --   end,
  --   dependencies = {
  --     "TheGLander/indent-rainbowline.nvim",
  --   },
  -- },
  { -- For gitlens like.
    "APZelos/blamer.nvim",
    config = function()
      vim.cmd("BlamerShow")
    end,
  },
  -- {
  --   "karb94/neoscroll.nvim",
  --   config = function()
  --     require("neoscroll").setup({})
  --   end,
  -- },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    main = "nvim-silicon",
    opts = {
      -- Configuration here, or leave empty to use defaults
      -- to_clipboard = true,
      line_offset = function(args)
        return args.line1
      end,
    },
  },
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
            ⣀⣤⣀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣶⠿⣿⠯⠻⣷⣿⠙⠶⢶⣄⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠁⠀⠸⣿⣠⠉⢻⣤⡀⠉⢉⠽⠳⣤⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠐⠀⠀⢈⣙⣶⣿⡉⢳⠒⠁⣀⠴⠊⠻⣦⡀⠀
⠀⠀⠀⠀⠀⠀⠀⣀⡴⠋⢹⣄⣠⡶⢏⣹⠿⠁⢀⡼⠧⣌⡡⢀⡀⠀⠉⠻⡄
⠀⠀⠀⠀⣠⠤⠊⠁⠀⠢⢤⠬⠛⠏⠽⠧⠟⢉⣁⣀⣀⣈⣳⣤⣤⡀⠁⢰⣿
⠀⣀⡴⠞⢁⣀⣀⡀⠤⠤⠴⠒⢒⡀⠨⠭⠭⠭⠭⠭⠽⠿⠿⠿⢭⣉⠻⡏⠐
⢰⠟⣠⡤⠙⠛⠉⠉⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⣷⠀
⢸⡄⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣠⡤⣶⣤⣤⣤⣴⣖⣿⣿⡯⠿⠿⣧⢿⠀
⠀⣧⠤⣶⣶⣶⣾⣯⡿⠿⠿⠿⠿⢷⡿⢍⠛⠛⠉⠉⢡⠞⠀⢻⡄⠀⣿⢸⡀
⠀⣿⠋⠁⠀⣠⠾⠋⠘⣆⠀⠀⢀⡎⠀⠀⠳⣄⠀⠀⡟⠀⠰⠈⢻⡀⣿⢸⣏
⠀⣿⠀⠀⢸⡃⠰⠟⢐⡏⠀⠀⠘⣧⣀⣃⣀⣽⣆⣀⣉⣒⣒⣺⢿⣶⡏⢸⡇
⠀⢸⣆⣤⣤⣭⣿⣷⡿⣳⣿⠿⢿⣿⣟⣿⣿⠽⠛⠛⠛⠛⠛⠛⠋⠉⡷⢸⣷
⠀⠘⣿⠚⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠃⣸⠟
⠀⠀⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣤⣤⣤⡤⠴⠶⠾⠟⠉⠀
⠀⠀⠸⣧⣤⣤⡤⠴⠒⠒⠚⠛⠛⠛⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
          
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        },
      },
    },
  },
}
