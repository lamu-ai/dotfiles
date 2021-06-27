" vim-plug {{{

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'lamu-ai/lamu.vim'
call plug#end()

" }}}

" coc.nvim {{{

let g:coc_global_extensions = ['coc-clangd', 'coc-css', 'coc-cssmodules', 'coc-discord-rpc', 'coc-fzf-preview', 'coc-html', 'coc-java', 'coc-jedi', 'coc-json', 'coc-omnisharp', 'coc-snippets', 'coc-sql', 'coc-tsserver', 'coc-xml', 'coc-yaml']
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" }}}

" General {{{

set background=dark
set tabstop=2
set shiftwidth=2
set expandtab
set number
set t_Co=256
set termguicolors
syntax on

au BufNewFile,BufRead /*.rasi setf css

" }}}

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

colorscheme lamu

