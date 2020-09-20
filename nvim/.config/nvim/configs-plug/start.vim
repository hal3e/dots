let g:startify_center = 50
" let g:startify_change_to_vcs_root = 1   " Change project folder


let s:padding_left = startify#get_padding()

let g:startify_lists = [
  \ { 'type': 'sessions',  'header': [s:padding_left .'Sessions'] },
  \ { 'type': 'files',     'header': [s:padding_left .'Files'] },
  \ { 'type': 'dir',       'header': [s:padding_left .'Current Directory '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': [s:padding_left .'Bookmarks'] }]

let g:startify_bookmarks = [
  \ { 's': '~/.config/nvim/configs-plug/start.vim' },
  \ { 'f': '~/.config/fish/config.fish' }]

let g:ascii=[
  \ '      ___        ___                   ___     ',
  \ '     /\__\      /\__\        ___      /\__\    ',
  \ '    /::|  |    /:/  /       /\  \    /::|  |   ',
  \ '   /:|:|  |   /:/  /        \:\  \  /:|:|  |   ',
  \ '  /:/|:|  |__/:/__/  ___    /::\__\/:/|:|__|__ ',
  \ ' /:/ |:| /\__\:|  | /\__\__/:/\/__/:/ |::::\__\',
  \ ' \/__|:|/:/  /:|  |/:/  /\/:/  /  \/__/~~/:/  /',
  \ '     |:/:/  /|:|__/:/  /\::/__/         /:/  / ',
  \ '     |::/  /  \::::/__/  \:\__\        /:/  /  ',
  \ '     /:/  /    ~~~~       \/__/       /:/  /   ',
  \ '     \/__/                            \/__/    ']
                                                                                   
let g:startify_custom_header = 'startify#pad(g:ascii)'
