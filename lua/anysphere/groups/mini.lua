local diff_group = require("anysphere.groups.diff")
local M = {}

---@param conf AnysphereColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local diff = diff_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    MiniDiffOverAdd     = diff["DiffAdd"],
    MiniDiffOverChange  = diff["DiffChange"],
    MiniDiffOverDelete  = diff["DiffDelete"],
    MiniDiffOverContext = { bg = c.line },
    MiniDiffSignAdd     = { fg = c.plus },
    MiniDiffSignChange  = { fg = c.delta },
    MiniDiffSignDelete  = { fg = c.error },

    MiniTrailspace      = { bg = c.error },
  }

  return hl
end
return M
