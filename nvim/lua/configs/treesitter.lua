require("nvim-treesitter.configs").setup {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",
    "vimdoc",

    -- web dev
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",

    -- programing
    "c",
    "cpp",
    "java",
    "python",

    --
    "markdown",
    "markdown_inline",
  },

  sync_install = false,
  auto_install = true,

  ignore_install = { "vimdoc" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
}
