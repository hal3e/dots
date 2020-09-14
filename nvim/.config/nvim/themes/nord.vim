augroup nord-theme-overrides
    autocmd!
      " Use 'nord7' as foreground color for Vim comment titles.
      autocmd ColorScheme nord highlight TabLineSel guibg=#3B4252 guifg=#81A1C1
augroup END

set termguicolors
colorscheme nord
let g:nord_italic=1
let g:nord_italic_comments=1
