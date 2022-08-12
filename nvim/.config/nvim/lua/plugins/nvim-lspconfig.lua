local nvim_lsp = require('lspconfig')

-- -- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.preselectSupport = true
-- capabilities.textDocument.completion.completionItem.preselect = false
-- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
-- capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     'documentation',
--     'detail',
--     'additionalTextEdits',
--   },
-- }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

-- This stopped working because I installed rust-tools!
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gc', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({float = false})<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({float = false})<CR>', opts)
  buf_set_keymap('n', '<space>l', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>ff', '<cmd>lua vim.buf.formatting()<CR>', opts)

end

--[[

Language servers:

Add your language server to `servers`

For language servers list see:
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

Bash --> bashls
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls

Python --> pyright
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright

C-C++ -->  clangd
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd

HTML/CSS/JSON --> vscode-html-languageserver
https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html

JavaScript/TypeScript --> tsserver
https://github.com/typescript-language-server/typescript-language-server

--]]

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--- local servers = { 'bashls', 'pyright', 'clangd', 'html', 'tsserver' }
local servers = { 'pyright', 'html', 'tsserver' }

-- Set settings for language servers below
--
-- tsserver settings
local ts_settings = function(client)
  client.resolved_capabilities.document_formatting = false
  ts_settings(client)
end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    -- capabilities = capabilities,
    ts_settings = ts_settings,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.rust_analyzer.setup {
    on_attach=on_attach,
    -- capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            assist = {
              importGranularity = "crate",
              importPrefix = "crate",
            },
            cargo = {
              loadOutDirsFromCheck = true,
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
            -- checkOnSave = {
            --   command = "clippy",
            -- },
            experimental = {
              procAttrMacros = true,
            },
            lens = {
              methodReferences = true,
              references = true,
            },
        }
    },
    flags = {
      debounce_text_changes = 200,
    }
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = {
      focusable = false,
      style = "minimal",
      header = "",
      prefix = "",
    }
})
