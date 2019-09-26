call pathogen#infect()
call pathogen#helptags()

set number
set nocompatible

syntax on
syntax enable
set background=dark
" let g:solarized_termcolors=16
colorscheme jellybeans
" colorscheme base16-default

set display=lastline "Show as much as possible of a wrapped line"

" Get rid of pipeline symbols in split column and replace with a single bar
set fillchars+=vert:\ 
hi VertSplit ctermbg=234
hi LineNr ctermbg=233

let g:pathogen_disabled = ['vim-peepopen', 'repmo.vim', 'simplenote.vim']

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Otherwise backspace key doesn't work (for some reason)
set backspace=indent,eol,start

" Remap tab so that it toggles folds
nnoremap <silent> <Tab> @=(foldlevel('.')?'za':"\<Tab>")<CR>
vnoremap <Tab> zf

" Syntax checking on write
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options =' -std=c++11 -stdlib=libc++'
let g:syntastic_fortran_compiler = 'gfortran'
let g:syntastic_fortran_compiler_options = '-Wuninitialized'
let g:syntastic_enable_signs=0
let syntastic_enable_highlighting=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
highlight SyntasticError ctermbg=Red
highlight SyntasticError ctermbg=Red

" Limit location list height to the number of variables+1, or 5 if more than 4
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors) + 1, 5])
    endif
endfunction

" Map Alt-Q and Alt-E to next and previous buffer
nmap ∆ :bprevious<cr>
nmap ˚ :bnext<cr>

set mouse=a

" Patched default font for fancy powerline symbols
" set guifont="Courier New":h11
set guifont=Sauce\ Code\ Powerline:h12
" set guifont=Monaco:h12
set encoding=utf-8

" For some reason VimTex doesn't work with zsh properly, so use the Bash shell
set shell=/bin/bash

" The preferred method for tabs (in python)
set tabstop=4
set shiftwidth=4
set expandtab

set smartindent
set autoindent
set ignorecase
set smartcase
set showmatch
set smarttab
set incsearch
set shiftround
set hlsearch

set history=1000
set undolevels=1000
set wildignore=*.swp,.DS_Store,*.o,*.obj,*.mod
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
  highlight ColorColumn ctermbg=233
  highlight ColorColumn guibg=#121212
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"Abbreviations
" abbrev open :! open -a Google\ Chrome.app %:p<cr>

"Mappings
" inoremap jk <esc>
nmap ;w <ctrl>ww<cr>
nmap ;S :cd ~/Sites/
nmap <space> :
" nmap ;t :NERDTreeToggle<cr>
nmap ;rc <cr>:e $MYVIMRC<cr>
" imap § <esc>
nmap <silent> ;/ :nohlsearch<cr>
nmap ;g :GhciFile<cr>
" nmap w <ctrl>ww
nnoremap ;n :NumbersToggle<CR>
nmap ;s :mksession! session.vim<CR>
nmap ;l :so session.vim<CR>
nmap ;R :RainbowParenthesesToggle<cr>
nmap ;t :TagbarToggle<cr>

nnoremap <S-CR> O<Esc> nmap <CR> o<Esc>

" Switch windows using the Ctrl-h/j/k/l keys
nmap <silent> <C-K> :wincmd k<CR>
nmap <silent> <C-J> :wincmd j<CR>
nmap <silent> <C-H> :wincmd h<CR>
nmap <silent> <C-L> :wincmd l<CR>

" An alternative window switching mapping
" nmap <C-J> <C-W>j<C-W>_
" nmap <C-K> <C-W>k<C-W>_

"Source vimrc after saving it
" if has("autocmd")
" 	autocmd bufwritepost .vimrc source $MYVIMRC
" endif

"NERDTree settings
let NERDTreeShowHidden=1
set guioptions-=L

"Tweak Browser refresh
nmap ;r :w<cr>:RRB<cr>
let g:RefreshRunningBrowserDefault='chrome'
let g:RefreshRunningBrowserReturnFocus=0

" Move between buffers without writing
set hidden

" Treat wrapped lines as separate lines
nmap j gj
nmap k gk

"Map autoclose
" imap ( ()<left>
" imap { {}<left>

let g:md_pdf_viewer="open"

" Parse .txt files as markdown
autocmd BufRead,BufNewFile *.txt set ft=markdown

"Spell correction for .md and .txt files
" autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_gb
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_gb
autocmd BufNewFile,BufRead *.tex setlocal spell spelllang=en_gb

"Word wrapping for .md, .tex and .txt files
autocmd BufNewFile,BufRead *.tex setlocal wrap linebreak
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

" imap [ []<left>

" JSLint.vim
filetype plugin on

" Powerline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif
    let g:airline_symbols.space = "\ua0"

set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
set linespace=0

"Omnicompletion
set ofu=syntaxcomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Set tabs to two spaces for LaTeX and Fortran files
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2
autocmd FileType f90 setlocal shiftwidth=2 softtabstop=2

"Highlight current line
set cursorline

" System clipboard (supposedly.... actually just breaks vim registers)
" set clipboard=unnamedplus

"Change leader key to a comma
let mapleader = ','

" nmap <leader>q <leader>p
nnoremap <leader>q :CtrlPMixed<cr>
nnoremap <leader>. :CtrlPTag<cr>
" nnoremap <leader>. !ctags --recurse .

" Alt-j/k deletes blank line below/above
" nnoremap <silent><C-J> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" nnoremap <silent><C-K> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" LATEX + Rubber plugin
nnoremap <leader>c :w<CR>: !rubber --pdf --warn all %<cr><cr>
nnoremap <leader>v :!open -g %:r.pdf <CR><CR>

" Augment argumentative.vim to allow deleting comments
" nnoremap d, ?(\\|,<cr> x d/)\\|,<cr> :nohlsearch<cr>

" The default spellcheck highlighting is terrible in terminal...
if !has("gui_running")
    hi clear SpellBad
    hi SpellBad cterm=underline ctermfg=red
endif

" MacVim by default renders thick fonts for a retina display
if has("gui_running")
    set macthinstrokes on
endif

" Vimtex word count for LaTeX
let g:vimtex_latexmk_options="-pdf -pdflatex='pdflatex -file-line-error -shell-escape -synctex=1'"
nnoremap <leader>wc :VimtexCountWords<cr>
let g:vimtex_motion_matchparen = 0

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
