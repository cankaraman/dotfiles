"use yadm for dotfiles
"add mappings for yadm commands
"also install ripgrep
" Download vim-plug and pathogen when vim runs for the very first time {{{
" if empty(glob("~/.vim/autoload/plug.vim"))
    " execute '!mkdir -p .vim/autoload && curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    " execute sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       " https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" endif
" if empty(glob("~/.vim/autoload/pathogen.vim"))
    " execute '!mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim'
" endif
"}}}

call plug#begin('~/.vim/plugged')
Plug 'akinsho/flutter-tools.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-sneak'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-repeat'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'seanbreckenridge/yadm-git.vim'
Plug 'airblade/vim-gitgutter'
"autocomplete plugins
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'

"Plug 'kosayoda/nvim-lightbulb'
"Plug 'Yggdroot/indentLine'
"Plug 'tpope/vim-eunuch'
"Plug 'michaeljsmith/vim-indent-object'
"Plug 'honza/vim-snippets'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"Plug 'jiangmiao/auto-pairs'
"Plug 'adelarsq/vim-matchit'
"Plug 'sheerun/vim-polyglot'
call plug#end()
"execute pathogen#infect()
"call pathogen#helptags()


let g:gruvbox_italic=1
colorscheme gruvbox
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab smartindent
set exrc
" set guicursor=
set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set ignorecase


set smartcase

set noswapfile
set nobackup
set undodir=~/.vim/undodir

set incsearch
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set cmdheight=2
set splitright
set pastetoggle=<F2>
set mouse=a
hi SpellBad cterm=underline

hi! link Operator GruvboxRed

"mappings for all filetypes {{{
nnoremap <leader>rt :UndotreeToggle<CR>
inoremap jk <ESC>
let mapleader = " "
inoremap <C-r><C-r> <C-r>"

iabbrev retrun return
cnoremap <c-h> <left>
cnoremap <c-l> <right>
" delete the first space
nnoremap <silent> d<space> :<c-u>call <SID>DeleteSpace()<cr>
function! s:DeleteSpace()
    " accept the match under cursor with 'c' flag
    call search('\v ', 'c')
    execute "normal! x"
endfunction

" paste unnamed register in the insert & command mode
inoremap <c-v> <c-r>"
cnoremap <c-v> <c-r>"

" till the end of the line
nnoremap L g_
onoremap L g_
" till the begining of the line
nnoremap H ^
onoremap H ^

" Map F4 key to toggle spell checking
noremap <F4> :setlocal spell! spelllang=en_us<CR>

"make Y same as D&C
nnoremap Y yg_
" nnoremap V vg_

"search and replace
nnoremap <C-f> /
" nnoremap <C-b> :nohlsearch<CR>
nnoremap <C-g> :%s//gc<left><left><left>

"copy to clipboard
vnoremap <C-c> "+y

" nnoremap <SPACE> <Nop>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>a <ESC>gg<S-v>G
"paste without yanking the seleceted text
vnoremap p "_dP

"free special input map first
inoremap <C-k> <nop>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-k> <Up>

"split mappings & settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"quick vimrc edit
nnoremap <leader>v :split $MYVIMRC<CR>
"augroup myvimrc
"    autocmd!
"    autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc source $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup end
"source vimrc manualy
nnoremap <leader>sv :source $MYVIMRC<cr>

"}}}

augroup jumpToLastPosition
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup end

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

augroup trailingSpaces
    autocmd!
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup end

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup END

augroup quit_quickfix
    au!
    au BufEnter * call MyLastWindow()
augroup end

function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit
    endif
  endif
endfunction

""vimscript topics to study {{{
" setlocal foldmethod=indent
" setlocal foldlevel=1
" gv visual | z= spelling | \r \e expr-quote
"
" help various-motions
" help sign-support
" help virtualedit
" help map-alt-keys
" help error-messages
" help development
" help tips
" help 24.8
" help 24.9
" help usr_12.txt
" help usr_26.txt
" help usr_32.txt
" help usr_42.txt
" }}}

