set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'ervandew/supertab'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'bufexplorer.zip'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
Bundle 'vim-coffee-script'
Bundle 'vim-javascript-syntax'
Bundle 'vim-stylus'
Bundle 'editorconfig-vim'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set background=dark
colorscheme deusx

highlight Folded guibg=#222200 guifg=#cccccc
highlight FoldColumn guibg=#222200 guifg=#cccccc
set foldcolumn=5
set foldlevelstart=99

set enc=utf-8
set guioptions-=T
"set guioptions-=l
"set guioptions-=r
set guioptions-=L
set guioptions-=R
set guifont=Inconsolata\ Medium\ 11
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
" vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

let NERDTreeIgnore=['\.pyc$']
let NERDTreeShowBookmarks=1

let g:treeExplVertical=1
let g:treeExplWinSize=50

let g:miniBufExplVSplit=30
let g:miniBufExplSplitBelow=0
let g:miniBufExplUseSingleClick = 0

let javaScript_fold=1

map <C-f> :FufFile<CR>
map <C-c> :FufDir<CR>
map <C-g> :FufBuffer<CR>
map <C-a> :BufExplorer<CR>

noremap <D-\> :NERDTreeToggle<CR>

noremap <Leader>][ :NERDTreeToggle<CR>
noremap <Leader>j :JSLintLight<CR>
noremap <Leader>J :JSLint<CR>

map <C-PageUp> :tabp<CR>
map <C-PageDown> :tabn<CR>

"FIXME: <D-w> should call gT only when a tab was closed 
map <D-w> :q<CR>gT
map <D-t> :tabnew<CR>
map <D-n> :new<CR>
map <D-S-t> :browse tabe<CR>
map <D-S-n> :browse split<CR>
map <D-]> :tabn<CR>
map <D-[> :tabp<CR>

map <D-M-Right> :tabn<CR>
map <D-M-Left> :tabp<CR>
imap <D-M-Right> <C-o>:tabn<CR>
imap <D-M-Left> <C-o>:tabp<CR>

au FileType javascript call JavaScriptFold()
