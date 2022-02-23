local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

return packer.startup(function(use)
  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }

  use {
    'hal3e/nord.nvim'
  }

  use {
    'nvim-lua/plenary.nvim'
  }

  use {
    'petertriho/nvim-scrollbar',
    event = "BufRead",
    config = function()
      require('scrollbar').setup()
    end,
  }

  use {
    "kyazdani42/nvim-web-devicons",
    after = "nord.nvim",
    config = function()
      require('plugins.icons')
    end,
  }

  use {
    "folke/todo-comments.nvim",
    event = "BufRead",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup{
        keywords = {
          FIX =  { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        },
          colors = {
          warning = { "DiagnosticSignWarn" }
        },
      } end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    config = function()
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-e>"] = "move_selection_previous"
            }
          }
        },
    } end,
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require('indent_blankline').setup{
        show_current_context = true,
        show_trailing_blankline_indent = false
    } end,
  }

  use {
    "terrortylor/nvim-comment",
    cmd = "CommentToggle",
    config = function()
      require('nvim_comment').setup{
        comment_empty = false,
        create_mappings = false,
      } end,
  }

  use {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require('better_escape').setup{
        mapping = 'nn',
        timeout = 200
      } end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require('nvim-treesitter.configs').setup{
        highlight = {
          enable = true,
          use_languagetree = true,
        }
      } end,
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
    config = function()
      require('plugins.nvim-cmp')
    end,
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.nvim-lspconfig')
    end,
  }

  use {
    "famiu/feline.nvim",
    after = "nvim-lspconfig",
    config = function()
      require('plugins.feline')
    end,
  }

  use {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require('plugins.bufferline')
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require('plugins.nvim-tree')
    end,
  }


  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    event = "BufRead",
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
