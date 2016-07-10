" The basics...
set nocompatible
filetype on
filetype off

" Package manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" More packages go here:
Plugin 'edsono/vim-matchit'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
Plugin 'mileszs/ack.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/VimClojure'
Plugin 'bling/vim-airline'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mbbill/undotree'
Plugin 'groenewege/vim-less'
Plugin 'rodjek/vim-puppet'
Plugin 'wting/rust.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'plasticboy/vim-markdown'
Plugin 'skammer/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'

call vundle#end()
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
set list listchars=tab:»·,trail:·,precedes:·
set colorcolumn=80

" Colors of the rainbow and appearance
syntax on
colorscheme onedark

set background=dark
hi ColorColumn guibg=gray13
hi CursorLine guibg=gray13
" I hateses the white bg/red fg
hi PreProc guifg=salmon guibg=grey15 ctermfg=red

" Don't insert a comment after CR
set formatoptions-=r

" set guifont=Inconsolata\ for\ Powerline:h16
set guifont=Anonymous\ Pro:h16
" let g:airline_powerline_fonts = 1
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

set wildignore+=.hg,.git,.svn,.servo,.cargo,vendor,log,tmp,doc,lib
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.jar,*.o,*.obj,*.exe,*.dll,*.manifest,*.class
set wildignore+=*.sw?
set wildignore+=*.DS_Store
set wildignore+=*.pyc
set wildignore+=tmp
set wildignore+=sass-cache
set wildignore+=*.gz
set wildignore+=node_modules
set wildignore+=site

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
autocmd BufRead *.cljx set filetype=clojure

" Abbreviations (yes, I went there)
iabbrev ldis ಠ_ಠ

" Custom commands
command Tidy :exec ":%! tidy -xml -i -q"

" Automatically re-index the current directory for fuzzy search on saving a
" buffer
autocmd BufWritePost * :CtrlPClearAllCaches
