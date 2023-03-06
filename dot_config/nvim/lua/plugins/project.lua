return {
    "ahmedkhalf/project.nvim",
    ---@param opts cmp.ConfigSchema
    name = "project_nvim",
    opts = function(_, opts)
        -- All the patterns used to detect root dir, when **"pattern"** is in
        -- detection_methods
        patterns =
            { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "TOT", "^.config", "pyproject.toml" }
    end,
}
