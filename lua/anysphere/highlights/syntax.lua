local M = {}

function M.get_highlights(palette)
  local highlights = {
    -- Comments
    Comment = { fg = palette.comment, gui = "italic" },

    -- Constants
    Constant = { fg = palette.constant },
    String = { fg = palette.string, gui = "italic" },
    Character = { fg = palette.string },
    Number = { fg = palette.number },
    Boolean = { fg = palette.boolean, gui = "bold" },
    Float = { fg = palette.number },

    -- Identifiers
    Identifier = { fg = palette.usage },
    Function = { fg = palette.func },

    -- Statements
    Statement = { fg = palette.keyword },
    Conditional = { fg = palette.keyword },
    Repeat = { fg = palette.keyword },
    Label = { fg = palette.keyword },
    Operator = { fg = palette.comparison }, -- Changed to use comparison color for operators
    Keyword = { fg = palette.keyword },
    Exception = { fg = palette.keyword },

    -- PreProcessor
    PreProc = { fg = palette.builtin },
    Include = { fg = palette.import },
    Define = { fg = palette.builtin },
    Macro = { fg = palette.builtin },
    PreCondit = { fg = palette.builtin },

    -- Types
    Type = { fg = palette.type, gui = "bold" },
    StorageClass = { fg = palette.class },
    Structure = { fg = palette.class },
    Typedef = { fg = palette.type },

    -- Special
    Special = { fg = palette.func },
    SpecialChar = { fg = palette.func },
    Tag = { fg = palette.func },
    Delimiter = { fg = palette.bracket },
    SpecialComment = { fg = palette.comment, italic = true },
    Debug = { fg = palette.error },

    -- HTML/XML specific (fallback for older syntax highlighting)
    htmlTag = { fg = palette.func },
    htmlTagName = { fg = palette.func },
    htmlArg = { fg = palette.attribute },
    htmlEndTag = { fg = palette.func },
    htmlString = { fg = palette.string },
    xmlTag = { fg = palette.func },
    xmlTagName = { fg = palette.func },
    xmlAttrib = { fg = palette.attribute },

    -- Error
    Error = { fg = palette.error, gui = "bold" },
  }

  return highlights
end

return M
