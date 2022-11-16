filetype plugin indent on
syntax on

" save file on make
set autowrite

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

" Disable mouse
set mouse=

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
set spell
map <Leader>s :setlocal spell<CR>
map <Leader>ss :setlocal nospell<CR>

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

" History
set history=700
set undolevels=700

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smartindent
set expandtab

" Textual files
autocmd FileType markdown set conceallevel=2
autocmd FileType tex,markdown setlocal linebreak wrap

" Set filetype for TSX files
autocmd BufNewFile,BufRead *.tsx setfiletype typescript.jsx

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable search highlight
map <Leader>h :nohl<CR>

" TextEdit might fail if hidden is not set.
set hidden

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" always show signcolumns
set signcolumn=yes

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Better display for messages
set cmdheight=2

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

" vim-plug
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'lervag/vimtex'
Plug 'thinca/vim-fontzoom'
Plug 'brooth/far.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim'
Plug 'hashivim/vim-terraform'

call plug#end()



" colorscheme
set background=light
set termguicolors


" FZF - Fuzzy finder
map <C-p> :GFiles<cr>
map <C-s> :Buffers<cr>

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1


" NERDTree
nnoremap <Leader>v :NERDTreeToggle<Enter>
nnoremap <Leader>vv :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1 " Close NERDTree when opening a file
let NERDTreeAutoDeleteBuffer=1 " Close buffer if file has been delted with
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize=60


" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Open commands list
nmap <leader>c :<C-u>CocList commands<cr>

" airline
set laststatus=2
let g:airline_skip_empty_sections = 1
let g:NERDTreeStatusline = ''


" Tagbar
map <Leader>t :TagbarToggle<CR>


" vimtex plugin
let g:vimtex_mappings_enabled = 1
let g:tex_flavor = 'latex'
