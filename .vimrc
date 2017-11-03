" Indenting
:filetype plugin indent on
:set cindent
:set tabstop=4
:set shiftwidth=4
:set expandtab

" Plugins
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
call plug#end()

let g:NERDDefaultAlign = 'left'
map <leader>cc <leader>c<space>
" Syntax-specific
:au FileType java inoremap { {<CR>}<Esc>ko

" Builds
:au FileType python set makeprg=python3\ %
:au FileType tex set makeprg=pdftex\ %
:set autowrite

" Vim aesthetics
:set cursorline
:set rnu
:autocmd InsertEnter * :set number | :set nornu
:autocmd InsertLeave * :set rnu | :set nonumber

" Shortcuts
:abbr sout System.out.println();<Esc>hi
:abbr psvm public static void main(String[] args) {

" Easy Motion
" :nmap / <Plug>(easymotion-sn)
" :nmap ' <Plug>(easymotion-bd-w)
" :nnoremap j gj
" :nnoremap k gk

" Theme
:set guioptions-=T
:syntax enable
:colorscheme gruvbox
:set background=dark

" Functionality
:inoremap `bf \textbf{
:inoremap `tt \texttt{
:inoremap `it \textit{
:inoremap `nl \newline
:inoremap `np \newpage
:inoremap `la $\leftarrow$
:inoremap `ra $\rightarrow$
:inoremap `en \begin{enumerate}<CR>\end{enumerate}<ESC>>>O\item 
:inoremap `fl \begin{flalign*}<CR>\end{flalign*}<ESC>O
:nnoremap <Tab> :ls<CR>:b
:noremap * *N
:command O :CommandT
:cabbrev o O
:command W w
:command Q q
:cabbrev dir NERDTree
" :nnoremap <C-J> <C-W><C-J>
" :nnoremap <C-K> <C-W><C-K>
" :nnoremap <C-L> <C-W><C-L>
" :nnoremap <C-I> <C-W><C-I>
