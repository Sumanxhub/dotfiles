require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Create a custom group to prevent duplicate execution on reload
local user_cmds = augroup("UserCustomAutocmds", { clear = true })

-- Automatically exit Neovim if the only remaining window is NvimTree.
-- This prevents getting stuck with a single NvimTree pane after closing files.
autocmd("BufEnter", {
  group = user_cmds,
  callback = function()
    if vim.fn.winnr "$" == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd "quit"
    end
  end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  group = user_cmds,
  callback = function()
    vim.highlight.on_yank { timeout = 300 }
  end,
})

-- Disable auto-comments on 'o' and 'enter'
autocmd("BufEnter", {
  group = user_cmds,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
})

-- Hyprlang LSP
-- autocmd({ "BufReadPre", "BufNewFile" }, {
--   group = user_cmds,
--   pattern = { "*.hl", "hypr*.conf" },
--   callback = function()
--     vim.bo.filetype = "hyprlang"
--     vim.lsp.start {
--       name = "hyprlang",
--       cmd = { "hyprls" },
--       root_dir = vim.fn.getcwd(),
--     }
--   end,
-- })
