" SETTINGS
set foldmethod=indent
set number
set ruler
set nowrap
set expandtab
set tabstop=3
set shiftwidth=3
set softtabstop=3
set mouse=a
syntax on

" BINDINGS
" escape is too far to reach…
imap jk <Esc>
" \ is dumb, too
let mapleader = ","
" ,, instead of ZZ
nnoremap <leader><leader> :xa<cr>
inoremap <leader><leader> <esc>:xa<cr>
" copy all to system clipboard
noremap <C-y> gg"*yG
" more logical splits
noremap <C-w>- :new<Enter>
noremap <C-w>\| :vnew<Enter>

" COLORS
set t_Co=256
set bg=dark
if &background == "dark"
        hi normal guibg=black
endif
" github.com/tpope/vim-vividchalk
colorscheme vividchalk

" MISC
" install plugins by adding to ~/.vim/bundle
execute pathogen#infect()
