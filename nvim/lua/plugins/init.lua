return {
  ------------------- Conform ----------------------
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    config = function()
      require "configs.formatter"
    end,
  },

  ------------------- Lspconfig --------------------
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  ------------------- Mason -----------------------
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    config = function()
      require "configs.mason"
    end,
  },

  ------------------- Treesitter -------------------
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "configs.treesitter"
    end,
  },

  ------------------- Telescope -------------------
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
      }
      return conf
    end,
  },

  ------------------- Nvim-tree ----------------------
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.nvim-tree"
    end,
  },

  ------------------ Auto-tag ----------------------
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.autotag"
    end,
  },

  ------------------- Which-key ----------------------
  {
    "folke/which-key.nvim",
    keys = { "<leader>" },
    cmd = "WhichKey",
    config = function()
      require "configs.which-key"
    end,
  },

  ------------------- Markdown ----------------------
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = function()
      require "configs.render_markdown"
      require("render-markdown").enable()
    end,
  },
}
