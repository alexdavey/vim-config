call pathogen#infect()
call pathogen#helptags()

set number
set nocompatible

syntax on
syntax enable
set background=dark
" let g:solarized_termcolors=16
colorscheme jellybeans

" Syntax checking on write
let g:syntastic_enable_signs=0
let g:syntastic_auto_loc_list=0
let syntastic_enable_highlighting=1

" set guifont="Courier New":h11
" Patched default font for fancy powerline symbols
set mouse=a
set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h12
set encoding=utf-8
set tabstop=4
set nosmartindent
set autoindent
set ignorecase
set smartcase
set showmatch
set smarttab
set incsearch
set shiftwidth=4
set shiftround
set hlsearch

set history=1000
set undolevels=1000
set wildignore=*.swp,.DS_Store
set visualbell
" set noerrorbells

set nobackup

"Autocompletion
set wildmode=list:longest
set foldenable
set splitbelow

let g:EasyMotion_leader_key = '<Leader>'

"Highlight over 80px
if exists('&colorcolumn')
  highlight ColorColumn ctermbg=Black
  highlight ColorColumn guibg=Black
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"Abbreviations
abbrev open :! open -a Google\ Chrome.app %:p<cr>

"Mappings
inoremap jk <esc>
nmap ;w <ctrl>ww<cr>
nmap ;S :cd ~/Sites/
nmap <space> :
" nmap ;t :NERDTreeToggle<cr>
nmap ;rc <cr>:e $MYVIMRC<cr>
imap § <esc>
nmap <silent> ;/ :nohlsearch<cr>
nmap ;g :GhciFile<cr>
" nmap w <ctrl>ww
nnoremap ;n :NumbersToggle<CR>
nmap ;s :mksession! session.vim<CR>
nmap ;l :so session.vim<CR>
nmap ;R :RainbowParenthesesToggle<cr>
nmap ;t :TagbarToggle<cr>
nmap <Leader>i ^df >>k$r,

" Switch windows using the Ctrl-h/j/k/l keys
nmap <silent> <C-K> :wincmd k<CR>
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-H> :wincmd h<CR>
nmap <silent> <C-L> :wincmd l<CR>

" An alternative window switching mapping
" nmap <C-J> <C-W>j<C-W>_
" nmap <C-K> <C-W>k<C-W>_

"Source vimrc after saving it
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

"NERDTree settings
let NERDTreeShowHidden=1
set guioptions-=L

"Tweak Browser refresh
nmap ;r :w<cr>:RRB<cr>
let g:RefreshRunningBrowserDefault='chrome'
let g:RefreshRunningBrowserReturnFocus=0

"Map autoclose
" imap ( ()<left>
" imap { {}<left>

"Spell correction for .md and .txt files
" autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_au
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_au

"Word wrapping for .md and .txt files
autocmd BufNewFile,BufRead *.txt setlocal wrap linebreak
autocmd BufNewFile,BufRead *.md setlocal wrap linebreak

"Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"Disable mouse
"set mouse=h

"Hide MacVim toolbar
if has("gui_running")
	set guioptions=egmrt
endif
imap [ []<left>

" JSLint.vim
filetype plugin on

" Powerline
set laststatus=2
let g:Powerline_symbols='fancy'

"Omnicompletion
set ofu=syntaxcomplete#Complete

" autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"Highlight current line
set cursorline

"Change leader key to a comma
let mapleader = ','

" nmap <leader>q <leader>p
nmap <leader>q :CtrlPMixed<cr>

" Alt-j/k deletes blank line below/above
" nnoremap <silent><C-J> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" nnoremap <silent><C-K> :set paste<CR>m`O<Esc>``:set nopaste<CR>