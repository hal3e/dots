-- TODO: fix gitsigns jump to and preview
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd
local opt = vim.opt

-- Set workman bindings
opt.langmap = "qq,dw,re,wr,bt,jy,fu,ui,po,\\;p,aa,ss,hd,tf,gg,yh,nj,ek,ol,i\\;,zz,xx,mc,cv,vb,kn,lm,"..
              "QQ,DW,RE,WR,BT,JY,FU,UI,PO,\\:P,AA,SS,HD,TF,GG,YH,NJ,EK,OL,I\\:,ZZ,XX,MC,CV,VB,KN,LM"

-- Clear search highlighting
map('n', '<Esc>', ':nohl<CR>', default_opts)

-- Do not use arrow keys
map('', '<up>',    '<nop>', {noremap = true})
map('', '<down>',  '<nop>', {noremap = true})
map('', '<left>',  '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

-- Fast saving with <leader> and w
map('n', '<leader>w', ':w<CR>', default_opts)

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-y>', '<C-w>h', default_opts)
map('n', '<C-n>', '<C-w>j', default_opts)
map('n', '<C-e>', '<C-w>k', default_opts)
map('n', '<C-o>', '<C-w>l', default_opts)

-- Close all windows and exit from neovim
map('n', '<leader>q',  ':quitall<CR>', default_opts)
map('n', '<leader>qq', ':quitall!<CR>', default_opts)

-- Close pane
map('n', '<leader>x', ':close<CR>', default_opts)

-- Open terminal
map('n', '<C-t>', ':Term<CR>', {noremap = true})

-- Nvim-tree
map('n', '<leader>e', ':silent NvimTreeToggle<CR>', default_opts)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts)

-- Used for spelling <Leader>s enters spell menu, enter exits to normal mode
map('n', '<leader>ss', ':set spell!<CR>', default_opts)
map('n', '<leader>s', 'ea<C-X><C-S>', default_opts)
--inoremap <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"

-- Buffers
map('n', '<Tab>',     ':bn<CR>', default_opts)
map('n', '<S-Tab>',   ':bp<CR>', default_opts)
map('n', '<leader>b', ':bp | bd #<CR>', default_opts)

-- Commentary
map('n', '<C-_>', ':CommentToggle<CR>', default_opts)
map('v', '<C-_>', ':CommentToggle<CR>', default_opts)

-- Movement
map('n', 'n', 'nzz', default_opts)
map('n', 'N', 'Nzz', default_opts)
map('n', '*', '*zz', default_opts)
map('n', '#', '#zz', default_opts)
map('n', 'J', '<C-d>', default_opts)
map('n', 'K', '<C-u>', default_opts)
map('n', '<C-p>', '<C-o>', default_opts)
map('n', '<C-u>', '<C-i>', default_opts)

-- Telescope
map('n', '<leader>f',       ':Telescope git_files<CR>', default_opts)
map('n', '<leader>r',       ':Telescope live_grep<CR>', default_opts)
map('n', '<leader><Tab>',   ':Telescope buffers<CR>', default_opts)
map('n', '<leader><space>', ':Telescope commands<CR>', default_opts)
map('n', '<leader>th',       ':Telescope help_tags<CR>', default_opts)
map('n', '<leader>gs',      ':Telescope git_status<CR>', default_opts)

-- Gitsigns
map('n', '<leader>cp',       ':Gitsigns preview_hunk<CR>', default_opts)
map('n', '<leader>cr',       ':Gitsigns reset_hunk<CR>', default_opts)
map('n', '<leader>cd',       ':Gitsigns diffthis<CR>', default_opts)
map('n', '[c',       ':exe "Gitsigns next_hunk" | exe "Gitsigns preview_hunk" <CR>', default_opts)
map('n', ']c',       ':exe "Gitsigns prev_hunk" | exe "Gitsigns preview_hunk" <CR>', default_opts)
