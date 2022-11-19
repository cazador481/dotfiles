require('nvim-treesitter.configs').setup ({
    highlight = {
    enable = true,
    -- Automaticallyh install missing when entering buffer
    auto_install = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,},
    matchup = {
        enable=true,
    }
})

-- Needed so that treesitter components can build on a modern system.
require 'nvim-treesitter.install'.compilers = { '/home/utils/llvm-14.0.0/bin/clang'}
