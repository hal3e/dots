local g = vim.g     -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options

opt.shell = "/bin/dash"
opt.lazyredraw = true
opt.fillchars = { eob = " ", fold = " " }

opt.report = 99999
opt.shortmess = 'acstAFIW'
opt.showmode = false
opt.scrolloff = 5
opt.timeoutlen = 225 -- By default timeoutlen is 1000 ms
opt.mouse = ''
opt.cmdheight = 0
opt.laststatus = 0

g.mapleader = ' ' -- change leader to space
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
opt.history = 100     -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240   -- max column for syntax highlight

opt.expandtab = true  -- use spaces instead of tabs
opt.shiftwidth = 4    -- shift 4 spaces when tab
opt.tabstop = 4       -- 1 tab == 4 spaces
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

vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("format-ldg", { clear = true }),
    command = [[call ledger#align_commodity_buffer()]],
    pattern = "*.ldg"
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

vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('startup', { clear = true }),
    pattern = '*',
    callback = function()
        -- Open file browser if argument is a folder
        local arg = vim.api.nvim_eval('argv(0)')
        if arg == "" then
            vim.defer_fn(function()
                if vim.fn.findfile('.gitignore') == "" then
                    require('telescope.builtin').find_files()
                else
                    vim.cmd('silent NvimTreeToggle')
                    require('telescope.builtin').git_files()
                end
            end, 50)
        end
    end
})

-- add when nvim > 0.9.4
-- local function get_custom_foldtxt_suffix(foldstart)
--     local fold_suffix_str = string.format(
--         "  %s [%s lines]",
--         '┉',
--         vim.v.foldend - foldstart + 1
--     )

--     return { fold_suffix_str, "Folded" }
-- end

-- local function get_custom_foldtext(foldtxt_suffix, foldstart)
--     local line = vim.api.nvim_buf_get_lines(0, foldstart - 1, foldstart, false)[1]

--     return {
--         { line, "Normal" },
--         foldtxt_suffix
--     }
-- end

-- _G.get_foldtext = function()
--     local foldstart = vim.v.foldstart
--     local ts_foldtxt = vim.treesitter.foldtext()
--     local foldtxt_suffix = get_custom_foldtxt_suffix(foldstart)

--     if type(ts_foldtxt) == "string" then
--         return get_custom_foldtext(foldtxt_suffix, foldstart)
--     end

--     table.insert(ts_foldtxt, foldtxt_suffix)
--     return ts_foldtxt
-- end

-- vim.opt.foldtext = "v:lua.get_foldtext()"
