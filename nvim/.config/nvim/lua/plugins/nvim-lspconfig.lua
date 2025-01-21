local nvim_lsp = require('lspconfig')

-- Cmp completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function()
    local bufnr = 0 -- buffer 0 - current buffer only
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gc', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('x', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({float=false})<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({float=false})<CR>', opts)
end

nvim_lsp.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- -- Install Sway LSP as a custom	server
local configs = require('lspconfig.configs')

-- Check if the config is already defined (useful when reloading this file)
if not configs.sway_lsp then
    configs.sway_lsp = {
        default_config = {
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { 'forc-lsp' },
            filetypes = { 'sway' },
            init_options = {
                -- Any initialization options
                logging = { level = 'trace' }
            },
            root_dir = nvim_lsp.util.root_pattern(".git", vim.fn.getcwd()),
            settings = {},
        },
    }
end

nvim_lsp.sway_lsp.setup {}

require('rust-tools').setup({
    server = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                procMacro = { enable = true, attributes = { enable = true } },
                check = {
                    command = "clippy",
                    extraArgs = { "--all", "--", "-W", "clippy::all" },
                },
            },
        },
    },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    virtual_lines = {
        only_current_line = true,
        highlight_whole_line = false
    },
    severity_sort = true
    -- float = {
    --   focusable = false,
    --   style = "minimal",
    --   header = "",
    --   prefix = "",
    -- }
})

return { on_attach }
