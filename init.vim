call plug#begin('~/.local/share/nvim/plugged')

  Plug 'vim-airline/vim-airline'
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

  " map ]] :%Eval<cr>
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
set colorcolumn=80
set mouse=a
set history=100
set scrolloff=3
set splitbelow
set nohlsearch
set termguicolors

colorscheme molokai 
hi MatchParen cterm=bold ctermbg=none ctermfg=green

map i <Up>
map j <Left>
map k <Down>
noremap h i

" Don't overwrite register when pasting
nnoremap d "_d
vnoremap d "_d
nnoremap x "_x
vnoremap x "_x
nnoremap s "_s
vnoremap s "_s
xnoremap p "_dP

filetype plugin indent on
                                 set shiftwidth=2 tabstop=2 expandtab
autocmd FileType java       setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType python     setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType html       setlocal shiftwidth=2 tabstop=2 expandtab colorcolumn=120
autocmd FileType css        setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType ruby       setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType eruby      setlocal shiftwidth=2 tabstop=2 expandtab
