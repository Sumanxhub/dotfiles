return {
  require("nvim-tree").setup {
    view = {
      width = 30,
    },
    filters = {
      dotfiles = true,
    },
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
}
