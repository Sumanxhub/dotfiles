return {
  require("nvim-tree").setup {
    view = {
      width = 35,
    },
    filters = {
      dotfiles = false,
    },
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
}
