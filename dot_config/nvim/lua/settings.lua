local utils = require('utils')

local cmd = vim.cmd
local o = vim.opt

vim.cmd [[
    filetype plugin indent on
]]
vim.g.syntax_on = true -- Turn on syntax highlighting

-- Tabs and space
local indent = 4
o.shiftwidth = indent
o.tabstop    = indent
o.softtabstop = indent

o.expandtab  = true
o.smartindent= true
-- Makes it so when you copy the autoindent is disabled
o.copyindent = true

-- Make nvim splitting sane
o.splitbelow= true
o.splitright= true

o.wildmode= 'list:longest,full'

-- Enable relative numbers
o.number= true
o.relativenumber = true
o.ruler=true

-- Sync system and nvim clipboard
o.clipboard = 'unnamed,unnamedplus'

-- Enable mouse support
o.mouse = 'a'
o.mousefocus = true

-- Linewrapping
o.scrolloff= 4  -- Scrolls by  4 when you go left on the wordwrap
o.linebreak = true -- Wrap on word boundary

-- Folding
o.foldenable = true
o.foldmethod = 'syntax'
-- block,hor,mark,percent,quickfix,search,tag,undo
o.foldopen:append('insert')
o.foldopen:append('jump')

-- Misc
o.hidden= true -- Allows buffers to be hidden while having unsaved changes
o.ignorecase= true
o.shiftround= true
o.smartcase= true
o.undofile=true
o.inccommand = "nosplit"

-- Speed up vim
o.lazyredraw = true
o.synmaxcol = 255 --Syntax coloring slows things down, maybe able to turn off once we use treesitter
o.updatetime=300  -- fixes bad experience for diagnostics messages when its default is 4000
o.timeoutlen=300 -- leaderkey timeout

-- Completion
o.completeopt = "menuone,noinsert,noselect"

local python3='/home/eash/.cache/nvim/python3_venv/bin/python3'
if 1 == vim.fn.filereadable(python3) then
    vim.g.python3_host_prog=python3
else 
    vim.g.python3_host_prog="/home/eash/.pyenv/versions/3.10.10/bin/python3"
end

-- Enable 24bit colors
o.termguicolors = true

-- COQ settings.  Must be here so that they are loaded before the coq is required
vim.g.coq_settings = {
    ['auto_start'] = "shut-up",
    ["limits.completion_auto_timeout"]=2,
    ["clients.lsp.resolve_timeout"]=0.07,
}

-- Diagnostics
vim.diagnostic.config(
    {
        virtual_text = {
            source = false, -- using lsp_lines.nvim instead
            -- source = "if_many",
        },
        float = {
            source = "if_many",
        },
    }
)

-- Spell options
o.spelloptions = "camel"

-- Enable code action to show up on screen
-- autocmd CursorHold,CursorHoldI * lua require('code_action_utils').code_action_listener()s
