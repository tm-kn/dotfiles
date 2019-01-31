syntax on

" Enable full colour support
if has('nvim')
    set termguicolors
endif

" Use light background
set background=light

" Encoding
set encoding=utf-8
set fileencoding=utf-8

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

" Open split at the right and bottom
set splitbelow
set splitright

" Enable mouse
set mouse=a

" Bind <Leader> key
let mapleader = ','
let maplocalleader = ','

" Save command to <Leader>w
noremap <Leader>w :update<CR>

" Close buffer
noremap <Leader>q :close<CR>

" Quit all buffers and disregard changes
noremap <Leader>Q :qa<CR>

" Set font for GVIM
set guifont=Source\ Code\ Pro\ 13

" Navigate through tabs
map <Leader>n :tabprevious<CR>
map <Leader>m :tabnext<CR>

" Allow navigating through soft wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Spellcheck
set spelllang=en_gb
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
set textwidth=79
set nowrap
set formatoptions-=t
set colorcolumn=80
highlight ColorColumn ctermbg=253 guibg=lightgray

" History
set history=700
set undolevels=700

" Location
map <leader>lc :lclose<CR>

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Enable spellcheck in text files
autocmd FileType txt,rst,md,tex setlocal spell

" Enable wrapping in tex
autocmd FileType tex setlocal linebreak wrap

" YAML tabs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Javascript tabs
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable search highlight
map <Leader>h :nohl<CR>:set nospell<CR>

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

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'benjie/local-npm-bin.vim'
Plug 'sbdchd/neoformat'

" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar' " apt install ctags
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'thinca/vim-fontzoom'

call plug#end()

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
let g:ctrlp_user_command = [ '.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f' ]

" Neomake
call neomake#configure#automake('nrwi', 500)
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']

" Ack/The Silver Searcher
" Use The Sivler Searcher instead
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Tagbar
map <Leader>t :TagbarToggle<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Goyo plugin makes text more readable when writing prose:
map <F10> :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a

" vimtex plugin
let g:vimtex_mappings_enabled = 1
