local cmp = require 'cmp'
local luasnip = require 'luasnip'

require("luasnip/loaders/from_vscode").lazy_load()

local kinds = {
    Array = "  array",
    Boolean = "  bool",
    Class = "  class",
    Color = "  color",
    Constant = "●  const",
    Constructor = "●  constructor",
    Copilot = "  copilot",
    Enum = "●  enum",
    EnumMember = "●  enumber",
    Event = "  event",
    Field = "  field",
    File = "  file",
    Folder = "  folder",
    Function = "  function",
    Interface = "  interface",
    Key = "  key",
    Keyword = "  keyword",
    Method = "  method",
    Module = "  module",
    Namespace = "  namespace",
    Null = "  null",
    Number = "  number",
    Object = "  object",
    Operator = "+  operator",
    Package = "  package",
    Property = "●  property",
    Reference = "  reference",
    Snippet = "  snippet",
    String = [["  string]],
    Struct = "  struct",
    Text = "  text",
    TypeParameter = "●  tparam",
    Unit = "●  unit",
    Value = "●  value",
    Variable = "  variable",
    Macro = "@  macro",
}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = {
        completeopt = 'menu,menuone',
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-c>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip",  priority = 750 },
        { name = 'nvim_lua', priority = 500 },
        { name = 'buffer',   priority = 250, keyword_length = 2 },
        { name = "path",     priority = 50 },
        { name = "crates",   priority = 10 },
    }),
    matching = {
        disallow_fuzzy_matching = true,
    },
    formatting = {
        fields = { "abbr", "kind" },
        format = function(entry, item)
            item.kind = kinds[item.kind]
            item.menu = ''
            -- item.menu = ({
            --     nvim_lsp = "lsp",
            --     nvim_lua = "lua",
            --     luasnip = "snip",
            --     buffer = "buff",
            --     path = "path",
            -- })[entry.source.name]
            return item
        end,
    },
}

-- Use buffer source for `/`.
cmp.setup.cmdline({ '/', '?' }, {
    completion = {
        completeopt = 'menu,menuone',
        keyword_length = 2
    },
    mapping = cmp.mapping.preset.cmdline({
        ['<C-n>'] = {
            c = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
        },
        ['<C-p>'] = {
            c = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
        },
        ['<C-l>'] = {
            c = function(fallback)
                if cmp.visible() then
                    cmp.confirm { select = true }
                else
                    fallback()
                end
            end,
        },
    }),
    sources = cmp.config.sources({ { name = 'buffer' } })
})

--Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    completion = {
        completeopt = 'menu,menuone',
    },
    mapping = cmp.mapping.preset.cmdline({
        ['<C-n>'] = {
            c = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
        },
        ['<C-p>'] = {
            c = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
        },
        ['<CR>'] = {
            c = function(fallback)
                if cmp.visible() then
                    cmp.confirm { select = true }
                else
                    fallback()
                end
            end,
        },
    }),
    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})
