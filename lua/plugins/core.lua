local options = require("vim.filetype.options")
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
      local logo = [[
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
⠀⠀⠸⣧⣤⣤⡤⠴⠒⠒⠚⠛⠛⠛⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]]

      logo = string.rep("\n", 4) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "dracula",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              -- Custom component to show the repository name
              function()
                -- Use `git rev-parse --show-toplevel` to get the top-level directory of the Git repository
                local handle = io.popen("git rev-parse --show-toplevel 2> /dev/null")
                local result = handle:read("*a")
                handle:close()
                if result == "" then
                  return "[No Repo]"
                else
                  -- Extract the directory name (repository name) from the result
                  return vim.fn.fnamemodify(result, ":t")
                end
              end,
              icon = "", -- Optional: You can change or remove the icon
              color = { fg = "#fabd2f", gui = "bold" }, -- Customize the color
            },

            {
              "filename",
              path = 1, -- Show the full path of the file in the project
            },
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
    end,
  },

  -- -- Set the WezTerm colorscheme based on the Neovim colorscheme (IGNORE)
  -- vim.api.nvim_create_autocmd("ColorScheme", {
  --   group = vim.api.nvim_create_augroup("wezterm_colorscheme", { clear = true }),
  --   callback = function(args)
  --     local colorschemes = {
  --       ["tokyonight-day"] = "Tokyo Night Day",
  --       ["tokyonight-storm"] = "Tokyo Night Storm",
  --       ["catppuccin-frappe"] = "Catppuccin Frappe",
  --       ["catppuccin-latte"] = "Catppuccin Latte",
  --       ["catppuccin-macchiato"] = "Catppuccin Macchiato",
  --       ["catppuccin-mocha"] = "Catppuccin Mocha",
  --       ["gruvbox"] = "GruvboxDark",
  --       -- add more color schemes here ...
  --     }
  --     local colorscheme = colorschemes[args.match]
  --     if not colorscheme then
  --       return
  --     end
  --     -- Write the colorscheme to a file
  --     local filename = vim.fn.expand("$WEZTERM_CONFIG_DIR/colorscheme")
  --     assert(type(filename) == "string")
  --     local file = io.open(filename, "w")
  --     assert(file)
  --     file:write(colorscheme)
  --     file:close()
  --     vim.notify("Setting WezTerm color scheme to " .. colorscheme, vim.log.levels.INFO)
  --   end,
  -- }),
}
