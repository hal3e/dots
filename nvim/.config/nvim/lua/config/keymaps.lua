local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Clear search highlighting
map('n', '<Esc>', ':nohl<CR>', default_opts)

-- Do not use arrow keys
map('', '<up>', '<nop>', { noremap = true })
map('', '<down>', '<nop>', { noremap = true })
map('', '<left>', '<nop>', { noremap = true })
map('', '<right>', '<nop>', { noremap = true })

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- CTRL+I and CTRL+O
map('n', '<C-p>', '<C-o>zz', default_opts)
map('n', '<C-n>', '<C-i>zz', default_opts)

-- Redo with U
map('n', 'U', '<C-r>', default_opts)

-- Enter in normal mode makes new line
map('n', 'oo', 'o<esc>', default_opts)
map('n', 'OO', 'O<esc>', default_opts)

local chars = { '_', '.', ':', ',', ';', '|', '/', '\\', '*', '+', '%', '`', '?' }
for _, char in ipairs(chars) do
    for _, mode in ipairs({ 'x', 'o' }) do
        local i_cmd = string.format(':<C-u>silent! normal! f%sF%slvt%s<CR>', char, char, char)
        local a_cmd = string.format(':<C-u>silent! normal! f%sF%svf%s<CR>', char, char, char)
        map(mode, "i" .. char, i_cmd, default_opts)
        map(mode, "a" .. char, a_cmd, default_opts)
    end
end

function Select_indent(around)
    local start_indent = vim.fn.indent(vim.fn.line('.'))
    local blank_line_pattern = '^%s*$'

    if string.match(vim.fn.getline('.'), blank_line_pattern) then
        return
    end

    if vim.v.count > 0 then
        start_indent = start_indent - vim.o.shiftwidth * (vim.v.count - 1)
        if start_indent < 0 then
            start_indent = 0
        end
    end

    local prev_line = vim.fn.line('.') - 1
    local prev_blank_line = function(line) return string.match(vim.fn.getline(line), blank_line_pattern) end
    while prev_line > 0 and (prev_blank_line(prev_line) or vim.fn.indent(prev_line) >= start_indent) do
        vim.cmd('-')
        prev_line = vim.fn.line('.') - 1
    end
    if around then
        vim.cmd('-')
    end

    vim.cmd('normal! 0V')

    local next_line = vim.fn.line('.') + 1
    local next_blank_line = function(line) return string.match(vim.fn.getline(line), blank_line_pattern) end
    local last_line = vim.fn.line('$')
    while next_line <= last_line and (next_blank_line(next_line) or vim.fn.indent(next_line) >= start_indent) do
        vim.cmd('+')
        next_line = vim.fn.line('.') + 1
    end
    if around then
        vim.cmd('+')
    end
end

for _, mode in ipairs({ 'x', 'o' }) do
    map(mode, 'ii', ':<c-u>lua Select_indent()<cr>', default_opts)
    map(mode, 'ai', ':<c-u>lua Select_indent(true)<cr>', default_opts)
end

-- Fast saving with <leader> and w
map('n', '<leader>w', ':silent w<CR>', default_opts)

-- Save all windows and exit from neovim
map('n', '<leader>q', ':wqa<CR>', default_opts)

-- Close pane
map('n', '<leader>x', ':close<CR>', default_opts)

-- Open terminal
map('n', '<C-b>', ':Term<CR>', { noremap = true })

-- Nvim-tree
map('n', '<leader>e', ':silent NvimTreeToggle<CR>', default_opts)

-- Used for spelling <Leader>s enters spell menu, enter exits to normal mode
map('n', '<leader>ss', ':set spell!<CR>', default_opts)
map('n', '<leader>s', 'ea<C-X><C-S>', default_opts)

-- Buffers
map('n', '<Tab>', ':bn<CR>', default_opts)
map('n', '<S-Tab>', ':bp<CR>', default_opts)
map('n', '<leader>c', ':silent w | bp | bd #<CR>', default_opts)

-- Commentary
map('n', '<C-_>', ':CommentToggle<CR>', default_opts)
map('v', '<C-_>', ':CommentToggle<CR>', default_opts)

-- Movement
map('n', 'n', 'nzz', default_opts)
map('n', 'N', 'Nzz', default_opts)
map('n', '*', '*zz', default_opts)
map('n', '#', '#zz', default_opts)
map('n', 'H', '^', default_opts)
map('n', 'J', '<C-d>zz', default_opts)
map('n', 'K', '<C-u>zz', default_opts)
map('v', 'J', '<C-d>zz', default_opts)
map('v', 'K', '<C-u>zz', default_opts)
map('n', 'L', '$', default_opts)
map('n', '<leader>j', 'J', default_opts)

-- Yank on visual will not move cursor
map('v', 'y', 'ygv<esc>', default_opts)

vim.keymap.set('n', '<leader>l', function() vim.cmd('Lazy') end, default_opts)

-- Quickfix
map('n', '[q', ':try | cp | catch | clast | endtry<CR>zz', default_opts)
map('n', ']q', ':try | cn | catch | cfirst | endtry<CR>zz', default_opts)
