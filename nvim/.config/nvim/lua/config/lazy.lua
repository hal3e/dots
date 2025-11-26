local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out,                            'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('lazy').setup(
    {
        {
            'MeanderingProgrammer/render-markdown.nvim',
            dependencies = {
                'nvim-treesitter/nvim-treesitter',
                {
                    'nvim-tree/nvim-web-devicons',
                    config = function()
                        require('plugins.icons')
                    end,
                },
            },
            ---@module 'render-markdown'
            ---@type render.md.UserConfig
            opts = {},
        },

        {
            'felpafel/inlay-hint.nvim',
            event = 'LspAttach',
            config = true,
        },

        {
            'nvim-mini/mini.statusline',
            event = 'VeryLazy',
            config = function()
                local statusline = require('mini.statusline')
                statusline.setup({
                    content = {
                        active = function()
                            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
                            local filename      = statusline.section_filename({ trunc_width = 140 })
                            local location      = statusline.section_location({ trunc_width = 75 })

                            return statusline.combine_groups({
                                { hl = mode_hl,                  strings = { mode } },
                                '%<', -- Mark general truncate point
                                { hl = 'MiniStatuslineFilename', strings = { filename } },
                                '%=', -- End left alignment
                                { hl = mode_hl, strings = { location } },
                            })
                        end
                    }
                })
            end,
            lazy = true
        },

        {
            'hal3e/vim-ledger',
            event = { 'BufReadPost *.ldg' },
            lazy = true
        },

        {
            'folke/flash.nvim',
            event = 'VeryLazy',
            opts = {},
            keys = {
                {
                    's',
                    mode = { 'n', 'x', 'o' },
                    function()
                        -- default options: exact mode, multi window, all directions, with a backdrop
                        require('flash').jump()
                    end,
                    desc = 'Flash',
                },
                {
                    'vv',
                    mode = { 'n', 'o', 'x' },
                    function()
                        -- show labeled treesitter nodes around the cursor
                        require('flash').treesitter()
                    end,
                    desc = 'Flash Treesitter',
                },
                {
                    'r',
                    mode = 'o',
                    function()
                        -- jump to a remote location to execute the operator
                        require('flash').remote()
                    end,
                    desc = 'Remote Flash',
                },
            },
            dependencies = {
                'nvim-treesitter/nvim-treesitter',
            },
            lazy = true
        },

        {
            'saecki/crates.nvim',
            event = { 'BufReadPost Cargo.toml' },
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = true,
            lazy = true
        },

        {
            'catppuccin/nvim',
            name = 'catppuccin',
            priority = 1000,
            config = function()
                require('plugins.catppuccin')
            end,
            lazy = false
        },

        {
            "nvim-telescope/telescope.nvim",
            version = "*",
            cmd = "Telescope",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "debugloop/telescope-undo.nvim",
                { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
                "nvim-telescope/telescope-ui-select.nvim",
            },
            keys = {
                {
                    "<leader>t",
                    function()
                        require("telescope.builtin").builtin({ include_extensions = true })
                    end,
                    desc = "Telescope pickers",
                },
                {
                    "<leader>f",
                    function()
                        local builtin = require("telescope.builtin")
                        local ok = pcall(builtin.git_files)
                        if not ok then
                            builtin.find_files()
                        end
                    end,
                    desc = "Find files",
                },
                {
                    "<leader>r",
                    function()
                        require("telescope.builtin").live_grep()
                    end,
                    desc = "Live grep",
                },
                {
                    "<leader>ra",
                    function()
                        require("telescope").extensions.live_grep_args.live_grep_args()
                    end,
                    desc = "Live grep with args",
                },
                {
                    "<leader>d",
                    function()
                        require("telescope.builtin").diagnostics()
                    end,
                    desc = "Diagnostics",
                },
                {
                    "<leader>H",
                    function()
                        require("telescope.builtin").help_tags()
                    end,
                    desc = "Help tags",
                },
                {
                    "<leader>u",
                    function()
                        require("telescope.builtin").resume()
                    end,
                    desc = "Resume picker",
                },
                {
                    "<leader>ds",
                    function()
                        require("telescope.builtin").lsp_dynamic_workspace_symbols()
                    end,
                    desc = "Workspace symbols",
                },
                {
                    "<leader><Tab>",
                    function()
                        require("telescope.builtin").buffers()
                    end,
                    desc = "Buffers",
                },
            },
            opts = function()
                local actions = require("telescope.actions")

                return {
                    defaults = {
                        mappings = {
                            i = {
                                ["<C-n>"] = actions.move_selection_next,
                                ["<C-p>"] = actions.move_selection_previous,
                            },
                        },

                        layout_config = {
                            preview_width = 0.55,
                        },

                    },
                    extensions = {
                        ["ui-select"] = require("telescope.themes").get_cursor(),
                        -- optional: put undo config here later if you want
                        -- undo = {},
                        -- live_grep_args = {},
                    },
                }
            end,
            config = function(_, opts)
                local telescope = require("telescope")
                telescope.setup(opts)

                pcall(telescope.load_extension, "undo")
                pcall(telescope.load_extension, "ui-select")
                pcall(telescope.load_extension, "live_grep_args")
            end,
        },

        {
            "folke/todo-comments.nvim",
            event = "BufReadPost",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = {
                keywords = {
                    FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                    TODO = { icon = " ", color = "info" },
                    HACK = { icon = " ", color = "warning" },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                },
            },
            keys = {
                { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo comments" },
            },
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
            'max397574/better-escape.nvim',
            event = 'InsertCharPre',
            opts = {
                mappings = {
                    i = {
                        n = {
                            n = '<Esc>',
                        },
                    },
                },
            },
            lazy = true
        },

        {
            'nvim-treesitter/nvim-treesitter',
            lazy = false,
            branch = 'main',
            config = function(plugin)
                vim.opt.runtimepath:prepend(plugin.dir .. '/runtime')
                require('nvim-treesitter').setup({})
                vim.api.nvim_create_autocmd('FileType', {
                    pattern = {
                        'rust', 'lua', 'c',
                        'typescript', 'typescriptreact',
                        'javascript', 'javascriptreact',
                        'json', 'jsonc',
                        'html', 'css',
                    },
                    callback = function(args)
                        pcall(vim.treesitter.start, args.buf)
                    end,
                })
            end,
        },

        {
            'nvim-treesitter/nvim-treesitter-context',
            opts = {
                enable = true,
                multiwindow = false,
                max_lines = 1,
                min_window_height = 0,
                line_numbers = true,
                trim_scope = 'outer',
                mode = 'cursor',
                separator = nil,
            },
        },

        {
            'hrsh7th/nvim-cmp',
            event = { 'InsertEnter', 'CmdlineEnter' },
            dependencies = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
                'saadparwaiz1/cmp_luasnip',
                {
                    'L3MON4D3/LuaSnip',
                    version = 'v2.*',
                    build = 'make install_jsregexp',
                    dependencies = {
                        'rafamadriz/friendly-snippets',
                    },
                    config = function()
                        require('luasnip.loaders.from_vscode').lazy_load()
                    end,
                },
            },
            config = function()
                require('plugins.nvim-cmp')
            end,
        },

        {
            'j-hui/fidget.nvim',
            event = 'VeryLazy',
            opts = {
                notification = {
                    override_vim_notify = true,
                    window = {
                        avoid = { 'NvimTree' },
                    },

                }
            },
            lazy = true
        },

        {
            'kyazdani42/nvim-tree.lua',
            cmd = { 'NvimTreeOpen', 'NvimTreeToggle', 'NvimTreeFocus' },
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
                'nvim-treesitter/nvim-treesitter',
            },
        },

        {
            'lewis6991/gitsigns.nvim',
            event = 'BufReadPost',
            opts = {
                on_attach = function(bufnr)
                    local gs = require('gitsigns')

                    local function map(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, {
                            buffer = bufnr,
                            desc = desc,
                        })
                    end

                    map('n', ']c', function()
                        gs.nav_hunk('next', { preview = true, })
                    end, 'Next hunk')

                    map('n', '[c', function()
                        gs.nav_hunk('prev', { preview = true, })
                    end, 'Previous hunk')

                    map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
                    map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')

                    map('v', '<leader>hs', function()
                        gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, 'Stage hunk')

                    map('v', '<leader>hr', function()
                        gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end, 'Reset hunk')

                    map('n', '<leader>hS', gs.stage_buffer, 'Stage buffer')
                    map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo stage hunk')
                    map('n', '<leader>hR', gs.reset_buffer, 'Reset buffer')
                    map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
                    map('n', '<leader>hi', gs.preview_hunk_inline, 'Preview hunk inline')
                    map('n', '<leader>hb', function()
                        gs.blame_line({ full = true })
                    end, 'Blame line')
                    map('n', '<leader>htb', gs.toggle_current_line_blame, 'Toggle line blame')
                    map('n', '<leader>hd', gs.diffthis, 'Diff this')
                    map('n', '<leader>hD', function()
                        gs.diffthis('~')
                    end, 'Diff this ~')
                    map('n', '<leader>htd', gs.toggle_deleted, 'Toggle deleted')

                    map({ 'o', 'x' }, 'ih', gs.select_hunk, 'Select hunk')
                end,
            },
        },

        {
            'catgoose/nvim-colorizer.lua',
            event = 'BufReadPre',
            opts = {
                filetypes = { '*' },
                user_default_options = {
                    RGB = true,
                    RRGGBB = true,
                    names = false,
                    RRGGBBAA = true,
                    AARRGGBB = true,
                    rgb_fn = true,
                    hsl_fn = true,
                    css = false,
                    css_fn = true,
                    mode = 'background',
                    virtualtext = '■',
                },
            },
        },

        {
            'kylechui/nvim-surround',
            event = 'VeryLazy',
        },

        {
            'sindrets/diffview.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
            cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewRefresh', 'DiffviewFileHistory' },
            keys = {
                { '<leader>do', '<cmd>DiffviewOpen<cr>',    desc = 'Diffview open' },
                { '<leader>dc', '<cmd>DiffviewClose<cr>',   desc = 'Diffview close' },
                { '<leader>dr', '<cmd>DiffviewRefresh<cr>', desc = 'Diffview refresh' },
            },
            opts = {},
        }
    }, {
        install = {
            -- install missing plugins on startup. This doesn't increase startup time.
            missing = true,
            -- try to load one of these colorschemes when starting an installation during startup
            colorscheme = { 'catppuccin' },
        },
        performance = {
            rtp = {
                -- disable some rtp plugins
                disabled_plugins = {
                    '2html_plugin',
                    'tohtml',
                    'gzip',
                    'netrw',
                    'netrwPlugin',
                    'netrwSettings',
                    'netrwFileHandlers',
                    'matchit',
                    'tar',
                    'tarPlugin',
                    'spellfile_plugin',
                    'zip',
                    'zipPlugin',
                    'tutor',
                    'rplugin',
                    'syntax',
                    'synmenu',
                    'optwin',
                    'compiler',
                    'bugreport',
                    'ftplugin',
                },
            },
        },
    })
