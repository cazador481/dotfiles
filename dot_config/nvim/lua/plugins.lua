vim.cmd[[packadd packer.nvim]]
require('packer').startup(function()

    local function is_tmux()
        if os.getenv("TMUX") then
            return 1
        else
            return 0
        end
    end

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    -- key bindings
    use {'folke/which-key.nvim', config = function() require('config/which-key') end }

    use {'alker0/chezmoi.vim'}

    use  {'svermeulen/vimpeccable'}

    -- Color scheme
    use { 'navarasu/onedark.nvim' }
    use {'olimorris/onedarkpro.nvim', config = function() require('config/onedarkpro') end}

    use {"windwp/nvim-autopairs", config = function() require('config/nvim-autopairs') end}

    -- Testing
    use { "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-python",
        },
        config = function() require ('config/neotest') end
    }

    

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        tag  = '0.1.0',
        config = function() require('config/telescope') end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},{'nvim-telescope/telescope-ui-select.nvim'}},

    }
    use { 'nvim-telescope/telescope-packer.nvim', requires = {{'nvim-telescope/telescope.nvim'}}}

    -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = {{'nvim-telescope/telescope.nvim'}},
    --     config = function() require('telescope').load_extension('fzf') end}

    -- use { 'nvim-telescope/telescope-fzf-writer.nvim',
    --     requires = {{'nvim-telescope/telescope.nvim'}},
    --     config = function()
    --         require('telescope').load_extensions('fzf_writer')
    --         require('telescope').extensions.fzf_writer.grep()
    --     end
    -- }


    -- LSP config
    -- use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/nvim-lsp-installer',before = 'neovim/nvim-lspconfig'}
    use {'neovim/nvim-lspconfig',config = function() require('config/nvim-lsp-install') end}
    -- use {'ii14/lsp-command'}
    use {'ray-x/lsp_signature.nvim', config = function() require('lsp_signature').on_attach({bind = false,floating_window=false}) end }
    -- use {'onsails/lspkind-nvim', config = function() require('config.lspkind') end }
    use {'mfussenegger/nvim-lint'}
    use { "JASONews/glow-hover.nvim", requires = "charmbracelet/glow",config = function() require('glow-hover').setup() end }
    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
        config = function()
            require('nvim-lightbulb').setup({autocmd = {enabled = true}})
        end
    }

    -- lsp hover docs in side panel
    use {
    "amrbashir/nvim-docs-view",
    opt = true,
    cmd = { "DocsViewToggle" },
    config = function()
        require("docs-view").setup {
        position = "bottom",
        }
    end
    }
    -- Diagnostic
    use {
    "folke/trouble.nvim",
    -- requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
    end
    }

    -- use {
    --     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --     config = function()
    --         require("lsp_lines").setup()
    --         vim.diagnostic.config({ virtual_lines = { only_current_line = true} })
    --     end,
    --     requires ='neovim/nvim-lspconfig',
    -- }

    -- Completion
    use {'ms-jpq/coq_nvim',
        branch='coq',
        -- event = 'InsertEnter',
        config = function()
            local coq = require('coq')
        end
    }
    -- 9000 snippets
    use {'ms-jpq/coq.artifacts',branch='artifacts',requires = "ms-jpq/coq_nvim"}

    use {'qpkorr/vim-bufkill'}

    use {'tpope/vim-repeat'}

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('config/treesitter') end }
    use { 'IndianBoy42/tree-sitter-just', run = ':TSUpdate', config = function() require('tree-sitter-just').setup{} end }
    -- use {'nvim-treesitter/playground', config = function() require('tree-sittter.configs').setup() end ,requires='nvim-treesitter/nvim-treesitter' }
    use { 'lewis6991/spellsitter.nvim', config = function() require('spellsitter').setup() end, requires='nvim-treesitter/nvim-treesitter' }


    -- Comment
    use {'tomtom/tcomment_vim'}

    -- tmux
    use {'brauner/vimtux', cond = is_tmux}
    use {'christoomey/vim-tmux-navigator', cond = is_tmux, config = function() require('vim-tmux-navigator') end }
    use {'tmux-plugins/vim-tmux-focus-events', cond=is_tmux}
    use {'tmux-plugins/vim-tmux', cond = is_tmux}
    use {'tpope/vim-obsession', cond = is_tmux} -- used for tmux reloading

    -- Tab line
    use {'romgrk/barbar.nvim', requires = {{'kyazdani42/nvim-web-devicons'}}, config = function() require ('config/barbar') end}

    -- Status line
    use {'nvim-lualine/lualine.nvim'}


    use {'SirVer/ultisnips',config = function() require('ultisnips') end }

    use {'andymass/vim-matchup',before ='nvim-treesitter/nvim-treesitter'}

    -- Text Objects
    use { 'wellle/targets.vim'}
    -- use { 'kana/vim-textobj-user'}
    -- -- use { 'kana/vim-textobj-function'}
    -- use { 'bps/vim-textobj-python', ft = 'python'}
    -- use { 'thinca/vim-textobj-function-perl' , ft =  'perl'}
    use { 'glts/vim-textobj-comment', requires = {{'kana/vim-textobj-user'}}}
    -- use { 'vimtaku/vim-textobj-sigil'}
    -- use { 'paulhybryant/vim-textobj-path'}
    use {'nvim-treesitter/nvim-treesitter-textobjects',requires ={{'nvim-treesitter/nvim-treesitter'}}, config = function() require ('config/nvim-treesitter-textobjects') end }

    -- Reload vim files
    use {'xolox/vim-reload',ft='vim',requires = {{'xolox/vim-reload'}}}


    -- Markdown plugins
    -- use {"ellisonleao/glow.nvim", branch = 'main'}

    use {'airblade/vim-rooter',config = function() require ('config/vim-rooter') end}


    -- Perl Plugins
    use  {'vim-perl/vim-perl', ft = 'perl'}
    use {'catalinciurea/perl-nextmethod', ft= 'perl'} -- enables [M, [m, ]M,]m

    -- Git plugins
    use {'tpope/vim-fugitive'}

    use {'machakann/vim-sandwich'}

    --File manipulation
    use {'jghauser/mkdir.nvim'} -- creates dir on save
    use {'tpope/vim-eunuch', cmd = {'Delete', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir', 'SudoWrite', 'SudoeEdit'} } 

    use {'embear/vim-localvimrc', config = function() require('config/vim-localvimrc') end }

    -- Adds annotations
    use {'danymat/neogen', config = function() require('neogen').setup {
        languages = {
            python = {
                template = { 'google_docstrings'},
            },
        }
    } end, requires = 'nvim-treesitter/nvim-treesitter'}

    use {'rcarriga/nvim-notify', after= {'telescope.nvim'}, requires = {{'nvim-lua/plenary.nvim'}}, config = function() require('config/nvim-notify') end}

    use {'mfussenegger/nvim-dap'}
    use {'mfussenegger/nvim-dap-python',requires='mfussenegger/nvim-dap',config = function() require('config/dap-python') end}
    use {'nvim-telescope/telescope-dap.nvim',requires='nvim-telescope/telescope.nvim',after='telescope.nvim'}
end)
vim.cmd [[autocmd BufWritePost plugins.lua luafile lua/plugins.lua]]
--vim.cmd [[autocmd BufWritePost plugins.lua PackerInstall]]c
