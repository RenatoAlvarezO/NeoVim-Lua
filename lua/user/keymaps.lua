local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
--keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
--keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<C-Right>", ":bnext<CR>", opts)
-- keymap("n", "<C-Left>", ":bprevious<CR>", opts)
keymap("n", "<s-l>", ":bnext<cr>", opts)
keymap("n", "<s-h>", ":bprevious<cr>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


--  Personal Keymaps --

keymap("n","<C-b>",":NvimTreeToggle <CR>",{}) -- Toggles Tree
keymap("i","<C-b>","<ESC> :NvimTreeToggle <CR>",{}) -- Toggles Tree

keymap("n","<C-s>",":w <CR>",opts) --  Vainilla Save
keymap("i","<C-s>","<ESC> :w <CR> i",opts) -- Save (Insert Mode)
keymap("","<C-c>",'"+y <CR>',{}) -- Copy to system clipboard

keymap("","<C-p>","<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",{}) -- Search Files
keymap("","<C-f>","<cmd>Telescope live_grep<cr>",{}) --  Search In Files
-- keymap("","<C-p>",":Files <CR>",{}) -- Search Files
-- keymap("","<C-f>",":Rg ",{}) --  Search In Files

keymap('n', '<C-_>', '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>',{})
keymap('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>',{})

keymap('n','<C-q>', ':q <CR>', {})

-- keymap('n','<C-i>',':Format <CR>',{})
keymap('n','<C-g>', '<CMD> lua _LAZYGIT_TOGGLE()<CR>', {})
--
keymap('n','<C-z>','u',opts)
-- autoformat reconfig
keymap('n','<TAB>',":Format <CR>",{})

keymap('n','<C-d>','<cmd>lua require(\'diaglist\').open_all_diagnostics()<cr>',opts)

keymap('n','O',":SymbolsOutline <CR>",opts)
