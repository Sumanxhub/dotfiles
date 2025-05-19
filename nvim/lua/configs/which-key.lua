dofile(vim.g.base46_cache .. "whichkey")
return {
  require("which-key").setup {
    event = "VeryLazy",
  },
}
