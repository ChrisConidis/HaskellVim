" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012

" ============================================
" Note to myself:
" DO NOT USE <C-z> FOR SAVING WHEN PRESENTING!
" ============================================

set nocompatible
filetype plugin on
filetype indent on

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" py3 import sys

" Better copy & paste

" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed
set wildmode=longest,list,full
set wildmenu

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-X> :update<CR>
vnoremap <C-X> <C-C>:update<CR>
inoremap <C-X> <Esc>:update<CR>

" Back to beginning of line
noremap <S-Return> 0 <CR>

" Quick quit command
noremap <Leader>e :q!<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" create and destroy splits
noremap <C-v> <C-w>v<CR>
noremap <C-h> :split<CR>
noremap <C-d> :close<CR>
noremap <C-t> :tabnew<CR>


" navigate quickfix menu
map <Leader>j :cn<CR>
map <Leader>k :cp<CR>


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <c-t> <esc>:tabnew<CR>
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
syntax on
set background=dark
colorscheme distinguished

" Enable syntax highlighting
" You need to reload this file for the change to apply
set omnifunc=syntaxcomplete#Complete

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'jelera/vim-javascript-syntax'

Plugin 'pangloss/vim-javascript'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'wookiehangover/jshint.vim'
let JSHintUpdateWriteOnly=1
hi clear SpellBad
hi SpellBad cterm=underline,bold

Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

Plugin 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

Plugin 'airblade/vim-gitgutter'
let g:gitgutter_max_signs=2000

Plugin 'ntpeters/vim-better-whitespace'
highlight ExtraWhitespace ctermbg=22


hi Error ctermfg=88 ctermbg=000 guifg=#870000 guibg=#000000
hi SyntasticError None

call vundle#end()

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
set rtp+=~/.vim/ocp-indent-vim

map <Leader>t :MerlinTypeOf<CR>
map <Leader>l :MerlinLocate<CR>
