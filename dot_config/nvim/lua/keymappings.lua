local vimp=require('vimp')
-- Enter makes a blank space in normal mode
vimp.nnoremap('<S-Enter>','O<ESC>')
vimp.nnoremap('<Enter>','o<ESC>')

-- Quick savings
vimp.nmap({'silent'}, '<leader>w',':update<CR>')

-- Black hole mapping
vimp.nmap('<leader>d', "_d")

-- Arrow key to buffef map
-- vimp.nnoremap('<C-LEFT>',':bp<CR>')
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
