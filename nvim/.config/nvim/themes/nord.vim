augroup nord-theme-overrides
    autocmd!
      " Use 'nord7' as foreground color for Vim comment titles.
      autocmd ColorScheme nord highlight TabLineSel guibg=#3B4252 guifg=#81A1C1
augroup END

set termguicolors
colorscheme nord
let g:nord_italic=1
let g:nord_italic_comments=1

" Fix highlightedyank color
highlight HighlightedyankRegion guifg=#2E3440 guibg=#81A1C1
highlight SignColumn NONE

highlight EasyMotionTarget guifg=#D8DEE9
highlight EasyMotionShade  guifg=#616E88

highlight EasyMotionIncSearch guifg=#88C0D0

let g:indentLine_color_gui = '#616E88'

highlight Comment cterm=italic gui=italic
