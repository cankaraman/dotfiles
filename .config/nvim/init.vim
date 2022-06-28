
call plug#begin('~/.vim/plugged')
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'seanbreckenridge/yadm-git.vim'
Plug 'tpope/vim-repeat'
Plug 'unblevable/quick-scope'

call plug#end()
let mapleader = " "


if exists('g:vscode')
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine


  nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
  " nnoremap <space>t <Cmd>q<cr>
  nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
  nnoremap gi <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>

  nnoremap <leader>ff <Cmd>call VSCodeNotify('workbench.action.quickOpenNavigateNextInFilePicker')<CR>
  nnoremap <leader>fw <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>
  nnoremap <leader>fa <Cmd>call VSCodeNotify('workbench.action.quickOpenNavigatePreviousInFilePicker')<CR>
  nnoremap <leader>o <Cmd>call VSCodeNotify('workbench.action.quickOpenNavigateNextInFilePicker')<CR>
  nnoremap <leader>p <Cmd>call VSCodeNotify('workbench.action.quickOpenNavigatePreviousInFilePicker')<CR>

  highlight QuickScopePrimary guifg='#c079f2' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

endif

set undodir=~/.vim/undodir


" nnoremap <leader>u :UndotreeToggle<CR>
"move text up and down in vmode
" vnoremap K :m '>-2<CR>gv=gv
" vnoremap J :m '>+1<CR>gv=gv



"old mappings for all filetypes {{{
inoremap jk <ESC>
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
nnoremap <leader>sv :source $MYVIMRC<cr>


set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set ignorecase
set smartcase
set incsearch
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set cmdheight=2
set splitright
set pastetoggle=<F2>
set mouse=a

" set noswapfile
" set nobackup
set foldmethod=marker
set encoding=utf8
"autocommads and functions {{{
" augroup jumpToLastPosition
"     autocmd!
"     autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" augroup end
"
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

