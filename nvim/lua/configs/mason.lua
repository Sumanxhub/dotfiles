local options = {
  ensure_installed = {
    -- Web Dev
    "html-lsp",
    "css-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "eslint-lsp",

    -- Programming
    "pyright",
    "clangd",
    "jdtls",
    "lua-language-server",
    -- "rust-analyzer",
    -- "sqlls",

    -- Formatters & Linters
    "prettier",
    "stylua",
    "htmlhint",
    "autopep8",
    -- "ruff",
  },

  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  max_concurrent_installers = 10,
}

-- 1. Apply NvChad's custom UI theming
dofile(vim.g.base46_cache .. "mason")

-- 2. Initialize Mason
require("mason").setup(options)

-- 3. Create the Smart MasonInstallAll Command
vim.api.nvim_create_user_command("MasonInstallAll", function()
  local registry = require "mason-registry"

  -- Refresh the registry to check for the latest versions
  registry.refresh(function()
    local missing_tools = {}

    -- Loop through our list and check if they are already installed
    for _, tool in ipairs(options.ensure_installed) do
      local p = registry.get_package(tool)
      if not p:is_installed() then
        table.insert(missing_tools, tool)
      end
    end

    -- We must use vim.schedule because the registry refresh is asynchronous
    vim.schedule(function()
      if #missing_tools > 0 then
        local tools_str = table.concat(missing_tools, " ")
        vim.cmd("MasonInstall " .. tools_str)
        print("Installing missing tools: " .. tools_str)
      else
        print "✓ All tools in ensure_installed are already installed!"
      end
    end)
  end)
end, {})
