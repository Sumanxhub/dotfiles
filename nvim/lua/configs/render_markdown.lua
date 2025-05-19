return {
  require("render-markdown").setup {
    render_modes = { "n" },
    -- render_modes = true,
    heading = {
      enabled = true,
      render_modes = true,
      sign = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      position = "overlay", -- overlay, inline
      signs = { "󰫎 " },
      width = "full", -- block
    },
  },
}
