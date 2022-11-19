local windline = require('windline')
local hl_list = {
  NormalBg = { "NormalFg", "NormalBg" },
  White = { "black", "white" },
  Normal = { "NormalFg", "NormalBg" },
  Inactive = { "InactiveFg", "InactiveBg" },
  Active = { "ActiveFg", "ActiveBg" },
}
local basic = {}


-- Gets the current signature of the function that we are in
local current_signature = function(width)
  if not packer_plugins["lsp_signature.nvim"] or packer_plugins["lsp_signature.nvim"].loaded == false then
    return ""
  end
  local sig = require("lsp_signature").status_line(80)
  signature_length = #sig.label

  return sig.label .. "??" .. sig.hint, sig
end



basic.funcname = {
  name = "funcname",
  hl_colors = {
    default = hl_list.NormalBg,
    white = { "white", "black" },
    green = { "green_b", "NormalBg" },
    green_light = { "green_light", "NormalBg" },
  },
  text = function(_, winnr, width, is_float)
    return { { " ", "default" }, { current_function(width), "green" }, { " ", "default" } }
  end,
}

basic.signature = {
  name = "signature",
  hl_colors = {
    default = hl_list.NormalBg,
    white = { "white", "black" },
    green_light = { "green_light", "NormalBg" },
    megenta = { "megenta", "NormalBg" },
    yellow = { "yellow", "NormalBg" },
  },
  text = function(_, winnr, width, is_float)
    local label, sig = current_signature(width)

    if sig == nil or sig.label == nil or sig.range == nil then
      return {}
    end
    local label1, label2 = "", ""
    if sig.range.start and sig.range["end"] then
      label1 = sig.label:sub(1, sig.range["start"] - 1)
      label2 = sig.label:sub(sig.range["end"] + 1, #sig.label)
    end
    return {
      { " ", "default" },
      { label1, "green_light" },
      { sig.hint, "yellow" },
      { label2, "green_light" },
      { " ", "default" },
    }
  end,
}

require('wlsample.evil_line')

default = {
    basic.signature,sic.funcname,

}
