-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o       = vim.opt
local g       = vim.g

-- Tabs and space
local indent  = 4
o.shiftwidth  = indent
o.tabstop     = indent
o.softtabstop = indent

o.expandtab   = true
o.smartindent = true
-- Makes it so when you copy the autoindent is disabled
o.copyindent  = true

-- Sync system and nvim clipboard
-- o.clipboard   = 'unnamed,unnamedplus'

-- Mouse support
o.mousefocus  = true

-- Linewrapping
o.scrolloff   = 4 -- Scrolls by  4 when you go left on the wordwrap
o.linebreak   = true -- Wrap on word boundary

g.mapleader = '\\'

local python3 = '/home/eash/.pyenv/versions/nvim-python/bin/python3'
if 1 == vim.fn.filereadable(python3) then
  g.python3_host_prog = python3
else
  g.python3_host_prog = "/home/eash/.pyenv/versions/3.10.10/bin/python3"
end
