imap nj <Esc>|                  " Use 'nn' to exit insert mode
nnoremap <silent> <Esc> :noh<CR>         " Clear search

" Movement keymaps
nnoremap <C-p>  <C-o>
nnoremap J <C-d>                " Half page movement
nnoremap K <C-u>
nnoremap <C-y>  <C-w>h
nnoremap <C-n>  <C-w>j
nnoremap <C-e>  <C-w>k
nnoremap <C-o>  <C-w>l

" Used for spelling <Leader>s enters spell menu, enter exits to normal mode
nnoremap <Leader>s ea<C-X><C-S>
inoremap <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"

" Buffers keymaps
nnoremap <silent> <leader>b :Bd<CR>
nnoremap <silent> <leader>bb :BD<CR>
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" Commentary keymaps
nnoremap <silent> <C-\> :Commentary<CR>
vnoremap <silent> <C-\> :Commentary<CR>


" Search keymaps
nnoremap <silent> <leader>a :History<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>r :Rg<CR>
nnoremap <silent> <leader>c :History:<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>w :w<CR>
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

" Jupyter vim keymaps
nnoremap <silent> <leader>. :JupyterRunFile<CR>
nnoremap <silent> <leader>I :PythonImportThisFile<CR>
nnoremap <silent> <leader>d :JupyterCd %:p:h<CR>
nnoremap <silent> <leader>n :JupyterSendRange<CR>
nnoremap <silent> <leader>m :JupyterSendCell<CR>
nnoremap <silent> <leader>, <Plug>JupyterRunTextObj
vmap     <silent> <leader>. <Plug>JupyterRunVisual
nnoremap <silent> <leader>U :JupyterUpdateShell<CR>

nmap <silent> <leader>e :CocCommand explorer --toggle --sources=file+ --file-root-template [root] --position right --width 30<CR>
