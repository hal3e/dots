local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

return packer.startup(function(use)
   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

  use 'hal3e/nord.nvim'

  use "NvChad/nvim-base16.lua"

  use 'nvim-lua/plenary.nvim'

  use "kyazdani42/nvim-web-devicons"

  use 'Yggdroot/indentLine'

  use {
    "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup{
        comment_empty = false,
        create_mappings = false,
      } end,
  }

  use {
    "max397574/better-escape.nvim",
    config = function()
      require('better_escape').setup{
        mapping = 'nn',
        timeout = 200
      } end,
    event = "InsertEnter",
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-treesitter.configs').setup{
        highlight = {
          enable = true,
          use_languagetree = true,
        }
      } end,
    event = "BufRead",
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
    setup = require('plugins/nvim-cmp')
  }

  use {
    'neovim/nvim-lspconfig',
    setup = require('plugins/nvim-lspconfig')
  }

  use {
    "akinsho/bufferline.nvim",
    setup = require('plugins/bufferline')
  }

  use {
    'kyazdani42/nvim-tree.lua',
    setup = require('plugins/nvim-tree')
  }

  use {
    "famiu/feline.nvim",
    after = "nvim-web-devicons",
    setup = require('plugins/feline')
  }

  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  }

  use {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require('colorizer').setup({ "*" }, {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = false,
        css_fn = false,
        mode = "background",
       })
       vim.cmd "ColorizerAttachToBuffer"
      end,
  }
end)
