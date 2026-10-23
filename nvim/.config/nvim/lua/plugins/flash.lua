vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
    -- default options: exact mode, multi window, all directions, with a backdrop
    require('flash').jump()
end, { desc = 'Flash', silent = true })

vim.keymap.set({ 'n', 'o', 'x' }, 'vv', function()
    -- show labeled treesitter nodes around the cursor
    require('flash').treesitter()
end, { desc = 'Flash Treesitter', silent = true })

vim.keymap.set('o', 'r', function()
    -- jump to a remote location to execute the operator
    require('flash').remote()
end, { desc = 'Remote Flash', silent = true })

vim.pack.add({
    { src = 'https://github.com/folke/flash.nvim', name = 'flash.nvim', version = 'main' },
}, { confirm = false })

require('flash').setup({})
