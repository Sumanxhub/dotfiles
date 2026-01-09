require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- Automatically exit Neovim if the only remaining window is NvimTree.
-- This prevents getting stuck with a single NvimTree pane after closing files.
autocmd("BufEnter", {
  callback = function()
    if vim.fn.winnr "$" == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd "quit"
    end
  end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { timeout = 1000 }
  end,
})

-- Disable auto-comments on 'o'
autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove { "o" }
  end,
})
