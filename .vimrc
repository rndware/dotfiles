	" contents of minimal .vimrc
execute pathogen#infect()
syntax on
filetype plugin indent on
set autoindent
set number
set belloff=all
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set rtp+=~/.fzf
set nocompatible
set clipboard=unnamedplus
set ignorecase
filetype plugin on

let g:airline_theme='gruvbox'
set t_Co=256

nnoremap d "xd

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

colorscheme gruvbox
"colorscheme monokai
set bg=dark
:map <C-p> :FZF<CR>
:map <C-S-f> :Ag<CR>
:let mapleader = " "
nmap <Leader>e <C-w>w
nmap <Leader>q :qa<CR>
nmap <Leader>qq :qa!<CR>
nmap <Leader>s :w<CR>
nmap <Leader>w :q<CR>
nmap <Leader>f :Ag<CR>
nmap <Leader>p :FZF<CR>
nmap <Leader>n :NERDTree<CR>
nmap <Leader>d :vsplit<CR>
nmap <Leader>r :Farr<CR>
nmap J <C-w>h
nmap K <C-w>l
nmap <Leader>gb :<C-u>call gitblame#echo()<CR>
nmap <leader>] >>
nmap <leader>[ <<
noremap <Leader>y "+y

set shiftwidth=2

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

let g:gitgutter_async=0
set updatetime=750

highlight DiffAdd guifg=black guibg=wheat1
highlight DiffChange guifg=black guibg=skyblue1
highlight DiffDelete guifg=black guibg=gray45 gui=none
