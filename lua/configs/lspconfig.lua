-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "lua_ls", "pylsp" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.html.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.cssls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = {"c", "cpp"},
  cmd = {"clangd"}
}

lspconfig.pylsp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = {"python"}
}

lspconfig.lua_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = {"lua"},
  cmd = {"lua-language-server"}
}
-- local lspconfig = require("lspconfig")

-- Lua Language Server setup
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },  -- Recognize 'vim' as a global variable
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- Make LSP aware of Neovim runtime files
                checkThirdParty = false,  -- Optional, disables third-party library check warning
            },
            telemetry = {
                enable = false,  -- Disable telemetry for privacy
            },
        },
    },
})

