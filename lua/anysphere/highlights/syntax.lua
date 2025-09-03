local M = {}

function M.setup(palette)
  local highlights = {
    -- Comments
    Comment = { fg = palette.comment, italic = true },

    -- Constants
    Constant = { fg = palette.constant },
    String = { fg = palette.string, italic = true },
    Character = { fg = palette.string },
    Number = { fg = palette.number },
    Boolean = { fg = palette.boolean, bold = true },
    Float = { fg = palette.number },

    -- Identifiers
    Identifier = { fg = palette.usage },
    Function = { fg = palette.func },

    -- Statements
    Statement = { fg = palette.keyword },
    Conditional = { fg = palette.keyword },
    Repeat = { fg = palette.keyword },
    Label = { fg = palette.keyword },
    Operator = { fg = palette.operator },
    Keyword = { fg = palette.keyword },
    Exception = { fg = palette.keyword },

    -- PreProcessor
    PreProc = { fg = palette.builtin },
    Include = { fg = palette.builtin },
    Define = { fg = palette.builtin },
    Macro = { fg = palette.builtin },
    PreCondit = { fg = palette.builtin },

    -- Types
    Type = { fg = palette.type, bold = true },
    StorageClass = { fg = palette.type },
    Structure = { fg = palette.type },
    Typedef = { fg = palette.type },

    -- Special
    Special = { fg = palette.func },
    SpecialChar = { fg = palette.func },
    Tag = { fg = palette.func },
    Delimiter = { fg = palette.bracket },
    SpecialComment = { fg = palette.comment, italic = true },
    Debug = { fg = palette.error },

    -- Error
    Error = { fg = palette.error, bold = true },
  }

  for name, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, name, opts)
  end
end

return M
