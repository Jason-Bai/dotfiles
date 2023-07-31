local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local formatting = b.formatting

local diagnostics = b.diagnostics

local sources = {

  -- formattings

  -- webdev stuff
  formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
  formatting.prettier, -- so prettier works only on these filetypes

  -- Lua
  formatting.stylua,

  -- cpp
  formatting.clang_format,

  -- golang
  formatting.gofmt,

  -- python
  formatting.black,

  -- diagnosticss

  -- python
  diagnostics.flake8,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}
