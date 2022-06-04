nnoremap <silent> <C-n> :call ToggleNERDTreeWithRefresh()<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '^__pycache__$', '\.bin$', '\.db$']
fun! ToggleNERDTreeWithRefresh()
    :NERDTreeToggle
    if(exists("b:NERDTreeType") == 1)
        call feedkeys("R")
    endif
endf

