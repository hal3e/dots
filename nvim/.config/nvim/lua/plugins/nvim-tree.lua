local g = vim.g
vim.o.termguicolors = true

g.nvim_tree_add_trailing = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_special_files = {}
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?", string.rep(" ", 1000), "?:gs?^??" }

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0
}

g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "",
      renamed = "",
      staged = "",
      unmerged = "",
      unstaged = "",
      untracked = "",
   },
   folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}

require('nvim-tree').setup{
  open_on_setup = false,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = " ",
    }
  },
  view = {
     allow_resize = true,
     side = "right",
     width = 30,
  },
  filters = {
    dotfiles = false,
    custom = {'.git', 'node_modules', '.cache', '.bin'}
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
    ignore = false,
    timeout = 200,
  }
}
