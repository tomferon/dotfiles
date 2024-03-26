return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.4",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
      },
    },
  },
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-context",
  "vim-airline/vim-airline",
  "ntpeters/vim-better-whitespace",
  "folke/which-key.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind.nvim",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp"
  },
  "saadparwaiz1/cmp_luasnip",
  "tpope/vim-sleuth",
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",
  {
    "tpope/vim-surround",
    dependencies = {
      "tpope/vim-repeat"
    },
  },
  "numToStr/Comment.nvim",
  "mbbill/undotree",
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  "mrded/nvim-lsp-notify",
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  "nvim-neo-tree/neo-tree.nvim",
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
    -- tag = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
}
