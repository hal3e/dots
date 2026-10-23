require('plugins.plenary')

vim.pack.add({
    { src = 'https://github.com/sindrets/diffview.nvim', name = 'diffview.nvim', version = 'main' },
}, { confirm = false })

require('diffview').setup({})

for lhs, command in pairs({ ['<leader>do'] = 'DiffviewOpen', ['<leader>dc'] = 'DiffviewClose', ['<leader>dr'] = 'DiffviewRefresh' }) do
    vim.keymap.set('n', lhs, '<cmd>' .. command .. '<cr>', { desc = command, silent = true })
end
