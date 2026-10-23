vim.pack.add({
    { src = 'https://github.com/j-hui/fidget.nvim', name = 'fidget.nvim', version = 'main' },
}, { confirm = false })

require('fidget').setup({
    notification = {
        override_vim_notify = true,
        window = {
            avoid = { 'NvimTree' },
        },

    }
})
