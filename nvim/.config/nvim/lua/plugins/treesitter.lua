vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', name = 'nvim-treesitter', version = 'main' },
}, { confirm = false })

vim.opt.runtimepath:prepend((vim.fn.stdpath('data') .. '/site/pack/core/opt/nvim-treesitter') .. '/runtime')
require('nvim-treesitter').setup({})
vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'rust', 'lua', 'c',
        'typescript', 'typescriptreact',
        'javascript', 'javascriptreact',
        'json', 'jsonc',
        'html', 'css',
    },
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
