vim.opt.termguicolors = true -- enable 24-bit RGB colors

require('nvim-tree').setup({
    open_on_setup = false,
    disable_netrw = true,
    open_on_tab = false,
    update_cwd = true,
    respect_buf_cwd = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    renderer = {
        add_trailing = false,
        highlight_git = true,
        highlight_opened_files = "all",
        special_files = {},
        root_folder_modifier = table.concat { ":t:gs?$?", string.rep(" ", 1000), "?:gs?^??" },
        indent_markers = {
            enable = false,
        },
        icons = {
            padding = "",
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = false,
                modified = false
            },
            glyphs = {
                default = " ",
                symlink = " ",
                folder = {
                    default = " ",
                    empty = " ",
                    empty_open = " ",
                    open = " ",
                    symlink = " ",
                    symlink_open = " ",
                }
            }
        }
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    diagnostics = {
        enable = true,
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
        enable = true,
        ignore = true,
        timeout = 200,
    },
    filesystem_watchers = {
        enable = true,
    },
})
