-- path/to/file:line:col: severity: message [code]
local pattern = "([^:]+):(%d+):(%d+):(%d+):(%d+): (%a+): (.*)%s+%[(.*)%]"
local groups = { "file", "lnum", "col", "end_lnum", "end_col", "severity", "message", "code" }
local severities = {
    error = vim.diagnostic.severity.ERROR,
    warning = vim.diagnostic.severity.WARN,
    note = vim.diagnostic.severity.HINT,
}
return {
	"mfussenegger/nvim-lint",
	opts = {
        events = {"BufWritePost","BufReadPost"},
		linters_by_ft = {
			fish = { "fish" },
			python = { "mypy" },
			sh = { "shellcheck" },
		},
		-- LazyVim extension to easily override linter options
		-- or add custom linters.
		---@type table<string,table|function>
		linters = {
			mypy = function()
				local command = function()
					if vim.fn.exists(".venv/bin/mypy") == 1 then
						return ".venv/bin/mypy"
					end
					return "mypy"
				end
				return {
					stdin = false,
					ignore_exitcode = true,
					-- cmd = command(),
					cmd = ".venv/bin/mypy",
					args = {
						"--show-column-numbers",
						"--show-error-end",
						"--hide-error-context",
						"--no-color-output",
						"--no-error-summary",
						"--no-pretty",
					},
					parser = require("lint.parser").from_pattern(
						pattern,
						groups,
						severities,
						{ ["source"] = "mypy" },
						{ end_col_offset = 0 }
					),
				}
			end,
		},
	},
}
