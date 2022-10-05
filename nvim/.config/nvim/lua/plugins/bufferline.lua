local bg = '#1E2030'

require('bufferline').setup {
    options = {
        always_show_bufferline = true,
        show_tab_indicators = false,
        show_buffer_close_icons = false,
        max_name_length = 20,
        max_prefix_length = 19,
        tab_size = 21,
        enforce_regular_tabs = false,
        view = "multiwindow",
        separator_style = "thin",
        diagnostics = false,
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_close_icon = false,
        indicator = {
            style = 'icon',
            icon = ' ',
        },
    },

    highlights = {
        fill = {
            bg = bg,
        },

        background = {
            bg = bg,
        },

        buffer_selected = {
            italic = false
        },
    }
}
