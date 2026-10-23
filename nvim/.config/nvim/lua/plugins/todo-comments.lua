require('plugins.plenary')

vim.pack.add({
    { src = 'https://github.com/folke/todo-comments.nvim', name = 'todo-comments.nvim', version = 'main' },
}, { confirm = false })

require('todo-comments').setup({
    keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
})

vim.keymap.set('n', '<leader>st', function()
    vim.cmd('TodoTelescope')
end, { desc = 'Todo comments', silent = true })
