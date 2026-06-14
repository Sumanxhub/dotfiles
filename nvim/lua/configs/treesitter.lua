local options = {
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
  }
  -- Note: You no longer need `highlight = { enable = true }` here. 
  -- NvChad handles `vim.treesitter.start()` automatically in its own autocmds now.
}

return options
