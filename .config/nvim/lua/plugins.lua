return {
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
    "tpope/vim-sleuth",
    "tpope/vim-fugitive",
    "airblade/vim-gitgutter",
    { "tpope/vim-surround",
      dependencies = {
        "tpope/vim-repeat"
      },
    }
  }
}
