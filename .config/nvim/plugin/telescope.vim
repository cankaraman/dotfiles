" Using Lua functions
nnoremap <leader>o <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ft <cmd>Telescope<cr>

"search in buffer's directory
nnoremap <leader>fdf <cmd>lua require('telescope.builtin').find_files{ search_dirs={"%:h"} }<cr>
nnoremap <leader>fdg <cmd>lua require('telescope.builtin').live_grep{ search_dirs={"%:h"} }<cr>
lua << EOF
require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap(
  "n",
  "<space>fy",
  ":Telescope file_browser<cr>",
  { noremap = true }
)
require("telescope").load_extension("ui-select")
EOF
