local cmd = vim.cmd -- execute Vim commands
local g = vim.g     -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options

opt.shell = "/bin/dash"
opt.lazyredraw = true
opt.fillchars = { eob = " ", fold = " " }

opt.report = 99999
opt.shortmess = 'acstAFIW'
opt.showmode = false
opt.scrolloff = 5
opt.timeoutlen = 175 -- By default timeoutlen is 1000 ms
opt.mouse = ''
opt.cmdheight = 0

g.mapleader = ' ' -- change leader to a comma
g.python3_host_prog = '/home/hal3e/bin/miniconda3/envs/py38/bin/python'

opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile

--Live substitution
opt.inccommand = 'nosplit'

opt.number = true         -- show line number
opt.relativenumber = true -- show line number

opt.showmatch = true      -- highlight matching parenthesis
opt.foldmethod = 'indent' -- enable folding (default 'foldmarker')
opt.foldlevelstart = 99
opt.splitright = true     -- vertical split to the right
opt.splitbelow = true     -- orizontal split to the bottom
opt.ignorecase = true     -- ignore case letters when search
opt.smartcase = true      -- ignore lowercase for the whole pattern
opt.linebreak = true      -- wrap on word boundary

opt.hidden = true         -- enable background buffers

opt.undofile = true
opt.history = 100                      -- remember n lines in history
opt.lazyredraw = true                  -- faster scrolling
opt.synmaxcol = 240                    -- max column for syntax highlight

opt.termguicolors = true               -- enable 24-bit RGB colors
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()
cmd [[colorscheme catppuccin]]

opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4   -- shift 4 spaces when tab
opt.tabstop = 4      -- 1 tab == 4 spaces
opt.softtabstop = 4
opt.smarttab = true
opt.smartindent = true -- autoindent new lines
opt.breakindent = true

vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("format", { clear = true }),
    callback = function()
        vim.lsp.buf.format()
    end
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("sway-sytnax", { clear = true }),
    command = [[set filetype=sway]],
    pattern = "*.[sS][wW]"
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("remove-whitespace", { clear = true }),
    command = [[%s/\s\+$//e]]
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
    end
})

local toogle_nums = vim.api.nvim_create_augroup("toogle-line-nums", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
    group = toogle_nums,
    callback = function()
        vim.wo.relativenumber = false
    end
})

vim.api.nvim_create_autocmd("InsertLeave", {
    group = toogle_nums,
    callback = function()
        vim.wo.relativenumber = true
    end
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("set-spell", { clear = true }),
    callback = function()
        vim.wo.spell = true
    end
})

vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("close-nvimtree-if-last", { clear = true }),
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    pattern = "NvimTree*",
    nested = true,
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("quickfix-move-to_bottom", { clear = true }),
    command = [[wincmd J]],
    pattern = "qf",
})

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
