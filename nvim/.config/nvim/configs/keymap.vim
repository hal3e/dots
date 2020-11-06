imap nj <Esc>|                  " Use 'nn' to exit insert mode
nnoremap <Esc> :noh<CR>         " Clear search

" Movement keymaps
nnoremap J <C-d>                " Half page movement
nnoremap K <C-u>
nmap <leader>h  <C-w>h
nmap <leader>j  <C-w>j
nmap <leader>k  <C-w>k
nmap <leader>l  <C-w>l

" Used for spelling <Leader>s enters spell menu, enter exits to normal mode
nnoremap <Leader>s ea<C-X><C-S>
inoremap <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"

" Buffers keymaps
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader>b :Bd<CR>
nnoremap <leader>bb :BD<CR>

" Commentary keymaps
nnoremap <C-\> :Commentary<CR>
vnoremap <C-\> :Commentary<CR>


" Search keymaps
nnoremap <leader>a :History<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>c :History:<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Git fugitive keymaps
nnoremap <leader>g :G<CR>
nnoremap <leader>gl :Gllog<CR>
nnoremap <leader>gc :Commits<CR>


" Easymotion keymaps
nmap <leader>  <Plug>(easymotion-bd-f2)

let g:workman_normal_qwerty=1  " Map Workman to Qwerty in Normal mode

nmap <leader>e :CocCommand explorer --toggle --sources=file+ --file-root-template [root] --position right --width 30<CR>
