return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = { 
    style = "moon",
  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
    on_highlights = function (highlights, colors)
      highlights.WinSeparator = {bg = "black", fg = "red"}
    end,
  },
}
