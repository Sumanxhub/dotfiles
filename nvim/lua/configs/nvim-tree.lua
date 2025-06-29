return {
  require("nvim-tree").setup {
    view = {
      width = 35,
    },
    filters = {
      dotfiles = true,
    },
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
}
