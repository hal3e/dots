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
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
    {
        'farmergreg/vim-lastplace',

        {
            'nvimtools/none-ls.nvim',
            ft = { "sh", "bash" },
            config = function()
                local null_ls = require("null-ls")

                local null_helpers = require("null-ls.helpers")
                local methods = require("null-ls.methods")

                local DIAGNOSTICS = methods.internal.DIAGNOSTICS

                local shellcheck = null_helpers.make_builtin({
                    name = "shellcheck",
                    meta = {
                        url = "https://www.shellcheck.net/",
                        description = "A shell script static analysis tool.",
                    },
                    method = DIAGNOSTICS,
                    generator_opts = {
                        command = "shellcheck",
                        args = { "--format", "json1", "--source-path=$DIRNAME", "--external-sources", "-" },
                        to_stdin = true,
                        format = "json",
                        check_exit_code = function(code)
                            return code <= 1
                        end,
                        on_output = function(params)
                            local parser = null_helpers.diagnostics.from_json({
                                attributes = { code = "code" },
                                severities = {
                                    info = null_helpers.diagnostics.severities["information"],
                                    style = null_helpers.diagnostics.severities["hint"],
                                },
                            })

                            return parser({ output = params.output.comments })
                        end,
                    },
                    factory = null_helpers.generator_factory,
                })

                null_ls.setup({
                    sources = {
                        shellcheck.with({ filetypes = { "sh", "bash" } }),
                        null_ls.builtins.formatting.shfmt.with({ filetypes = { "sh", "bash" } }),
                    },
                    on_attach =
                        require('plugins.nvim-lspconfig').on_attach
                })
            end,
            dependencies = {
                {
                    'williamboman/mason.nvim',
                    config = true
                }
            },
            lazy = true
        },

        {
            'ThePrimeagen/harpoon',
            event = { "BufReadPost" },
            keys = {
                {
                    '<leader>n',
                    mode = { "n" },
                    function()
                        require("harpoon.ui").nav_next()
                    end,
                    desc = "harpoon next file",
                },
                {
                    '<leader>p',
                    mode = { "n" },
                    function()
                        require("harpoon.ui").nav_prev()
                    end,
                    desc = "harpoon previous file",
                },
                {
                    '<leader>h',
                    mode = { "n" },
                    function()
                        require("harpoon.mark").add_file()
                    end,
                    desc = "harpoon add file",
                },
                {
                    '<leader>o',
                    mode = { "n" },
                    function()
                        require("harpoon.ui").toggle_quick_menu()
                    end,
                    desc = "harpoon quick menu",
                }
            },
            config = true,
            lazy = true
        },

        {
            "hal3e/vim-ledger",
            event = { "BufReadPost *.ldg" },
            lazy = true
        },

        {
            'folke/flash.nvim',
            event = "VeryLazy",
            opts = {
                modes = {
                    char = {
                        enabled = false,
                    }
                }
            },
            keys = {
                {
                    "s",
                    mode = { "n", "x", "o" },
                    function()
                        -- default options: exact mode, multi window, all directions, with a backdrop
                        require("flash").jump()
                    end,
                    desc = "Flash",
                },
                {
                    "vv",
                    mode = { "n", "o", "x" },
                    function()
                        -- show labeled treesitter nodes around the cursor
                        require("flash").treesitter()
                    end,
                    desc = "Flash Treesitter",
                },
                {
                    "r",
                    mode = "o",
                    function()
                        -- jump to a remote location to execute the operator
                        require("flash").remote()
                    end,
                    desc = "Remote Flash",
                },
            },
            dependencies = {
                'nvim-treesitter/nvim-treesitter',
            },
            lazy = true
        },

        {
            'saecki/crates.nvim',
            event = { "BufReadPost Cargo.toml" },
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = true,
            lazy = true
        },

        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            config = function()
                require('plugins.catppuccin')
            end,
            lazy = false
        },

        {
            'petertriho/nvim-scrollbar',
            event = 'BufReadPost',
            config = true,
            lazy = true
        },


        {
            'nvim-telescope/telescope.nvim',
            cmd = 'Telescope',
            dependencies = {
                'nvim-lua/plenary.nvim',
                "debugloop/telescope-undo.nvim",
                "nvim-telescope/telescope-live-grep-args.nvim",
                'nvim-telescope/telescope-ui-select.nvim',
                {
                    'folke/todo-comments.nvim',
                    dependencies = 'nvim-lua/plenary.nvim',
                    opts = {
                        keywords = {
                            FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
                            TODO = { icon = ' ', color = 'info' },
                            HACK = { icon = ' ', color = 'warning' },
                            WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
                            PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
                            NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
                        },
                    },
                },
            },
            config = function()
                local telescope = require("telescope")
                telescope.setup {
                    extensions = {
                        ["ui-select"] = {
                            require("telescope.themes").get_cursor()
                        }
                    },
                    defaults = {
                        mappings = {
                            i = {
                                ['<C-n>'] = 'move_selection_next',
                                ['<C-p>'] = 'move_selection_previous'
                            }
                        }
                    }
                }

                telescope.load_extension("undo")
                telescope.load_extension("todo-comments")
                telescope.load_extension("ui-select")
                telescope.load_extension("live_grep_args")

                local builtin = require('telescope.builtin')
                local all_pickers = function() builtin.builtin({ include_extensions = true }) end

                local default_opts = { noremap = true, silent = true }
                vim.keymap.set('n', '<leader>t', all_pickers, default_opts)
                vim.keymap.set('n', '<leader>f', builtin.git_files, default_opts)
                vim.keymap.set('n', '<leader>r', builtin.live_grep, default_opts)
                vim.keymap.set('n', '<leader>ra', telescope.extensions.live_grep_args.live_grep_args, default_opts)
                vim.keymap.set('n', '<leader>d', builtin.diagnostics, default_opts)
                vim.keymap.set('n', '<leader>H', builtin.help_tags, default_opts)
                vim.keymap.set('n', '<leader>u', builtin.resume, default_opts)
                vim.keymap.set('n', '<leader>ds', builtin.lsp_dynamic_workspace_symbols, default_opts)
                vim.keymap.set('n', '<leader><Tab>', builtin.buffers, default_opts)
            end,
            lazy = true
        },

        {
            'lukas-reineke/indent-blankline.nvim',
            tag = 'v2.20.8',
            event = { 'BufReadPost', 'BufNewFile' },
            opts = {
                show_current_context = true,
                show_trailing_blankline_indent = false
            },
            lazy = true
        },

        {
            'terrortylor/nvim-comment',
            cmd = 'CommentToggle',
            config = function()
                require('nvim_comment').setup(
                    {
                        comment_empty = false,
                        create_mappings = false,
                    }

                )
            end,
            lazy = true
        },

        {
            'max397574/better-escape.nvim',
            event = 'InsertCharPre',
            opts = {
                mappings = {
                    i = {
                        n = {
                            n = "<Esc>",
                        },
                    },
                },
            },
            lazy = true
        },

        {
            'nvim-treesitter/nvim-treesitter',
            event = "VeryLazy",
            config = function()
                require('nvim-treesitter.configs').setup(
                    {
                        ensure_installed = { "rust", "lua", "c" },
                        sync_install = false,
                        auto_install = false,
                        ignore_install = {},
                        modules = {},
                        highlight = {
                            enable = true,
                        }
                    }
                )
            end,
            dependencies = {
                {
                    'nvim-treesitter/nvim-treesitter-context',
                    opts = {
                        max_lines = 1
                    },
                    lazy = true,
                }
            },
            lazy = true
        },

        {
            'hrsh7th/nvim-cmp',
            event = { "InsertEnter", "CmdlineEnter" },
            dependencies = {
                {
                    'L3MON4D3/LuaSnip',
                    dependencies = { "rafamadriz/friendly-snippets" },
                },
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-cmdline',
                'saadparwaiz1/cmp_luasnip',
            },
            config = function()
                require('plugins.nvim-cmp')
            end,
            lazy = true
        },

        {
            'williamboman/mason.nvim',
            event = "VeryLazy",
            config = true,
            lazy = true
        },

        {
            "j-hui/fidget.nvim",
            event = "VeryLazy",
            tag = "v1.2.0",
            opts = {
                notification = {
                    override_vim_notify = true,

                }
            },
            lazy = true
        },

        {
            'neovim/nvim-lspconfig',
            ft = { "rust", "lua", "sway", "sh", "bash", "vue", "js", "ts" },
            config = function()
                require('plugins.nvim-lspconfig')
            end,
            dependencies = {
                'folke/neodev.nvim',
                'simrat39/rust-tools.nvim',

                {
                    'williamboman/mason.nvim',
                    config = true
                },

                {
                    'williamboman/mason-lspconfig.nvim',
                    opts =
                    {
                        ensure_installed = { "lua_ls", "rust_analyzer" },
                    }
                },

                {
                    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
                    config = true
                },

            },
            lazy = true
        },

        {
            'kyazdani42/nvim-tree.lua',
            cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
            config = function()
                require('plugins.nvim-tree')
            end,
            dependencies = {
                {
                    'nvim-tree/nvim-web-devicons',
                    config = function()
                        require('plugins.icons')
                    end,
                },
            },
        },

        {
            'lewis6991/gitsigns.nvim',
            event = 'BufReadPost',
            opts = {
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
            },
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
            opts = {
                keymaps = {
                    visual = "SS",
                }
            },
            lazy = true
        },

        {
            'sindrets/diffview.nvim',
            cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
            dependencies = 'nvim-lua/plenary.nvim',
            lazy = true
        },
    }, {
        install = {
            -- install missing plugins on startup. This doesn't increase startup time.
            missing = true,
            -- try to load one of these colorschemes when starting an installation during startup
            colorscheme = { "catppuccin" },
        },
        performance = {
            rtp = {
                -- disable some rtp plugins
                disabled_plugins = {
                    "2html_plugin",
                    "tohtml",
                    "getscript",
                    "getscriptPlugin",
                    "gzip",
                    "logipat",
                    "netrw",
                    "netrwPlugin",
                    "netrwSettings",
                    "netrwFileHandlers",
                    "matchit",
                    "tar",
                    "tarPlugin",
                    "rrhelper",
                    "spellfile_plugin",
                    "vimball",
                    "vimballPlugin",
                    "zip",
                    "zipPlugin",
                    "tutor",
                    "rplugin",
                    "syntax",
                    "synmenu",
                    "optwin",
                    "compiler",
                    "bugreport",
                    "ftplugin",
                },
            },
        },
    })
