return {
    "ahmedkhalf/project.nvim",
    name = "project_nvim",
    ---@param opts cmp.ConfigSchema
    opts = {
        manual_mode = false,
        -- All the patterns used to detect root dir, when **"pattern"** is in
        -- detection_methods
        scope = "win",
        -- detection_methods = {"pattern", "lsp"}
        detection_methods = {"pattern"},
        patterns =
            { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "TOT", "^.config", "pyproject.toml" },
    }
}
