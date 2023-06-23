require('nvim-tree').setup({
    open_on_setup = false,
    disable_netrw = true,
    open_on_tab = false,
    update_cwd = true,
    respect_buf_cwd = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    signcolumn = "yes",
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
})
