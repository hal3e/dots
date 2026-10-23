vim.pack.add({
    { src = 'https://github.com/lewis6991/gitsigns.nvim', name = 'gitsigns.nvim', version = 'main' },
}, { confirm = false })

require('gitsigns').setup({
    on_attach = function(bufnr)
        local gs = require('gitsigns')

        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = bufnr,
                desc = desc,
            })
        end

        map('n', ']c', function()
            gs.nav_hunk('next', { preview = true, })
        end, 'Next hunk')

        map('n', '[c', function()
            gs.nav_hunk('prev', { preview = true, })
        end, 'Previous hunk')

        map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
        map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')

        map('v', '<leader>hs', function()
            gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, 'Stage hunk')

        map('v', '<leader>hr', function()
            gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, 'Reset hunk')

        map('n', '<leader>hS', gs.stage_buffer, 'Stage buffer')
        map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo stage hunk')
        map('n', '<leader>hR', gs.reset_buffer, 'Reset buffer')
        map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
        map('n', '<leader>hi', gs.preview_hunk_inline, 'Preview hunk inline')
        map('n', '<leader>hb', function()
            gs.blame_line({ full = true })
        end, 'Blame line')
        map('n', '<leader>htb', gs.toggle_current_line_blame, 'Toggle line blame')
        map('n', '<leader>hd', gs.diffthis, 'Diff this')
        map('n', '<leader>hD', function()
            gs.diffthis('~')
        end, 'Diff this ~')
        map('n', '<leader>htd', gs.toggle_deleted, 'Toggle deleted')

        map({ 'o', 'x' }, 'ih', gs.select_hunk, 'Select hunk')
    end,
})
