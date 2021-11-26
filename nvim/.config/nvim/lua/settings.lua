local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

opt.shortmess = 'I'
opt.showmode = false
opt.scrolloff = 5
opt.timeoutlen = 175            -- By default timeoutlen is 1000 ms

g.mapleader = ' '             -- change leader to a comma

opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile

--Live substitution
opt.inccommand = 'nosplit'

opt.number = true             -- show line number
opt.relativenumber = true     -- show line number
cmd [[autocmd InsertEnter * :set norelativenumber]]
cmd [[autocmd InsertLeave * :set relativenumber]]

opt.showmatch = true          -- highlight matching parenthesis
opt.foldmethod = 'indent'     -- enable folding (default 'foldmarker')
opt.foldlevelstart = 99
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- orizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.linebreak = true          -- wrap on word boundary

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- set spell for git commits
cmd [[au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
  augroup end
]], false)

opt.hidden = true         -- enable background buffers

opt.undofile = true
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

opt.termguicolors = true      -- enable 24-bit RGB colors
cmd [[colorscheme nord]]

opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 2        -- shift 4 spaces when tab
opt.tabstop = 2           -- 1 tab == 4 spaces
opt.smarttab = true
opt.smartindent = true    -- autoindent new lines
opt.breakindent = true

-- Do not auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-- IndentLine
--g.indentLine_setColors = 0  -- set indentLine color
g.indentLine_char = '|'       -- set indentLine character

-- Disable IndentLine for markdown files (avoid concealing)
cmd [[autocmd FileType markdown let g:indentLine_enabled=0]]

--opt.completeopt = 'menuone,noselect,noinsert'

-- Open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]
