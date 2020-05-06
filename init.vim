call plug#begin('~/.local/share/nvim/plugged')

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

  Plug 'ctrlpvim/ctrlp.vim'
  " Open ctrl-p files in new tabs
  let g:ctrlp_prompt_mappings = {
     \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
     \ 'AcceptSelection("t")': ['<cr>'],
     \ }
  let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg)$',
  \ 'file': '\v\.(class|dll)$',
  \ }

  Plug 'scrooloose/nerdtree'
  function! ToggleNERDTreeFind()
      if g:NERDTree.IsOpen()
          execute ':NERDTreeClose'
      elseif bufname("%") == ""
          execute ':NERDTreeToggle'
      else
          execute ':NERDTreeFind'
      endif
  endfunction
  nnoremap <silent> <C-n> :call ToggleNERDTreeFind()<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " Open NERDTree in new tabs
  autocmd BufWinEnter * NERDTreeMirror

  " TODO In the previous tab refocus the cursor to the buffer

  Plug 'Valloric/YouCompleteMe'
  let g:ycm_autoclose_preview_window_after_completion = 1

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

  " Expand snippets with enter key
  let g:UltiSnipsExpandTrigger="<nop>"
  let g:ulti_expand_or_jump_res = 0
  function! <SID>ExpandSnippetOrReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
      return snippet
    else
      return "\<CR>"
    endif
  endfunction
  inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

  " Java
  Plug 'dansomething/vim-eclim'

  " Clojure
  Plug 'tpope/vim-fireplace'

  " R
  Plug 'jalvesaq/Nvim-R'
  let g:R_assign = 0

  " Haskell
  Plug 'neovimhaskell/haskell-vim'

  " Latex
  Plug 'xuhdev/vim-latex-live-preview'

  " Theme
  Plug 'NLKNguyen/papercolor-theme'

  map ]] <Esc>:w<CR>:!runghc %:p<CR>
call plug#end()

set hidden
map gb :bnext<cr>
map gB :bprevious<cr>
cnoreabbrev W w
cnoreabbrev Q bd
cnoreabbrev q bd

" Display
set list
set listchars=tab:│\ ,extends:›,precedes:‹,trail:·
set autoread
set number
set colorcolumn=81
set textwidth=80
set wrap
set linebreak
set mouse=a
set history=200
set scrolloff=5
set splitbelow
set nohlsearch
set termguicolors
au FileType * set fo-=c fo-=r fo-=o

" Theme
" colorscheme molokai
" hi MatchParen cterm=bold ctermbg=none ctermfg=green
set background=light
colorscheme PaperColor
let g:airline_theme='papercolor'

map i <Up>
map j <Left>
map k <Down>
noremap h i
" noremap G Gzz

" Don't overwrite register when pasting
nnoremap d "_d
vnoremap d "_d
nnoremap x "_x
vnoremap x "_x
nnoremap s "_s
vnoremap s "_s
xnoremap p "_dP

" Spell check shortcut
map <F5> :setlocal spell! spelllang=en_gb<CR>

filetype plugin indent on
                                 set sw=2 ts=2 et

autocmd FileType java       setlocal sw=4 ts=4 noexpandtab
autocmd FileType haskell    setlocal sw=4 ts=4 et
autocmd FileType python     setlocal sw=4 ts=4 et
autocmd FileType html       setlocal sw=2 ts=2 et cc=120

" Default
" autocmd FileType css        setlocal sw=2 ts=2 et
" autocmd FileType javascript setlocal sw=2 ts=2 et
" autocmd FileType ruby       setlocal sw=2 ts=2 et
" autocmd FileType eruby      setlocal sw=2 ts=2 et
" autocmd FileType clojure    setlocal sw=2 ts=2 et

let g:tex_flavor = "latex"
autocmd FileType tex        setlocal sw=2 ts=2 et cc=71 tw=70
