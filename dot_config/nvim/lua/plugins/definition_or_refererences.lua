return {
    "KostkaBrukowa/definition-or-references.nvim",
    keys = {
        {
            "gd", 
            function()
                require("definition-or-references").definition_or_references()
            end,
            desc = "definition-or-references",
        },
    },
    opts = {
        on_references_result = function()
            require("telescope.builtin").lsp_references({
            layout_strategy = "center",
            bufnr = 0,
            })
        end,
    },
}
