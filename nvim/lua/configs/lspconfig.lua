-----------------------------------------------------------------
-- Load NvChad default LSP settings
-----------------------------------------------------------------
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-----------------------------------------------------------------
-- Shared base configuration applied to ALL servers
-----------------------------------------------------------------
local base = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-----------------------------------------------------------------
-- Server definitions
-- simple  -> servers that work with defaults only
-- custom  -> servers that need extra settings / cmd / filetypes
-----------------------------------------------------------------
local servers = {
  simple = {
    "html",
    "ts_ls",
    -- "add_more_here"
  },

  custom = {

    clangd = {
      cmd = { "clangd" },
      filetypes = { "c", "cpp" },
    },

    cssls = {
      settings = {
        css = {
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    },

    lua_ls = {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    },

    pyright = {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            typeCheckingMode = "basic",
          },
        },
      },
    },

    tailwindcss = {
      filetypes = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
      settings = {
        classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
        tailwindCSS = {
          validate = true,
          experimental = {
            classRegex = {
              "tw`([^`]*)`",
              'tw="([^"]*)"',
              'tw={"([^"}]*)"}',
            },
          },
        },
      },
    },

    -- eslint = {
    --   filetypes = {
    --     "javascript",
    --     "javascriptreact",
    --     "javascript.jsx",
    --     "typescript",
    --     "typescriptreact",
    --     "typescript.tsx",
    --     "vue",
    --   },
    -- },

    jdtls = {
      settings = {
        java = {
          eclipse = { downloadSources = true },
          configuration = { updateBuildConfiguration = "interactive" },
          maven = { downloadSources = true },
          implementationsCodeLens = { enabled = true },
          referencesCodeLens = { enabled = true },
          format = { enabled = true },
        },
      },
    },

    -- rust_analyzer = {
    --   filetypes = { "rust" },
    --   settings = {
    --     ["rust-analyzer"] = {
    --       cargo = { allFeatures = true },
    --       check = {
    --         command = "clippy",
    --         enabled = true,
    --       },
    --       procMacro = {
    --         enable = true,
    --       },
    --     },
    --   },
    -- },

    -- add_more_here
  },
}

-----------------------------------------------------------------
-- Build final configs and register them ONCE per server
-----------------------------------------------------------------
local enabled = {}

-- Simple servers (base only)
for _, name in ipairs(servers.simple) do
  vim.lsp.config(name, base)
  table.insert(enabled, name)
end

-- Custom servers (base + server-specific config)
for name, cfg in pairs(servers.custom) do
  local final = vim.tbl_deep_extend("force", base, cfg)
  vim.lsp.config(name, final)
  table.insert(enabled, name)
end

-----------------------------------------------------------------
-- Enable all configured servers
-----------------------------------------------------------------
vim.lsp.enable(enabled)
