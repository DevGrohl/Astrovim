local options = {
  formatters_by_ft = {
    go = { "gofmt", "goimports" },
    lua = { "stylua" },
    python = {"black"},
    rust = { "ast-grep", lsp_format = "fallback" },
  },

  fomat_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
