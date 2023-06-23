vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup {
    highlight_overrides = {
        all = function(colors)
            return {
                DiagnosticError            = {
                    style = {}
                },
                DiagnosticWarn             = {
                    style = {}
                },
                DiagnosticInfo             = {
                    style = {}
                },
                DiagnosticHint             = {
                    style = {}
                },
                DiagnosticVirtualTextError = {
                    bg = colors.none
                },
                DiagnosticVirtualTextWarn  = {
                    bg = colors.none
                },
                DiagnosticVirtualTextInfo  = {
                    bg = colors.none
                },
                DiagnosticVirtualTextHint  = {
                    bg = colors.none
                },
                NvimTreeOpenedFile         = {
                    fg = colors.green

                },

            }
        end,
    },
}

vim.cmd.colorscheme 'catppuccin'
