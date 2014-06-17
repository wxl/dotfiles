set foldmethod=indent
set number
set ruler
set nowrap
set go-=T
set bg=dark
set t_Co=256
set expandtab
set tabstop=3
set shiftwidth=3
set softtabstop=3

if &background == "dark"
        hi normal guibg=black
endif
syntax on

" github.com/tpope/vim-vividchalk
colorscheme vividchalk

" copy all to system clipboard
noremap <C-y> gg"*yG
" more logical splits
noremap <C-w>- :new<Enter>
noremap <C-w>\| :vnew<Enter>
