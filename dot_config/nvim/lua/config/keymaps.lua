-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
set = vim.keymap.set
-- Enter makes a blank space in normal mode
set("n",'<S-Enter>','O<ESC>',{silent = true})
set("n",'<Enter>','o<ESC>',{silent=true})
-- Quick savings
set("n",'<leader>w',':update<CR>',{silent=true})

-- Black hole mapping
set("n",'<leader>d', "_d",{silent = true})

-- Arrow key to buffef map
set("n",'<C-LEFT>',':bp<CR>',{silent=true})
-- vimp.nnoremap('<C-LEFT>',':bp<CR>')
set("n",'<C-RIGHT>',':bn<CR>',{silent=true})
-- vimp.nnoremap('<C-RIGHT>',':bn<CR>')


-- "{{{makes jk go by line, except when proceded by number
-- function! LineMotion(dir)
--     execute "normal! " . (v:count1 > 1 ? "m'" . v:count1 : "g") . a:dir
-- endfunction
--
-- nnoremap <silent> j :<c-u>call LineMotion("j")<cr>
-- nnoremap <silent> k :<c-u>call LineMotion("k")<cr>
-- "}}}

-- Fix common command errors such as 'W' instead of 'w' and so on
vim.cmd [[
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
]]


-- Telescope mappings
vim.cmd [[
command! Files Telescope fd
command! Fd Telescope fd
command! Buffers Telescope buffers
command! Rg Telescope grep_string search="" only_sort_text=true
]]
