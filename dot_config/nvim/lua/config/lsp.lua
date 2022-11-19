local lsputil = require('lspconfig/util')
local wk = require("which-key")
local coq = require("coq")
local on_attach = function(client, bufnr)


    require'lsp_signature'.on_attach(client)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>law', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>lrw', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>llw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    wk.register(
    {
        ['g'] = {
            name = 'GOTO',
            td= {'<cmd>lua vim.lsp.buf.type_definition()<CR>', "Goto Type Definition"},
            D={'<Cmd>lua vim.lsp.buf.declaration()<CR>','Declaration of symbol'},
            d={'<Cmd>lua vim.lsp.buf.definition()<CR>','Definition of symbol'},
            i={'<cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation'},
        }
    }
    )


    -- Rename
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)

    buf_set_keymap('n', '<leader>rf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Code Action
    -- buf_set_keymap('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",opts)
    -- buf_set_keymap('n', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>",opts)
    buf_set_keymap('n', '<leader>lss', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.server_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf",
        "<cmd>lua vim.lsp.buf.format()<CR>", opts)
        vim.cmd [[command! Format :lua vim.lsp.buf.format(_sync);vim.cmd('write')]]
    elseif client.server_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>lf",
        "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

        local Formatexpr_wrapper = function()
            -- only reformat on explicit gq command
            if not fn.mode() == 'n' then
                -- fall back to Vims internal reformatting
                return 1
            end

            local opts = {}
            local start_line = vim.v.lnum
            local end_line = start_line + vim.v.count - 1
            if start_line >= 0 and end_line >= 0 then
                vim.lsp.buf.range_formatting(opts, {start_line, 0}, {end_line, 0})
            end

            return 0
        end
        -- Sets gq to use lsp
        -- buf_set_option('formatexpr',Formatexpr_wrapper)
    end


    -- EFM handles the formatting
    -- if client.name == "pylsp" then
    --     client.server_capabilities.document_formatting=false
    --     client.server_capabilities.document_range_formatting=false
    -- end

end

require('nvim-lsp-installer').setup{
    automatic_installation = true, --automatically detect which servers to install based on lspconfig
}
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
-- capabilities.textDocument.codeAction = {
--     dynamicRegistration = true,
--     codeActionLiteralSupport = {
--         codeActionKind = {
--             valueSet = (function()
--                 local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
--                 table.sort(res)
--                 return res
--             end)()
--         }
--     }
-- }

capabilities.textDocument.completion.completionItem.snippetSupport = true;


-- LSP servers can be automatically installed by running the LSPI command
local servers = {
    -- "efm",
    -- "jsonls",
    "pylsp",
    -- "pyright",
    "vimls",
    -- "yamlls",
    -- "sumneko_lua",
    "taplo", -- toml

}


for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
      coq.lsp_ensure_capabilities{
        on_attach = on_attach,
        flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
        }
    }
  }
end

lspconfig.sumneko_lua.setup {
    on_attach=on_attach,
    capabilities = capabilities,
    settings =  {
             Lua = {
                 diagnostics = {
                     -- Gets the language server to recodnginze the vim, and use globals
                     globals = { 'use','vim' }
                 },
                 workspace = {
                     -- Make the server aware of Neovim runtime files
                     library = vim.api.nvim_get_runtime_file("",true)
                 },
                 -- Do not send telemetry data
                 telemetry = {
                     enable = false,
                 }

             }
         }
 }

lspconfig.jsonls.setup {
    on_attach=on_attach,
    capabilities = capabilities,
    settings =  {
            settings = {
                json = {
                    format = {
                        enable = true
                    }
                }
            }
        }
    }
lspconfig.yamlls.setup{
    on_attach=on_attach,
    capabilities = capabilities,
    settings = {
                yaml = {
                    format =
                    {
                        enable = true,
                        bracketSpacing = true,
                        validate = true,
                        completion= true,
                    }
                }
            }
        }

lspconfig.efm.setup {
    on_attach=on_attach,
    capabilities = capabilities,
    root_dir = function(fname)
        return vim.fn.getcwd()
    end,
    -- cmd = {
    --     vim.fn.stdpath("data") .. "/lsp_servers/efm/efm-langserver",
    --     "-c",
    -- },
    flags = {
        debounce_text_changes = 150,
    },
    filetypes = { "python", },
    init_options = {
        documentFormatting = true,
    },
}
--
-- local function get_python_venv()
--
--
--     -- This is very slow so commented out
--     -- if vim.env.VIRTUAL_ENV then return vim.env.VIRTUAL_ENV end
--     --
--     -- local match = vim.fn.glob(lsputil.path.join(vim.fn.getcwd(), 'Pipfile'))
--     -- if match ~= '' then return vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv')) end
--     --
--     -- match = vim.fn.glob(lsputil.path.join(vim.fn.getcwd(), 'poetry.lock'))
--     -- if match ~= '' then return vim.fn.trim(vim.fn.system('poetry env info -p')) end
--     return '.venv'
-- end
-- local venv = get_python_venv()

lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = function(client,bufnr)
        -- When using vim 0.8 or later switch to client.server_capabilities
        client.server_capabilities.code_action = true
        client.server_capabilities.code_lens = true
        client.server_capabilities.code_lens_resolve = false
        client.server_capabilities.completion = true
        client.server_capabilities.declaration = false
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_highlight = false
        client.server_capabilities.document_range_formatting = false
        client.server_capabilities.document_symbol = false
        client.server_capabilities.execute_command = false
        client.server_capabilities.find_references = false
        client.server_capabilities.goto_definition = false
        client.server_capabilities.hover = false -- pyright only gets type information, and docs from stub file
        client.server_capabilities.implementation = false
        client.server_capabilities.rename = false
        client.server_capabilities.signature_help = false
        -- client.server_capabilities.signature_help_trigger_characters = {}
        -- client.server_capabilities.text_document_did_change = 1
        -- client.server_capabilities.text_document_open_close = true
        -- client.server_capabilities.text_document_save = true
        -- client.server_capabilities.text_document_save_include_text = false
        -- client.server_capabilities.text_document_will_save = false
        -- client.server_capabilities.text_document_will_save_wait_until = false
        -- client.server_capabilities.type_definition = false
        client.server_capabilities.workspace_symbol = false
        on_attach(client,bufnr)
    end,
    settings = {
        pyright = {
            disableOrganizeImports = false,
            -- typeCheckingMode="off",
        },
        python = {
            pythonPath = '.venv/bin/python',
            analysis = {
                autoImportCompletions = true,
                autoSearchPath = true,
                diagnosticSeverityOverrides = {
                    reportPrivateImportUsage = false,
                },
                useLibraryCodeForTypes = true,
            }
        },
    },
    on_new_config = function(new_config,new_root_dir)
        local py = require 'utils.python.lua'
        py.env(new_root_dir)
        new_config.settings.python.pythonPath = py.get_python_dir(new_root_dir)
        new_config.settings.python.analysis.extraPaths = { py.pep582(new_root_dir) }
        -- This is where we should add the code to find the python directory
    end, 

}

