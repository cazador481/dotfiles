return {

    "nvimtools/none-ls.nvim",
    enabled = false, -- disalbed so to try to use the new options in lazyvim
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
        local nls = require("null-ls")
        local helpers = require("null-ls.helpers")
        local darglint = {
            method = nls.methods.DIAGNOSTICS,
            name = "darglint",
            filetypes = { "python" },
            -- null_ls.generator creates an async source
            -- that spawns the command with the given arguments and options
            generator = nls.generator({
                command = ".venv/bin/darglint",
                args = { "-v2", "$FILENAME" },
                to_stdin = false,
                from_stderr = false,
                to_temp_file = true,
                -- choose an output format (raw, json, or line)
                format = "line",
                check_exit_code = function(code, stderr)
                    local success = code <= 1

                    if not success then
                        -- can be noisy for things that run often (e.g. diagnostics), but can
                        -- be useful for things that run on demand (e.g. formatting)
                        print(stderr)
                    end

                    return success
                end,
                -- use helpers to parse the output from string matchers,
                -- or parse it manually with a function
                -- TODO add source
                on_output = helpers.diagnostics.from_patterns({
                        --  axlclone/utils.py:subprocess_check_output_with_logging:69: DAR402: Excess exception(s) in Raises section: +r CalledProcessError
                    {
                        pattern = [[.*:(%d+): (.*)]],
                        groups = { "row", "message" },
                        -- pattern = [[.:(%d+):(%d+) [%w-/]+ (.*)]],
                        -- groups = { "row", "col", "message" },
                    },
                }),
            }),
        }
        return {
            debug = true,
            sources = {
                nls.builtins.diagnostics.mypy.with({ 
                    -- command = "dmypy",
                    args = function(params)
                        -- "run",
                                return {
                                    -- "--timeout", "500",
                                    -- "--log-file",
                                    -- "mypyd.log",
                                    -- "--",
                                    "--hide-error-context",
                                    "--no-color-output",
                                    "--show-absolute-path",
                                    "--show-column-numbers",
                                    "--show-error-codes",
                                    "--no-error-summary",
                                    "--no-pretty",
                                    "--shadow-file",
                                    params.bufname,
                                    params.temp_path,
                                    params.bufname,
                                }
                            end,
                    prefer_local = ".venv/bin",

                    timeout = 100000,
                    runtime_condition = function(params)
                        if string.find(params.bufname,"fugitive") or string.find(params.bufname,".venv") then
                            return false
                        else
                            return true
                        end
                    end,
                }),
                -- nls.builtins.diagnostics.ruff.with({ prefer_local = ".venv/bin" }),

                -- nls.builtins.formatting.prettierd,
                nls.builtins.formatting.stylua,
                nls.builtins.formatting.shfmt,
                -- darglint,
                nls.builtins.diagnostics.dotenv_linter,
                nls.builtins.diagnostics.checkmake,
            },
        }
    end,
}
