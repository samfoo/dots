" The basics...
set nocompatible
filetype on
filetype off

" Package manager
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" More packages go here:
Bundle 'edsono/vim-matchit'
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-rails'
Bundle 'mileszs/ack.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/VimClojure'
Bundle 'bling/vim-airline'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'mbbill/undotree'
Bundle 'groenewege/vim-less'
Bundle 'rodjek/vim-puppet'

filetype plugin indent on

let mapleader = "\\"

set noswapfile
set encoding=utf-8
set autoindent
" set cursorline
set ttyfast
set ruler
set number
set lazyredraw
set nobackup

" Tabs, spaces, wrapping (oh my!)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set nowrap
set textwidth=0
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
set list listchars=tab:»·,trail:·
set colorcolumn=80

" Colors of the rainbow and appearance
syntax on
colorscheme flat

set background=dark
hi ColorColumn guibg=gray13
hi CursorLine guibg=gray13
" I hateses the white bg/red fg
hi PreProc guifg=salmon guibg=grey15 ctermfg=red

" Don't insert a comment after CR
set formatoptions-=r

set guifont=Inconsolata\ for\ Powerline:h16
let g:airline_powerline_fonts = 1
" Hide the toolbar in macvim
if has("gui_running")
    set guioptions=egmrt
endif

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
noremap <C-N> <Esc>:noh<CR>

noremap <c-s> <Esc>:vsp<CR>
noremap <c-d> <Esc>:sp<CR>

" Buffers
noremap <C-l> <Esc>:CtrlPBuffer<CR>

" Fuzzy file finder
noremap <Leader>r <Esc>:CtrlPClearAllCaches<CR>

" Movement
set scrolloff=3
set sidescrolloff=5
" j and k should both behave with wrapped lines. 
noremap j gj
noremap k gk

" Annoying commands are annoying
nnoremap K <nop>

set laststatus=2
set esckeys

" So many files to ignore...
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.jar,*.o,*.obj,*.exe,*.dll,*.manifest,*.class
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=*.pyc
set wildignore+=tmp
set wildignore+=sass-cache
set wildignore+=*.gz
set wildignore+=node_modules

" Rainbow parens are pretty
" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces


" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

autocmd BufRead *.rhtml set filetype=eruby
autocmd BufRead *.ru set filetype=ruby
autocmd BufRead *.erb set filetype=eruby
autocmd BufRead *.jbuilder set filetype=ruby
autocmd BufRead *.pc set filetype=c

" Abbreviations (yes, I went there)
iabbrev ldis ಠ_ಠ

" Custom commands
command Tidy :exec ":%! tidy -xml -i -q"

" Automatically re-index the current directory for fuzzy search on saving a
" buffer
autocmd BufWritePost * :CtrlPClearAllCaches
