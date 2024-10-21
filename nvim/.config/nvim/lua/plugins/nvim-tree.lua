local function on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', '<C-i>', api.node.show_info_popup, opts('Info'))
    vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
    vim.keymap.set('n', 'J', api.node.navigate.sibling.next, opts('Next Sibling'))
    vim.keymap.set('n', 'K', api.node.navigate.sibling.prev, opts('Previous Sibling'))
    vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
    vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
    vim.keymap.set('n', 'bd', api.marks.bulk.delete, opts('Delete Bookmarked'))
    vim.keymap.set('n', 'bt', api.marks.bulk.trash, opts('Trash Bookmarked'))
    vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
    vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle Filter: No Buffer'))
    vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
    vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
    vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
    vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
    vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
    vim.keymap.set('n', 'zR', api.tree.expand_all, opts('Expand All'))
    vim.keymap.set('n', 'r', api.fs.rename_basename, opts('Rename: Basename'))
    vim.keymap.set('n', 'R', api.fs.rename, opts('Rename'))
    vim.keymap.set('n', 'rp', api.fs.rename_full, opts('Rename: Full Path'))
    vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
    vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
    vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
    vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
    vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
    vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
    vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
    vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Filter: Git Ignore'))
    vim.keymap.set('n', '>', api.node.navigate.sibling.last, opts('Last Sibling'))
    vim.keymap.set('n', '<', api.node.navigate.sibling.first, opts('First Sibling'))
    vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
    vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
    vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
    vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
    vim.keymap.set('n', 'zM', api.tree.collapse_all, opts('Collapse'))
    vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
    vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
    vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
end

require('nvim-tree').setup({
    disable_netrw = true,
    open_on_tab = false,
    update_cwd = true,
    respect_buf_cwd = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    renderer = {
        add_trailing = false,
        highlight_git = false,
        highlight_opened_files = "icon",
        highlight_modified = "icon",
        special_files = {},
        root_folder_modifier = table.concat { ":t:gs?$?", string.rep(" ", 1000), "?:gs?^??" },
        indent_markers = {
            enable = false,
        },
        icons = {
            padding = "",
            git_placement = "signcolumn",
            modified_placement = "after",
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true,
                modified = true,
            },
            glyphs = {
                default = " ",
                symlink = " ",
                modified = " ●",
                folder = {
                    default = " ",
                    empty = " ",
                    empty_open = " ",
                    open = " ",
                    symlink = " ",
                },
                git = {
                    unstaged = "┃",
                    staged = "┃",
                    unmerged = "┃",
                    renamed = "",
                    untracked = "┆",
                    deleted = "",
                    ignored = "",
                },
            },
        }
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        icons = {
            hint = " ",
            info = " ",
            warning = " ",
            error = " ",
        }
    },
    view = {
        signcolumn = "yes",
        side = "right",
        width = 30,
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = false,
            }
        }
    },
    git = {
        show_on_dirs = true,
        show_on_open_dirs = false,
        enable = true,
        ignore = true,
        timeout = 200,
    },
    modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
    },
    filesystem_watchers = {
        enable = true,
    },
    on_attach = on_attach
})
