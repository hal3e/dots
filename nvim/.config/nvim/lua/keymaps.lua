local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local opt = vim.opt

-- Set workman bindings
opt.langmap = "qq,dw,re,wr,bt,jy,fu,ui,po,\\;p,aa,ss,hd,tf,gg,yh,nj,ek,ol,i\\;,zz,xx,mc,cv,vb,kn,lm," ..
    "QQ,DW,RE,WR,BT,JY,FU,UI,PO,\\:P,AA,SS,HD,TF,GG,YH,NJ,EK,OL,I\\:,ZZ,XX,MC,CV,VB,KN,LM"

-- Clear search highlighting
map('n', '<Esc>', ':nohl<CR>', default_opts)

-- Do not use arrow keys
map('', '<up>', '<nop>', { noremap = true })
map('', '<down>', '<nop>', { noremap = true })
map('', '<left>', '<nop>', { noremap = true })
map('', '<right>', '<nop>', { noremap = true })

-- Fast saving with <leader> and w
map('n', '<leader>w', ':w<CR>', default_opts)

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- Close all windows and exit from neovim
map('n', '<leader>q', ':quitall<CR>', default_opts)
map('n', '<leader>qq', ':quitall!<CR>', default_opts)

-- Close pane
map('n', '<leader>x', ':close<CR>', default_opts)

-- Open terminal
map('n', '<C-t>', ':Term<CR>', { noremap = true })

-- Nvim-tree
map('n', '<leader>e', ':silent NvimTreeToggle<CR>', default_opts)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts)

-- Used for spelling <Leader>s enters spell menu, enter exits to normal mode
map('n', '<leader>ss', ':set spell!<CR>', default_opts)
map('n', '<leader>s', 'ea<C-X><C-S>', default_opts)
--inoremap <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"

-- Buffers
map('n', '<Tab>', ':bn<CR>', default_opts)
map('n', '<S-Tab>', ':bp<CR>', default_opts)
map('n', '<leader>b', ':bp | bd #<CR>', default_opts)

-- Commentary
map('n', '<C-_>', ':CommentToggle<CR>', default_opts)
map('v', '<C-_>', ':CommentToggle<CR>', default_opts)

-- Movement
map('n', 'n', 'nzz', default_opts)
map('n', 'N', 'Nzz', default_opts)
map('n', '*', '*zz', default_opts)
map('n', '#', '#zz', default_opts)
map('', 'J', '<C-d>', default_opts)
map('', 'K', '<C-u>', default_opts)
map('n', '<C-o>', '<C-o>', default_opts)
map('n', '<C-i>', '<C-i>', default_opts)

-- Telescope
map('n', '<leader>f', ':Telescope git_files<CR>', default_opts)
map('n', '<leader>r', ':Telescope live_grep<CR>', default_opts)
map('n', '<leader><Tab>', ':Telescope buffers<CR>', default_opts)
map('n', '<leader><space>', ':Telescope commands<CR>', default_opts)
map('n', '<leader>th', ':Telescope help_tags<CR>', default_opts)
map('n', '<leader>gs', ':Telescope git_status<CR>', default_opts)

-- Lsp
-- Had to add this here because of rust-tools
map('n', 'gc', '<cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', default_opts)
map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', default_opts)
map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', default_opts)
map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', default_opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', default_opts)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', default_opts)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', default_opts)
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', default_opts)
map('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', default_opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', default_opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', default_opts)
map('n', '<space>l', '<cmd>lua vim.diagnostic.set_loclist()<CR>', default_opts)
map('n', '<space>ff', '<cmd>lua vim.lsp_buf.format()<CR>', default_opts)
