require('plugins.plenary')

vim.pack.add({
    { src = 'https://github.com/saecki/crates.nvim', name = 'crates.nvim', version = 'main' },
}, { confirm = false })

require('crates').setup({
    -- Use CMP's existing LSP source without loading CMP during startup.
    lsp = {
        enabled = true,
        completion = true,
    },
})

-- crates.nvim attaches on reads; also attach its completion server to new manifests.
vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = 'Cargo.toml',
    callback = function(args)
        require('crates').update(args.buf)
        require('crates.lsp').start_server()
    end,
})
