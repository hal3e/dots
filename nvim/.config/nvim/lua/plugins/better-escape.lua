vim.pack.add({
    { src = 'https://github.com/max397574/better-escape.nvim', name = 'better-escape.nvim', version = 'master' },
}, { confirm = false })

require('better_escape').setup({
    default_mappings = false,
    timeout = 225,
    mappings = {
        i = {
            n = {
                n = '<Esc>',
            },
        },
    },
})
