set nocompatible
set clipboard=unnamed
syntax enable

let g:mapleader = "\<Space>"
let g:maplocalleader = ','

set mouse=a

" Set tabs to 2 spaces
set si
set tabstop=2
set shiftwidth=2
set expandtab

" Show tabs
set list listchars=tab:›\ ,trail:∙

"filetype plugins
filetype indent plugin on

" autocomplete
set omnifunc=syntaxcomplete#Complete
set completeopt+=longest

" line numbering
set number
set relativenumber

set path+=**
set wildmenu

" search behavior
set ignorecase
set smartcase
set incsearch
set hlsearch

"block matching
set showmatch
set matchtime=3

" display styling
set tgc
set title
set titleold=""
set vb
set linebreak
colorscheme solarized8

"scrolling
set scrolloff=1
set sidescrolloff=5

"autoload external changes
set autoread

"persistent history
set history=10000
set viminfo+=!
set undofile
set undolevels=1000
set undoreload=10000

"window split defaults
set splitright
set splitbelow

" window navigation
noremap <Leader>ww <C-w>w
noremap <Leader>wr <C-w>r
noremap <Leader>wd <C-w>c
noremap <Leader>wq <C-w>q
noremap <Leader>wh <C-w>h
noremap <Leader>wj <C-w>j
noremap <Leader>wk <C-w>k
noremap <Leader>wl <C-w>l
noremap <Leader>wn <C-w>n
nnoremap <Leader>wH <C-W>5<
nnoremap <Leader>wL <C-W>5>
nnoremap <Leader>wJ :resize +5<CR>
nnoremap <Leader>wK :resize -5<CR>
nnoremap <Leader>w= <C-W>=
nnoremap <Leader>ws <C-W>s
nnoremap <Leader>w- <C-W>s
nnoremap <Leader>wv <C-W>v
nnoremap <Leader>w\| <C-W>v
nnoremap <Leader>w2 <C-W>v

if has('nvim') || has('terminal')
  tnoremap <Leader>wj <C-W>j
  tnoremap <Leader>wk <C-W>k
  tnoremap <Leader>wh <C-W>h
  tnoremap <Leader>wl <C-W>l
endif

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

"netrw
let g:netrw_banner = 0
let g:netrw_listsytle = 3
let g:netrw_altv = 1
let g:netrw_preview = 1
let g:netrw_winsize = 20
let g:netrw_isopen = 0

"make netrw explorer toggle nicer
function! ToggleVExplorer()
  if g:netrw_isopen
    let i = bufnr("$")
    while (i >= 1)
      if (getbufvar(i, "&filetype") == "netrw")
        silent exe "bwipeout " . i
      endif
      let i-=1
    endwhile
    let g:netrw_isopen = 0
  else
    let g:netrw_isopen = 1
    silent Lexplore
  endif
endfunction

noremap <silent> <C-E> :call ToggleVExplorer()<CR>

"terminals
if has('nvim')
  autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif
  noremap <Leader>t :belowright split <bar> resize 12 <bar> terminal<cr>
  noremap <Leader>T :tab terminal<cr>
else
  noremap <Leader>t :belowright term ++close<cr>
  noremap <Leader>T :tab term ++close<cr>
endif

"vim-clap settings
if !has('nvim')
  packadd! vim-clap
  autocmd FileType * hi ClapDefaultCurrentSelection ctermfg=224 guifg= #d19292 cterm=bold gui=bold
  "let g:clap_preview_direction = 'LR'
  "let g:clap_layout = { 'width': '59%', 'col': '50%' }
  noremap <Leader>p :Clap command<cr>
  noremap <Leader>f :Clap filer<cr>
  noremap <Leader>b :Clap buffers<cr>
endif

"update time (update git status faster)
set updatetime=250
set timeoutlen=500

"gitgutter 
let g:gitgutter_sign_priority=9

"syntastic
if !has('nvim')
  packadd! syntastic
  let g:syntastic_always_poplulate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_id_checkers = 1

  let g:syntastic_markdown_checkers = ["proselint"]
  let g:syntastic_javascript_checkers = ["eslint"]
  let g:syntastic_go_checkers = ["go"]
  let g:syntastic_json_checkers = ["jsonlint"]
  let g:syntastic_ruby_checkers = ["mri"]
endif

" markdown preview
let g:mkdp_auto_start = 1

" startify
let g:startify_custom_header = []

"status line
set laststatus=2
set ruler
set showcmd
set noshowmode
set background=light "TODO fix this so its automatic
let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }
