local vimp=require('vimp')
-- Arrow key to buffef map
vimp.nnoremap('<C-LEFT>',':BufferPrevious<CR>')
vimp.nnoremap('<C-RIGHT>',':BufferNext<CR>')

vimp.nnoremap('<A-1>',':BufferGoto 1<CR>')
vimp.nnoremap('<A-2>',':BufferGoto 2<CR>')
vimp.nnoremap('<A-3>',':BufferGoto 3<CR>')
vimp.nnoremap('<A-4>',':BufferGoto 4<CR>')
vimp.nnoremap('<A-5>',':BufferGoto 5<CR>')
vimp.nnoremap('<A-6>',':BufferGoto 6<CR>')
vimp.nnoremap('<A-7>',':BufferGoto 7<CR>')
vimp.nnoremap('<A-8>',':BufferGoto 8<CR>')
vimp.nnoremap('<A-9>',':BufferGoto 9<CR>')

vim.g.bufferline = {
    -- Show both buffer index and icons
    icons = 'both',
}
