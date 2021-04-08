call plug#begin('~/.config/nvim/plugged')


" plugins {{{
	Plug 'justinmk/vim-dirvish'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-eunuch'

	" git
	"Plug 'tpope/vim-fugitive'
	"Plug 'tommcdo/vim-fugitive-blame-ext'
	"Plug 'gregsexton/gitv', { 'on': ['Gitv'] }
	"Plug 'airblade/vim-gitgutter'
	Plug 'TimUntersberger/neogit'
	Plug 'rhysd/committia.vim'
	
	" better in-fn context
	"Plug 'wellle/context.vim'

	" treesitter is a parser improvement thign
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }
	" :TSInstall bash
	" :TSInstall c
	" :TSInstall cpp
	" :TSInstall go
	" :TSInstall lua
	" :TSInstall rust
	" :TSInstall json
	" :TSInstall vue
	" :TSInstall jsonc
	" :TSInstall php
	" :TSInstall yaml
	" :TSInstall javascript
	
	" lintin'
	Plug 'dense-analysis/ale'

	" lsp stuff, 0.5+
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'
	Plug 'nvim-lua/lsp-status.nvim'
	Plug 'nvim-lua/diagnostic-nvim'
	Plug 'sbdchd/neoformat'

	" telescopic!
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

	" golang
	"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
	" Plug 'zchee/deoplete-go', { 'do': 'make' }
	" Plug 'sebdah/vim-delve'

	" C++
	" Plug 'zchee/deoplete-clang'
	"Plug 'rhysd/vim-clang-format'

	" php
	" Plug 'StanAngeloff/php.vim'

	" rust
	"Plug 'rust-lang/rust.vim'
	"Plug 'racer-rust/vim-racer'
	" Plug 'sebastianmarkow/deoplete-rust'

	" colo
	Plug 'chrsm/vim-colors-paramount'
" }}}

call plug#end()

lua require('init')

lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { --[[ "javascript"]] }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { --[["c", "rust"]] },  -- list of language that will be disabled
  },
}
EOF

" vim settings {{{
	set nowrap
	" set shell=/usr/bin/zsh
	set number
	set showmode
	set showcmd
	set textwidth=120
	set cmdheight=1
	set pumheight=10
	set noswapfile
	set hidden
	set clipboard+=unnamedplus
	set lazyredraw
	set showmatch
	set matchtime=2
	set nostartofline
	set scrolloff=5
	set updatetime=1000
	set synmaxcol=5000

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

	"set completeopt+=noinsert,noselect
	"set completeopt-=preview
	set updatetime=300
	set completeopt=menuone
	set completeopt+=noinsert
	set completeopt-=preview
	set shortmess+=c

	set background=dark
	set termguicolors
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

	nnoremap <leader>w :w<CR>
	nnoremap <leader>g :Neogit<CR>

	" tab, shift-tab
	inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	" CtrlP (+ag)
	"nnoremap <leader>p :CtrlP<CR>
	"nnoremap <leader>b :CtrlPBuffer<CR>
" }}}

" general conf {{{
	let g:committia_open_only_vim_starting = 1

	let g:airline#extensions#ale#enabled = 1
	let g:ale_sign_error = '⤫'
	let g:ale_sign_warning = '⚠'
	let g:ale_linters = {
		\ 'rust': [ 'rustc' ],
		\ 'javascript': [],
		\ 'go': ['gopls'],
		\ }

	" telescope
	nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
	nnoremap <leader>p <cmd>lua require('telescope.builtin').find_files()<cr>
	nnoremap <leader>lg <cmd>lua require('telescope.builtin').live_grep()<cr>
" }}}

" language-specific {{{
" golang
	let g:ale_go_gometalinter_enabled = 1

	" TODO: find replacements?
	let g:go_fmt_command = "goimports"
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
	let g:go_code_completion_enabled = 0

	let g:deoplete#sources#go#pointer = 1

	" lol no generics
	autocmd BufNewFile,BufRead *.go_gen set syntax=go

" c++
	let g:ale_cpp_clang_options = '-std=c++1z -Wall'
	let g:ale_cpp_gcc_options = '-std=c++1z -Wall'

	au FileType cpp setl ts=4 sw=4 expandtab

	let g:clang_format#code_style = 'llvm'
	let g:clang_format#auto_format = 1

" javascript
	au FileType javascript setl ts=4 sw=4

" lua
	au FileType lua setl ts=2 sw=2 expandtab

" rust
	au FileType rust setl ts=4 sw=4 expandtab

" ruby
	au FileType ruby setl ts=2 sw=2 expandtab

" }}}
