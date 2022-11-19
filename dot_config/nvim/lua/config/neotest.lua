local neotest = require("neotest")
local vimp=require('vimp')
neotest.setup(
    {
        adapters = {
            require("neotest-python")({
                args = {"-v"},
            })
        },
    }
)
vim.api.nvim_set_keymap('n','[n',':lua require("neotest").jump.prev({status = "failed"})<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',']n',':lua require("neotest").jump.next({status = "failed"})<CR>', {noremap = true, silent = true})

-- vimp.nnoremap('<silent>[n',':lua require("neotest").jump.prev({status = "failed"})<CR>')
-- vimp.nnoremap('<silent>]n',':lua require("neotest").jump.next({status = "failed"})<CR>')
