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
set incsearch
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set cmdheight=2
set splitright
set pastetoggle=<F2>
set mouse=a

set noswapfile
set nobackup
set foldmethod=marker
set encoding=utf8
" set guifont=DroidSansMono_Nerd_Font:h11
set guifont=DroidSansMono\ Nerd\ Font:h11
let g:airline_powerline_fonts = 1

" lua << EOF
" require'nvim-web-devicons'.setup {
"  -- your personnal icons can go here (to override)
"  -- you can specify color or cterm_color instead of specifying both of them
"  -- DevIcon will be appended to `name`
"  override = {
"   zsh = {
"     icon = "",
"     color = "#428850",
"     cterm_color = "65",
"     name = "Zsh"
"   }
"  };
"  -- globally enable default icons (default to false)
"  -- will get overriden by `get_icons` option
"  default = true;
" }
" EOF
