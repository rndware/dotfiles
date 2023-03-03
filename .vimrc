 " contents of minimal .vimrc
call plug#begin('~/.vim/plugged')

Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'sonph/onehalf'
Plug 'tpope/vim-surround'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'brooth/far.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'pangloss/vim-javascript'
Plug 'mitermayer/vim-prettier'
Plug 'garbas/vim-snipmate'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/0.x' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gregsexton/matchtag'
Plug 'stsewd/fzf-checkout.vim'

Plug 'ap/vim-css-color'
Plug 'matze/vim-move'
Plug 'zivyangll/git-blame.vim'

Plug 'nikvdp/ejs-syntax'

Plug 'mattn/emmet-vim'

Plug 'grvcoelho/vim-javascript-snippets'

Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

call plug#end()

syntax on
filetype plugin indent on
set autoindent
set mouse=a
set tabstop=4
set number
set nohlsearch
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

"let g:airline_theme='gruvbox'
let g:airline_theme='onehalfdark'

let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

let NERDTreeMapJumpFirstChild='\i'
let NERDTreeMapJumpLastChild='\k'
let NERDTreeMapOpenVSplit='d'
let NERDTreeMinimalUI=1

set t_Co=256

nnoremap d "xd

"colorscheme gruvbox
colorscheme onehalfdark

set bg=dark
" :map <C-p> :FZF<CR>
nnoremap <C-p> <cmd>Telescope find_files<cr>
:map <C-S-f> :Ag<CR>
:map <C-b> :GBranches<CR>
:let mapleader = " "
nmap <Leader>e <C-w>w
nmap <Leader>q :qa!<CR>
nmap <Leader>s :w<CR>
nmap <c-s> :w<CR>
nmap <Leader>w :q<CR>
" nmap <Leader>f :Ag<CR>
nnoremap <Leader>f <cmd>Telescope live_grep<cr>
nmap <Leader>p :FZF<CR>
nmap <Leader>n :enew<CR>
nmap <leader>vn :NERDTreeFind<CR>
nmap <Leader>d :vsplit<CR>
nmap <Leader>D :on<CR>
nmap <Leader>g :Farr<CR>
nmap <Leader>ks :G<CR>
nmap <Leader>kc :Gcommit<CR>
nmap <Leader>kp :Gpush<CR>
nmap <Leader>ki :Gdiff<CR>
nmap <Leader>kr :Gread<CR>
nmap <Leader>ka :Gwrite<CR>
nmap <Leader>= :Prettier<CR>
nmap s <Plug>(easymotion-overwin-f2)

:nnoremap <Leader> @q

noremap <leader>/ :Commentary<CR>
noremap <C-_> :Commentary<CR>

noremap <leader>j J<CR>

nmap <Leader>r <Plug>(coc-rename)
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)

nmap <leader><CR> :Buf<CR>

let g:prettier#config#single_quote = 'true'
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'

autocmd VimEnter * NERDTree

nnoremap <silent> J :wincmd h<CR>
nnoremap <silent> K :wincmd l<CR>

nmap <Leader>gb :<C-u>call gitblame#echo()<CR>
noremap <Leader>y "+y

let g:EasyMotion_smartcase = 1

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:move_map_keys = 0
nmap <A-Up> <Plug>MoveLineUp
nmap <A-Down> <Plug>MoveLineDown
vmap <A-Up> <Plug>MoveBlockUp
vmap <A-Down> <Plug>MoveBlockDown

vmap <C-S-v> <C-v>

set shiftwidth=2

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

let g:gitgutter_async=0
set updatetime=750

" stty -ixon

highlight DiffAdd guifg=black guibg=wheat1
highlight DiffChange guifg=black guibg=skyblue1
highlight DiffDelete guifg=black guibg=gray45 gui=none

lua <<EOF
local telescope = require('telescope')

-- Configure the keybindings for the fuzzy finder
telescope.setup {
  defaults = {
    mappings = {
      i = {
		['<C-j>'] = "move_selection_next",
		['<C-k>'] = "move_selection_previous",
		["<esc>"] = "close"
	  },
    }
  }
}
EOF
