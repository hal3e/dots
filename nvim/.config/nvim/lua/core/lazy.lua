vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true -- enable 24-bit RGB colors

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
    {

        { 'hal3e/nord.nvim' },

        {
            "ggandor/leap.nvim",
            event = 'BufRead',
            config = function()
                require('leap').add_default_mappings()
            end,
            lazy = true
        },

        {
            'saecki/crates.nvim',
            event = { "BufRead Cargo.toml" },
            dependencies = { { 'nvim-lua/plenary.nvim' } },
            config = true,
            lazy = true
        },

        {
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

                require("catppuccin").setup {
                    highlight_overrides = {
                        all = function(colors)
                            return {
                                DiagnosticVirtualTextError = {
                                    bg = colors.none
                                },
                                DiagnosticVirtualTextWarn = {
                                    bg = colors.none
                                },
                                DiagnosticVirtualTextInfo = {
                                    bg = colors.none
                                },
                                DiagnosticVirtualTextHint = {
                                    bg = colors.none
                                },
                            }
                        end,
                    },
                }
                vim.cmd.colorscheme 'catppuccin'
            end

        },

        { "nvim-lua/plenary.nvim" },

        {
            'petertriho/nvim-scrollbar',
            event = 'BufRead',
            config = true,
            lazy = true
        },

        {
            'nvim-tree/nvim-web-devicons',
            config = function()
                require('plugins.icons')
            end,
        },

        {
            'folke/todo-comments.nvim',
            event = 'BufRead',
            dependencies = 'nvim-lua/plenary.nvim',
            config = function()
                require('todo-comments').setup {
                    keywords = {
                        FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
                        TODO = { icon = ' ', color = 'info' },
                        HACK = { icon = ' ', color = 'warning' },
                        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
                        PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
                        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
                    },
                    colors = {
                        warning = { 'DiagnosticSignWarn' }
                    },
                }
            end,
            lazy = true
        },

        {
            'nvim-telescope/telescope.nvim',
            cmd = 'Telescope',
            config = function()
                require('telescope').setup {
                    defaults = {
                        mappings = {
                            i = {
                                ['<C-n>'] = 'move_selection_next',
                                ['<C-p>'] = 'move_selection_previous'
                            }
                        }
                    },
                }
            end,
            dependencies = { { 'nvim-lua/plenary.nvim' } },
            lazy = true
        },

        {
            'lukas-reineke/indent-blankline.nvim',
            event = { 'BufReadPost', 'BufNewFile' },
            config = function()
                require('indent_blankline').setup {
                    show_current_context = true,
                    show_trailing_blankline_indent = false
                }
            end,
            lazy = true
        },

        {
            'terrortylor/nvim-comment',
            cmd = 'CommentToggle',
            config = function()
                require('nvim_comment').setup {
                    comment_empty = false,
                    create_mappings = false,
                }
            end,
            lazy = true
        },

        {
            'max397574/better-escape.nvim',
            event = 'InsertEnter',
            config = function()
                require('better_escape').setup {
                    mapping = 'nn',
                    timeout = 200
                }
            end,
            lazy = true
        },

        {
            'nvim-treesitter/nvim-treesitter',
            config = function()
                require('nvim-treesitter.configs').setup {
                    highlight = {
                        enable = true,
                        use_languagetree = true,
                    }
                }
            end,
            dependencies = {
                'nvim-treesitter/nvim-treesitter-context',
            }
        },


        {
            'hrsh7th/nvim-cmp',
            event = { "InsertEnter", "CmdlineEnter" },
            dependencies = {
                'L3MON4D3/LuaSnip',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-buffer',
                'saadparwaiz1/cmp_luasnip',
            },
            config = function()
                require('plugins.nvim-cmp')
            end,
            lazy = true
        },



        {
            'neovim/nvim-lspconfig',
            event = { "BufReadPre", "BufNewFile" },
            config = function()
                require('plugins.nvim-lspconfig')
            end,
            dependencies = {
                'folke/neodev.nvim',
                {
                    'williamboman/mason.nvim',
                    config = true
                },

                {
                    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
                    config = true
                },

                {
                    'j-hui/fidget.nvim',
                    config = true,
                },

                {
                    'simrat39/rust-tools.nvim',
                    config = function()
                        require('rust-tools').setup({
                            server = {
                                capabilities = require('plugins.nvim-lspconfig').capabilities,
                                on_attach = require('plugins.nvim-lspconfig').on_attach,
                                settings = {
                                    ["rust-analyzer"] = {
                                        check = {
                                            command = "clippy",
                                            extraArgs = { "--all", "--", "-W", "clippy::all" },
                                        },
                                    },
                                },
                            },
                        })
                    end,
                },
            },
            lazy = true
        },



        {
            'freddiehaddad/feline.nvim',
            config = function()
                require('plugins.feline')
            end,
        },

        {
            'akinsho/bufferline.nvim',
            event = { "BufReadPost" },
            config = function()
                require('plugins.bufferline')
            end,
            lazy = true
        },

        {
            'kyazdani42/nvim-tree.lua',
            cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
            config = function()
                require('plugins.nvim-tree')
            end,
        },


        {
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
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
                            vim.schedule(function() gs.next_hunk({ preview = true }) end)
                            return '<Ignore>'
                        end, { expr = true })

                        map('n', '[c', function()
                            if vim.wo.diff then return '[c' end
                            vim.schedule(function() gs.prev_hunk({ preview = true }) end)
                            return '<Ignore>'
                        end, { expr = true })

                        -- Actions
                        map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
                        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
                        map('n', '<leader>hS', gs.stage_buffer)
                        map('n', '<leader>hu', gs.undo_stage_hunk)
                        map('n', '<leader>hR', gs.reset_buffer)
                        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
                        map('n', '<leader>htb', gs.toggle_current_line_blame)
                        map('n', '<leader>hd', gs.diffthis)
                        map('n', '<leader>hD', function() gs.diffthis('~') end)
                        map('n', '<leader>htd', gs.toggle_deleted)

                        -- Text object
                        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                    end
                }
            end,
            lazy = true
        },

        {
            'norcalli/nvim-colorizer.lua',
            event = 'BufReadPre',
            config = function()
                require('colorizer').setup({ '*' }, {
                    RGB = true,       -- #RGB hex codes
                    RRGGBB = true,    -- #RRGGBB hex codes
                    names = false,    -- "Name" codes like Blue
                    RRGGBBAA = true,  -- #RRGGBBAA hex codes
                    AARRGGBB = false, -- 0xAARRGGBB hex codes
                    rgb_fn = true,    -- CSS rgb() and rgba() functions
                    hsl_fn = true,    -- CSS hsl() and hsla() functions
                    css = false,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn = true,    -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    -- Available modes: foreground, background
                    -- Available modes for `mode`: foreground, background,  virtualtext
                    mode = "background", -- Set the display mode.
                    virtualtext = "■",
                })
            end,
            lazy = true
        },

        {
            'kylechui/nvim-surround',
            event = 'BufReadPost',
            config = function()
                require('nvim-surround').setup({})
            end,
            lazy = true
        },

        {
            'sindrets/diffview.nvim',
            event = 'BufRead',
            dependencies = 'nvim-lua/plenary.nvim',
            lazy = true
        },
    }, {
        performance = {
            rtp = {
                -- disable some rtp plugins
                disabled_plugins = {
                    "2html_plugin",
                    "getscript",
                    "getscriptPlugin",
                    "gzip",
                    "logipat",
                    "matchit",
                    "matchparen",
                    "netrw",
                    "netrwFileHandlers",
                    "netrwPlugin",
                    "netrwSettings",
                    "rrhelper",
                    "spellfile_plugin",
                    "tar",
                    "tarPlugin",
                    "tohtml",
                    "tutor",
                    "vimball",
                    "vimballPlugin",
                    "zip",
                    "zipPlugin",
                },
            },
        },
    })
