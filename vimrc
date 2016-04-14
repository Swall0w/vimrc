"           2016/04/10  
"---------------------------------------------------
"   base setting
"---------------------------------------------------
set number
set title
set ignorecase
set smartcase
set ruler
set wildmenu
set ignorecase
set ruler
set autoindent
set nocompatible
set cursorline
set cursorcolumn
set laststatus=2
set helpheight=999
set wildmenu
set ambiwidth=double
set tabstop=4
set expandtab
set smarttab
"set clipboard=unamed,autoselect
set clipboard=unnamedplus
set encoding=utf-8
set shiftwidth=4
set smartindent
set list
set hidden
set history=50
set virtualedit=block

set showcmd
set cmdheight=2
set scrolloff=2

set showmatch
set matchtime=2

set nowrap
set textwidth=0
"--------------------------------
"       auto setting 
"--------------------------------
set hlsearch
nnoremap<ESC><ESC> :nohlsearch<CR>
"--------------------------------
"   KEY BIND Setting for default
"--------------------------------
nnoremap gs :vertical wincmd f<CR>
inoremap <silent> jj <ESC>                                  " jj for ESC 
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>          " Saving the file forcibly with typing :w!! 
" exchanging : for ; in normal mode
noremap : ;
noremap ; :

autocmd BufNewFile,BufRead *.py nnoremap <C-r> :!python %
"--------------------------------
"   KEY BIND Setting for plugins 
nnoremap <silent><C-e> :NERDTreeToggle<CR>                  " NerdTree  Crtl  + e
"------auto parenthesis----------
imap { {}<left>
imap [ []<left>
imap ( ()<left>

" directory where plugins are installed
let s:dein_dir = expand('~/.cache/dein')

" dein.vim 
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" if dein.vim are not installed, vim installs it automatically
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" setting begins
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	" TOML file contains plugin list

	" read TOML file and make cache.
	call dein#load_toml('~/.vim/rc/dein.toml',	{'lazy': 0})
	call dein#load_toml('~/.vim/rc/dein_lazy.toml',{'lazy': 1})

	"" TOML file contains plugin list
	"let s:toml	= g:dein_dir . '/rc/dein.toml'
	"let s:toml	= g:dein_dir . '/rc/dein_lazy.toml'

	"" read TOML file and make cache.
	"call dein#load_toml(s:toml,	{'lazy': 0})
	"call dein#load_toml(s:lazy_toml,{'lazy': 1})

	" setting ends
	call dein#end()
	call dein#save_state()
endif

"if there is a plugin that haven't been installed yet, dein begins installing it.
if dein#check_install()
	call dein#install()
endif

"---------------------------------------------------------------------
" Color Setting
"---------------------------------------------------------------------
" set 256 colors mode
set t_Co=256
" set background color
set background=dark
highlight clear Normal
colorscheme jellybeans
" syntax should be placed the last line on vimrc
syntax on
