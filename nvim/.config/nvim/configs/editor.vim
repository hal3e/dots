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

" Fold settings
set foldmethod=indent
set foldlevelstart=99
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.vim,*.py,*.html,*.js,*.ts,*.rs mkview
  autocmd BufWinEnter *.vim,*.py,*.html,*.js,*.ts,*.rs loadview
augroup END

set noshowmode             " We don't need to see things like -- INSERT -- anymore
set timeoutlen=175         " By default timeoutlen is 1000 ms
set formatoptions-=cro     " Stop newline continuation of comments
set clipboard=unnamedplus  " Copy paste between vim and everything else
set laststatus=0           " Don't show status bar

" Split locations
set splitbelow
set splitright

" Delete current and all buffers
command! Bd execute 'bp | bd #' 
command! BD execute '%bd | Startify' 

let g:skim_layout = { 'down': '~40%' }

let g:highlightedyank_highlight_duration=150

let g:python3_host_prog = expand("/home/hal3e/bin/miniconda3/envs/py38/bin/python")

au! BufWritePost $MYVIMRC source %      " Source when writing to init.vm

" IindentLine configuration
let g:indentLine_char = '▏'
let g:indentLine_fileType = ['python',  'vue', 'rust', 'c', 'cpp', 'javascript', 'typescript', 'html', 'vim']

" Set spell for git commits 
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

let g:workman_normal_qwerty=1  " Map Workman to Qwerty in Normal mode
