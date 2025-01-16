-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "oxocarbon",
  transparency = true,

  hl_override = {
  	Comment = { italic = true },
  	["@comment"] = { italic = true },
  },
}

M.ui = {

  statusline = {
    enabled = true,
    theme = "default",
    separator_style = "arrow",
    -- theme = "minimal",
    -- separator_style = "round",
  },

  tabufline = {
    enabled = true,
    lazyload = false,
    order = { "treeOffset", "buffers", "tabs", "btns"},
  },
}

return M
