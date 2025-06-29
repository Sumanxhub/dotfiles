return {

  require("conform").setup {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "autopep8" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      java = {},
      rust = { "rustfmt" },
      kotlin = { "ktlint" },
    },

    -- formatters = {
    --   ktlint = {
    --     timeout_ms = 5000,
    --   },
    -- },

    -- format_on_save = {
    --   timeout_ms = 1000,
    --   lsp_format = "fallback",
    -- },
  },

  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
      local filetype = vim.bo[args.buf].filetype
      local timeout = (filetype == "kotlin") and 5000 or 1000
      require("conform").format {
        bufnr = args.buf,
        -- lsp_fallback = true,
        lsp_fallback = (filetype ~= "kotlin"),
        timeout_ms = timeout,
      }
    end,
  }),
}
