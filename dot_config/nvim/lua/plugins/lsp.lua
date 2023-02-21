local lsputil = require("lspconfig/util")
return {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
        -- Disable autoformat
        autoformat = false,
        ---@type lspconfig.options
        pylsp = {
            -- on_attach = function(client, bufnr)
            --     client.server_capabilities.document_formatting = false
            --     client.server_capabilities.document_range_formatting = false
            --
            --     on_attach(client, bufnr)
            -- end,
            -- cmd = { '/home/eash/scratch/.local/nvim/lsp_servers/pylsp/venv/bin/pylsp', '-v', '-v', '--log-file', '/home/eash/pylsp.log' },
            cmd_env = {
                VIRTUAL_ENV = ".venv",
                PATH = lsputil.path.join(".venv", "bin") .. ":" .. vim.env.PATH,
            },
            settings = {
                pylsp = {
                    configurationSources = { "flake8" },
                    plugins = {
                        black = { enabled = false },
                        flake8 = {
                            enabled = true,
                            ignore = { "BLK100", "E1", "E2", "E3", "E5", "I", "W291" },
                            executable = ".venv/bin/flake8",
                        },
                        jedi = { environment = ".venv/bin/python" },
                        mccabe = { enabled = false },
                        mypy = { enabled = false },
                        pycodestyle = { enabled = false }, -- mypy does not use executable
                        pydocstyle = { enabled = false },
                        pyflakes = { enabled = false },
                        pylint = { enabled = false },
                        rope_autoimport = { enabled = true },
                        yapf = { enabled = false },
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
}
