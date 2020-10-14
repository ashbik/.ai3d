syntax on
filetype plugin on
let python_highlight_all = 1

set encoding=UTF-8
set foldmethod=indent
set foldlevel=99
set nocompatible
set number relativenumber
hi LineNr ctermfg=8
set autoindent
set ts=4
set expandtab
set showmatch



autocmd FileType python inoremap  ii <Esc> 0 :w <Enter> :!python3 % <Enter>



call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/goyo.vim'
call plug#end()

" Syntastic Options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
