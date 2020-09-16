set number                 " Set interactive line numbering
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

set hidden                 " History for files
set undofile

set spell

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
set timeoutlen=300         " By default timeoutlen is 1000 ms
set formatoptions-=cro     " Stop newline continuation of comments
set clipboard=unnamedplus  " Copy paste between vim and everything else
set laststatus=0           " Don't show status bar

set splitbelow             " Split locations
set splitright

" Search commands
command! -nargs=* -complete=dir -bang F :Files <args>
command! H :History
command! Bd execute '%bd | Startify'| " Delete all buffers

let s:a=getcwd()
let g:fzf_layout = { 'down': '~40%' }
command! -bang -nargs=* Prg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': '/mnt/c/Users/u17g69/Desktop/halil/adas-ph/code/osiviz/frontend/'}), <bang>0)

let g:highlightedyank_highlight_duration=150

let g:python3_host_prog = expand("/home/hal3e/miniconda3/envs/py3/bin/python3.7")

au! BufWritePost $MYVIMRC source %      " Source when writing to init.vm
