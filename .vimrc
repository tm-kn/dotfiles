" Syntax
syntax on

" Default backspace behaviour
set backspace=2

" Clipboard
" Share clipboard with the OS
set clipboard=unnamedplus

" Paste mode so pastes better from other applications
set pastetoggle=<F2>

" Enable wildmenu
set wildmenu

" Map <Del> to delete to the black hole register
nnoremap <Del> "_d
nnoremap <Del><Del> "_dd
vnoremap <Del> "_d

" Enable mouse
set mouse=a

" Bind <Leader> key
let mapleader=","

" Save command to ctrl+z and <Leader>w
noremap <C-Z> :up<CR>
vnoremap <C-Z> <C-C>:up<CR>
inoremap <C-Z> <C-O>:up<CR>
map <Leader>w :up<CR>

" Close buffer
noremap <Leader>q :close<CR>

" Quit all buffers and disregard changes
noremap <Leader>Q :qa<CR>

" Set font for GVIM
set guifont=Monospace\ 11

" Navigate through tabs
map <Leader>n :tabprevious<CR>
map <Leader>m :tabnext<CR>

" Navigate through splits
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Spellcheck
" set spell spelllang=en_gb
map <Leader>s :set spell<CR>

" Allow moving to the previous/next line with arrows/H/L
set whichwrap+=<,>,h,l,[,]

" Reload files edited elsewhere
set autoread

" Disable folding
set nofoldenable

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Delete trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Line numbers and ruler
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

" History
set history=700
set undolevels=700

" Location
map <Leader>ll :lopen<CR>
map <leader>lc :lclose<CR>

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" YAML tabs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable search highlight
map <Leader>h :nohl<CR>:set nospell<CR>

" Search mapping
map <Leader>f /

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Mappings in the command mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <c-B> <left>
cnoremap <c-F> <right>

"Disable toolbar in GVIM
set guioptions-=T
set guioptions-=m

" Add seeral lines at the top and end of the view
set scrolloff=10

"
" plugins
"

" vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar' " apt install ctags
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rust-lang/rust.vim'

call vundle#end()

filetype plugin indent on

" NERDTree
nnoremap <Leader>g :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1 " Close NERDTree when opening a file
let NERDTreeAutoDeleteBuffer=1 " Close buffer if file has been delted with
                               " NERDTree
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" airline
set laststatus=2

" Ctrlp
let g:ctrlp_max_height=30
set wildignore+=*.pyc

" Ctrl to ignore .gitignore
let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f'
    \ ]

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

" Ack/The Silver Searcher
" Use The Sivler Searcher instead
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

map <Leader>F :Ack<space>

" Tagbar
map <Leader>t :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
