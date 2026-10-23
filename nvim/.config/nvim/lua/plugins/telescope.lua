require('plugins.plenary')
require('plugins.icons')

vim.pack.add({
    { src = 'https://github.com/nvim-telescope/telescope.nvim', name = 'telescope.nvim', version = vim.version.range('*') },
    { src = 'https://github.com/debugloop/telescope-undo.nvim', name = 'telescope-undo.nvim', version = 'main' },
    { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim', name = 'telescope-ui-select.nvim', version = 'master' },
    { src = 'https://github.com/nvim-telescope/telescope-live-grep-args.nvim', name = 'telescope-live-grep-args.nvim', version = vim.version.range('^1.0.0') },
}, { confirm = false })

local function options()
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
end

local telescope = require("telescope")
telescope.setup(options())

pcall(telescope.load_extension, "undo")
pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "live_grep_args")

vim.keymap.set('n', '<leader>t', function()
    require('telescope.builtin').builtin({ include_extensions = true })
end, { desc = 'Telescope pickers', silent = true })

vim.keymap.set('n', '<leader>f', function()
    local builtin = require('telescope.builtin')
    local ok = pcall(builtin.git_files)
    if not ok then
        builtin.find_files()
    end
end, { desc = 'Find files', silent = true })

vim.keymap.set('n', '<leader>r', function()
    require('telescope.builtin').live_grep()
end, { desc = 'Live grep', silent = true })

vim.keymap.set('n', '<leader>ra', function()
    require('telescope').extensions.live_grep_args.live_grep_args()
end, { desc = 'Live grep with args', silent = true })

vim.keymap.set('n', '<leader>d', function()
    require('telescope.builtin').diagnostics()
end, { desc = 'Diagnostics', silent = true })

vim.keymap.set('n', '<leader>H', function()
    require('telescope.builtin').help_tags()
end, { desc = 'Help tags', silent = true })

vim.keymap.set('n', '<leader>u', function()
    require('telescope.builtin').resume()
end, { desc = 'Resume picker', silent = true })

vim.keymap.set('n', '<leader>ds', function()
    require('telescope.builtin').lsp_dynamic_workspace_symbols()
end, { desc = 'Workspace symbols', silent = true })

vim.keymap.set('n', '<leader><Tab>', function()
    require('telescope.builtin').buffers()
end, { desc = 'Buffers', silent = true })
