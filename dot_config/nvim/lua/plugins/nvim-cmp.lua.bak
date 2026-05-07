return {
    "hrsh7th/nvim-cmp",
    -- keys = {":","/", "?"},  -- lazy load cmp on more keys along with insert mode
    dependencies = { 
        "andersevenrud/cmp-tmux",
        "hrsh7th/cmp-nvim-lsp-signature-help" ,
        "windwp/nvim-autopairs",
        -- "hrsh7th/cmp-cmdline", # causes nvim to hang
        'FelipeLema/cmp-async-path',
        'hrsh7th/cmp-nvim-lsp',
    },

    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        opts.performance = {fetching_timeout = 10}
        opts.sources = {
            {name = "tmux"},
            { name = "nvim_lsp_signature_help" },
            {name = 'async_path'},
            {name = 'buffer'},
            {name = 'luasnip'},
            {name = 'nvim_lsp'},

        }

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        -- enable supper tab
        opts.mapping = vim.tbl_extend("force", opts.mapping, {
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        }
        )

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end,

    -- config = function(plugin, opts)
    --     local cmp = require "cmp"
    --     -- run cmp setup
    --     cmp.setup(opts)
    --
    --     -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
    --     cmp.setup.cmdline("/", {
    --         mapping = cmp.mapping.preset.cmdline(),
    --         sources = {
    --             { name = "buffer" },
    --         },
    --     })
    --     cmp.setup.cmdline(":", {
    --     mapping = cmp.mapping.preset.cmdline(),
    --     sources = cmp.config.sources(
    --         {
    --             { name = "path" },
    --         }, 
    --         {
    --             {
    --                 name = "cmdline",
    --                 option = {
    --                     ignore_cmds = { "Man", "!" },
    --                 },
    --             },
    --         }),
    --     })
    -- end,

}
