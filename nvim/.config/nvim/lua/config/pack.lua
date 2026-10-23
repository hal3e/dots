local api = vim.api

vim.loader.enable()
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Register filetype detection before the file-loading callbacks below.
vim.cmd('filetype plugin indent on')

-- Disable unused built-in plugins. nvim-tree disables netrw in its own setup.
for _, name in ipairs({
    'gzip', 'matchit', 'tarPlugin', 'zipPlugin',
    '2html_plugin', 'spellfile_plugin', 'remote_plugins',
}) do
    vim.g['loaded_' .. name] = 1
end

-- Build LuaSnip's regex support after installation or updates.
-- Register before the first vim.pack.add() so this also runs during initial installation.
api.nvim_create_autocmd('PackChanged', {
    callback = function(args)
        local data = args.data
        if data.spec.name == 'LuaSnip' and (data.kind == 'install' or data.kind == 'update') then
            local result = vim.system({ 'make', 'install_jsregexp' }, { cwd = data.path, text = true }):wait()
            if result.code ~= 0 then
                error('LuaSnip build failed:\n' .. result.stdout .. result.stderr)
            end
        end
    end,
})

-- Load the visible UI and ordinary plugin commands during startup.
require('plugins.catppuccin')
require('plugins.statusline')
require('plugins.treesitter')
require('plugins.treesitter-context')
require('plugins.icons')
require('plugins.ledger')
require('plugins.telescope')
require('plugins.nvim-tree')
require('plugins.diffview')
require('plugins.colorizer')
require('plugins.indent-guides')
require('plugins.todo-comments')
require('plugins.gitsigns')
require('plugins.better-escape')
require('plugins.inlay-hint')

-- Load Markdown rendering and Cargo support when opening matching files.
api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    once = true,
    callback = function()
        require('plugins.markdown')
    end,
})
api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
    pattern = 'Cargo.toml',
    once = true,
    callback = function()
        require('plugins.crates')
    end,
})

-- Schedule nonvisual setup after the UI attaches; no first-event replay needed.
api.nvim_create_autocmd('UIEnter', {
    once = true,
    callback = function()
        vim.schedule(function()
            require('plugins.completion')
            require('plugins.flash')
            require('plugins.fidget')
            require('plugins.surround')
        end)
    end,
})
