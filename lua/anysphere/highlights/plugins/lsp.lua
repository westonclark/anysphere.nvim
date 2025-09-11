local M = {}

function M.get_highlights(palette)
  local highlights = {
    -- LSP Diagnostics
    DiagnosticError = { fg = palette.error },
    DiagnosticWarn = { fg = palette.warning },
    DiagnosticInfo = { fg = palette.info },
    DiagnosticHint = { fg = palette.hint },
    DiagnosticOk = { fg = palette.git_add },

    DiagnosticVirtualTextError = { fg = palette.error, gui = "italic" },
    DiagnosticVirtualTextWarn = { fg = palette.warning, gui = "italic" },
    DiagnosticVirtualTextInfo = { fg = palette.info, gui = "italic" },
    DiagnosticVirtualTextHint = { fg = palette.hint, gui = "italic" },

    DiagnosticUnderlineError = { sp = palette.error, gui = "undercurl" },
    DiagnosticUnderlineWarn = { sp = palette.warning, gui = "undercurl" },
    DiagnosticUnderlineInfo = { sp = palette.info, gui = "undercurl" },
    DiagnosticUnderlineHint = { sp = palette.hint, gui = "undercurl" },

    DiagnosticSignError = { fg = palette.error },
    DiagnosticSignWarn = { fg = palette.warning },
    DiagnosticSignInfo = { fg = palette.info },
    DiagnosticSignHint = { fg = palette.hint },

    -- LSP References
    LspReferenceText = { bg = palette.visual },
    LspReferenceRead = { bg = palette.visual },
    LspReferenceWrite = { bg = palette.visual, gui = "bold" },

    -- LSP Signature help
    LspSignatureActiveParameter = { fg = palette.func, gui = "bold" },

    -- Code lens
    LspCodeLens = { fg = palette.comment, gui = "italic" },
    LspCodeLensSeparator = { fg = palette.comment },

    -- Inlay hints
    LspInlayHint = { fg = palette.comment, gui = "italic" },
  }

  return highlights
end

return M
