-- vim.cmd("let g:netrw_liststyle =  3")

local opt = vim.opt

opt.relativenumber = true
opt.nu = true
opt.numberwidth = 2
opt.scrolloff = 10
opt.sidescrolloff = 8

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true

opt.wrap = true

-- Search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixed case, then assumes want case-sensitive
-- opt.hlsearch = true
opt.incsearch = true

-- For Color Schemes
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.updatetime = 50

opt.backspace = "indent,eol,start"

-- Split Windows
opt.splitright = true
opt.splitbelow = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.clipboard = "unnamedplus"
opt.showmode = false
opt.cursorline = false -- higligh cursor line

-- Code Folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
