local notify = require("notify")

notify.setup({
  timeout = 5000,
})

require("lsp-notify").setup({
  notify = notify,
})
