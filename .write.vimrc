call plug#begin()
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
call plug#end()

colorscheme seoul256-light
set linespace=7
set guifont=Menlo:h14
set noshowmode
set noshowcmd
set spell
set textwidth=66
"set formatoptions=tacqwn

set noswapfile
set nowb
set nobackup

set clipboard=unnamed

cabbrev q qa
cabbrev wq wqa
nmap / <Plug>(easymotion-sn)
nmap <space> <Plug>(easymotion-s2)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap * *N
