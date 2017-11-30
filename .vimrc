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
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'w0rp/ale'
call plug#end()

let g:NERDDefaultAlign = 'left'
map <leader>cc <leader>c<space>

" Builds
:au FileType python set makeprg=python\ %
:au FileType tex set makeprg=pdflatex\ %\ &&\ open\ %<.pdf
:set autowrite

" Vim aesthetics
:set cursorline
:set rnu
:autocmd InsertEnter * :set number | :set nornu
:autocmd InsertLeave * :set rnu | :set nonumber

" Easy Motion
:nmap / <Plug>(easymotion-sn)
:nmap ' <Plug>(easymotion-bd-w)
:noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
:noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Theme
:set guioptions-=T
:syntax enable
:colorscheme gruvbox
:set background=dark

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
:au FileType tex inoremap `fl \begin{flalign*}<CR>\end{flalign*}<ESC>>>O

" Functionality
:nnoremap <Tab> :ls<CR>:b
:noremap * *N
:command O :CommandT
:cabbrev smake silent make
:cabbrev chk setlocal spell spelllang=en_us
:command W w
:command Q q
:cabbrev dir NERDTree
" :nnoremap <C-J> <C-W><C-J>
" :nnoremap <C-K> <C-W><C-K>
" :nnoremap <C-L> <C-W><C-L>
" :nnoremap <C-I> <C-W><C-I>
"
" Shortcuts
:abbr sout System.out.println();<Esc>hi
:abbr psvm public static void main(String[] args) {

