local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Set `mapleader` before lazy so your mappings are correct

local plugins = require("plugins")

require("lazy").setup(plugins, {
  lazy = true
})

require("options")

require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.cmp")
require("plugins.luasnip")
require("plugins.comment")
require("plugins.noice")
require("plugins.notify")
require("plugins.mason")

require("lsp")

require("which-key").setup {}
require("gitsigns").setup {}

require("keymaps")

--vim.g.airline_theme = "catppuccin"
vim.cmd([[
  :AirlineTheme catppuccin
]])

vim.g.better_whitespace_enabled = true
vim.g.strip_whitespace_on_save = true
