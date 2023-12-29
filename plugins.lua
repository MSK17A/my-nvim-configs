local plugins = {

-- In order to modify the `lspconfig` configuration:
{
  "neovim/nvim-lspconfig",
   config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
   end,
},
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"go", "javascript"},
    opts = function ()
      return require "custom.configs.null-ls"
    end
  }
}

return plugins
