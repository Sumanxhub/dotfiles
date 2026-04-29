local M = {}

-- persistent terminal state
local state = {
  bufnr = nil,
  winid = nil,
  chanid = nil,
}

----------------------------------------------------------
-- Helpers
----------------------------------------------------------

local function win_valid(win)
  return win and vim.api.nvim_win_is_valid(win)
end

local function buf_valid(buf)
  return buf and vim.api.nvim_buf_is_valid(buf)
end

local function open_window()
  vim.cmd("botright 20split")
  state.winid = vim.api.nvim_get_current_win()
end

----------------------------------------------------------
-- Terminal Management
----------------------------------------------------------

local function create_terminal()
  open_window()

  state.bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(state.winid, state.bufnr)

  vim.api.nvim_set_option_value("buflisted", false, { buf = state.bufnr })
  vim.api.nvim_set_option_value("swapfile", false, { buf = state.bufnr })

  state.chanid = vim.fn.jobstart(vim.o.shell, {
    term = true,
    detach = false,
  })

  vim.b[state.bufnr].terminal_job_id = state.chanid
end

local function show_terminal()
  if win_valid(state.winid) then
    return
  end
  open_window()
  vim.api.nvim_win_set_buf(state.winid, state.bufnr)
end

local function hide_terminal()
  if win_valid(state.winid) then
    vim.api.nvim_win_close(state.winid, true)
    state.winid = nil
  end
end

----------------------------------------------------------
-- PUBLIC API
----------------------------------------------------------

function M.toggle()
  if win_valid(state.winid) then
    hide_terminal()
  else
    if not buf_valid(state.bufnr) then
      create_terminal()
    else
      show_terminal()
    end
    -- Only enter insert mode when manually toggling, not when running code
    vim.cmd("startinsert")
  end
end

function M.run()
  -- 1. Auto-save the current file before running
  vim.cmd("silent! write")

  local ft = vim.bo.filetype
  local dir = vim.fn.expand("%:p:h")
  local file = vim.fn.expand("%:t")     -- file.cpp
  local name = vim.fn.expand("%:t:r")   -- file (no extension)

  -- 2. Combine clear and execution into a single command chain
  local cmd_by_ft = {
    c = string.format('clear && cd "%s" && gcc "%s" -o "%s.out" && "./%s.out"; rm -f "%s.out"', dir, file, name, name, name),
    cpp = string.format('clear && cd "%s" && g++ "%s" -o "%s.out" && "./%s.out"; rm -f "%s.out"', dir, file, name, name, name),
    python = string.format('clear && cd "%s" && python3 "%s"', dir, file),
  }

  local cmd = cmd_by_ft[ft]
  if not cmd then
    vim.notify("No runner configured for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  if not buf_valid(state.bufnr) then
    create_terminal()
  else
    show_terminal()
  end

  -- 3. Send the single command string
  vim.api.nvim_chan_send(state.chanid, cmd .. "\n")

  -- Optional: Jump back to your code window automatically
  -- vim.cmd("wincmd p") 
end

return M
