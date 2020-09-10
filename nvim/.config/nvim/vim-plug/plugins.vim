" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'joshdick/onedark.vim'
    Plug 'ap/vim-buftabline'
    Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
    Plug 'lotabout/skim.vim'
    Plug 'tpope/vim-commentary'    
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'machakann/vim-highlightedyank'
    Plug 'norcalli/nvim-colorizer.lua'

call plug#end()
