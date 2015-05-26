set termencoding=utf-8
set background=dark
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'fugitive.vim'
Plugin 'godlygeek/csapprox'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'mattn/emmet-vim' 
Plugin 'elzr/vim-json'
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
colorscheme desert
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript  setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 noexpandtab
set t_Co=256
let &t_Co=256