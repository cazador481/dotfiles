return {
    'saghen/blink.cmp',
    -- depedencies = {
    --         "mgalliou/blink-cmp-tmux",
    -- },
    -- `main` is untested, please open a PR if you've confirmed it works as expected
    -- dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    opts = {
        sources = {
            default = {
                'lsp',
                'buffer',
                'snippets',
                'path',
                -- "tmux",
            },
            providers = {
                tmux = {
                    module = "blink-cmp-tmux",
                    name = "tmux",
                    -- default options
                    opts = {
                        all_panes = false,
                        capture_history = false,
                        -- only suggest completions from `tmux` if the `trigger_chars` are
                        -- used
                        triggered_only = false,
                        trigger_chars = { "." }
                    },
                },
            },
        },
        keymap = {
            preset = 'none',
            --  Super tab
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },

            ['<Tab>'] = {
                function(cmp)
                    if cmp.snippet_active() then return cmp.accept()
                    else return cmp.select_and_accept() end
                end,
                'snippet_forward',
                'fallback'
            },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
    }
}
