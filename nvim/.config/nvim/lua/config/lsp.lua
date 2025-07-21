-- Lsp keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
    callback = function()
        local bufnr = 0 -- only current buffer
        local function buf_set_keymap(mode, lhs, rhs, opts)
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', opts or {}, { buffer = bufnr }))
        end
        local opts = { noremap = true, silent = true }

        buf_set_keymap('n', 'gc', vim.lsp.buf.declaration, opts)
        buf_set_keymap('n', 'gd', vim.lsp.buf.definition, opts)
        buf_set_keymap('n', 'gh', vim.lsp.buf.hover, opts)
        buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, opts)
        buf_set_keymap('n', 'gs', vim.lsp.buf.signature_help, opts)
        buf_set_keymap('n', 'gt', vim.lsp.buf.type_definition, opts)
        buf_set_keymap('n', 'gr', vim.lsp.buf.references, opts)
        buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
        buf_set_keymap('n', '<leader>a', vim.lsp.buf.code_action, opts)
        buf_set_keymap('x', '<leader>a', vim.lsp.buf.code_action, opts)
        buf_set_keymap('n', '[w',
            function()
                vim.diagnostic.jump({ count = -1, float = false, severity = vim.diagnostic.severity.ERROR })
            end, opts)
        buf_set_keymap('n', ']w',
            function()
                vim.diagnostic.jump({ count = 1, float = false, severity = vim.diagnostic.severity.ERROR })
            end, opts)
    end,
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('typos_lsp')

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    virtual_lines = {
        current_line = true,
    },
    severity_sort = true
})
