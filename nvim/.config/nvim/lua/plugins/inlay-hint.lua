vim.pack.add({
    { src = 'https://github.com/felpafel/inlay-hint.nvim', name = 'inlay-hint.nvim', version = 'main' },
}, { confirm = false })

require('inlay-hint').setup()
