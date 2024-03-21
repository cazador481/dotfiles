return {
    "hinell/lsp-timeout.nvim",
    enabled=false,
	dependencies={ "neovim/nvim-lspconfig" },
	init = function()
	    vim.g.lspTimeoutConfig = {
            stopTimeout = 1000*60 * 10, -- ms, timeout before stopping all LSP
        }
    end
}
