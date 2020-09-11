call plug#begin('~/.local/share/nvim/plugged')

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

  Plug 'ctrlpvim/ctrlp.vim'
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
  let g:livepreview_engine = 'xelatex'

  " Theme
  Plug 'NLKNguyen/papercolor-theme'
  " More contrast (color00 = bg, color05 = comments, color07 = text)
  let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.light': {
  \       'override' : {
  \         'color00' : ['#eeeeee', ''],
  \         'color05' : ['#555555', ''],
  \         'color07' : ['#111111', ''],
  \       }
  \     }
  \   }
  \ }

call plug#end()

" Buffers
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
set wrap
set linebreak
set mouse=a
set history=200
set scrolloff=5
set splitbelow
set nohlsearch
set termguicolors
set nojoinspaces
set formatoptions+=a

" Disable autocommenting on new lines
au FileType * set fo-=c fo-=r fo-=o

" Theme
" colorscheme molokai
" hi MatchParen cterm=bold ctermbg=none ctermfg=green
set background=light
colorscheme PaperColor
let g:airline_theme='papercolor'

" Navigation
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

filetype plugin indent on

map <F5> :setlocal spell! spelllang=en_gb<CR>

" Use defaults for css, javascript, ruby, eruby, clojure
set colorcolumn=81
set textwidth=80
set shiftwidth=2
set tabstop=2
set expandtab

" Override for
autocmd FileType java       setlocal sw=4 ts=4 noexpandtab
autocmd FileType haskell    setlocal sw=4 ts=4
autocmd FileType python     setlocal sw=4 ts=4
autocmd FileType markdown   setlocal sw=4 ts=4 cc=71 tw=70
autocmd FileType html       setlocal cc=120 tw=70

let g:tex_flavor = "latex"
autocmd FileType tex        setlocal cc=71 tw=70
