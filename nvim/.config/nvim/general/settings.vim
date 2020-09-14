imap nj <Esc>| " Use 'nn' to exit insert mode

set number " Set interactive line numbering
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

set hidden
set undofile

set undofile

set splitbelow
set splitright

set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set showtabline=1                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set laststatus=0
set breakindent

let g:highlightedyank_highlight_duration = 100

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

" Change buffers
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Comment line or block
nnoremap <C-\> :Commentary<CR>
vnoremap <C-\> :Commentary<CR>

" Half page movement
nnoremap J <C-d>
nnoremap K <C-u>

" Set foldmethod to indent but fold manually
set foldmethod=indent
set foldlevelstart=99

" Used fro spelling <Leader>s enters spell menu, enter exits to normal mode
nnoremap <Leader>s ea<C-X><C-S>
inoremap <expr> <CR> pumvisible() ? "\<C-y><Esc>" : "\<CR>"

let g:workman_normal_qwerty = 1

let g:python3_host_prog = expand("/home/hal3e/miniconda3/envs/py3/bin/python3.7")

" Fzf settings
command! -nargs=* -complete=dir -bang F :Files
command! -nargs=* -complete=dir -bang H :History
