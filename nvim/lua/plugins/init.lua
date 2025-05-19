return {
  ------------------- Conform ----------------------
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    cmd = { "ConformInfo" },
    config = function()
      require "configs.conform"
    end,
  },

  ------------------- Lspconfig --------------------

  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require "configs.lspconfig"
    end,
  },

  ------------------- Mason -----------------------
  --code suggesions and autocompletion plugins
  {
    "williamboman/mason.nvim",
    config = function()
      require "configs.mason"
    end,
  },

  ------------------- Treesitter -------------------
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "configs.treesitter"
    end,
  },

  ------------------- Telescope -------------------
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
      }
      -- or
      -- table.insert(conf.defaults.mappings.i, your table)
      return conf
    end,
  },

  ------------------- Nvim-tree ----------------------
  {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.nvim-tree"
    end,
  },

  ------------------ Auto-tag ----------------------
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require "configs.autotag"
    end,
  },

  ------------------- Which-key ----------------------
  {
    "folke/which-key.nvim",
    cmd = "WhichKey",
    config = function()
      require "configs.which-key"
    end,
  },

  ------------------- Markdown ----------------------
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    --@module 'render-markdown'
    --@type render.md.UserConfig
    opts = function()
      require "configs.render_markdown"
      require("render-markdown").enable()
    end,
  },
}
