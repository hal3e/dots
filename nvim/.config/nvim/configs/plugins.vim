if empty(glob('~/.config/nvim/autoload/plug.vim')) " Auto-install vim-plug
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'pangloss/vim-javascript'
  Plug 'joshdick/onedark.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'ap/vim-buftabline'
  Plug 'lotabout/skim'
  Plug 'lotabout/skim.vim'
  " Plug 'junegunn/fzf'
  " Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'    
  Plug 'jiangmiao/auto-pairs'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'machakann/vim-highlightedyank'
  Plug 'airblade/vim-gitgutter'
  Plug 'nicwest/vim-workman'
  Plug 'mhinz/vim-startify', {'branch': 'center'}
  Plug 'easymotion/vim-easymotion'
  Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
