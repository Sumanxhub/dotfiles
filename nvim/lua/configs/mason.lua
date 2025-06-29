return {
  require("mason").setup {
    ensure_installed = {
      -- [  code suggesions

      --web dev
      "html-lsp",
      "css-lsp",
      "typescript-language-server",
      "tailwindcss-language-server",
      "eslint-lsp",

      --programing
      "pyright",
      -- "python-lsp-server",
      "clangd",
      "jdtls",
      "lua-language-server",
      "rust-analyzer",
      "kotlin-language-server",

      -- ]

      --formatters

      "prettier",
      "black",
      "autopep8",
      "stylua",
      "ktlint",

      --linters
      "pyflakes",
      "htmlhint",
      -- "mypy",
      -- "ruff",
    },

    automatic_installation = true,

    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },

    max_concurrent_installers = 10,
  },
}
