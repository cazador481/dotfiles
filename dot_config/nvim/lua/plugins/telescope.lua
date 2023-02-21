return {
    "telescope.nvim",
    dependencies = {'ahmedkhalf/project.nvim'},
    config = function(plugin)
        -- run original config
        plugin._.super.config()
        require('telescope').load_extension('projects')
    end
}
