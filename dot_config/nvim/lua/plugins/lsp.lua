return {
    "neovim/nvim-lspconfig",
    enabed=false,
    init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        keys[#keys + 1]= {"gd",false}
    end,
    --`@class PluginLspOpts
    opts = {
        --`@type lspconfig.options
        servers = {
            ruff_lsp = {
                settings = {
                    ruff = {
                        args = {"--ignore=E201,E231,E227"},
                    }
                },
            },
            pyright = {
                settings = {
                    python = {
                        pythonPath =".venv/bin/python",
                        analysis = {
                            autoImportCompletions = true,
                            autoSearchPaths = true,
                            exclude={".venv"},
                            useLibraryCodeForTypes = true,
                        }
                    },
                    pyright = {
                        disableOrganizeImports = true,

                    },
                    diagnosticMode = "openFilesOnly",
                    indexing = true,
                },
            },
        },
    },
}
