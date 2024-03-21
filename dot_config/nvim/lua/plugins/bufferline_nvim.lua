return {
    'akinsho/bufferline.nvim',
    opts = {
        options = {
            numbres = "buffer_id",
            groups = {
                options = {
                    toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
                },
                items = {
                    {
                        name = "Tests", -- Mandatory
                        highlight = {underline = true, sp = "blue"}, -- Optional
                        priority = 2, -- determines where it will appear relative to other groups (Optional)
                        icon = "", -- Optional
                        matcher = function(buf) -- Mandatory
                            return buf.path:match('.*test_.*')
                        end,
                    },
                    -- {
                    --     name = "Docs",
                    --     highlight = {undercurl = true, sp = "green"},
                    --     auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
                    --     matcher = function(buf)
                    --         if buf.filename then
                    --             return buf.filename:match('%.md') or buf.filename:match('%.txt')
                    --         end
                    --         return false
                    --     end,
                    --     separator = { -- Optional
                    --     style = require('bufferline.groups').separator.tab
                    --     },
                    -- }
                }
            },
        },
    }, 
}
