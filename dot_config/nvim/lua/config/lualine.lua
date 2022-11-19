
-- local signature_length = 0
--
-- local treesitter_context = require("modules.lang.treesitter").context
--
-- local current_function = function(width)
--   -- local wwidth = winwidth()
--   if width < 50 then
--     return ""
--   end
--
--   width = width
--   if width < 100 and signature_length > 50 then
--     return ""
--   end
--   if width < 140 then
--     width = math.min(width, 80) - signature_length
--   end
--   if width >= 140 then
--     width = math.max((width - signature_length) * 0.6, 40)
--   end
--   if width > 200 then
--     width = width * 0.7
--   end
--   local ts = treesitter_context(400)
--   if string.len(ts) < 3 then
--     return "? "
--   end
--   ts = string.gsub(ts, "[\n\r]+", " ")
--
--   return string.sub("? " .. ts, 1, width)
-- end
--

-- Status line
local function current_signature()
    width = 80
    if not pcall(require, 'lsp_signature') then return end
    local sig = require("lsp_signature").status_line(width)
    return sig.label .. "??" .. sig.hint
end    

local function hello()
    return "Hello"
end

    require('lualine').setup {
      options = { fmt = string.lower },
      sections = { 
        lualine_b = {'branch','diff','diagnostics',current_signature}, }

        --   lualine_a = {
        -- { 'mode', fmt = function(str) return str:sub(1,1) end } },
        --           lualine_b = {'current_signature'} }

    }
-- require('lualine').setup{
--     local function hello()
--         return 'hi'
--     end
--     sections = { 
--         'lualine_a' = {hello},
--     }
-- }
