local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

opt.shell = "/bin/dash"
opt.lazyredraw = true
-- opt.fillchars = { eob = " "}
opt.fillchars = { eob = " ", fold = " "}

opt.shortmess = 'I'
opt.showmode = false
opt.scrolloff = 5
opt.timeoutlen = 175            -- By default timeoutlen is 1000 ms

g.mapleader = ' '             -- change leader to a comma
g.python3_host_prog = '/home/hal3e/bin/miniconda3/envs/py38/bin/python'

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

exec([[
augroup filetypedetect
  au! BufNewFile,BufRead *.[sS][wW] set syntax=rust
augroup END
]], false)

opt.hidden = true         -- enable background buffers

opt.undofile = true
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

opt.termguicolors = true      -- enable 24-bit RGB colors
cmd [[colorscheme nord]]

opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 2           -- 1 tab == 4 spaces
opt.smarttab = true
opt.smartindent = true    -- autoindent new lines
opt.breakindent = true

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

cmd [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