lspconfig.pylsp.setup {
    capabilities = capabilities,
    on_attach = function(client,bufnr)
        client.server_capabilities.document_formatting=false
        client.server_capabilities.document_range_formatting=false

        on_attach(client,bufnr)
    end,
    -- cmd = {'/home/eash/scratch/.local/nvim/lsp_servers/pylsp/venv/bin/pylsp','-v','-v','--log-file','/home/eash/pylsp.log'},
    cmd_env = {
        VIRTUAL_ENV = '.venv',
        PATH = lsputil.path.join('.venv','bin') .. ':' .. vim.env.PATH,
    },
    settings = {
        pylsp = {
            configurationSources = {'flake8'},
            plugins = {
                jedi = {environment = ".venv/bin/python"},
                pycodestyle = {enabled = false},
                pydocstyle = {enabled = false},
                pyflakes = {enabled = false},
                pylint = {enabled = false},
                mccabe  = {enabled = false},
                yapf = {enabled = false},
                flake8 = {
                    enabled = true,
                    ignore = {'BLK100','E201','E222','E241','E225', 'E261','E231','W293','E252','E302','E501','I','W291'},
                    executable = ".venv/bin/flake8",
                },
                -- mypy does not use executable
                mypy = { enabled = false },
                black = {enabled = false},
            },
        },
    },
    on_new_config = function(new_config,new_root_dir)
        local py = require 'utils.python.lua'
        py.env(new_root_dir)
        new_config.settings.pylsp.plugins.jedi.environment = py.get_python_dir(new_root_dir)
    end, 
}
