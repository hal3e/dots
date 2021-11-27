local g = vim.g
vim.o.termguicolors = true

g.nvim_tree_add_trailing = 0
g.nvim_tree_gitignore = 0
g.nvim_tree_quit_on_open = 0
g.nvim_tree_indent_markers = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_disable_window_picker = 1
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
   default = "",
}

require('nvim-tree').setup{
  open_on_setup = false,
  disable_netrw = true,
  hijack_netrw = true,
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
     enable = true,
     update_cwd = false,
  },
  view = {
     allow_resize = true,
     side = "left",
     width = 25,
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
  },
  filters = {
    dotfiles = false,
    custom = {'.git', 'node_modules', '.cache', '.bin'}
  }
}
