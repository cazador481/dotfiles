-- Map leader to space
vim.g.mapleader = '\\'

local fn = vim.fn
local execute = vim.api.nvim_command
local g = vim.g

-- Disable unused default plugins
-- g.loaded_netrwPlugin = true
-- g.loaded_netrwFileHandlers = true
-- g.loaded_netrwSettings = true
g.loaded_vimballPlugin = true
g.loaded_tutor_mode_plugin = true


-- Sensible defaults
require('settings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

--    update display environment and SSH env variables
vim.cmd [[
    function! Tmux_display()
        let $DISPLAY=systemlist("tmux show-environment DISPLAY|cut -d'=' -f 2")[0]
        let $SSH_CLIENT=systemlist("tmux show-environment SSH_CLIENT|cut -d'=' -f 2")[0]
        let $SSH_CONNECTION=systemlist("tmux show-environment SSH_CONNECTION|cut -d'=' -f 2")[0]
    endfunc

    augroup TMUX_DISPLAY_GROUP
        au!
        autocmd FocusGained * call Tmux_display()
    augroup end

    ]]

-- git description
vim.cmd [[
    au BufNewFile,BufRead EDIT_DESCRIPTION set filetype=gitcommit
    au BufNewFile,BufRead EDIT_DESCRIPTION setlocal spell spelllang=en_us
]]


-- Install plugins
require('plugins')

require('keymappings')

-- -- Color schen
-- g.onedark_styne='deep'
require('config/onedarkpro')

-- Status line
local current_signature = function(width)
  if not pcall(require, 'lsp_signature') then return end
  local sig = require("lsp_signature").status_line(width)
  return sig.label .. "??" .. sig.hint
end

-- Another option is to groups configuration in one folder
require('config/lsp')

require('config/lualine')
