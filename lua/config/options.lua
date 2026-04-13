-- Editing
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smarttab = true

-- Netrw
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]] -- Hides dotfiles
vim.g.netrw_banner = 0 -- Show wiht `I`
vim.g.netrw_keepdir = 0 -- Fixes move command error
vim.g.netrw_localcopydircmd = "cp -r" -- copy recursively
