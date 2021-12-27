vim.cmd [[
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
vim.cmd [[let g:gruvbox_contrast_dark = "hard"]]
-- vim.cmd [[]]
vim.cmd [[set termguicolors]]
