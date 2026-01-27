vim.g.mapleader = "," -- leader key
vim.o.mouse = "a" -- enable mouse in all modes
vim.o.clipboard = "unnamedplus,unnamed" -- system clipboard and primary selection

vim.o.expandtab = true -- tabs -> spaces
vim.o.smarttab = true -- smarter tab handling
vim.o.tabstop = 2 -- visible tab width
vim.o.softtabstop = 2 -- insert-mode tab width
vim.o.shiftwidth = 2 -- indent width
vim.o.incsearch = true -- incremental search
vim.o.ignorecase = true -- case-insensitive search
vim.o.hlsearch = true -- highlight matches
vim.o.number = true -- absolute line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.background = "dark" -- colorscheme expects dark background
vim.o.cursorline = true -- highlight current line
vim.o.wildmenu = true -- command-line completion menu
vim.o.showmatch = true -- highlight matching brackets
vim.o.splitright = true -- vertical splits open on the right
vim.o.foldenable = false -- keep folds open by default
vim.o.foldlevelstart = 10 -- open most folds if folding enabled

local map = vim.keymap.set -- keymap helper
map("i", "<Up>", "<Nop>") -- disable arrow keys in insert mode
map("i", "<Down>", "<Nop>")
map("i", "<Left>", "<Nop>")
map("i", "<Right>", "<Nop>")

map("n", "<Space>", ":") -- Space -> :
map("v", "<Space>", ":")

map("n", "<Tab>", "%") -- Tab -> matching bracket
map("v", "<Tab>", "%")

map("n", "<C-h>", "<C-w>h") -- split navigation
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map({ "n", "v" }, "d", '"_d') -- delete without yanking
map("n", "x", '"_x')
map("n", "X", '"_X')
map("n", "D", '"_D')
