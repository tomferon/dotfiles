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
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp"
    },
    "saadparwaiz1/cmp_luasnip",
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

local cmp = require("cmp")
cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
}

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" }
      }
    }
  })
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_attach = function()
  print("hello")
  local nmap = function(key, func)
    print("setting keymap")
    vim.keymap.set("n", key, func, { buffer = 0 })
  end
  nmap("K", vim.lsp.buf.hover)
  nmap("gd", vim.lsp.buf.definition) -- <C-t> to jump back.
  nmap("gr", vim.lsp.buf.references)
  nmap("gt", vim.lsp.buf.type_definition)
  nmap("gi", vim.lsp.buf.implementation)
  nmap("<leader>df", vim.diagnostic.goto_next)
  nmap("<leader>db", vim.diagnostic.goto_prev)
  nmap("<leader>.", vim.lsp.buf.code_action)
  nmap("<leader>r", vim.lsp.buf.rename)
end

local setup_lsp = function(name, args)
  args.capabilities = capabilities
  args.on_attach = lsp_attach
  require("lspconfig")[name].setup(args)
end

setup_lsp("rnix", {})

-- Need to be before the other options.
vim.opt.compatible = false

vim.opt.filetype = "on"
vim.opt.filetype.plugin = "on"
vim.opt.filetype.indent = "on"

vim.opt.number = true
vim.opt.numberwidth = 4

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
