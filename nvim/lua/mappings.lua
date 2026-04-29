-- require "nvchad.mappings" -- (Uncomment if you want NvChad's base mappings to load alongside yours)

local map = vim.keymap.set

-----------------------------------------------------------------
-- General / Editor 
-----------------------------------------------------------------
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "escape insert mode" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "general quit" })

-----------------------------------------------------------------
-- File Operations
-----------------------------------------------------------------
map("n", "<leader>ww", "<cmd>w<CR>", { desc = "save file" })
map("n", "<leader>wq", "<cmd>x<CR>", { desc = "save and quit" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "general save file" }) -- Merged the duplicate <C-s> mappings
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- Save without triggering autocommands (no formatting)
map("n", "<leader>W", "<cmd>noautocmd w<CR>", { desc = "save without formatting" })

-----------------------------------------------------------------
-- Movement (Insert Mode)
-----------------------------------------------------------------
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-----------------------------------------------------------------
-- Window Management
-----------------------------------------------------------------
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-----------------------------------------------------------------
-- Search & Highlights
-----------------------------------------------------------------
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "*", "*N", { desc = "Highlight word under cursor (stay in place)" })
map("n", "#", "#N", { desc = "Highlight word under cursor (stay in place)" })

-----------------------------------------------------------------
-- Toggles & UI
-----------------------------------------------------------------
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>so", "<cmd>lua vim.o.scrolloff = (vim.o.scrolloff == 999) and 0 or 999<CR>", { desc = "toggle scroll off", silent = true })
map("n", "<leader>cl", ':echo ""<CR>', { desc = "clear cmd", silent = true })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-----------------------------------------------------------------
-- Buffer Management (Tabufline)
-----------------------------------------------------------------
-- map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<tab>", function() require("nvchad.tabufline").next() end, { desc = "buffer goto next" })
map("n", "<S-tab>", function() require("nvchad.tabufline").prev() end, { desc = "buffer goto prev" })
map("n", "<leader>x", function() require("nvchad.tabufline").close_buffer() end, { desc = "buffer close" })

-- Switch buffers -> ALT + N
for i = 1, 9 do
  map("n", string.format("<A-%s>", i), function()
    local bufnr = vim.t.bufs[i]
    if bufnr then
      require("nvchad.tabufline").goto_buf(bufnr)
    else
      print("Buffer " .. i .. " does not exist!")
    end
  end, { desc = string.format("Go to buffer %s", i) })
end

-----------------------------------------------------------------
-- LSP & Formatting
-----------------------------------------------------------------
map("n", "<leader>fm", function() require("conform").format { lsp_fallback = true } end, { desc = "general format file" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-----------------------------------------------------------------
-- Core Plugins (Comments, NvimTree, Telescope)
-----------------------------------------------------------------
-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Telescope 
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>th", function() require("nvchad.themes").open() end, { desc = "telescope nvchad themes" })

-----------------------------------------------------------------
-- Utility Plugins (WhichKey, Markdown)
-----------------------------------------------------------------
-- WhichKey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>wk", function() vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ") end, { desc = "whichkey query lookup" })

-- Markdown Render
map("n", "<leader>me", function() require("render-markdown").enable() end, { desc = "Toggle On Markdown Rendering" })
map("n", "<leader>md", function() require("render-markdown").disable() end, { desc = "Toggle Off Markdown Rendering" })

-----------------------------------------------------------------
-- Terminal & Code Runner
-----------------------------------------------------------------
-- NvChad Terminal Escape
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- NvChad Terminals
map("n", "<leader>h", function() require("nvchad.term").new { pos = "sp" } end, { desc = "new horizontal terminal" })
map("n", "<leader>v", function() require("nvchad.term").new { pos = "vsp" } end, { desc = "new vertical terminal" })
map({ "n", "t" }, "<A-v>", function() require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" } end, { desc = "toggleable vertical terminal" })
map({ "n", "t" }, "<A-h>", function() require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" } end, { desc = "toggleable horizontal terminal" })
map({ "n", "t" }, "<A-i>", function() require("nvchad.term").toggle { pos = "float", id = "floatTerm" } end, { desc = "toggle floating terminal" })

-- Code Runner
map("n", "<leader>cr", function() require("runner").run() end, { desc = "Run Code" })
map("n", "<leader>ct", function() require("runner").toggle() end, { desc = "Toggle Runner Terminal" })
map("t", "<leader>ct", function() require("runner").toggle() end, { desc = "Hide Runner Terminal" })
