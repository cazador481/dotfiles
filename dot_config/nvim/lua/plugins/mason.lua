return {
    'mason-org/mason.nvim',
    opts = {
        ensure_installed = {
            "mypy",
            "ruff",
            "shellcheck",
            "shfmt",
            "stylua",
        },
    },
}
