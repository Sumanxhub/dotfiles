return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- code suggestions
        -- [web dev]
        "html-lsp",
        "css-lsp",
        "typescript-language-server",

        -- [programming]
        "python-lsp-server",
        "clangd",
        "lua-language-server",

        -- formatters
        "prettier",
        "black",
        "autopen8",
        "stylua",

        -- linters
        "pyflakes",
        "htmlhint",
        -- "ruff",
      },
    },
  },
  {
  	"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript", "tsx", "json",
        "python", "cpp", "c",
  		},
      highlight = { enable = true },
  	},
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
      }
      return conf
    end,
  },

}
