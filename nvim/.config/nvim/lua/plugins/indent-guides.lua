vim.pack.add({
    { src = 'https://github.com/lukas-reineke/indent-blankline.nvim', name = 'indent-blankline.nvim', version = 'master' },
}, { confirm = false })

require('ibl').setup({
    scope = {
        enabled = false,
    },
    whitespace = {
        remove_blankline_trail = true,
    },
})
