filetype plugin indent on
syntax on

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
set spell
map <Leader>s :set spell<CR>
map <Leader>ss :set nospell<CR>

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

" Refresh CtrlP and NERDTree
map <leader>r :CtrlPClearCache<CR>:NERDTreeRefreshRoot<CR>

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smartindent
set expandtab

" Enable spellcheck in text files
autocmd FileType txt,rst,md,tex setlocal spell

" Enable wrapping in tex
autocmd FileType tex setlocal linebreak wrap

" YAML tabs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Javascript tabs
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab

" Set filetype for TSX files
autocmd BufNewFile,BufRead *.tsx setfiletype typescript.jsx

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable search highlight
map <Leader>h :nohl<CR>

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

"
" plugins
"

" vim-plug
call plug#begin('~/.vim/plugged')

"Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'benjie/local-npm-bin.vim'
Plug 'sbdchd/neoformat'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'editorconfig/editorconfig-vim'

Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
Plug 'thinca/vim-fontzoom'
Plug 'rhysd/vim-grammarous'
Plug 'danielwe/base16-vim'

"CoC extensions
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}


call plug#end()

" colorscheme
"
let base16colorspace=256
set background=light
colorscheme base16-google-light


" NERDTree
nnoremap <Leader>v :NERDTreeToggle<Enter>
nnoremap <Leader>vv :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1 " Close NERDTree when opening a file
let NERDTreeAutoDeleteBuffer=1 " Close buffer if file has been delted with
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" CoC
set updatetime=400

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Open commands list
nmap <leader>c :<C-u>CocList commands<cr>


" airline
set laststatus=2
"let g:airline_extensions = ['branch', 'hunks', 'coc']
let g:airline_skip_empty_sections = 1
let g:NERDTreeStatusline = ''


" Ctrlp
let g:ctrlp_max_height=30
set wildignore+=*.pyc


" Ctrl to ignore .gitignore
let g:ctrlp_user_command = [ '.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f' ]


" Neomake
"call neomake#configure#automake('nrwi', 500)
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']

" Disable LaTeX checkers since vimtex is used to compile on the fly.
let g:neomake_tex_enabled_makers = []


" Ack/The Silver Searcher
" Use The Silver Searcher instead Ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif


" Tagbar
map <Leader>t :TagbarToggle<CR>


" Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 0


" Goyo plugin makes text more readable when writing prose:
map <F10> :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a


" vimtex plugin
let g:vimtex_mappings_enabled = 1


" CoC plugin
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
