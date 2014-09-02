syntax on
filetype plugin indent on
set autoindent
set mouse=a
set nocompatible
autocmd vimenter * NERDTree
set number
execute pathogen#infect()
let g:nerdtree_tabs_open_on_console_startup=1
nnoremap \f :FufFile<CR>
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
nnoremap x "_x
vnoremap x "_x
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set backspace=indent,eol,start
colorscheme molokai
" I haven't found how to hide this function (yet)
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()
set shortmess+=A
map <F8> : !gcc % && ./a.out <CR>
map <F9> :w <CR>
imap so<Tab> System.out.println("");<Left><Left><Left>
