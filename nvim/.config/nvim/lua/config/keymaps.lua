local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Map lowercase to uppercase marks
for i = string.byte("a"), string.byte("z") do
    local l = string.char(i)
    local u = string.upper(l)
    map('n', 'm' .. l, 'm' .. u, default_opts)
    map('n', '`' .. l, '`' .. u, default_opts)
    map('n', "'" .. l, "'" .. u, default_opts)
end

-- Do not copy when pasting over text
map('x', 'p', 'P', default_opts)
map('x', 'P', 'p', default_opts)

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

-- Add custom text objects
local chars = { '_', '.', ':', ',', ';', '|', '/', '\\', '*', '+', '%', '`', '?' }
for _, char in ipairs(chars) do
    for _, mode in ipairs({ 'x', 'o' }) do
        local i_cmd = string.format(':<C-u>silent! normal! f%sF%slvt%s<CR>', char, char, char)
        local a_cmd = string.format(':<C-u>silent! normal! f%sF%svf%s<CR>', char, char, char)
        map(mode, "i" .. char, i_cmd, default_opts)
        map(mode, "a" .. char, a_cmd, default_opts)
    end
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
map('n', '<leader>c', ':silent w | bp | bd #<CR>', default_opts)

-- Commentary
map('n', '<C-_>', 'gcc', { noremap = false, silent = true })
map('v', '<C-_>', 'gc', { noremap = false, silent = true })

-- Movement
map('n', 'n', 'nzz', default_opts)
map('n', 'N', 'Nzz', default_opts)
map('n', '*', '*zz', default_opts)
map('n', '#', '#zz', default_opts)
map('n', 'H', '^', default_opts)
map('v', 'H', '^', default_opts)
map('o', 'H', '^', default_opts)
map('n', 'L', '$', default_opts)
map('v', 'L', '$', default_opts)
map('o', 'L', '$', default_opts)
map('n', 'J', '<C-d>zz', default_opts)
map('n', 'K', '<C-u>zz', default_opts)
map('v', 'J', '<C-d>zz', default_opts)
map('v', 'K', '<C-u>zz', default_opts)
map('n', '<leader>j', 'J', default_opts)

-- Yank on visual will not move cursor
map('v', 'y', 'ygv<esc>', default_opts)
