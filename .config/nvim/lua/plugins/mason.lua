require("mason").setup({
  PATH = "append",
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
    border = "rounded",
  },
})

require("mason-lspconfig").setup({
  automatic_installation = {
    exclude = {
      "hls",
    },
  },
})
