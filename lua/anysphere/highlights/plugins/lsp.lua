local M = {}

function M.setup(palette)
  local highlights = {
    -- LSP Diagnostics
    DiagnosticError = { fg = palette.error },
    DiagnosticWarn = { fg = palette.warning },
    DiagnosticInfo = { fg = palette.info },
    DiagnosticHint = { fg = palette.hint },
    DiagnosticOk = { fg = palette.git_add },

    DiagnosticVirtualTextError = { fg = palette.error, italic = true },
    DiagnosticVirtualTextWarn = { fg = palette.warning, italic = true },
    DiagnosticVirtualTextInfo = { fg = palette.info, italic = true },
    DiagnosticVirtualTextHint = { fg = palette.hint, italic = true },

    DiagnosticUnderlineError = { sp = palette.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = palette.warning, undercurl = true },
    DiagnosticUnderlineInfo = { sp = palette.info, undercurl = true },
    DiagnosticUnderlineHint = { sp = palette.hint, undercurl = true },

    DiagnosticSignError = { fg = palette.error },
    DiagnosticSignWarn = { fg = palette.warning },
    DiagnosticSignInfo = { fg = palette.info },
    DiagnosticSignHint = { fg = palette.hint },

    -- LSP References
    LspReferenceText = { bg = palette.visual },
    LspReferenceRead = { bg = palette.visual },
    LspReferenceWrite = { bg = palette.visual, bold = true },

    -- LSP Signature help
    LspSignatureActiveParameter = { fg = palette.func, bold = true },

    -- Code lens
    LspCodeLens = { fg = palette.comment, italic = true },
    LspCodeLensSeparator = { fg = palette.comment },

    -- Inlay hints
    LspInlayHint = { fg = palette.comment, italic = true },
  }

  for name, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, name, opts)
  end
end

return M
