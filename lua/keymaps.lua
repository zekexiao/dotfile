-- 按键映射
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- 普通模式映射
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-s>", ":w<CR>", opts)

-- 插入模式映射
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-o>", "<Esc>o", opts)
map("i", "<C-b>", "<Home>", opts)
map("i", "<C-d>", "<End>", opts)
map("i", "<C-s>", "<Esc>:w<CR>", opts)

-- 可视模式映射
map("v", "<C-y>", '"+y', opts)

-- 自定义 j 和 k 的行为
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
map("n", "^", "g^", opts)

-- 修改 leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
