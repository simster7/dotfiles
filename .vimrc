" Indenting
:filetype plugin indent on
:set cindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set expandtab
"
" Theme
:set guioptions-=T
:syntax enable
:colorscheme gruvbox
:set background=dark
:set macligatures
:set guifont=Fira\ Code:h12


" Plugins
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Plug 'vim-syntastic/syntastic'
" Plug 'w0rp/ale'
call plug#end()

set timeoutlen=1000 ttimeoutlen=0

let g:NERDDefaultAlign = 'left'
map <leader>cc <leader>c<space>

:set noswapfile
:set nowb
:set nobackup

":autocmd BufEnter * silent! lcd %:p:h

" Builds
:au FileType python set makeprg=python\ %
:au FileType tex set makeprg=pdflatex\ %\ &&\ open\ %<.pdf
:set autowrite

" Line aesthetics
:set cursorline
:set rnu
:autocmd InsertEnter * :set number | :set nornu
:autocmd InsertLeave * :set rnu | :set nonumber

" Motion
:nmap / <Plug>(easymotion-sn)
:nmap <space> <Plug>(easymotion-bd-w)
:noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
:noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
:noremap * *N
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" fzf
:noremap " :Files<CR>
:noremap ' :Lines<CR>
":noremap ' :BLines<CR>
:nnoremap <Tab> :Buffers<CR>

" GitGutter
:cabbrev gitgut GitGutterToggle

" Splitting
:set splitbelow
:set splitright
:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>

" Syntax-specific
:au FileType java inoremap { {<CR>}<Esc>ko
:au FileType tex inoremap `bf \textbf{
:au FileType tex inoremap `tt \texttt{
:au FileType tex inoremap `it \textit{
:au FileType tex inoremap `nl \newline
:au FileType tex inoremap `np \newpage
:au FileType tex inoremap `la $\leftarrow$
:au FileType tex inoremap `ra $\rightarrow$
:au FileType tex inoremap `en \begin{enumerate}<CR>\end{enumerate}<ESC>>>O\item 
:au FileType tex inoremap `mt \begin{bmatrix}<CR>\end{bmatrix}<ESC>>>O
:au FileType tex inoremap `fl \begin{flalign*}<CR>\end{flalign*}<ESC>O
:au FileType tex inoremap `al \begin{align*}<CR>\end{align*}<ESC>O
:au FileType tex inoremap `( \left(
:au FileType tex inoremap `) \right)

" NERDTree
:cabbrev dir NERDTreeToggle

" Functionality
:noremap <C-p> :register<CR>:put
:cabbrev smake silent make
:cabbrev chk setlocal spell spelllang=en_us
:cabbrev W w
:cabbrev Q q
:cabbrev rc e $MYVIMRC

" Automatically source .vimrc file when saving it
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC 
augroup END

" Shortcuts
:abbr sout System.out.println();<Esc>hi
:abbr psvm public static void main(String[] args) {

