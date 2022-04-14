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
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'benjie/local-npm-bin.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'lervag/vimtex'
Plug 'thinca/vim-fontzoom'
Plug 'brooth/far.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim'

call plug#end()


"CoC extensions
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-tslint-plugin',
    \ 'coc-pyright',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-yaml',
    \ 'coc-snippets',
    \ 'coc-lists',
    \ 'coc-css',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-git',
    \ 'coc-yank',
    \ 'coc-svg',
    \ 'coc-xml',
    \ 'coc-highlight',
    \ 'coc-vimtex',
\]


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
let g:airline_extensions = ['branch', 'hunks', 'coc']
let g:airline_skip_empty_sections = 1
let g:NERDTreeStatusline = ''


" Tagbar
map <Leader>t :TagbarToggle<CR>


" vimtex plugin
let g:vimtex_mappings_enabled = 1
let g:tex_flavor = 'latex'


" CoC plugin
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" Escape to close the floating windows - really annoying.
nmap <Esc> :call coc#float#close_all() <CR>
