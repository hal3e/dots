vim.pack.add({
    { src = 'https://github.com/catgoose/nvim-colorizer.lua', name = 'nvim-colorizer.lua', version = 'master' },
}, { confirm = false })

require('colorizer').setup({
    filetypes = { '*' },
    user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        css = false,
        css_fn = true,
        mode = 'background',
        virtualtext = '■',
    },
})
