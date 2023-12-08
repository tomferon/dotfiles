-- Need to be before the other options.
vim.opt.compatible = false

vim.opt.filetype = "on"
vim.opt.filetype.plugin = "on"
vim.opt.filetype.indent = "on"

vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true

vim.opt.undofile = true

vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

vim.opt.scrolloff = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.history = 1000

vim.opt.wildignore = "*.jpg,*.png,*.o,*.pdf"

vim.cmd.syntax "on"
vim.cmd.colorscheme "catppuccin-frappe"

vim.opt.timeoutlen = 500
