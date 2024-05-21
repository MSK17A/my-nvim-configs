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
    ft = {"go", "javascript", "javascriptreact", "typescript", "typescriptreact", "python", "cpp", "rust", "java"},
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  -- {
  --   'mfussenegger/nvim-lint',
  -- },
  {
    'Vimjas/vim-python-pep8-indent',
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  }
}

return plugins
