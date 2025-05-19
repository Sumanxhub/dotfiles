return {

  require("conform").setup {
    default_format_opts = {
      lsp_format = "fallback", -- Ensure LSP formatting is used if available
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "autopep8" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
    },
    formatters = {
      python = { "autopep8" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 1000, -- Keep the same timeout as in the original config
      lsp_format = "fallback", -- Fallback to LSP formatting if needed
    },
  },
}
