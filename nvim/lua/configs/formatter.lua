-- lua/configs/conform.lua

local conform = require "conform"

------------------------------------------------------------------
--Define formatting behavior *profiles*
------------------------------------------------------------------
local format_profiles = {
  default = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },

  slow = {
    timeout_ms = 5000,
    lsp_fallback = false,
  },

  strict = {
    timeout_ms = 2000,
    lsp_fallback = false,
  },
}

------------------------------------------------------------------
-- Map filetypes to format_profiles
------------------------------------------------------------------
-- Only specify filetypes that need special treatment;
-- others will use 'default' automatically.

local formatter_behavior = {
  kotlin = "slow",
  python = "slow",
  json = "strict",
}

------------------------------------------------------------------
-- Configure Conform with formatter tools per filetype
------------------------------------------------------------------
conform.setup {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "autopep8" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    kotlin = { "ktlint" },

    -- add more filetypes here
  },
}

------------------------------------------------------------------
-- Format-on-save autocmd picking profile by filetype
------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local profile_name = formatter_behavior[ft] or "default"
    local profile = format_profiles[profile_name]

    require("conform").format {
      bufnr = args.buf,
      timeout_ms = profile.timeout_ms,
      lsp_fallback = profile.lsp_fallback,
    }
  end,
})
