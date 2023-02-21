return {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
        local nls = require("null-ls")
        return {
            sources = {
                -- nls.builtins.formatting.prettierd,
                nls.builtins.formatting.stylua,
                nls.builtins.diagnostics.mypy.with({ prefer_local = ".venv/bin" }),
                -- nls.builtins.diagnostics.dotenv_linter
                -- nls.builtins.diagnostics.checkmake
            },
        }
    end,
}
