if exists('g:vscode')
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine


  nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
  " nnoremap <space>t <Cmd>q<cr>
  nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
  nnoremap gi <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>

  highlight QuickScopePrimary guifg='#c079f2' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

endif
