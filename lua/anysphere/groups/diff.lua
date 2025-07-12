local utilities = require("anysphere.utilities")
local M = {}

---@param conf AnysphereColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    DiffAdd          = { fg = c.plus, bg = utilities.blend(c.plus, c.bg, 0.2) },
    DiffChange       = { fg = c.delta, bg = utilities.blend(c.delta, c.bg, 0.2) },
    DiffDelete       = { fg = c.error, bg = utilities.blend(c.error, c.bg, 0.2) },
    DiffText         = { fg = c.fg },
    DiffFile         = { fg = c.keyword },
    DiffIndexLine    = { fg = c.comment },
  }

  return hl
end
return M
