let mapleader = ' '

" Write with privileges 
cmap w!! w !sudo tee %

" Used with zt not to scroll to the top
set scrolloff=5

" Live substitution
set inccommand=nosplit

" Set interactive line numbering
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" History for files
set hidden
set undofile

" set spell

set tabstop=2              " Insert 2 spaces for a tab
set shiftwidth=2           " Change the number of space characters inserted for indentation
set smarttab               " Makes tabbing smarter will realize you have 2 vs 4
set expandtab              " Converts tabs to spaces
set smartindent            " Makes indenting smart
set autoindent             " Good auto indent
set breakindent            " Indent as line before

set foldmethod=indent
set foldlevelstart=99      "Fold manually

set noshowmode             " We don't need to see things like -- INSERT -- anymore
set timeoutlen=175         " By default timeoutlen is 1000 ms
set formatoptions-=cro     " Stop newline continuation of comments
set clipboard=unnamedplus  " Copy paste between vim and everything else
set laststatus=0           " Don't show status bar

" Split locations
set splitbelow
set splitright

" Search commands
command! -nargs=* -complete=dir -bang F :Files <args>
command! H :History
command! Bd execute 'bp | bd #'| " Delete buffer
command! BD execute '%bd | Startify'| " Delete all buffers

let g:fzf_layout = { 'down': '~40%' }

command! -bang -nargs=? -complete=dir F
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:highlightedyank_highlight_duration=150

let g:python3_host_prog = expand("/home/hal3e/miniconda3/envs/py3/bin/python3.7")

au! BufWritePost $MYVIMRC source %      " Source when writing to init.vm
