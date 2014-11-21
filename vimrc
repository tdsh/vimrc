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
set diffopt=vertical

" Escape / and ? automatically
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

syntax on
autocmd BufWrite *.py :call Flake8()

" cscope settings
if has('cscope') && filereadable('/usr/bin/cscope')
   nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
   nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
   nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
   nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
   nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
   nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
   nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
   nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

   nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
   nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
   nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

   nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
   nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
   nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
   nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

"--------------------------------------------------------------------
" NeoBundle.vim
"--------------------------------------------------------------------
if has('vim_starting')
	" Run when vim starts up only
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	call neobundle#end()
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

" Markdown Preview
" <F7> to preview
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'kannokanno/previm'
NeoBundle 'kana/vim-submode'

augroup PrevimSettings
	autocmd!
	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" Use chrome.
let g:previm_open_cmd = 'google-chrome --user-data-dir --new-window'

nnoremap <silent> <F7> :PrevimOpen<CR>

" vim-markdown
NeoBundle 'godlygeek/tabular'
NeoBundle 'rcmdnk/vim-markdown'

nnoremap <silent> <Space>f :set foldenable
nnoremap <silent> <Space>w :set nofoldenable

NeoBundle 'ConradIrwin/vim-bracketed-paste'

" This must be the end.
filetype plugin indent on
