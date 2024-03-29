local null_ls = require("null-ls")
local auggroup = vim.api.nvim_create_augroup("LspFormatting", {})
local opts = {
  sources = {
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.pyink,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.rustfmt,
  },
  on_attach = function (client, bufnr)
   if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = auggroup,
        buffer = bufnr
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = auggroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({ bufnr = bufnr})
        end
      })
    end
   end
}
return opts
