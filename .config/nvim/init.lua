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

local plugins = {
  {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim',
          build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
      },
    },
    "nvim-treesitter/nvim-treesitter",
    "vim-airline/vim-airline",
    "ntpeters/vim-better-whitespace",
    "folke/which-key.nvim",
    "neovim/nvim-lspconfig",
  }
}

require("lazy").setup(plugins, {
  lazy = true
})

require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "css",
    "csv",
    "dhall",
    "dot",
    "haskell",
    "javascript",
    "json",
    "latex",
    "lua",
    "nix",
    "vim",
    "sql",
    "terraform",
    "typescript",
    "vimdoc",
    "query",
    "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,
}

require("telescope").setup {
  keys = {

  },
  extensions = {
    "fzf",
  },
}

require("which-key").setup {
}

require("lspconfig").rnix.setup {}

-- Need to be before the other options.
vim.opt.compatible = false

vim.opt.filetype = "on"
vim.opt.filetype.plugin = "on"
vim.opt.filetype.indent = "on"

vim.opt.number = true
vim.opt.numberwidth = 3

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

--vim.g.airline_theme = "catppuccin"
vim.cmd([[
  :AirlineTheme catppuccin
]])

vim.g.better_whitespace_enabled = true
vim.g.strip_whitespace_on_save = true
