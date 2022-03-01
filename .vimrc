set nocompatible               " be iMproved
filetype off                   " required!

set background=dark

highlight Folded guibg=#222200 guifg=#cccccc
highlight FoldColumn guibg=#222200 guifg=#cccccc
set foldcolumn=5
set foldlevelstart=99

set enc=utf-8
set guioptions-=T
set guioptions-=L
set guioptions-=R
set wrapscan
set ignorecase
set number
set ruler
set incsearch
set nohls
set showcmd
set expandtab
set autoindent
set smartindent
set tabstop=4
set showmatch
set vb t_vb=
set shiftwidth=4
set backspace=indent,eol,start

map <C-PageUp> :tabp<CR>
map <C-PageDown> :tabn<CR>

map <D-M-Right> :tabn<CR>
map <D-M-Left> :tabp<CR>
imap <D-M-Right> <C-o>:tabn<CR>
imap <D-M-Left> <C-o>:tabp<CR>

