return {
    "neovim/nvim-lspconfig",
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
                             diagnosticMode = "openFilesOnly",
                            stubPath = "/home/scratch.eash_gpu/python-type-stubs/stubs:stubs",

                            -- Checks that are caught by ruff
                            diagnosticSeverityOverrides = {
                                reportUnusedVariable = "none" -- Disable "is not accessed" error
                            },
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
     setup = {
    ruff_lsp = function()
      LazyVim.lsp.on_attach(function(client, _)
        if client.name == "ruff_lsp" then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end)
    end,
    }
   },
}
