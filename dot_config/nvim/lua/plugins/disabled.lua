-- Default plugins to disable
return{
    {"echasnovski/mini.pairs",enabled = false},
    {"lewis6991/gitsigns.nvim", enabled = false},
    {"hrsh7th/cmp-path", enabled = false},
    {"folke/flash.nvim", enabled = false}, -- causes search to stop working https://github.com/folke/flash.nvim/issues/274

    {"folke/noice.nvim", enabled = true},
    {"lukas-reineke/indent-blankline.nvim",enabled=false},
    -- A little faster than indent-blankline
    -- {
    -- "shellRaining/hlchunk.nvim",
    -- event = { "UIEnter" },
    -- config = function()
    --     require("hlchunk").setup({})
    -- end
    -- },
}
