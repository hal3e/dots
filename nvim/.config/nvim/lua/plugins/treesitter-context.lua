require('plugins.treesitter')

vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context', name = 'nvim-treesitter-context', version = 'master' },
}, { confirm = false })

require('treesitter-context').setup({
    enable = true,
    multiwindow = false,
    max_lines = 1,
    min_window_height = 0,
    line_numbers = true,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
})
