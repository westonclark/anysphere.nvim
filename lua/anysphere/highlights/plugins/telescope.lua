local M = {}

function M.get_highlights(palette)
  local highlights = {
    -- Telescope
    TelescopeNormal = { fg = palette.fg, bg = palette.bg },
    TelescopeBorder = { fg = palette.float_border, bg = palette.bg },
    TelescopePromptNormal = { fg = palette.fg, bg = palette.line },
    TelescopePromptBorder = { fg = palette.float_border, bg = palette.line },
    TelescopePromptTitle = { fg = palette.func, bold = true },
    TelescopePreviewTitle = { fg = palette.func, bold = true },
    TelescopeResultsTitle = { fg = palette.func, bold = true },

    -- Selection
    TelescopeSelection = { fg = palette.fg, bg = palette.visual },
    TelescopeSelectionCaret = { fg = palette.func, bg = palette.visual },

    -- Matching
    TelescopeMatching = { fg = palette.func, bold = true },

    -- Preview
    TelescopePreviewNormal = { fg = palette.fg, bg = palette.bg },
    TelescopePreviewBorder = { fg = palette.float_border, bg = palette.bg },

    -- Results
    TelescopeResultsNormal = { fg = palette.fg, bg = palette.bg },
    TelescopeResultsBorder = { fg = palette.float_border, bg = palette.bg },
  }

  return highlights
end

return M
