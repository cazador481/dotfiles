require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        -- ["ic"] = "@comment.outer",
        -- ["ac"] = "@comment.outer",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outter",
        },
      },
    },
  }
