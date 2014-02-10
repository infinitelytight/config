syntax on
filetype plugin indent on
set autoindent
set mouse=a
set nocompatible
autocmd vimenter * NERDTree
set number
execute pathogen#infect()
let g:nerdtree_tabs_open_on_console_startup=1
set backupdir=~/.tmp
set swapfile
set dir=~/.tmp
set completeopt-=preview
map i <Up>
map j <Left>
map k <Down>
noremap h i
set smartindent
nnoremap d "_d
vnoremap d "_d
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
