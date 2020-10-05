imap nj <Esc>|                  " Use 'nn' to exit insert mode
nnoremap <Esc> :noh<CR>         " Clear search

" Movement keymaps
nnoremap J <C-d>                " Half page movement
nnoremap K <C-u>
nmap <leader>hh  <C-w>h
nmap <leader>ll  <C-w>l

" Used for spelling <Leader>s enters spell menu, enter exits to normal mode
nnoremap <Leader>s ea<C-X><C-S>
inoremap <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"

" Buffers keymaps
nnoremap <Tab> :bn<CR>          " Change buffers
nnoremap <S-Tab> :bp<CR>
nnoremap <leader>b :Bd<CR>
nnoremap <leader>bb :BD<CR>

" Commentary keymaps
nnoremap <C-\> :Commentary<CR>  " Comment line or block
vnoremap <C-\> :Commentary<CR>


" Search keymaps
nnoremap <leader>q :H<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>c :Commands<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Easymotion keymaps
nmap <leader>j  <Plug>(easymotion-bd-f2)
nmap <leader>jj <Plug>(easymotion-bd-fn)
nmap <leader>l  <Plug>(easymotion-lineforward)
nmap <leader>h  <Plug>(easymotion-linebackward)

let g:workman_normal_qwerty=1  " Map Workman to Qwerty in Normal mode

nmap <leader>e :CocCommand explorer --toggle --sources=file+ --file-root-template [root] --position right --width 30<CR>
