call plug#begin()
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

colorscheme seoul256-light
set linespace=7
set linebreak
set guifont=Menlo:h14
set noshowmode
set noshowcmd
set spell
set textwidth=0
set wrapmargin=0

set noswapfile
set nowb
set nobackup
set backspace=2
set clipboard=unnamed

function! Goyo_before()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! Goyo_after()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

let g:goyo_callbacks = [function('Goyo_before'), function('Goyo_after')]
nmap / <Plug>(easymotion-sn)
nmap <space> <Plug>(easymotion-s2)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap * *N

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd VimEnter * Limelight0.3
