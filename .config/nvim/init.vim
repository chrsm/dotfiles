call plug#begin('~/.config/nvim/plugged')

" plugins {{{
	Plug 'justinmk/vim-dirvish'
	Plug 'sjl/gundo.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'talek/obvious-resize'
	Plug 'tpope/vim-eunuch'

	" git
	Plug 'tpope/vim-fugitive'
	Plug 'tommcdo/vim-fugitive-blame-ext'
	Plug 'gregsexton/gitv'


	" misc
	Plug 'rking/ag.vim'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'rhysd/committia.vim'

	Plug 'stephpy/vim-yaml'
	Plug 'vim-ruby/vim-ruby'
	Plug 'w0rp/ale'
	Plug 'posva/vim-vue'
	Plug 'HerringonDarkholme/yats.vim'

	Plug 'autozimu/LanguageClient-neovim', {
		\ 'branch': 'next',
		\ 'do': 'bash install.sh',
		\ }

	" golang
	Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
	Plug 'sebdah/vim-delve'

	" C++
	" Plug 'zchee/deoplete-clang'
	Plug 'rhysd/vim-clang-format'

	" rust
	Plug 'rust-lang/rust.vim'

	" colo
	Plug 'chrsm/vim-colors-paramount'
" }}}

call plug#end()

" vim settings {{{
	if &term == "xterm-256color"
		set termguicolors
	endif
	set nowrap
	set shell=/usr/bin/zsh
	set number
	set showmode
	set showcmd
	set textwidth=120
	set cmdheight=1
	set pumheight=10
	set noswapfile
	set hidden
	set clipboard=unnamedplus
	set lazyredraw
	set showmatch
	set matchtime=2
	set nostartofline
	set scrolloff=5
	set updatetime=1000
	set synmaxcol=160

	set splitbelow
	set splitright

	set notimeout
	set ttimeout
	set ttimeoutlen=10

	set ignorecase
	set smartcase
	set wrapscan
	set nohlsearch

	set backup
	set backupdir=~/.config/nvim/backups/
	set undofile
	set undodir=~/.config/nvim/undos/

	set mouse=a

	filetype plugin on
	filetype indent on
	syntax on

	set completeopt+=noinsert,noselect
	set completeopt-=preview

	let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

	set background=dark
	colo paramount
" }}}

" keymaps {{{
	let mapleader = ","
	nmap <space> ,
	nnoremap ; :
	nnoremap : ;
	nnoremap Y y$
	imap jj <esc>

	" switch to alternate file (split)
	map <C-j> <c-w>j
	map <C-k> <c-w>k
	map <C-l> <c-w>l
	map <C-h> <c-w>h

	" disable arrow keys
	noremap <Up> <NOP>
	noremap <Down> <NOP>
	noremap <Left> <NOP>
	noremap <Right> <NOP>

	" resize splits
	let g:obvious_resize_default = 2
	noremap <silent> <C-K> :ObviousResizeUp<CR>
	noremap <silent> <C-J> :ObviousResizeDown<CR>
	noremap <silent> <C-H> :ObviousResizeLeft<CR>
	noremap <silent> <C-L> :ObviousResizeRight<CR>

	" highlight last inserted text, via dougblack.io
	nmap gV `[v`]

	" leaders
	nnoremap <leader>w :w<CR>

	" CtrlP (+ag)
	nnoremap <leader>p :CtrlP<CR>
	nnoremap <leader>b :CtrlPBuffer<CR>
" }}}

" ale {{{
	let g:airline#extensions#ale#enabled = 1

	let g:ale_sign_error = '⤫'
	let g:ale_sign_warning = '⚠'

	let g:ale_linters = {
		\ 'rust': [ 'rustc' ],
		\ 'javascript': [],
		\ 'go': [ 'gometalinter', 'gofmt', 'staticcheck', 'go build', 'gosimple' ],
		\ }
" }}}

" languageclient / lsp {{{
	let g:LanguageClient_serverCommands = {
		\ 'cpp': [ 'clangd' ],
		\ 'go': [ 'go-langserver', '-gocodecompletion', '-func-snippet-enabled' ],
		\ 'rust': [ '~/.cargo/bin/rustup', 'run', 'stable', 'rls' ],
		\ }

	let g:LanguageClient_autoStart = 1
" }}}

" golang {{{
	let g:ale_go_gometalinter_enabled = 1

	let g:deoplete#sources#go#pointer = 1

	let g:go_debug = ['shell-commands']
	let g:go_code_completion_enabled = 0
	let g:go_fmt_command = "gofumports"
	let g:go_fmt_fail_silently = 1
	let g:go_highlight_build_constraints = 1
	let g:go_highlight_extra_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_types = 1
	let g:go_auto_type_info = 1

	" lol no generics
	autocmd BufNewFile,BufRead *.go_gen set syntax=go
" }}}

" c++ {{{
	" deoplete/c++ specific crap
	" let g:deoplete#sources#clang#std = {'c': 'c11', 'cpp': 'c++17', 'objc': 'c11', 'objcpp': 'c++1z'}
	
	let g:ale_cpp_clang_options = '-std=c++1z -Wall'
	let g:ale_cpp_gcc_options = '-std=c++1z -Wall'

	au FileType cpp setl ts=4 sw=4 expandtab

	let g:clang_format#code_style = 'llvm'
	let g:clang_format#auto_format = 1
	let g:clang_format#style_options = {
		\ "SortIncludes": "false" }
" }}}

" javascript {{{
	au FileType javascript setl ts=4 sw=4
" }}}

" deoplete {{{
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#enable_smart_case = 1
	let g:deoplete#disable_auto_complete = 0
	let g:deoplete#ignore_sources = {}
	let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']
	let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
	let g:deoplete#sources#go#align_class = 1

	call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
	call deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
	call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

	" Let <Tab> also do completion
	inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}

	" close doc window when completion is done
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}

" ag + ctrlp {{{
	set grepprg=ag\ --nogroup\ --nocolor
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.bin

	let g:ctrlp_custom_ignore = {
		\ 'dir': '\v[\/]\.(git|hg|svn)$',
		\ 'file': '\v\.(exe|so|dll|bin)$',
	\ }

	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
" }}}

" committia, vim-fugitive, etc {{{
	let g:committia_open_only_vim_starting = 1
" }}}

" rust {{{
	"let g:rustfmt_autosave = 1
	"let g:racer_cmd = '/home/c/.cargo/bin/racer'
	"let $RUST_SRC_PATH='/home/chrsm/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
	"let g:racer_experimental_completer = 1
	"let g:deoplete#sources#rust#racer_binary='/home/c/.cargo/bin/racer'
	"let g:deoplete#sources#rust#rust_source_path=$RUST_SRC_PATH
	"let g:deoplete#sources#rust#show_duplicates=0

	au FileType rust setl ts=4 sw=4 expandtab
" }}}

" ruby {{{
	au FileType ruby setl ts=2 sw=2 expandtab
" }}}

" lua {{{
	au FileType lua setl ts=2 sw=2 expandtab
" }}}

" typescript {{{
	let g:typescript_indent_disable = 1
	au BufWrite *.ts :Autoformat
" }}}
