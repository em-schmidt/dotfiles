set nocompatible
syntax enable

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

"status line
set laststatus=2
set ruler
set showcmd
set showmode

" line numbering
set number
set relativenumber

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
colorscheme solarized8

"netrw
let g:netrw_banner = 0
let g:netrw_listsytle = 3
let g:netrw_browse_split = 4
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


"airline
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

"update time (update git status faster)
set updatetime=250

"syntastic
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

let g:iced_enable_default_key_mappings = v:true
