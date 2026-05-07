local lsputil = require('lspconfig/util')
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
            ruff = {
                settings = {
                    ruff = {
                        lint = {
                            ignore = {"E201","E231","E227" },
                        }
                    }
                },
            },
            perlnavigator = {
                settings = {
                    perlnavigator = {
                        perlPath =  '/home/utils/perl5/perlbrew/perls/5.32.1-20241209/bin/perl',
                        enableWarnings = true,
                        perlcriticEnabled = true,
                        includePaths = {"../bucket/lib", "../bucket/t/lib","../app/lib","../app/t/lib"},
                    }
                }
            },
            pyright = {
                enabled = not vim.g.using_nvidia_farm,
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
            pylsp = {
                enabled = vim.g.using_nvidia_farm,
                -- cmd = { "/home/eash/.local/share/nvim/mason/bin/pylsp" },
                -- cmd = { '/home/eash/scratch/.local/nvim/lsp_servers/pylsp/venv/bin/pylsp', '-v', '-v', '--log-file', '/home/eash/pylsp.log' },
                cmd_env = {
                    VIRTUAL_ENV = ".venv",
                    PATH = lsputil.path.join(".venv", "bin") .. ":" .. vim.env.PATH,
                },
                settings = {
                    pylsp = {
                        configurationSources = { "flake8" },
                        plugins = {
                            pylsp_mypy = {enabled = false},
                            black = { enabled = false },
                            flake8 = {
                                enabled = false,
                                ignore = { "BLK100", "E1", "E2", "E3", "E5", "I", "W291" },
                                executable = ".venv/bin/flake8",
                            },
                            jedi = { environment = ".venv/bin/python" },
                            mccabe = { enabled = false },
                            mypy = { enabled = false }, -- mypy does not use executable
                            pycodestyle = { enabled = false },
                            pydocstyle = { enabled = false },
                            pyflakes = { enabled = false },
                            pylint = { enabled = false },

                            yapf = { enabled = false },
                            ruff = {enabled = false},

                            --  Enable auto import dd
                            jedi_completion = { enabled = false},
                            -- rope_autoimport = { enabled = true },
                            rope_completion = {enabled = true},
                        },
                    },
                },
                on_new_config = function(new_config, new_root_dir)
                    local py = require("utils.python.lua")
                    py.env(new_root_dir)
                    new_config.settings.pylsp.plugins.jedi.environment = py.get_python_dir(new_root_dir)
                end,
            },
        },

    --  setup = {
    -- ruff_lsp = function()
    --   LazyVim.lsp.on_attach(function(client, _)
    --     if client.name == "ruff_lsp" then
    --       -- Disable hover in favor of Pyright
    --       client.server_capabilities.hoverProvider = false
    --     end
    --   end)
    -- end,
    -- }
   },
}
