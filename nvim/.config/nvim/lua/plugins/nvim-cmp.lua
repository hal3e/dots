local cmp = require 'cmp'
local luasnip = require 'luasnip'
local feedkeys = require('cmp.utils.feedkeys')
local keymap = require('cmp.utils.keymap')

require("luasnip/loaders/from_vscode").lazy_load()

-- local format_icons = {
--     Namespace = "",
--     Text = " ",
--     Method = " ",
--     Function = " ",
--     Constructor = " ",
--     Field = "ﰠ ",
--     Variable = " ",
--     Class = "ﴯ ",
--     Interface = " ",
--     Module = " ",
--     Property = "ﰠ ",
--     Unit = "塞 ",
--     Value = " ",
--     Enum = " ",
--     Keyword = " ",
--     Snippet = " ",
--     Color = " ",
--     File = " ",
--     Reference = " ",
--     Folder = " ",
--     EnumMember = " ",
--     Constant = " ",
--     Struct = "פּ ",
--     Event = " ",
--     Operator = " ",
--     TypeParameter = " ",
--     Table = "",
--     Object = " ",
--     Tag = "",
--     Array = "[]",
--     Boolean = " ",
--     Number = " ",
--     Null = "ﳠ",
--     String = " ",
--     Calendar = "",
--     Watch = " ",
--     Package = "",
--     Copilot = " ",
-- }

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = {
        completeopt = 'menu,menuone',
        keyword_length = 2
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-e>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.scroll_docs(-4),
        ['<C-o>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    }
    -- formatting = {
    --     format = function(_, vim_item)
    --         vim_item.kind = string.format("%s", format_icons[vim_item.kind])
    --         return vim_item
    --     end
    -- }
}

-- Use buffer source for `/`.
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline({
        ['<C->'] = {
            c = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
        },
        ['<C-e>'] = {
            c = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
        },
        ['<CR>'] = {
            c = cmp.mapping.confirm { select = true }
        },
    }),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
        ['<C-n>'] = {
            c = function()
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    feedkeys.call(keymap.t('<C-z>'), 'n')
                end
            end,
        },
        ['<C-e>'] = {
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    feedkeys.call(keymap.t('<C-z>'), 'n')
                end
            end,
        },
    }),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
