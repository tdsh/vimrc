filetype off
filetype plugin indent off

"---------------------------------------------------------------
" release autogroup in MyAutoCmd
augroup MyAutoCmd
	autocmd!
augroup END

set ignorecase	" Ignore case when running search
set smartcase	" Identify case only when search characters include upper case
"set incsearch	" Incremental search
set hlsearch	" Highlight matched text in search
set listchars=eol:$,trail:-,nbsp:%	" Special characters of 'set list'

" Escape / and ? automatically
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

syntax on
autocmd BufWrite *.py :call Flake8()

"--------------------------------------------------------------------
" NeoBundle.vim
"--------------------------------------------------------------------
if has('vim_starting')
	" Run when vim starts up only
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'rails.vim'
NeoBundle 'python.vim'

NeoBundle 'vim-flake8'
let g:flake8_ignore = 'E265,E501'

NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\     'unix' : 'make -f make_unix.mak',
	\     },
	\ }

NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config={'*': {'split': 'vertical'}}

NeoBundle 'thinca/vim-template'
autocmd MyAutoCmd User plugin-template-loaded
	\   if search('<+CURSOR+>')
	\ |     silent! execute 'normal! "_da>'
	\ | endif

NeoBundle 'scrooloose/nerdtree'
nnoremap <f2> :NERDTreeToggle<CR>

NeoBundle 'terryma/vim-multiple-cursors'

filetype plugin indent on
