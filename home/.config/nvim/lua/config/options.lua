local opt = vim.opt

-- Leader key (must be set before keymaps)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

-- UI
opt.cursorline = true
opt.signcolumn = "yes"
opt.colorcolumn = "120"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.termguicolors = true

-- Editing
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.fixendofline = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Misc
opt.showmode = false
opt.updatetime = 250
opt.timeoutlen = 300
