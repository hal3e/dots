if empty(glob('~/.config/nvim/autoload/plug.vim')) " Auto-install vim-plug
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'ap/vim-buftabline'
  Plug 'lotabout/skim'
  Plug 'lotabout/skim.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-commentary'    
  Plug 'jiangmiao/auto-pairs'
  Plug 'machakann/vim-highlightedyank'
  Plug 'airblade/vim-gitgutter'
  Plug 'nicwest/vim-workman'
  Plug 'easymotion/vim-easymotion'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'pangloss/vim-javascript'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mhinz/vim-startify', {'branch': 'center'}
call plug#end()
