local previewers = require("telescope.previewers")

local _bad = { ".*%.csv", ".*%.lua", ".*%.py" } -- Put all filetypes that slow you down in this array
local bad_files = function(filepath)
  for _, v in ipairs(_bad) do
    if filepath:match(v) then
      return false
    end
  end

  return true
end

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  if opts.use_ft_detect == nil then opts.use_ft_detect = true end
  opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
  previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

return {
    "nvim-telescope/telescope.nvim",
    -- change some options
    opts = {
      defaults = {
            buffer_previewer_maker = new_maker
        },
    },
}
