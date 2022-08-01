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
    event = { "BufRead", "BufNewFile" },
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
   'simrat39/rust-tools.nvim',
    after = "nvim-lspconfig",
    config = function()
      require('rust-tools').setup()
    end,
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.nvim-lspconfig')
    end,
  }

  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lsp_lines").setup()
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


  use {
    'lewis6991/gitsigns.nvim',
    event = "BufRead",
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk({preview = true}) end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk({preview = true}) end)
          return '<Ignore>'
        end, {expr=true})

        -- Actions
        map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hr', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
      }

    end,
  }

  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup{}
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
