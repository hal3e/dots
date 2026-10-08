local g = vim.g     -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options

opt.diffopt = "internal,filler,closeoff,indent-heuristic,inline:char"

opt.runtimepath:append('/usr/share/tree-sitter')

opt.shell = "/bin/dash"
opt.lazyredraw = true
opt.fillchars:append({ fold = " ", eob = " " })

opt.spell = true

-- Nice and simple folding:
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = 'expr'
opt.foldtext = ''
opt.foldcolumn = "0"
opt.updatetime = 750

-- Default to treesitter folding
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("lsp-fold", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client ~= nil and client:supports_method('textDocument/foldingRange') then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
    end,
})

opt.report = 99999
opt.shortmess = 'acstAFIW'
opt.showmode = false
opt.scrolloff = 5
opt.timeoutlen = 225 -- By default timeoutlen is 1000 ms
opt.mouse = ''
opt.laststatus = 3
opt.signcolumn = 'yes'        -- Reserve space so deferred signs do not shift the text.
g.mapleader = ' '             -- change leader to space

opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile

--Live substitution
opt.inccommand = 'nosplit'

opt.number = true         -- show line number
opt.relativenumber = true -- show line number

opt.showmatch = true      -- highlight matching parenthesis
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
        vim.lsp.buf.format {
            filter = function(client) return client.name ~= "volar" end
        }
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("format-ldg", { clear = true }),
    command = [[call ledger#align_commodity_buffer()]],
    pattern = "*.ldg"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("open-scad-syntax", { clear = true }),
    command = [[set filetype=openscad]],
    pattern = "*.scad"
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

local toggle_nums = vim.api.nvim_create_augroup("toggle-line-nums", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
    group = toggle_nums,
    callback = function()
        vim.wo.relativenumber = false
    end
})

vim.api.nvim_create_autocmd("InsertLeave", {
    group = toggle_nums,
    callback = function()
        vim.wo.relativenumber = true
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

local function is_git_repo(directory)
    vim.fn.system({ "git", "-C", directory, "rev-parse", "--show-toplevel" })
    return vim.v.shell_error == 0
end

-- Open nvim-tree once, when a file inside a Git working tree is loaded.
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
    callback = function(args)
        local filename = vim.api.nvim_buf_get_name(args.buf)
        if filename == "" or vim.bo[args.buf].buftype ~= "" then
            return
        end

        if not is_git_repo(vim.fn.fnamemodify(filename, ":h")) then
            return
        end

        vim.api.nvim_del_autocmd(args.id)
        vim.cmd "noautocmd NvimTreeOpen"
        vim.cmd "noautocmd wincmd p"
    end,
})

vim.api.nvim_create_autocmd('VimEnter', {
    group = vim.api.nvim_create_augroup('startup', { clear = true }),
    pattern = '*',
    callback = function()
        -- Open a file picker when no path arguments are supplied.
        if vim.fn.argc() == 0 then
            local builtin = require('telescope.builtin')
            if is_git_repo(vim.fn.getcwd()) then
                builtin.git_files()
            else
                builtin.find_files()
            end
        end
    end
})

vim.api.nvim_create_autocmd('RecordingEnter', {
    group = vim.api.nvim_create_augroup('MacroRecordingEnter', { clear = true }),
    callback = function()
        local msg = 'Recording macro @' .. vim.fn.reg_recording() .. '\n'
        vim.notify(msg)
    end,
})

vim.api.nvim_create_autocmd('RecordingLeave', {
    group = vim.api.nvim_create_augroup('MacroRecordingLeave', { clear = true }),
    callback = function()
        local msg = 'Finished recording macro @' .. vim.fn.reg_recording() .. '\n'
        vim.notify(msg)
    end,
})

vim.api.nvim_create_autocmd("VimResized", {
    group = vim.api.nvim_create_augroup("resize-splits-when-terminal-resized", { clear = true }),
    command = "wincmd =",
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("no-auto-comment", { clear = true }),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

vim.api.nvim_create_autocmd("CursorHold", {
    group = vim.api.nvim_create_augroup("LspReferenceHighlight", { clear = true }),
    desc = "Highlight references under cursor",
    callback = function()
        -- Only run if the cursor is not in insert mode
        if vim.fn.mode() ~= "i" then
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            local supports_highlight = false
            for _, client in ipairs(clients) do
                if client.server_capabilities.documentHighlightProvider then
                    supports_highlight = true
                    break -- Found a supporting client, no need to check others
                end
            end

            -- 3. Proceed only if an LSP is active AND supports the feature
            if supports_highlight then
                vim.lsp.buf.clear_references()
                vim.lsp.buf.document_highlight()
            end
        end
    end,
})

vim.api.nvim_create_autocmd("CursorMovedI", {
    group = "LspReferenceHighlight",
    desc = "Clear highlights when entering insert mode",
    callback = function()
        vim.lsp.buf.clear_references()
    end,
})

require('vim._core.ui2').enable({
    enable = true,
    msg = {
        targets = {
            [''] = 'msg',
            empty = 'cmd',
            bufwrite = 'msg',
            confirm = 'cmd',
            emsg = 'pager',
            echo = 'msg',
            echomsg = 'msg',
            echoerr = 'pager',
            completion = 'cmd',
            list_cmd = 'pager',
            lua_error = 'pager',
            lua_print = 'msg',
            progress = 'pager',
            rpc_error = 'pager',
            quickfix = 'msg',
            search_cmd = 'cmd',
            search_count = 'cmd',
            shell_cmd = 'pager',
            shell_err = 'pager',
            shell_out = 'pager',
            shell_ret = 'msg',
            undo = 'msg',
            verbose = 'pager',
            wildlist = 'cmd',
            wmsg = 'msg',
            typed_cmd = 'cmd',
        },
        cmd = {
            height = 0.2,
        },
        dialog = {
            height = 0.2,
        },
        msg = {
            height = 0.2,
            timeout = 5000,
        },
        pager = {
            height = 0.5,
        },
    },
})

-- Hide the command line after ui2 attaches to avoid an extra startup screen clear.
opt.cmdheight = 0

vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>U", require("undotree").open)
