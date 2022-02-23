-- TODO: use nord colors

local bg = '#292E3D'

require('bufferline').setup {
  options = {
    always_show_bufferline = true,
    show_tab_indicators = false,
    show_buffer_close_icons = false,
    max_name_length = 20,
    max_prefix_length = 19,
    tab_size = 21,
    enforce_regular_tabs = false,
    indicator_icon = ' ',
    view = "multiwindow",
    separator_style = "thin",
    diagnostics = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
  },

  highlights = {
    fill = {
      guibg = bg,
    },

    background = {
      guibg = bg,
    },

    buffer_selected = {
      guibg = "#2E3445",
      gui = "bold",
    },

    separator = {
      guifg = bg,
      guibg = bg,
    },

    separator_selected = {
      guifg = "#2E3445",
      guibg = "#2E3445",
    },

    duplicate_selected = {
      guibg = "#2E3445",
    },

    duplicate = {
      guibg = bg,
    }
  }
}
