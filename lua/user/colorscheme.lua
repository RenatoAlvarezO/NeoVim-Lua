vim.cmd [[let g:gruvbox_contrast_dark = "hard"]]
vim.cmd [[
    let g:everforest_background = 'hard'
    let g:everforest_better_performance = 1
    ]]
vim.cmd [[set termguicolors]]
vim.cmd [[
try
  " colorscheme solarized
  " colorscheme gruvbox
  " colorscheme NeoSolarized
  let ayucolor = "mirage" 
  colorscheme ayu
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
-- vim.cmd [[]]
vim.cmd [[set termguicolors]]
