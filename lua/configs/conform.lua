local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
  },
})

local function format_on_save()
  vim.api.nvim_create_autocmd("BufWritePre",{
    pattern = "*",
    callback = function()
      conform.format({ async = false, lsp_fallback = true })
    end,
  })
end

format_on_save()
  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },

