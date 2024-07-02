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

require("mason-nvim-dap").setup({
  ensure_installed = {
    "codelldb",
  },

  automatic_installation = {
    exclude = {
    },
  },

  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
  },
})
