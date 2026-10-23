vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.statusline', name = 'mini.statusline', version = 'main' },
}, { confirm = false })

local statusline = require('mini.statusline')
statusline.setup({
    content = {
        active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local filename      = statusline.section_filename({ trunc_width = 140 })
            local location      = statusline.section_location({ trunc_width = 75 })

            return statusline.combine_groups({
                { hl = mode_hl,                  strings = { mode } },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                '%=', -- End left alignment
                { hl = mode_hl, strings = { location } },
            })
        end
    }
})

-- This layout has no LSP or diagnostic counts. Their refresh hooks force an
-- early redraw while nvim-tree is still opening during startup.
vim.api.nvim_clear_autocmds({
    group = 'MiniStatusline',
    event = { 'LspAttach', 'LspDetach', 'DiagnosticChanged' },
})
