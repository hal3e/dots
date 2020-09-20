imap nj <Esc>|                  " Use 'nn' to exit insert mode
nnoremap <Esc> :noh<CR>         " Clear search

" Write with privileges 
cmap w!! w !sudo tee %

nnoremap <Tab> :bn<CR>          " Change buffers
nnoremap <S-Tab> :bp<CR>

nnoremap <C-\> :Commentary<CR>  " Comment line or block
vnoremap <C-\> :Commentary<CR>

nnoremap J <C-d>                " Half page movement
nnoremap K <C-u>

" Used fro spelling <Leader>s enters spell menu, enter exits to normal mode
nnoremap <Leader>s ea<C-X><C-S>
inoremap <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"

nnoremap <leader>b :bd<CR>
nnoremap <leader>bb :Bd<CR>

nnoremap <leader>q :H<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>

nmap <leader>j  <Plug>(easymotion-bd-f2)
nmap <leader>jj <Plug>(easymotion-bd-fn)
nmap <leader>l  <Plug>(easymotion-lineforward)
nmap <leader>h  <Plug>(easymotion-linebackward)

let g:workman_normal_qwerty=1  " Map Workman to Qwerty in Normal mode
