let s:editor_root=expand('~/.config/nvim/')

" Stuff for Plug
set nocompatible
filetype off
call plug#begin(s:editor_root . 'plugged')

" Utilities
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color'
Plug 'sbdchd/neoformat'

" Autocomplete 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'ternjs/tern_for_vim', { 'do': 'yarn' }
Plug 'zchee/deoplete-jedi'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'tweekmonster/deoplete-clang2'

" Language support
Plug 'digitaltoad/vim-pug'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()
filetype plugin indent on

" Editorconfig config
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Auto reload files
set autoread

" vim-go config
" Don't auto-update go tools with :GoInstallBinaries
let g:go_get_update = 0 

" JS config
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern#filetypes = [
                \ 'jsx',
                \ 'js',
                \ 'es6',
                \ ]
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
autocmd FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2


" Neoformat configs - format on save
let g:neoformat_javascript_prettier = {
			\'args': ['--single-quote', '--print-width 100', '--bracket-spacing false'],
			\'exe': 'prettier',
			\ }

let g:neoformat_css_prettier = {
			\'args': ['--parser css', '--single-quote', '--print-width 100', '--bracket-spacing false'],
			\'exe': 'prettier',
			\ }

let g:neoformat_scss_prettier = {
			\'args': ['--parser css', '--single-quote', '--print-width 100', '--bracket-spacing false'],
			\'exe': 'prettier',
			\ }

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_only_msg_on_error = 1
augroup fmt
  autocmd!
  autocmd BufWritePre * | Neoformat
augroup END

" Java config
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Airline config
let g:airline_powerline_fonts=1

" Set crtlp to find dotfiles
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build|CMakeFiles)|(\.(swp|ico|git|svn|DS_Store))$'

" Completions config
let g:deoplete#enable_at_startup = 1
autocmd FileType .java let g:deoplete#auto_complete_delay=1000
set completeopt-=preview
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Set tabs as \t and 4 spaces wide
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" TTY config
set ttyfast
set mouse=a

" Enable numbering
set number

" Fix vim for webpack watcher
set backupcopy=yes
