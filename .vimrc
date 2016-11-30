" SETTINGS
" line numbers
set number
" where am i?
set ruler
" we don't need no word wrap
set nowrap
" spaces instead of tabs
set expandtab
" three spaces per tab
set tabstop=3
set shiftwidth=3
set softtabstop=3
" let syntax files provide fold info
set foldmethod=syntax
" mouse works everywhere
set mouse=a
" syntax hilighting
syntax on
" loads necessary stuff by filetype
filetype plugin indent on

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
" 256 colors spinning out of control
set t_Co=256
" i like my background like i like my soul
set bg=dark
if &background == "dark"
        hi normal guibg=black
endif
" github.com/tpope/vim-vividchalk
colorscheme vividchalk

" MISC
" install plugins by adding to ~/.vim/bundle
execute pathogen#infect()
" GPG editing
" Don't save backups of *.gpg files
set backupskip+=*.gpg
" To avoid that parts of the file is saved to .viminfo when yanking or
" deleting, empty the 'viminfo' option.
set viminfo=
augroup encrypted
  au!
  " Disable swap files, and set binary file format before reading the file
  autocmd BufReadPre,FileReadPre *.gpg
    \ setlocal noswapfile bin
  " Decrypt the contents after reading the file, reset binary file format
  " and run any BufReadPost autocmds matching the file name without the .gpg
  " extension
  autocmd BufReadPost,FileReadPost *.gpg
    \ execute "'[,']!gpg --decrypt --default-recipient-self" |
    \ setlocal nobin |
    \ execute "doautocmd BufReadPost " . expand("%:r")
  " Set binary file format and encrypt the contents before writing the file
  autocmd BufWritePre,FileWritePre *.gpg
    \ setlocal bin |
    \ '[,']!gpg --encrypt --default-recipient-self
  " After writing the file, do an :undo to revert the encryption in the
  " buffer, and reset binary file format
  autocmd BufWritePost,FileWritePost *.gpg
    \ silent u |
    \ setlocal nobin
augroup END
