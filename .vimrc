syntax on
filetype plugin indent on
execute pathogen#infect()
set autoindent
set autoread
set mouse=a
set nocompatible
set number
set backupdir=~/.tmp
set swapfile
set dir=~/.tmp
set smartindent
set wildmenu
set history=50
map i <Up>
map j <Left>
map k <Down>
noremap h i
nnoremap d "_d
vnoremap d "_d
nnoremap x "_x
vnoremap x "_x
nnoremap s "_s
vnoremap s "_s
inoremap <C-l> <Del>
set shortmess+=A
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set backspace=indent,eol,start
set incsearch
set scrolloff=3
set guioptions=aegimt
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.html.erb set ts=2 sts=2 sw=2 expandtab

colorscheme molokai 
set listchars=tab:\|\ 
set list

" Use buffers as tabs
set hidden
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
noremap gt :bnext<ENTER>
noremap gT :bprevious<ENTER>
cnoreabbrev W w
cnoreabbrev Q bd
cnoreabbrev q bd

" Switch cursor based on mode
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

map <C-n> :NERDTreeToggle<CR>

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

" You complete me
"let g:loaded_youcompleteme = 1
"let g:ycm_filetype_blacklist = { 'ruby' : 1, 'eruby' : 1 }
"let g:ycm_min_num_identifier_candidate_chars = 6

